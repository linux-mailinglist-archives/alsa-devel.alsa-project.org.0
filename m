Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13B876463
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 13:36:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D1BB93A;
	Fri,  8 Mar 2024 13:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D1BB93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709901380;
	bh=FO/2tbdfopZ0jgXfxeznKBXF2Z6rQryzkEHxQzSdob4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OqYUv1SKuqygeveu29WK6t/FMP8lEziuvQjwmHfO1hbV90Nw31Tmglgknv3l24hf5
	 Xy90ingAL3DfNnTxV7mj6B4Na8xjsblOYoxw1g6YofApdn9+/7JFq8ORuf0jALPFwR
	 EgiUFs4XEM9eqdsOvZJSJ3Ff9pHklJ4eraV/1mJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B08BF805AB; Fri,  8 Mar 2024 13:35:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1373F8057E;
	Fri,  8 Mar 2024 13:35:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DA34F8024E; Fri,  8 Mar 2024 13:35:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6788DF80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 13:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6788DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TYOhrchC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51BBD61785;
	Fri,  8 Mar 2024 12:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A38FC43394;
	Fri,  8 Mar 2024 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709901328;
	bh=FO/2tbdfopZ0jgXfxeznKBXF2Z6rQryzkEHxQzSdob4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYOhrchCM5AcfxPJr1oIyABZAaxg9gskQp8WoHXfOeui02f9YDOiUEccLFAfpD2MU
	 EiUsJt/4PuPnbdyx9XpqQeesIstI/T4Dps8oISJ/y5AUG8qglej8saE4q/j8uFmuQD
	 MtyJSyWiCJfn8zC3DSxgZZhC3aFuUlWjbwyNJa2caxdbIUR3V6GYfzhBTdUg0iUfYL
	 7DDTDQ/azQpLSE//PcmZ7EJMqDDLBKsliYdSOxj5Y2ZCkCx0GHh5Gy+4sf/Gaq7XKx
	 3nO8obKNqOFLq8Y8riZvs/8P5jhDuqveb687JPfbxHzKcjxYU2SzHwk8DBGqK0Cm2J
	 b7zKSu+WHLzaA==
Date: Fri, 8 Mar 2024 12:35:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH v1 2/2] ASoC:
 starfive: Add PDM controller support
Message-ID: <330cf044-75e2-4938-b886-ce13003d30e8@sirena.org.uk>
References: <20240307033708.139535-1-xingyu.wu@starfivetech.com>
 <20240307033708.139535-3-xingyu.wu@starfivetech.com>
 <fddca901-273c-4b06-ad59-d156941920d6@sirena.org.uk>
 <NTZPR01MB0956E2033EDDA3FFE1211ACD9F27A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmTquCiKJJKa3CmU"
Content-Disposition: inline
In-Reply-To: 
 <NTZPR01MB0956E2033EDDA3FFE1211ACD9F27A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-Cookie: Isn't this my STOP?!
Message-ID-Hash: FAMZ3W63PHCBD5QCJXUMW3HL3SGJXVLF
X-Message-ID-Hash: FAMZ3W63PHCBD5QCJXUMW3HL3SGJXVLF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAMZ3W63PHCBD5QCJXUMW3HL3SGJXVLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PmTquCiKJJKa3CmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 08, 2024 at 08:45:45AM +0000, Xingyu Wu wrote:
> > On Thu, Mar 07, 2024 at 11:37:08AM +0800, Xingyu Wu wrote:

> > > +	if (!device_property_read_u8(&pdev->dev, "starfive,pdm-modulex",
> > &using_modulex))
> > > +		if (using_modulex == 1)
> > > +			base += JH8100_PDM_MODULEX_SHIFT; /* Use module 1 */

> > This really looks like you've got one hardware block with two devices in it, either
> > the address ranges registered for the devices in DT should be separate and you
> > shouldn't need this property or you should have one component registering both
> > PDM interfaces.

> Yeah, They like two independent device and have different register to
> configure, but just use the same clocks and resets.  Due to the sample
> rate depend on the share clocks, they should be registered together as
> a 4-channel capture device (rarely used), or just one of them can be
> registered separately as a 2-channel device.  BTW, can I use the
> 0x12250000 about the property of reg for device 0 or 0x12250010 for
> device 1 to choose which device to be used in DT?

Ah, so it's actually a small MFD but given that it's two audio blocks
possibly not worth registering as such.  I'd register two stereo DAIs to
one component and then use the DAI ID to figure out which registers to
write to.  Four channel mode might need a property to put everything as
one DAI and not register the second one, or it might just be OK to let
the first DAI be 4 channel with runtime error checking.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--PmTquCiKJJKa3CmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXrBgoACgkQJNaLcl1U
h9DEhwf+KgApJjUr4IiU+vvCVeMKJxlSEoO7nfmdqt1/A6QTnqv6jBiCGSwpMIHx
h+m+KI68xKrBA8J2ufPN/KnCh0prXfy8vOPOccavWBg4UdDm6LHnheeZHXt+xgla
VRAaPw9XpGmW7mo2lqY4QR6lutgLIQDxIoLjzRepCFoFrTQIH2yaSqUxcakRwaFA
KfqgAyDhr+NrZSThLLoHuJjGQOVEyA8TOwrjKPnG3GVjhLupXbr6UgR3BZ7I7saf
k7zYnzW4/HSb3ACbYaHCkwL88RVCFdih43ZpIwNKgxeFpB9/FYa0ow4xk3nGjoPn
cEbVA3HKOGq0/mGsOzLEYgAc2u4Vdg==
=kMbj
-----END PGP SIGNATURE-----

--PmTquCiKJJKa3CmU--
