Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB61736B62
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 13:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CE414E;
	Tue, 20 Jun 2023 13:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CE414E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687261668;
	bh=C+FiMJ1INtmm+m9AePVrGfbLxaYft8hCj0GpBNdZ+AY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gq5s9fMaKK72dMPJQcwi4qdt9TX8wqWbdOmXI6Ao8V6Df7oz/jBwxCM8Lgvs5SJr9
	 YIffk8hbIvG9qpgg9/z8QtkgOrtOs0iWtCeqw7BbKdG2UPE9bk8n3RB/P2aNtKF9Qc
	 FPkW3XDx4Pb9OXL7ugjfxnA97Ekx30pGhRuFuVQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2440BF80163; Tue, 20 Jun 2023 13:46:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB62F80132;
	Tue, 20 Jun 2023 13:46:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6FD1F80141; Tue, 20 Jun 2023 13:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F21E9F80124
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 13:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F21E9F80124
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-183-CwR9mL0JPti0FE6q9jlz4w-1; Tue, 20 Jun 2023 12:45:04 +0100
X-MC-Unique: CwR9mL0JPti0FE6q9jlz4w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 20 Jun
 2023 12:45:02 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 20 Jun 2023 12:45:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Herve Codina' <herve.codina@bootlin.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>
Subject: RE: [PATCH v5 07/13] minmax: Introduce {min,max}_array()
Thread-Topic: [PATCH v5 07/13] minmax: Introduce {min,max}_array()
Thread-Index: AQHZn535xpz9i2gsDE6nNaGlDsvHDa+TlXFw
Date: Tue, 20 Jun 2023 11:45:01 +0000
Message-ID: <70697b976107473b8779eea7d6c8a189@AcuMS.aculab.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
 <20230615152631.224529-8-herve.codina@bootlin.com>
In-Reply-To: <20230615152631.224529-8-herve.codina@bootlin.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5AKB3WRTWAG4BHIHL27ZZ27JNV4JTGMX
X-Message-ID-Hash: 5AKB3WRTWAG4BHIHL27ZZ27JNV4JTGMX
X-MailFrom: david.laight@aculab.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AKB3WRTWAG4BHIHL27ZZ27JNV4JTGMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Herve Codina
> Sent: 15 June 2023 16:26
>=20
> Introduce min_array() (resp max_array()) in order to get the
> minimal (resp maximum) of values present in an array.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  include/linux/minmax.h | 64 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> index 396df1121bff..1672985b02a3 100644
> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -133,6 +133,70 @@
>   */
>  #define max_t(type, x, y)=09__careful_cmp((type)(x), (type)(y), >)
>=20
> +/*
> + * Remove a const qualifier from integer types
> + * _Generic(foo, type-name: association, ..., default: association) perf=
orms a
> + * comparison against the foo type (not the qualified type).
> + * Do not use the const keyword in the type-name as it will not match th=
e
> + * unqualified type of foo.
> + */
> +#define __unconst_integer_type_cases(type)=09\
> +=09unsigned type:  (unsigned type)0,=09\
> +=09signed type:    (signed type)0
> +
> +#define __unconst_integer_typeof(x) typeof(=09=09=09\
> +=09_Generic((x),=09=09=09=09=09=09\
> +=09=09char: (char)0,=09=09=09=09=09\
> +=09=09__unconst_integer_type_cases(char),=09=09\
> +=09=09__unconst_integer_type_cases(short),=09=09\
> +=09=09__unconst_integer_type_cases(int),=09=09\
> +=09=09__unconst_integer_type_cases(long),=09=09\
> +=09=09__unconst_integer_type_cases(long long),=09\
> +=09=09default: (x)))

Those are probably more generally useful and belong elsewhere.

> +
> +/*
> + * Do not check the array parameter using __must_be_array().
> + * In the following legit use-case where the "array" passed is a simple =
pointer,
> + * __must_be_array() will return a failure.
> + * --- 8< ---
> + * int *buff
> + * ...
> + * min =3D min_array(buff, nb_items);
> + * --- 8< ---

Is that needed in the .h file?

> + *
> + * The first typeof(&(array)[0]) is needed in order to support arrays of=
 both
> + * 'int *buff' and 'int buf[N]' types.
> + *
> + * The array can be an array of const items.
> + * typeof() keeps the const qualifier. Use __unconst_typeof() in order t=
o
> + * discard the const qualifier for the __element variable.
> + */
> +#define __minmax_array(op, array, len) ({=09=09=09=09\
> +=09typeof(&(array)[0]) __array =3D (array);=09=09=09=09\
> +=09typeof(len) __len =3D (len);=09=09=09=09=09\
> +=09__unconst_integer_typeof(__array[0]) __element =3D __array[--__len]; =
\

s/__element/__bound/

> +=09while (__len--)=09=09=09=09=09=09=09\
> +=09=09__element =3D op(__element, __array[__len]);=09=09\
> +=09__element; })

I'm not all sure that all the shenanigans required to use min()
is really needed here.

It would also be generally better to process the array forwards.
So something like:
=09typeof (&array[0]) __ptr =3D array, __limit =3D array + len;
=09typeof (array[0] + 0) __element, __bound =3D *__ptr++;
=09while (ptr < __limit) {
=09=09__element =3D *__ptr++;
=09=09if (__element > __bound)
=09=09=09__bound =3D __element;
=09}
=09(typeof (array[0]))__bound; })
seems fine to me.
The final cast is there to convert 'int' back to un/signed char|short.
Not really needed and might generate worse code.

But if you insist on using min/max ignore this bit.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

