Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8422C3CA
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 12:53:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D4EB168A;
	Fri, 24 Jul 2020 12:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D4EB168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595587992;
	bh=PWG32YcOeMhH2GemOphH4Q5kn3Lnq8/kK3Cn2vynBns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VB/4W+4ZHDiQ2bTO/+uAMhzuKIfdpSv9VAsy7Ab3QmxTQDsvGjMWzErzfbw7zELKI
	 kZDeHtLrw6fHBkca2DnfD7wcVJ3FeiPhHXfEVD6nZvs4Ix3xEd+jOdaYqI58c5G+Y1
	 gS6KAdMGGEaTkEarddhysGXM+NmEBGAfV56MAPp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68081F800DF;
	Fri, 24 Jul 2020 12:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18DA1F8014C; Fri, 24 Jul 2020 12:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83A33F800DF
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 12:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83A33F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F13CfL8g"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE4D92073E;
 Fri, 24 Jul 2020 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595587874;
 bh=PWG32YcOeMhH2GemOphH4Q5kn3Lnq8/kK3Cn2vynBns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F13CfL8g3nuEJDlJLOJWXoQxuiGsmhcbLkqR3TjHfE+4YtoZbpNAOvoKtkd2cESJO
 Dflwy+cwmJdExBiwXmtYEDNj1QWcDUekKwgWndHKUXiotd3FTxwjukBYHZA/7fY9E0
 HKqx+IFR1ua1y60dDC0WoFg5wGByT2ZHtSDCuMX8=
Date: Fri, 24 Jul 2020 11:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee@maximintegrated.com>
Subject: Re: [PATCH 3/3] ASoC: max98390: update dsm param bin max size
Message-ID: <20200724105059.GA5664@sirena.org.uk>
References: <20200724085644.9837-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20200724085644.9837-1-steves.lee@maximintegrated.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 krzk@kernel.org, lgirdwood@gmail.com, nuno.sa@analog.com, geert@linux-m68k.org,
 dmurphy@ti.com, shumingf@realtek.com, srinivas.kandagatla@linaro.org,
 rf@opensource.wolfsonmicro.com
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


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2020 at 05:56:44PM +0900, Steve Lee wrote:
>  MAX98390_DSM_PARAM_MAX_SIZE is changed to support extended
>  register update.

I'm missing patches 1-2 and have no cover letter - what's the story
with dependencies?

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8avQ8ACgkQJNaLcl1U
h9Aj3gf/YVzWgBS3oyh3vmgjlIEpdZ48zKwfNrdP3AjsgdDI/wZsm/firZQBHg7G
6AituA5MsDLLEH8KG4S6HZ30QY3mC4BB0v8ILr9OeOGc/+M1OugxQQPMgK5RqZ8e
o8PGXWFmZdTnE2Uitl70g7Kb0aHiWY3aiB3M8EKVY5+z3OShdaVfcrOJBmssd9Uj
kWF0WxHZzYpkC1xny5352uirIwuv4tVkupZeP4A9Tg6A/LgRlKpqVG/GVZJMjjdY
9d5lewHYM/UTje7Fk+21hvKnGScwlPt9iMejfI0A85Fm0So9WPVGqimIKLn8mu61
ChWNE4Zr+67zERK/T8B8aktKc+gVxw==
=TNpF
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
