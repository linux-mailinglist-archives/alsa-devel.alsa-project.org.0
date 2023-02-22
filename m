Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E48769F46A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 13:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65680EAC;
	Wed, 22 Feb 2023 13:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65680EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677068466;
	bh=2+2TJkgRXCmNd9+5BaM+df/ooQPJG0ZkV7NMD1G8dmY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JggZiOgTL3bzzHWrrea/RPcfjcrQ/n1l/7J+Vg5vyE+6GU7HYo6spKYkPrd8UCC+D
	 xQoANQnbugQ+7KcEmh9ZpkwoV/2lJhxvrHm+I6IRJptBIy9nY/qGE7FzV3BeuDlYUS
	 k8mNxGUjGEqgRs9hMOlzI220PQZWCFL/RvlffTCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FAE4F8025A;
	Wed, 22 Feb 2023 13:20:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81654F802DB; Wed, 22 Feb 2023 13:20:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 456DFF80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 13:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 456DFF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q9cCrINs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7B771B81331;
	Wed, 22 Feb 2023 12:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19015C433EF;
	Wed, 22 Feb 2023 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677068403;
	bh=2+2TJkgRXCmNd9+5BaM+df/ooQPJG0ZkV7NMD1G8dmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9cCrINsvRaurAABclGE1tp4NHVQiZKQmnFVGFXzs7GRUOv4LR2rs3J21i3NnFOXj
	 HDolACx62fgYzSX+zwTvOgzKKTdtVdC8T3zVqy/vNvu3fUQrp2dL8hEHY8csajFLUD
	 SSmlAsORmsbLTqwQhSRLEo2XHwP/EzjK2UdbKVVbqGXCDKsee2j6yOqHRBn3hYsOJJ
	 Cl6xTNCVMKwA7tZzoHHB6RDvTl0bjDtXJ2SZ39uBN2608NDicfNJ5rXpr0kFt3/4Bi
	 eud9XIpiy/p3K/PUua7FRqgIgEfGTV90bLaEnAepkgFnmD5xOdIIUd+32leCBYWHjc
	 kVmXw7zlsCyKg==
Date: Wed, 22 Feb 2023 12:19:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/YIbHkKFcn+q7WN@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XiSMiZ0uGxQUzWO"
Content-Disposition: inline
In-Reply-To: 
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
Message-ID-Hash: SQHBZK372M5XWKOCXUUCTQIXNKAC2O5H
X-Message-ID-Hash: SQHBZK372M5XWKOCXUUCTQIXNKAC2O5H
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQHBZK372M5XWKOCXUUCTQIXNKAC2O5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1XiSMiZ0uGxQUzWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:

> Because this driver sets up fm34 and switches it to bypass mode allowing
> sound to work on the device. There is no dsp framework in kernel which could
> be called to operate dsp from the actual sound codec. (If there is, I
> would be glad

> if you show me). Fm34 must be active only on DMIC use, all other cases require
> it to be in bypass.

Sure there is, like I said in my other reply it looks like an aux
device.

--1XiSMiZ0uGxQUzWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2CGwACgkQJNaLcl1U
h9AXbgf+KDsG9jPazXe6+tb8ukkM1X7V3ZrGq0fbURStkTR6kLCBEGGhTvyq0YCT
TtplQaXCon/i1wXlJuarC0gkQPxthZ2BkchS1qYUpVKGAWUCvB3mkbGLBL8F21gO
VotkLaRgdg1JwIdPMMhCg+Sjm3r43pjQykfH37T5yNR93s2rkUZxstGE8rTGUcxc
GSLHMLNq5btjF5GJMo4DY6oQG96hOwRurB0UyV3N6ju1RPYYyzxZGdIt0ucWtoXA
AKkXkz1B3VSaGa0sdrl32PPEKbcn1eWlkmeaOpYIcbzxMh3re6NyAiQDFDjYfqxu
lp/aY0N3/DiFvIXWhVN5RCWt1zfESQ==
=a0mP
-----END PGP SIGNATURE-----

--1XiSMiZ0uGxQUzWO--
