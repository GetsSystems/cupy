# distutils: language = c++


class Flags(object):

    def __init__(self, c_contiguous, f_contiguous, owndata):
        self._c_contiguous = c_contiguous
        self._f_contiguous = f_contiguous
        self._owndata = owndata

    @property
    def c_contiguous(self):
        return self._c_contiguous

    @property
    def f_contiguous(self):
        return self._f_contiguous

    @property
    def owndata(self):
        return self._owndata

    @property
    def fnc(self):
        return self.f_contiguous and not self.c_contiguous

    @property
    def forc(self):
        return self.f_contiguous or self.c_contiguous

    def __getitem__(self, name):
        if name == 'C_CONTIGUOUS':
            return self.c_contiguous
        elif name == 'F_CONTIGUOUS':
            return self.f_contiguous
        elif name == 'OWNDATA':
            return self.owndata
        else:
            raise KeyError('%s is not defined for cupy.ndarray.flags' % name)

    def __repr__(self):
        t = '  %s : %s'
        ret = []
        for name in 'C_CONTIGUOUS', 'F_CONTIGUOUS', 'OWNDATA':
            ret.append(t % (name, self[name]))
        return '\n'.join(ret)
