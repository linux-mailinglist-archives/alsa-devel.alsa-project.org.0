Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF637BED6D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 23:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0F33EE8;
	Mon,  9 Oct 2023 23:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0F33EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696887325;
	bh=sbcf3+uQNhI0ScDGSdYPib55L0AZf4Wf9BddyEqIBn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vd3kFN3P/RbiEs+hFZJPcPPrv194C1CWbvQtbjSwm9wRFqAHcmWfO156tcSaP1ORv
	 kIQUSX50pqnkeb5rRFaN9bS8SD/TP+qOk/HqehrkNGHjaRYl+tU64OKphnAwOZ38QJ
	 HJ33if5BLv0Rpfcmz+SLKw5Phgj27uRn/GbFVGbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 716D9F80130; Mon,  9 Oct 2023 23:34:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B37F8027B;
	Mon,  9 Oct 2023 23:34:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16359F802BE; Mon,  9 Oct 2023 23:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68DB3F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 23:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DB3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=COaB/IHz
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso45979735e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 14:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696887263; x=1697492063;
 darn=alsa-project.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNDOsSTch3MMqY9kI8wZmkDm7oCLtJgQ3JvcvKno3Xk=;
        b=COaB/IHzjkRFrUJPh/TE79hixqyS/RT9+hak7UvxKy13erkGOXyMZRmXoWhBR/n5W0
         rmEZ1EsYnRYjpwEDeuodnHTknCpINAGhQ9Mq5vSdTqwqPpsUSSFO1vbZhMf7FqjSh7AG
         NwGT4F2It97M6x2qEq1LpWo2NQbVE9jnRPyFfUUlaRPQ8/PIk3wm3vIHow+gQVTk2I8U
         umX2cPTG34SKJ3CkED9vvceg1z/FrfDHk+3zdXuB262ZTYJbVcn7aB+nr9WVn+r5Sx3M
         JBVWedGD2zYCaCI8wpND9Afn+VL/6kVsi9xZgdYNCCRf4Wqw1ihfQm7M6B0Gs+qOJSuH
         /hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696887263; x=1697492063;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNDOsSTch3MMqY9kI8wZmkDm7oCLtJgQ3JvcvKno3Xk=;
        b=DXdpKaWTzTex/mMbUMlT61mm7sNhpS3+AWbeEbtYJ7+5yMTSQ6ZL5pLnon1KvS1T8l
         vOuKj/clQ98hV0qF8bxXcg05RlKNqGWBPdYW8G9jeZILBeJ49H/XTygeRQsxVeCX0xvh
         AaaN6km4+RqM2lg4EhvVaa4Qk5/4DGSYZ1/zLzU7JfpZbJkzYiABYMezFcwocb8HLq2R
         81gqDekNEQ8X5MKb6AebtJsIzY3sceUKlfgnr6Vr2bqHR3uFWEX48WHH/KoDce3OO75t
         HEjEugK7W2hWS3pCdd74jFSlw5OmvEZZKYqNA8TYIwPNM8sE4CakRgO7IWwDrtaHdx7m
         twHQ==
X-Gm-Message-State: AOJu0YxfnH7Fm79GjIVVi39voc3OE/uZlqDmjTiMXrCQfUNvE1LZkyy2
	RT+lOTj/W1J6U8qdCK274HA=
X-Google-Smtp-Source: 
 AGHT+IEp21rPlfxlwCIL6YcK9L2I+Ff5iswt4GDSRJHG16laa4xoz7a4kSqpkc/aog/kf6l9kHP+bg==
