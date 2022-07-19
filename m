Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43871579730
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 12:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C5F16BA;
	Tue, 19 Jul 2022 12:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C5F16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658224988;
	bh=80bZm4zlczb/8ZMuPnYJlvT55H3NQ90bPY0IYqlN+eA=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+mmqKBxPjp97QSlseipW8yYHd0M4GDYkrHccSSsqiKCcghBFV9Dn5p/5OK0rftJk
	 nXauQKGPlkrnHX7vZRMr47LdZLhdiqpfJ2tFm6JjDS7SFZtda9141L+dywKVjiIXli
	 cMunbuaUAd46KPLX/nOPDqr2ZZz4ocxIIElstL34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40635F80224;
	Tue, 19 Jul 2022 12:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EDD0F80125; Tue, 19 Jul 2022 12:02:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB1FDF80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 12:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1FDF80125
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-321-44wpZVbANnSqGgqWPqcHHw-1; Tue, 19 Jul 2022 11:01:55 +0100
X-MC-Unique: 44wpZVbANnSqGgqWPqcHHw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Tue, 19 Jul 2022 11:01:54 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Tue, 19 Jul 2022 11:01:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Shengjiu Wang' <shengjiu.wang@nxp.com>, "shengjiu.wang@gmail.com"
 <shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, 
 "tiwai@suse.com" <tiwai@suse.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Thread-Topic: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Thread-Index: AQHYm1RF9VBLG0gK5ky/ItlmeeUnS62FdfSA
Date: Tue, 19 Jul 2022 10:01:54 +0000
Message-ID: <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shengjiu Wang
> Sent: 19 July 2022 10:28
>=20
> Fix sparse warning:
> sound/soc/fsl/fsl_asrc.c:1177:60: sparse: warning: incorrect type in argu=
ment 3 (different base types)
> sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    expected unsigned int [usert=
ype] *out_value
> sound/soc/fsl/fsl_asrc.c:1177:60: sparse:    got restricted snd_pcm_forma=
t_t *
> sound/soc/fsl/fsl_asrc.c:1200:47: sparse: warning: restricted snd_pcm_for=
mat_t degrades to integer
>=20
> Fixes: 4520af41fd21 ("ASoC: fsl_asrc: Support new property fsl,asrc-forma=
t")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 20a9f8e924b3..544395efd605 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1174,7 +1174,7 @@ static int fsl_asrc_probe(struct platform_device *p=
dev)
>  =09=09return ret;
>  =09}
>=20
> -=09ret =3D of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_forma=
t);
> +=09ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32 *)&asrc->asr=
c_format);

Ugg, you really shouldn't need to do that.
It means that something is badly wrong somewhere.
Casting pointers to integer types is just asking for a bug.

>  =09if (ret) {
>  =09=09ret =3D of_property_read_u32(np, "fsl,asrc-width", &width);
>  =09=09if (ret) {
> @@ -1197,7 +1197,7 @@ static int fsl_asrc_probe(struct platform_device *p=
dev)
>  =09=09}
>  =09}
>=20
> -=09if (!(FSL_ASRC_FORMATS & (1ULL << asrc->asrc_format))) {
> +=09if (!(FSL_ASRC_FORMATS & (1ULL << (__force u32)asrc->asrc_format))) {

Ditto.

=09David

>  =09=09dev_warn(&pdev->dev, "unsupported width, use default S24_LE\n");
>  =09=09asrc->asrc_format =3D SNDRV_PCM_FORMAT_S24_LE;
>  =09}
> --
> 2.34.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

