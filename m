Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E4A6043C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Mar 2025 23:27:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97474603D1;
	Thu, 13 Mar 2025 23:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97474603D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741904851;
	bh=2Thd5wncBX9UXcNTEQjvPDsWMoAGf0leeEpe2iU4IjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GmZoosJGdEtw/L6amiYpDUi0vZEF2E5O6eMyD28my6FtwGdQ6d0nXDOXjHVO5Etip
	 ELPIq4bKhc0mQ29d9PbAt+axjHWy3A+ouYxPhX9RGN+91yZ+KWK3p0SAMHbdk59h/l
	 4aC5P+sZv5S2QN5sc5gfrgdajllEkcvDRrNFvFBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4C9F805BA; Thu, 13 Mar 2025 23:26:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12874F8026D;
	Thu, 13 Mar 2025 23:26:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E050BF8026D; Thu, 13 Mar 2025 23:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEF90F80095
	for <alsa-devel@alsa-project.org>; Thu, 13 Mar 2025 23:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF90F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bR7gSo/Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AC12A48765;
	Thu, 13 Mar 2025 22:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3582CC4CEDD;
	Thu, 13 Mar 2025 22:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741904809;
	bh=2Thd5wncBX9UXcNTEQjvPDsWMoAGf0leeEpe2iU4IjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bR7gSo/Q9yYINoE68WBG5gU9dXiIH6XS0/5cVT3WIrE7lTRpm/u18uVN2DIbsQ6ni
	 tTMUClSGprRt0ewY/W2v8SqhujoiwGzcPLKgDWBCD99qA+3ZmLwVqdNUVrUc5WVSpE
	 mr6w/mLkMbAT/EDtWzfvEYX/t1q2L7Gs3uWfnl92vxykvEbim8QMqzLCqehnAdLuiL
	 6oAy6YvVcHUoIsWOOvDLPbra8RRgLvYzDKamdIF/n/NzKMM13uJG/VVqXbfa9dRW9O
	 YQx/Snyjb6uwMSVGDY7sjcT1kHu/m32tzzRFEOcx+glNw9JD5SQ88moWKbFxmAhyeJ
	 elGJXtxyfJbhQ==
Date: Thu, 13 Mar 2025 22:26:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
Subject: Re: [RESEND PATCH v5] ASoC: tas2781: Support dsp firmware Alpha and
 Beta seaies
Message-ID: <f0bc9d68-5383-43b8-afea-0a065bcbe93c@sirena.org.uk>
References: <20250313093238.1184-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TLUsaQI18VaMPx9C"
Content-Disposition: inline
In-Reply-To: <20250313093238.1184-1-shenghao-ding@ti.com>
X-Cookie: The people rule.
Message-ID-Hash: EN65NOT4UOBAHCLHGHLU4IGMKD7YGRIV
X-Message-ID-Hash: EN65NOT4UOBAHCLHGHLU4IGMKD7YGRIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EN65NOT4UOBAHCLHGHLU4IGMKD7YGRIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TLUsaQI18VaMPx9C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2025 at 05:32:38PM +0800, Shenghao Ding wrote:
> For calibration, basic version does not contain any calibration addresses,
> it depends on calibration tool to convey the addresses to the driver.
> Since Alpha and Beta firmware, all the calibration addresses are saved
> into the firmware.

Reviewed-by: Mark Brown <broonie@kernel.org>

Takashi, this depends on changes in your tree due to the HDA bit - can
you apply it please?

--TLUsaQI18VaMPx9C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfTW6QACgkQJNaLcl1U
h9DySQf/T6Nyno4MNhSjiyKk8wnlq8AU1DRnzwq1u3qA0VL++YRHueGuI5GBpA4i
AlIy582uUcKzgE8sTj1m+7c22rbDsJRHTIxHH1SX/jwele5cIFS1t99NuXXi1TpB
5TihAGtGtjitYfV87j7oPzIXVnEU82NuCiVSUY9etnV+50h6/5GN5/4Rlb+Odxwo
/iRaCAJXBtZhnIctGM3qul7jSab0F5CdgQNxdu5pY7aVbVv5j/YiXLyW1e1kLmbk
LV1hQIHgn0a9PconnjUuNeGF2FPkgH0SxlLQYHWWlR9fugRFhQZe8NkMUQp1u5Zy
2ZczvT8liuUjgavDifmriUoFW6JqXQ==
=kHXC
-----END PGP SIGNATURE-----

--TLUsaQI18VaMPx9C--
