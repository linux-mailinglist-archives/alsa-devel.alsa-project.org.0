Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED0723757
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 08:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07A1847;
	Tue,  6 Jun 2023 08:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07A1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686031945;
	bh=0/SEa1+QK/S1pwf87rIZ/2RyLZE/h3augkTvqyVw3hE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tmFUUafJ2giBfLWrxrSU2QBsbzT+Mq47xqT79EueqS4gKUX7QBdB4wwg4S0DYjJ+5
	 wo3KE48yjWMwBHkdJYbTgrUYIrIBQUi8ub+PfrCeg6oOHw83CE2uC0jHCAJQUwDUIp
	 jt3cDkl2+Teebi4FMS13U5ZE5TT2XH0SvIFdicio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFDCF805D8; Tue,  6 Jun 2023 08:09:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 562B5F805CB;
	Tue,  6 Jun 2023 08:09:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D4A2F80199; Mon,  5 Jun 2023 19:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 568E3F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 19:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 568E3F80155
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QZg1N2bmLz67ftX;
	Tue,  6 Jun 2023 01:03:52 +0800 (CST)
Received: from localhost (10.126.171.223) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 5 Jun
 2023 18:05:48 +0100
Date: Mon, 5 Jun 2023 18:05:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Herve Codina <herve.codina@bootlin.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 5/9] iio: inkern: Add a helper to query an available
 minimum raw value
Message-ID: <20230605180547.0000528b@Huawei.com>
In-Reply-To: 
 <CAHp75Vec3fXT6phqvLGSn0c09USCXXF6ZoE+X1VNJGM6jyf=aQ@mail.gmail.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-6-herve.codina@bootlin.com>
	<ZHtIdTZbULl6t4RT@surfacebook>
	<20230605094637.7615b689@bootlin.com>
	<CAHp75Vec3fXT6phqvLGSn0c09USCXXF6ZoE+X1VNJGM6jyf=aQ@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.126.171.223]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-MailFrom: jonathan.cameron@huawei.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: QVLQZGKDYZBVV6WU7UH2K7Z2CKTURKPC
X-Message-ID-Hash: QVLQZGKDYZBVV6WU7UH2K7Z2CKTURKPC
X-Mailman-Approved-At: Tue, 06 Jun 2023 06:09:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVLQZGKDYZBVV6WU7UH2K7Z2CKTURKPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 5 Jun 2023 12:45:24 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Jun 5, 2023 at 10:46=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> > On Sat, 3 Jun 2023 17:04:37 +0300
> > andy.shevchenko@gmail.com wrote: =20
> > > Tue, May 23, 2023 at 05:12:19PM +0200, Herve Codina kirjoitti: =20
>=20
> ...
>=20
> > > > +           case IIO_VAL_INT:
> > > > +                   *val =3D vals[--length]; =20
> > > =20
> > > > +                   while (length) { =20
> > >
> > >                       while (length--) {
> > >
> > > will do the job and at the same time...
> > > =20
> > > > +                           if (vals[--length] < *val)
> > > > +                                   *val =3D vals[length]; =20
> > >
> > > ...this construction becomes less confusing (easier to parse). =20
> >
> > Indeed, I will change in the next iteration. =20
>=20
> And looking into above line, this whole construction I would prefer to
> have a macro in minmax.h like
>=20
> #define min_array(array, len) \
> {( \
>   typeof(len) __len =3D (len); \
>   typeof(*(array)) __element =3D (array)[--__len]; \
>   while (__len--) \
>     __element =3D min(__element, (array)[__len]); \
>   __element; \
> )}
>=20
> (it might need more work, but you got the idea)
>=20
> > > > +                   }
> > > > +                   break; =20
>=20
> ...
>=20
> > > > +           default:
> > > > +                   /* FIXME: learn about min for other iio values =
*/ =20
> > >
> > > I believe in a final version this comment won't be here. =20
> >
> > We have the same FIXME comment in the iio_channel_read_max() function I
> > copied to create this iio_channel_read_min() and, to be honest, I
> > don't really know how to handle these other cases.
> >
> > In this series, I would prefer to keep this FIXME. =20
>=20
> I see, Jonathan needs to be involved here then.

It's really more of a TODO when someone needs it than a FIXME.
I'm not particularly keen to see a bunch of code supporting cases
that no one uses, but it's useful to call out where the code would
go if other cases were to be supported.

Perhaps soften it to a note that doesn't have the work FIXME in it.

Jonathan


>=20
> > > > +                   return -EINVAL; =20
>=20

