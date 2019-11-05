#cython: cdivision=True
#cython: boundscheck=False
#cython: nonecheck=False
#cython: wraparound=False

from libc.math cimport pow

def deflect(double cos_alpha, double u):
    """ Coordinate deflection as a function of local ray angle and compactness.

    :param double: :math:`\cos\\alpha`
    :param double: :math:`r_{s}/R`

    :returns: tuple -- (:math:`\cos\psi`,
                        :math:`\partial\cos\\alpha/\partial\cos\psi/(1-u)`)

    """

    cdef double z = (1.0 - cos_alpha)/(1.0 - u)
    cdef double P = 0.0
    cdef double Q = 0.0

    expansion(z, u, &P, &Q)

    return (1.0 - z*(1.0 + pow(u, 2)*P),
            1.0/(1.0 + pow(u, 2)*(z*Q + P)))

cdef public void c_deflect(double cos_alpha, double u,
                           double *cos_psi, double *deriv):

    cdef double z = 1.0 - cos_alpha
    cdef double P = 0.0
    cdef double Q = 0.0

    expansion(z, u, &P, &Q)

    cos_psi[0] = 1.0 - z*(1.0 + pow(u, 2)*P)
    deriv[0] = 1.0/(1.0 + pow(u, 2)*(z*Q + P))

