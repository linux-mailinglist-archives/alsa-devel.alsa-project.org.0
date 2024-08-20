Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8829586B4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 14:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CA7828;
	Tue, 20 Aug 2024 14:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CA7828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724156212;
	bh=UD2iWnBN1K1lx4fAL3Rx1S9GAo9ArXuFHIb6cBCtmlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ku0Do0WzAG332gwe4Hg+yvgB+k1Dg/T/7OHz6DwU7mPyuID75ErfYhD854wWJMO/2
	 mFJ8y8XWqup32DtlxFxw1rECnu7KmRcSTo9sYqsiilozCSNP5Oo5JvYQKWPi8Z/Uam
	 cFL1PflbV6PlxPr9QD4c++U/Xj0P2AHG577ecDIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CDACF805B6; Tue, 20 Aug 2024 14:16:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C648F805AF;
	Tue, 20 Aug 2024 14:16:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98B97F80494; Tue, 20 Aug 2024 14:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDD78F8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 14:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDD78F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oWGaHhMQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B641060D54;
	Tue, 20 Aug 2024 12:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB21C4AF13;
	Tue, 20 Aug 2024 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724156156;
	bh=UD2iWnBN1K1lx4fAL3Rx1S9GAo9ArXuFHIb6cBCtmlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWGaHhMQZIU2vQziqFzFEfECPlPbLi3b+OfUgLvZJoLYcAWfY7gNi2Nkg8r9/wJJS
	 jiYW3IAxdsyMm2bzuUHggFmk8GpmEfz35ho4kF2APKI9AFj09B2Z8MQp7RruDRlEyA
	 xuDsWAPIqRsBCz6qRvOa5vKwAQ4uFOr1KlO/tb+rcn/d2j/qrpUuHibaaiupuceAsW
	 3ZIXv+BDbSt2wF92EMcG+s8JxMfLJE5R+Duc3g6/JlTeGnLoAtHhDFaW/Wv9qfZHzR
	 WT8sNjBrPbF3lAZjJKfSsIadu+m/hcDRX+GZuYR8Nv0LozxNf02V7aVsyoaOfZblTj
	 XAhexZJuqWouQ==
Date: Tue, 20 Aug 2024 13:15:47 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"zhourui@huaqin.com" <zhourui@huaqin.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Salazar, Ivan" <i-salazar@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"Yue, Jaden" <jaden-yue@ti.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Rao, Dipa" <dipa@ti.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
	"Xu, Baojun" <baojun.xu@ti.com>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"Chadha, Jasjot Singh" <j-chadha@ti.com>,
	"judyhsiao@google.com" <judyhsiao@google.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"cujomalainey@google.com" <cujomalainey@google.com>,
	"Kutty, Aanya" <aanya@ti.com>,
	"Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
	"savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
	"flaviopr@microsoft.com" <flaviopr@microsoft.com>,
	"Ji, Jesse" <jesse-ji@ti.com>,
	"darren.ye@mediatek.com" <darren.ye@mediatek.com>,
	"antheas.dk@gmail.com" <antheas.dk@gmail.com>,
	"Jerry2.Huang@lcfuturecenter.com" <Jerry2.Huang@lcfuturecenter.com>,
	"jim.shil@goertek.com" <jim.shil@goertek.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: fixed the issue that
 the chip do not shutdown immediatly after aplay stopped
Message-ID: <75d68eea-61e4-4e06-83d4-072072d15c41@sirena.org.uk>
References: <20240819141017.502-1-shenghao-ding@ti.com>
 <06667a01-32ee-403b-8c59-1ee37d2ef192@sirena.org.uk>
 <03a3979be8af486f9911277172725d8b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qql/TEzOPNy+pYOU"
Content-Disposition: inline
In-Reply-To: <03a3979be8af486f9911277172725d8b@ti.com>
X-Cookie: You are false data.
Message-ID-Hash: I4IR523Q4TYTKC7EZFM3T2C6XJY3ACKP
X-Message-ID-Hash: I4IR523Q4TYTKC7EZFM3T2C6XJY3ACKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4IR523Q4TYTKC7EZFM3T2C6XJY3ACKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qql/TEzOPNy+pYOU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 04:34:00AM +0000, Ding, Shenghao wrote:

> > This is a much heavier weight operation than we're expecting for a mute=
, it
> > should usually just be literally muting - one or two register writes, n=
ot a power
> > up/down sequence

> Can the power on is still kept in DAMP, and move the power off(Only set t=
he register 0x2 to 0xe)=20
> into the .mute_stream?

Wouldn't that break when a second stream is played, unless whatever is
holding the output open is fixed DAPM will still have the device active
and therefore not redo the power up sequence?

--qql/TEzOPNy+pYOU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbEiPIACgkQJNaLcl1U
h9A1VQf8C4wenI1tyC54PB9RZ4HBag9vM0bqHAldRpHz2yEdUjnKIQMJoB/jBMnE
YczAse7xlrNbEPae5X/cNsGMwzBIORtq/dsNq367WokMJFzuG5/D4YMDoSqU1jpW
Tw/Tog/74y6HNoXcED8ZKCYsgG1Y3wQQIafgF3m/rnZadsmmfw6cW49FZ9E6csh+
2SJGKd2YEeZWodcortFr0uo+G1t1Hr/KVrSSCVlvqpAaWQ/hrg+gokW5Yhe/RmIx
OhwNDxJhNRBl1jFoXYGL2u/9ry3g92yIJ5Si0J2cXpJhSFf+hvj+6aBlO8cXtEnX
4/KYf8b5M0GTLVcWohrxJy70drHRCA==
=HW/Q
-----END PGP SIGNATURE-----

--qql/TEzOPNy+pYOU--
