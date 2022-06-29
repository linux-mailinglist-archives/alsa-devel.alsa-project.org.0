Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CABD5603C9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 17:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D511A201;
	Wed, 29 Jun 2022 17:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D511A201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656515013;
	bh=YrW0MclUMyY6HcWXjSnuuUFbvlixqKQGRTLyrIyuaNw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uo0mSrzHB1+o/agFHj1ejM1ZEr4CuyI+ttP0aWY5DyArlv+7cV6xYpNHzPQgbeCw1
	 cnDm4anIZonq4S9SwYgk3lI//tlNS5W0Y4zEKFG/F6ynU+41pkmJE+zeS60azHa1Jm
	 D9Hn6nHqyXauu0EhK8T7INkWHxLgfMyILq1at5T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 454DAF800F8;
	Wed, 29 Jun 2022 17:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C47F8020D; Wed, 29 Jun 2022 17:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE049F80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 17:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE049F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pv37R9NP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D582B823D5;
 Wed, 29 Jun 2022 15:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE84C341C8;
 Wed, 29 Jun 2022 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656514948;
 bh=YrW0MclUMyY6HcWXjSnuuUFbvlixqKQGRTLyrIyuaNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pv37R9NP3xjH54c2qAdGqhH0HdmWOME93RcwiKVRzc5Fp9XVH7wL8ynWDb03uSjhz
 OTSpIzqZGIpqPRHSEqyv66o679VemE0pL06v/QS6jLnbua/06ux9/QArO7nAOa6W6H
 nQ+PThkNL2P6Y28zO5td1v+t4zqssiWFPqQowauXh1u28O9eiLj1hXtL71IhgmbtW4
 /dr/7MpJbYA49tTmBqB+dD8uBrOo0Vfsz1l9hs0zcxn5swV9xkvs6rhNq5Dr61Q/zj
 FaYmXsLr/Ikz23Afr8paaprehEjSfytBYI4yD+xkEwpphAPnZM5xq50A/3dw8CY42y
 WyLeDh1+Iqglw==
Date: Wed, 29 Jun 2022 16:02:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: wsa883x: add control, dapm widgets and
 map
Message-ID: <YrxpgF2B5W7fyYVy@sirena.org.uk>
References: <20220629145831.77868-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CQe+J6NOIs3++col"
Content-Disposition: inline
In-Reply-To: <20220629145831.77868-1-srinivas.kandagatla@linaro.org>
X-Cookie: Booths for two or more.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--CQe+J6NOIs3++col
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 29, 2022 at 03:58:31PM +0100, Srinivas Kandagatla wrote:

> +static const char * const wsa_dev_mode_text[] = {
> +	"speaker", "receiver", "ultrasound"

Idiomatically these would be capitalised ("Speaker" and so on).  Sorry,
didn't notice on v1.  Otherwise this looks good.

--CQe+J6NOIs3++col
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8aX8ACgkQJNaLcl1U
h9B68Af+OSwqjG2mYULXNLPfUr5eNb4DI+Y6bHPZFcuyEnRugPAEnGTHmOSj1ysS
q2GQrCsTJTm8dByTkopi1uIHgetJIy9vb7rItZqE2GK8BHb3Ne2KUxKL3XkX7g5C
+OSchkZVjHjDuwJ4NPmTLWUrpFbQcMrCnrM3+pWhFNqLE69mg8DioAaer1wWjBEd
E+6piqi8E1AyQlV+sOGe94sUXWVP/REM6wEKOKd90SMXSs87XYLbOb179k6YkSyy
iO2qgO1aif6QYJcNm4NdprDvwnXEEcP6s/PAqsEfqoQ8mggt0EHfBRZ4ri0Cn8mz
DETkg0CsWMM8gEHA16POeG5NImOVOw==
=jykd
-----END PGP SIGNATURE-----

--CQe+J6NOIs3++col--
