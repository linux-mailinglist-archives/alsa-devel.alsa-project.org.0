Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58307020F8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 03:09:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3C41F7;
	Mon, 15 May 2023 03:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3C41F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684112994;
	bh=UFENhqiakD8QEtrxSxXbki36RDciOCSV149yt6dLUlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mvw5djgoTiJTVcarauWLcp1z7HTcy5UeRM6VHIj1n4FaLPj3vbzs9uRvZmEDFvVnl
	 AKlZSoFJ5d5W1yl64iTWxu8/liukBfgTJURl2xMSbHIWF1wjKdSIfZZiAZu2p/+YBi
	 TKFwQivzBWHfoQZw2m6/Jif7jjC3fRwLy9hz5G0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FE0BF80548; Mon, 15 May 2023 03:09:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B4EF8025A;
	Mon, 15 May 2023 03:09:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A59C1F80272; Mon, 15 May 2023 03:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC827F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 03:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC827F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MqHY9HYL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5609761009;
	Mon, 15 May 2023 01:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27439C433D2;
	Mon, 15 May 2023 01:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684112929;
	bh=UFENhqiakD8QEtrxSxXbki36RDciOCSV149yt6dLUlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqHY9HYLeLXi4X5n8tlA7eZm0k1zWxi6SE24zzL6vY3HeFydLIlXAeZfuxfCQMdBa
	 osGgaBJaF8NiHdQc5assWlUveJQw10+sC4S8OWBhynMwo2mxBIy+Msyj0NIcnDvvNo
	 5b8/xoJ5n5lQcnI5XXaUJMc0wDG24CSzavQJ7fPOlpSeH9Il55dc4LUGodOXpP55/I
	 HjNP2l3t8ohx6pnNvdPpXMbNvFjRG8OCL3Kbc+RHCubIgvOPeWdfo2pA8btRes3QK0
	 dRvploNr47/xOMW0g5jhccZMEN3xea4i3rwgcvmVQpGNxagOCMHDtrokcbVqr8F/BA
	 xxdBfc0HZjgdQ==
Date: Mon, 15 May 2023 10:08:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Marc Zyngier <maz@kernel.org>, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	tglx@linutronix.de, linus.walleij@linaro.org, vkoul@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
Message-ID: <ZGGGGcZNEx7o8GC6@finisterre.sirena.org.uk>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
 <86o7mpmvqq.wl-maz@kernel.org>
 <20230512153933.GH68926@ediswmail.ad.cirrus.com>
 <86mt29mt2m.wl-maz@kernel.org>
 <20230512164233.GN68926@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elVqdTBpOwS6uzdG"
Content-Disposition: inline
In-Reply-To: <20230512164233.GN68926@ediswmail.ad.cirrus.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: GVTPTPMZ45JR7CDQNMKRMI4TJP2ORBZC
X-Message-ID-Hash: GVTPTPMZ45JR7CDQNMKRMI4TJP2ORBZC
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVTPTPMZ45JR7CDQNMKRMI4TJP2ORBZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--elVqdTBpOwS6uzdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 12, 2023 at 04:42:33PM +0000, Charles Keepax wrote:

> I guess if Mark doesn't mind I think the only internal bit of the
> device that uses the IRQs is the CODEC driver so I could move the
> IRQ handling in there, it does seem a little odd to me, but I
> guess I don't have any problems with it.

The obvious (and previously standard) place for it would be the MFD.

--elVqdTBpOwS6uzdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRhhhgACgkQJNaLcl1U
h9AQBwf/Vl7z7xogRyvrOyQVvmOhb4t1sIM1jgniNv/+CSDFa4/NyBY16e3xpB59
b5NYJGg0YEv4Zo19kQql1gLRJPIaW5AkS+gK7qIFRlAnnx8aJc1MlwrVWZKUmRPY
eoJMOiHSt8WnHU2ib94i8kpDtpzPI5D9nmTnn63wWCiWEv28gu57kGp21j/5zuBi
FssPHGDJIIskV8g7lqRxjNmY/eEy22/afYtGy9yYS9yyqPZCFATQ/998Fo+r11u/
OWS0qAXCzxT+3OKj/nabwTenvVqnwXjCmfdI4Oq83I3Ecf04lVHt+hxk1SLACcdz
vDQ+BpPpUMUg561BpqXtF0Vv5KkdSg==
=ORMJ
-----END PGP SIGNATURE-----

--elVqdTBpOwS6uzdG--