cdef void expansion(double z, double u, double *P, double *Q) nogil:

    cdef double p # polynomial in z, p(z)
    cdef double q = 0.0 # derivative p'(z)
    cdef double a # temporary storage of each p(z) coefficient, a polynomial in u, a(u)


    p = 9.884951758609434e-12
    p = -2.870078765724739e-10 + u * p
    p = 4.020756922412279e-09 + u * p
    p = -3.618813749019969e-08 + u * p
    p = 2.350632972357739e-07 + u * p
    p = -1.173550415967108e-06 + u * p
    p = 4.682676702450328e-06 + u * p
    p = -1.533117014426496e-05 + u * p
    p = 4.195645602965111e-05 + u * p
    p = -9.727707568984217e-05 + u * p
    p = 1.929764461517209e-04 + u * p
    p = -3.299267377248597e-04 + u * p
    p = 4.886265643462961e-04 + u * p
    p = -6.290034359921522e-04 + u * p
    p = 7.050975845382921e-04 + u * p
    p = -6.885684907434155e-04 + u * p
    p = 5.852066537897190e-04 + u * p
    p = -4.317600570727831e-04 + u * p
    p = 2.753688825683875e-04 + u * p
    p = -1.508726633842501e-04 + u * p
    p = 7.038707135793503e-05 + u * p
    p = -2.761976700409780e-05 + u * p
    p = 8.959876882107094e-06 + u * p
    p = -2.344040896491672e-06 + u * p
    p = 4.763943753962761e-07 + u * p
    p = -7.076546216736946e-08 + u * p
    p = 6.855119766104408e-09 + u * p
    p = -3.261251772249362e-10 + u * p
    a = -2.055945320192658e-11
    a = 5.761839002696802e-10 + u * a
    a = -7.780785732814167e-09 + u * a
    a = 6.740641959197404e-08 + u * a
    a = -4.207821293980645e-07 + u * a
    a = 2.015438572121017e-06 + u * a
    a = -7.700991767937092e-06 + u * a
    a = 2.409478379628691e-05 + u * a
    a = -6.287258754484699e-05 + u * a
    a = 1.386441080160985e-04 + u * a
    a = -2.608631202760185e-04 + u * a
    a = 4.216818606202494e-04 + u * a
    a = -5.883941724643294e-04 + u * a
    a = 7.107533731802362e-04 + u * a
    a = -7.441793131033107e-04 + u * a
    a = 6.751465640829833e-04 + u * a
    a = -5.296964839056874e-04 + u * a
    a = 3.580415501755087e-04 + u * a
    a = -2.072868011684782e-04 + u * a
    a = 1.019183171302787e-04 + u * a
    a = -4.204966667624031e-05 + u * a
    a = 1.431292621673463e-05 + u * a
    a = -3.921769491029839e-06 + u * a
    a = 8.334516837546538e-07 + u * a
    a = -1.292812465275132e-07 + u * a
    a = 1.306264038142837e-08 + u * a
    a = -6.475991507804457e-10 + u * a
    q = p + z * q
    p = a + z * p
    a = 4.281522261501752e-11
    a = -1.156659529277288e-09 + u * a
    a = 1.503479856606456e-08 + u * a
    a = -1.251769093389391e-07 + u * a
    a = 7.497010826957423e-07 + u * a
    a = -3.438736897558010e-06 + u * a
    a = 1.255702234697664e-05 + u * a
    a = -3.746234625484411e-05 + u * a
    a = 9.297812625459668e-05 + u * a
    a = -1.944732285136346e-04 + u * a
    a = 3.459826568537568e-04 + u * a
    a = -5.269602579194818e-04 + u * a
    a = 6.900286570696004e-04 + u * a
    a = -7.786025803217970e-04 + u * a
    a = 7.574223423161577e-04 + u * a
    a = -6.344143844328712e-04 + u * a
    a = 4.560689895146644e-04 + u * a
    a = -2.798772811418123e-04 + u * a
    a = 1.454345251251196e-04 + u * a
    a = -6.325101702539987e-05 + u * a
    a = 2.264260647324240e-05 + u * a
    a = -6.511739581432996e-06 + u * a
    a = 1.449935821673133e-06 + u * a
    a = -2.352892659213981e-07 + u * a
    a = 2.483986602763499e-08 + u * a
    a = -1.285414735221752e-09 + u * a
    q = p + z * q
    p = a + z * p
    a = -8.928353606905754e-11
    a = 2.321769632312769e-09 + u * a
    a = -2.900492469690162e-08 + u * a
    a = 2.316963431900859e-07 + u * a
    a = -1.328911134995647e-06 + u * a
    a = 5.825500810108343e-06 + u * a
    a = -2.028479486362963e-05 + u * a
    a = 5.756337374091395e-05 + u * a
    a = -1.355168310479005e-04 + u * a
    a = 2.680282580870261e-04 + u * a
    a = -4.493190172933788e-04 + u * a
    a = 6.422683376957792e-04 + u * a
    a = -7.856714486516514e-04 + u * a
    a = 8.237510061460049e-04 + u * a
    a = -7.399154771275136e-04 + u * a
    a = 5.679409502806395e-04 + u * a
    a = -3.707312688601152e-04 + u * a
    a = 2.042387609918347e-04 + u * a
    a = -9.389730977872860e-05 + u * a
    a = 3.544189714343411e-05 + u * a
    a = -1.072310606026001e-05 + u * a
    a = 2.507039174982712e-06 + u * a
    a = -4.264624612100198e-07 + u * a
    a = 4.712951795675537e-08 + u * a
    a = -2.550214098514604e-09 + u * a
    q = p + z * q
    p = a + z * p
    a = 1.864540391678506e-10
    a = -4.660067478694623e-09 + u * a
    a = 5.585718193238809e-08 + u * a
    a = -4.273208723154473e-07 + u * a
    a = 2.342468823069677e-06 + u * a
    a = -9.792173505162371e-06 + u * a
    a = 3.243428021158912e-05 + u * a
    a = -8.731002193944384e-05 + u * a
    a = 1.943772354882524e-04 + u * a
    a = -3.622779784625538e-04 + u * a
    a = 5.700171582518644e-04 + u * a
    a = -7.612430482437610e-04 + u * a
    a = 8.653632781149952e-04 + u * a
    a = -8.378549196333084e-04 + u * a
    a = 6.897652089030503e-04 + u * a
    a = -4.808300830641678e-04 + u * a
    a = 2.818210438163392e-04 + u * a
    a = -1.373940142670404e-04 + u * a
    a = 5.483623952844461e-05 + u * a
    a = -1.749942069567392e-05 + u * a
    a = 4.306046212566519e-06 + u * a
    a = -7.695074582273296e-07 + u * a
    a = 8.920212905722033e-08 + u * a
    a = -5.056906856290419e-09 + u * a
    q = p + z * q
    p = a + z * p
    a = -3.899819586928173e-10
    a = 9.352182264200045e-09 + u * a
    a = -1.073600599065444e-07 + u * a
    a = 7.850147236478281e-07 + u * a
    a = -4.103783576876953e-06 + u * a
    a = 1.631919716387434e-05 + u * a
    a = -5.127811552929873e-05 + u * a
    a = 1.305428755885593e-04 + u * a
    a = -2.738888073130850e-04 + u * a
    a = 4.791566537250441e-04 + u * a
    a = -7.044290878323798e-04 + u * a
    a = 8.743183491931583e-04 + u * a
    a = -9.179389413393901e-04 + u * a
    a = 8.146916662928244e-04 + u * a
    a = -6.092128008519056e-04 + u * a
    a = 3.813932770927863e-04 + u * a
    a = -1.978680150165611e-04 + u * a
    a = 8.376878904183155e-05 + u * a
    a = -2.827677362206516e-05 + u * a
    a = 7.342251396201052e-06 + u * a
    a = -1.381712039133496e-06 + u * a
    a = 1.683825087764996e-07 + u * a
    a = -1.002174933794109e-08 + u * a
    q = p + z * q
    p = a + z * p
    a = 8.170330154443824e-10
    a = -1.876579187241475e-08 + u * a
    a = 2.059085104512719e-07 + u * a
    a = -1.435872823442669e-06 + u * a
    a = 7.140912901998706e-06 + u * a
    a = -2.694021075189127e-05 + u * a
    a = 8.006147374304363e-05 + u * a
    a = -1.920951272628894e-04 + u * a
    a = 3.783384838499968e-04 + u * a
    a = -6.184993794032974e-04 + u * a
    a = 8.451701591558503e-04 + u * a
    a = -9.689505868991383e-04 + u * a
    a = 9.326541651813003e-04 + u * a
    a = -7.520053327298875e-04 + u * a
    a = 5.051293253676368e-04 + u * a
    a = -2.799871669655676e-04 + u * a
    a = 1.261790312665076e-04 + u * a
    a = -4.519662520713731e-05 + u * a
    a = 1.241939902609923e-05 + u * a
    a = -2.467676584810765e-06 + u * a
    a = 3.169166953513532e-07 + u * a
    a = -1.984832220164592e-08 + u * a
    q = p + z * q
    p = a + z * p
    a = -1.714797640811710e-09
    a = 3.764749684991402e-08 + u * a
    a = -3.939767373564685e-07 + u * a
    a = 2.613763521829951e-06 + u * a
    a = -1.233283061316354e-05 + u * a
    a = 4.400768498343633e-05 + u * a
    a = -1.232695836919466e-04 + u * a
    a = 2.776704452536730e-04 + u * a
    a = -5.110847190954119e-04 + u * a
    a = 7.766889946385862e-04 + u * a
    a = -9.804734958915311e-04 + u * a
    a = 1.030711051771426e-03 + u * a
    a = -9.014840935296654e-04 + u * a
    a = 6.530722412359181e-04 + u * a
    a = -3.885000424703463e-04 + u * a
    a = 1.871176968278645e-04 + u * a
    a = -7.137566902119615e-05 + u * a
    a = 2.082246877174708e-05 + u * a
    a = -4.381138295390771e-06 + u * a
    a = 5.945514963071667e-07 + u * a
    a = -3.928189439553978e-08 + u * a
    q = p + z * q
    p = a + z * p
    a = 3.606008814556496e-09
    a = -7.550893735101084e-08 + u * a
    a = 7.518145454613251e-07 + u * a
    a = -4.732515262587874e-06 + u * a
    a = 2.112211549256592e-05 + u * a
    a = -7.104648192016516e-05 + u * a
    a = 1.868488837478166e-04 + u * a
    a = -3.933768729021518e-04 + u * a
    a = 6.731630572761916e-04 + u * a
    a = -9.451914745780428e-04 + u * a
    a = 1.094269449444114e-03 + u * a
    a = -1.045473282876713e-03 + u * a
    a = 8.217486946631579e-04 + u * a
    a = -5.273676106763079e-04 + u * a
    a = 2.726977161317715e-04 + u * a
    a = -1.112183034464188e-04 + u * a
    a = 3.457045014026606e-05 + u * a
    a = -7.727479611111279e-06 + u * a
    a = 1.111422801665856e-06 + u * a
    a = -7.768019094847735e-08 + u * a
    q = p + z * q
    p = a + z * p
    a = -7.598913387839574e-09
    a = 1.513999852227495e-07 + u * a
    a = -1.430381280289331e-06 + u * a
    a = 8.517532146062999e-06 + u * a
    a = -3.583725370593124e-05 + u * a
    a = 1.131883643231935e-04 + u * a
    a = -2.782543433204830e-04 + u * a
    a = 5.447079492633212e-04 + u * a
    a = -8.613604154901329e-04 + u * a
    a = 1.109369067213441e-03 + u * a
    a = -1.167503221266816e-03 + u * a
    a = 1.002673130093355e-03 + u * a
    a = -6.983720848821816e-04 + u * a
    a = 3.897251758104986e-04 + u * a
    a = -1.707237277890426e-04 + u * a
    a = 5.677116169982539e-05 + u * a
    a = -1.353065465548039e-05 + u * a
    a = 2.069372907734861e-06 + u * a
    a = -1.534726955968500e-07 + u * a
    q = p + z * q
    p = a + z * p
    a = 1.604967253169656e-08
    a = -3.034474067914703e-07 + u * a
    a = 2.712209811782955e-06 + u * a
    a = -1.522644876496291e-05 + u * a
    a = 6.016235227045388e-05 + u * a
    a = -1.776372654101038e-04 + u * a
    a = 4.061025205648488e-04 + u * a
    a = -7.347421974298389e-04 + u * a
    a = 1.065927501981961e-03 + u * a
    a = -1.248220374993483e-03 + u * a
    a = 1.181135550621170e-03 + u * a
    a = -8.991669235604926e-04 + u * a
    a = 5.447959371058193e-04 + u * a
    a = -2.576808617134611e-04 + u * a
    a = 9.209150650879195e-05 + u * a
    a = -2.349905644250963e-05 + u * a
    a = 3.835845466347676e-06 + u * a
    a = -3.029003491220470e-07 + u * a
    q = p + z * q
    p = a + z * p
    a = -3.398290817938269e-08
    a = 6.078920409707070e-07 + u * a
    a = -5.122941089482590e-06 + u * a
    a = 2.701129755023015e-05 + u * a
    a = -9.978524952447136e-05 + u * a
    a = 2.740299743808201e-04 + u * a
    a = -5.790934236000809e-04 + u * a
    a = 9.613990656048678e-04 + u * a
    a = -1.268437754237240e-03 + u * a
    a = 1.335917900944817e-03 + u * a
    a = -1.120918306474167e-03 + u * a
    a = 7.426094148525804e-04 + u * a
    a = -3.815525885879532e-04 + u * a
    a = 1.473284794107755e-04 + u * a
    a = -4.043726926011195e-05 + u * a
    a = 7.074587074905312e-06 + u * a
    a = -5.971038577900400e-07 + u * a
    q = p + z * q
    p = a + z * p
    a = 7.215006513911998e-08
    a = -1.217019097846152e-06 + u * a
    a = 9.633606611539738e-06 + u * a
    a = -4.749687240214586e-05 + u * a
    a = 1.632197476074455e-04 + u * a
    a = -4.144086358054487e-04 + u * a
    a = 8.037560610200238e-04 + u * a
    a = -1.213831517703485e-03 + u * a
    a = 1.440784163442773e-03 + u * a
    a = -1.346018881199313e-03 + u * a
    a = 9.832938551060243e-04 + u * a
    a = -5.527260810285342e-04 + u * a
    a = 2.320018133690466e-04 + u * a
    a = -6.886071098943097e-05 + u * a
    a = 1.297373330047350e-05 + u * a
    a = -1.175440849337122e-06 + u * a
    q = p + z * q
    p = a + z * p
    a = -1.536425669645336e-07
    a = 2.434564656266406e-06 + u * a
    a = -1.802275727341977e-05 + u * a
    a = 8.267079942004839e-05 + u * a
    a = -2.627023971483978e-04 + u * a
    a = 6.122933607777448e-04 + u * a
    a = -1.080555417287162e-03 + u * a
    a = 1.468563030455875e-03 + u * a
    a = -1.546824958612145e-03 + u * a
    a = 1.258743057370946e-03 + u * a
    a = -7.806693051809103e-04 + u * a
    a = 3.587639996667223e-04 + u * a
    a = -1.158674668391434e-04 + u * a
    a = 2.363724644579917e-05 + u * a
    a = -2.310220155147833e-06 + u * a
    q = p + z * q
    p = a + z * p
    a = 3.282609934740578e-07
    a = -4.865183869979903e-06 + u * a
    a = 3.351398504450514e-05 + u * a
    a = -1.421824324424844e-04 + u * a
    a = 4.148563776080995e-04 + u * a
    a = -8.800465884134463e-04 + u * a
    a = 1.398138443008415e-03 + u * a
    a = -1.686871686383771e-03 + u * a
    a = 1.548443459242025e-03 + u * a
    a = -1.070451703407717e-03 + u * a
    a = 5.432093957925954e-04 + u * a
    a = -1.922833327599105e-04 + u * a
    a = 4.274255123486016e-05 + u * a
    a = -4.531941656738187e-06 + u * a
    q = p + z * q
    p = a + z * p
    a = -7.039063801994321e-07
    a = 9.709535090062162e-06 + u * a
    a = -6.187347039968423e-05 + u * a
    a = 2.410857314362180e-04 + u * a
    a = -6.404192409417544e-04 + u * a
    a = 1.223447487745195e-03 + u * a
    a = -1.726266123386799e-03 + u * a
    a = 1.816112268834521e-03 + u * a
    a = -1.417205310132637e-03 + u * a
    a = 8.023447237210812e-04 + u * a
    a = -3.139776909305761e-04 + u * a
    a = 7.661480996090094e-05 + u * a
    a = -8.870292508819385e-06 + u * a
    q = p + z * q
    p = a + z * p
    a = 1.515577309917593e-06
    a = -1.934360104353867e-05 + u * a
    a = 1.132414294229677e-04 + u * a
    a = -4.018384125514074e-04 + u * a
    a = 9.616681624584649e-04 + u * a
    a = -1.632415776284068e-03 + u * a
    a = 2.009621794409224e-03 + u * a
    a = -1.798677524722386e-03 + u * a
    a = 1.150594098055445e-03 + u * a
    a = -5.029715213531967e-04 + u * a
    a = 1.359149346744085e-04 + u * a
    a = -1.731468524739340e-05 + u * a
    q = p + z * q
    p = a + z * p
    a = -3.278066400050099e-06
    a = 3.844699424314832e-05 + u * a
    a = -2.050492658652954e-04 + u * a
    a = 6.557926966524360e-04 + u * a
    a = -1.395239961518239e-03 + u * a
    a = 2.067741586578794e-03 + u * a
    a = -2.167411568644516e-03 + u * a
    a = 1.591926430085998e-03 + u * a
    a = -7.874067950166212e-04 + u * a
    a = 2.381435626310020e-04 + u * a
    a = -3.368630671781489e-05 + u * a
    q = p + z * q
    p = a + z * p
    a = 7.126509256489198e-06
    a = -7.617462713006110e-05 + u * a
    a = 3.663238951062859e-04 + u * a
    a = -1.042139950075382e-03 + u * a
    a = 1.937122316299009e-03 + u * a
    a = -2.446576143380290e-03 + u * a
    a = 2.106973351610762e-03 + u * a
    a = -1.198482443547620e-03 + u * a
    a = 4.110182694826963e-04 + u * a
    a = -6.526885577930785e-05 + u * a
    q = p + z * q
    p = a + z * p
    a = -1.558249253022265e-05
    a = 1.502603443560171e-04 + u * a
    a = -6.431597843457598e-04 + u * a
    a = 1.599800519484330e-03 + u * a
    a = -2.536794622437270e-03 + u * a
    a = 2.635798897896811e-03 + u * a
    a = -1.761043140129611e-03 + u * a
    a = 6.962322821335012e-04 + u * a
    a = -1.258042568318913e-04 + u * a
    q = p + z * q
    p = a + z * p
    a = 3.429410877945074e-05
    a = -2.945378891951526e-04 + u * a
    a = 1.103254201920694e-03 + u * a
    a = -2.343658758360589e-03 + u * a
    a = 3.061808900522601e-03 + u * a
    a = -2.473025971442585e-03 + u * a
    a = 1.151613902254866e-03 + u * a
    a = -2.408506620121365e-04 + u * a
    q = p + z * q
    p = a + z * p
    a = -7.602885926248419e-05
    a = 5.719754645640790e-04 + u * a
    a = -1.832004020846945e-03 + u * a
    a = 3.211678334688065e-03 + u * a
    a = -3.269098011150596e-03 + u * a
    a = 1.846269539284245e-03 + u * a
    a = -4.569582652254866e-04 + u * a
    q = p + z * q
    p = a + z * p
    a = 1.699281686358754e-04
    a = -1.094698809794305e-03 + u * a
    a = 2.899055346206081e-03 + u * a
    a = -3.970229041538404e-03 + u * a
    a = 2.836356351981352e-03 + u * a
    a = -8.561827265871384e-04 + u * a
    q = p + z * q
    p = a + z * p
    a = -3.831049120052880e-04
    a = 2.045108908948195e-03 + u * a
    a = -4.243925134156227e-03 + u * a
    a = 4.097465034965035e-03 + u * a
    a = -1.575247668997669e-03 + u * a
    q = p + z * q
    p = a + z * p
    a = 8.707810047095761e-04
    a = -3.655849358974359e-03 + u * a
    a = 5.377435064935065e-03 + u * a
    a = -2.817495004995005e-03 + u * a
    q = p + z * q
    p = a + z * p
    a = -1.986852433281005e-03
    a = 5.952380952380952e-03 + u * a
    a = -4.802489177489177e-03 + u * a
    q = p + z * q
    p = a + z * p
    a = 4.464285714285714e-03
    a = -7.440476190476190e-03 + u * a
    q = p + z * q
    p = a + z * p
    q = p + z * q
    p = -8.928571428571428e-03 + z * p
    q = pow(z, 2) * q + 2.0 * z * p
    p = pow(z, 2) * p
    P[0] = p
    Q[0] = q
