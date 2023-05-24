Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203770F829
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 16:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 170A5200;
	Wed, 24 May 2023 15:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 170A5200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684936808;
	bh=s7ODysrVL6L25XbJNWIyvhMKDv3+c3+iRnPs03vFH0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQqSknWCm0/28pMcaCOsvLpDksejQL7ldI1GPWMRA3K+fVlHKcjr8fkDggJtw9YnA
	 lhaRxCBN9ERCNN0DWtzYrTK8X0IgenJiIhu5ViNAvTZPkf/Lj6lsCU1pmxd6PJWdR9
	 VO+6ea1pPvJcyYO/AyOdiTxkknbAzEiukSg9mnaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7116CF8053D; Wed, 24 May 2023 15:59:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32459F80053;
	Wed, 24 May 2023 15:59:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08956F8024E; Wed, 24 May 2023 15:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CCD6F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 15:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCD6F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mmWZFX7H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C41C63271;
	Wed, 24 May 2023 13:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A495FC433EF;
	Wed, 24 May 2023 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684936747;
	bh=s7ODysrVL6L25XbJNWIyvhMKDv3+c3+iRnPs03vFH0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmWZFX7HB0sxfLupokaobr2jrqyYPq0DZgrCcu2R6nUQFf9ffaN084zM4/1xiSeVm
	 gXH12b5GYmNFRNA1/1IlCBJs86tUMLo0lICqSR5IRNojIPMCVI+eZ0v4GgpobS0yYm
	 rHS9s6pkdv7ixVaaRZ1vWzFT2K8v/rNNQkCwH8Y4d3wrsU/Np5VDiTjjnTPgjKdZw3
	 UW/h9e6LruZqhj0j4WVuk7b5QBfvCtxzlW6ti3ZZzu0ThBWXRQgpf0+Fidb9jZMFN7
	 HXZHZEzac7d0B9L6e8HZ0zvhNh4/6qSYGv2ShZ1Q7Qn6f+w2igm6XYeyP8Dnw3hr5y
	 62HFi1m5D58hA==
Date: Wed, 24 May 2023 14:59:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	David Yang <yangxiaohua@everest-semi.com>,
	Daniel Drake <drake@endlessm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture
 Target Volume control
Message-ID: <01fd1a9f-56c7-4864-bb2b-8b004284c8cc@sirena.org.uk>
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
 <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
 <cfa23203-1626-440b-ec27-efe56cb297d2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5dAsb6A5aa1oi1XV"
Content-Disposition: inline
In-Reply-To: <cfa23203-1626-440b-ec27-efe56cb297d2@collabora.com>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: JWQIAE35TZTB3YHW7XIED6TMBRCW5TOZ
X-Message-ID-Hash: JWQIAE35TZTB3YHW7XIED6TMBRCW5TOZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWQIAE35TZTB3YHW7XIED6TMBRCW5TOZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5dAsb6A5aa1oi1XV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 04:49:37PM +0300, Cristian Ciocaltea wrote:
> On 5/24/23 13:30, Mark Brown wrote:

> > Presumably you can check the effects of changing the value?  It seems
> > plausible that what's written in the code might be accurate and the
> > higher values might actually change the gain but it'd be better to
> > check.

> I haven't noticed a (measurable) change in gain when switching between
> 10 and 11, but my testing equipment is also not that great. Will try to
> improve the tests accuracy.

I'd expect it should be really obvious with a scope if you've got one?
Testing with something consistent like a sine wave (eg, from
speaker-test) should also make a 1.5dB difference noticable enough to
check if there's at least a volume change by ear even if you can't
specifically quantify it.

--5dAsb6A5aa1oi1XV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRuGCMACgkQJNaLcl1U
h9AcDwf/Wi9oFO/zCuXcdQUi3Vp+Eyy46hZtVdxgIqdFlbsWoBoIYtHoKUyolbCe
KOrPtIARsf6WybwRtIymagviHxnu8jh8Abk+18Ns5ZxdYQ9Tj4VZTGXq1qodDEg6
XKlZ4Dm4g1vetWmf2ZE8zGRXKaJX3jMoa2Gz7TyiT9e6qf9yOiAHuYbf9c2t0BAA
CkZRrB+I8UVh0/G49kg7ApiN8W07RHEDYW0QaeMO49auGg+75ptD46316gJvAvVQ
QbYIH+YDmjxtv6pT9ZuXxBBRE2nVyeW/O/qPEK96ahLIPU9RZyjo3uE03+XeVYj/
hejkDQyW1odVohfhGZJFDVP7oeMzcQ==
=9KPI
-----END PGP SIGNATURE-----

--5dAsb6A5aa1oi1XV--