X-Received: by 2002:adf:e604:0:b0:31f:fdcf:b2b6 with SMTP id
 p4-20020adfe604000000b0031ffdcfb2b6mr14520504wrm.55.1696887263095;
        Mon, 09 Oct 2023 14:34:23 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.dynamic.inetia.pl.
 [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id
 a6-20020a1709062b0600b009b29553b648sm7188210ejg.206.2023.10.09.14.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 14:34:22 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Date: Mon, 09 Oct 2023 23:34:20 +0200
Message-ID: <13421748.dW097sEU6C@dell>
In-Reply-To: <202310090122.Yp9JndiQ-lkp@intel.com>
References: 
 <20231008135601.542356-1-jmkrzyszt@gmail.com>
 <202310090122.Yp9JndiQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23960251.ouqheUzb2q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Message-ID-Hash: OAWDDVUNFNGWLUWTRD2HTMIITEI27XNP
X-Message-ID-Hash: OAWDDVUNFNGWLUWTRD2HTMIITEI27XNP
X-MailFrom: jmkrzyszt@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAWDDVUNFNGWLUWTRD2HTMIITEI27XNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--nextPart23960251.ouqheUzb2q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Date: Mon, 09 Oct 2023 23:34:20 +0200
Message-ID: <13421748.dW097sEU6C@dell>
In-Reply-To: <202310090122.Yp9JndiQ-lkp@intel.com>
MIME-Version: 1.0

Dnia niedziela, 8 pa=C5=BAdziernika 2023 20:03:21 CEST kernel test robot pi=
sze:
> Hi Janusz,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on linus/master v6.6-rc4 next-20231006]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Janusz-Krzysztofik=
/ASoC-ti-ams-delta-Allow-it-to-be-test-compiled/20231008-215910
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=
 for-next
> patch link:    https://lore.kernel.org/r/20231008135601.542356-1-jmkrzysz=
t%40gmail.com
> patch subject: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231009=
/202310090122.Yp9JndiQ-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231009/202310090122.Yp9JndiQ-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310090122.Yp9JndiQ-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> sound/soc/ti/ams-delta.c:401:24: error: initialization of 'void (*)(st=
ruct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (*)(struct t=
ty_struct *, const unsigned char *, const unsigned char *, unsigned int)'} =
from incompatible pointer type 'void (*)(struct tty_struct *, const u8 *, c=
onst char *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char =
*, const char *, int)'} [-Werror=3Dincompatible-pointer-types]
>      401 |         .receive_buf =3D cx81801_receive,
>          |                        ^~~~~~~~~~~~~~~
>    sound/soc/ti/ams-delta.c:401:24: note: (near initialization for 'cx818=
01_ops.receive_buf')
>    cc1: some warnings being treated as errors

This is the error I reported and fixed in the recent "[PATCH] ASoC: ti:=20
ams-delta: Fix cx81801_receive() argument types".  This change just=20
exhibits that error, still present in trees without that fix.

Mark, if you are OK with this change, could you please give your ack, like=
=20
you did for the fix?

Greg, since you already added that fix to your tty-linux tree, commit=20
b3fa3cf02e3c, could you please also take this patch?

Thanks,
Janusz

>=20
>=20
> vim +401 sound/soc/ti/ams-delta.c
>=20
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
393 =20
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
394  static struct tty_ldisc_ops cx81801_ops =3D {
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
395  	.name =3D "cx81801",
> fbadf70a8053b3 sound/soc/ti/ams-delta.c   Jiri Slaby         2021-05-05  =
396  	.num =3D N_V253,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
397  	.owner =3D THIS_MODULE,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
398  	.open =3D cx81801_open,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
399  	.close =3D cx81801_close,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
400  	.hangup =3D cx81801_hangup,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29 @=
401  	.receive_buf =3D cx81801_receive,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
402  	.write_wakeup =3D cx81801_wakeup,
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
403  };
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
404 =20
> 6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  =
405 =20
>=20
>=20


--nextPart23960251.ouqheUzb2q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmUkcdwACgkQ2WqSnlts
jBpG1gf/Xf4UDGXaQO6w4A4PbxFkumCYro0do9ngRH668OOuaTn//xqnKsziL5mS
gRCV3IF60YSwaVHBF3AU4S8PNDTugigA+w+jqXViYDa1AhFqB7S4SvlT0c7Gt33S
yu4vDHnZvd4bpXQdqCMUcVkBpFHEboXor/j7oKOIyf51EF9Zn503mFWeqwA8Z7tm
iEAWcQPIaforwJBnNrIf79Q2K1cnmhVX7DaUqJFknWRR9sH+ZIBBZhpqL4nAVk2j
ep9un8kB7Q3WWH00K9MUS5P33IVUQk65g/0CVsAK7fDvYnaeTLgeTWRGrZYyGTTt
TYsrbGjitpvPKDEl4h1IOkKi3gU0lA==
=8g9/
-----END PGP SIGNATURE-----

--nextPart23960251.ouqheUzb2q--



