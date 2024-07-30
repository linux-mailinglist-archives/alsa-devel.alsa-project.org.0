Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C19411F4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 14:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3906CA4B;
	Tue, 30 Jul 2024 14:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3906CA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722342841;
	bh=prajFAXc15IKFQqLopgO8RX/edCg/+NlgdG7rdK6U/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mFpmhDjTkUej+ow6ngmAG7vx/StuurgJnCo+oiMIFy6Hm8WWwOMHapxHeOeaF5nxo
	 yrGlSlVbqmyYH2unzFBzVTdvQg7tPejri+F2W+CNiM3/aL/BE/zGTghm5u3r+ss3Ba
	 X0n0ub58mJlRU2jCNYcYSde8lAkyiUABoZOnBrNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E689F805BF; Tue, 30 Jul 2024 14:33:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 308A0F80589;
	Tue, 30 Jul 2024 14:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE26CF802DB; Tue, 30 Jul 2024 14:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74459F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 14:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74459F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PmuBha4/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 424F4CE0F21;
	Tue, 30 Jul 2024 12:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A2DC4AF0A;
	Tue, 30 Jul 2024 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722342453;
	bh=prajFAXc15IKFQqLopgO8RX/edCg/+NlgdG7rdK6U/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmuBha4/V+uRHTVN+VPOqRW/TQ30dPB6xXATXhyonRat7B2RfN7P8YkKRrE15qFRi
	 WtBcvhKW1kueI7YgCPrv6BLxE5NKD9iAj9syawPvx42rRHJaCisiKyEPxpQVNzwy8Q
	 DGkdm0+qPLQR3GaHqDcfUt2JlAYCzE7/OyCbgRx8ts4l5bF86F7C10l/WvgfiQfemg
	 EO3ejrHVI4CvCYfDrmIjimYePkS5bvVsfq7esD/RZD5V+MghD5OYnmhuFdJq/6Y6ih
	 3OyC97nXxoWq8QXRHxoiOLqCs7+qF5STFLIFhdqPOQ+WFECAiA0+z161AcGqOTjTCU
	 Em4SEGCQRSBdQ==
Date: Tue, 30 Jul 2024 13:27:24 +0100
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Chadha, Jasjot Singh" <j-chadha@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"Yue, Jaden" <jaden-yue@ti.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Rao, Dipa" <dipa@ti.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
	"Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"judyhsiao@google.com" <judyhsiao@google.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"cujomalainey@google.com" <cujomalainey@google.com>,
	"Kutty, Aanya" <aanya@ti.com>,
	"Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
	"savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
	"flaviopr@microsoft.com" <flaviopr@microsoft.com>,
	"Ji, Jesse" <jesse-ji@ti.com>,
	"darren.ye@mediatek.com" <darren.ye@mediatek.com>,
	"antheas.dk@gmail.com" <antheas.dk@gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Move tas2563_dvc_table
 into a separate Header file
Message-ID: <e8ce11fd-ff6a-4ca0-ac33-5abf20cf242d@sirena.org.uk>
References: <20240716061123.127-1-shenghao-ding@ti.com>
 <1dc0518a-f0b3-4617-9c79-ac903ca9ee33@sirena.org.uk>
 <9f92b5275c3e4b7d896e90f8a654f11e@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M31YrSuujxfYiekN"
Content-Disposition: inline
In-Reply-To: <9f92b5275c3e4b7d896e90f8a654f11e@ti.com>
X-Cookie: Don't SANFORIZE me!!
Message-ID-Hash: BOZ6WDRIMY6DMRZJJPL43N7AG7A4T22Z
X-Message-ID-Hash: BOZ6WDRIMY6DMRZJJPL43N7AG7A4T22Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOZ6WDRIMY6DMRZJJPL43N7AG7A4T22Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--M31YrSuujxfYiekN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 01:24:34AM +0000, Ding, Shenghao wrote:

> One more thing, these day my colleague and I want have some adjustment on=
 the=20
> tas2781 driver code to support both i2c and spi interface, and plan to ab=
stract
> the common part, especially the dsp binary parsing, as a shared lib. Woul=
d you
> be so kind and give us some advice on it? Thanks.

That seems like a sensible and reasonable design - factoring out common
code is a good idea, there's a number of existing drivers doing things
ike that.  Possibly the biggest example is the Cirrus/Wolfson Arizona
drivers and the wm_adsp DSPs they use.  Do you have specific questions
around this?

--M31YrSuujxfYiekN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmao3CsACgkQJNaLcl1U
h9BGQgf4kAzdugFNKyAftef9KQS+4e7h1g9tO7s0fepdIaECIgySGuABwn0nfyjh
DKoldNoNHuv/YOW7I1iwHkcgG+WGaR7i2cfecBTBmHOmuELB+HUx+3WypdxiVBJA
QvtR70ebI/7G3f259pd4v1PIMxNt8gkIn7hYyouqI21ocPKd9W93lR7lzia/B42a
p3zrqgnIgXH8w724gwYjuTdYQfqJPoHUPWNGtLoT5Vcpd6SPtq1aC2L77E5buUxa
21LXUGX3h3X4up38Cd4jaPb2Y/+3bPzW++33PhEcTSgc456HoNHXN/z1+k9/+b8b
4IJb5mBQWptGhDn0Pv+DucscmB8w
=3BSB
-----END PGP SIGNATURE-----

--M31YrSuujxfYiekN--
