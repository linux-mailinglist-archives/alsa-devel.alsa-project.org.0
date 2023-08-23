Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAEB785D66
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0852847;
	Wed, 23 Aug 2023 18:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0852847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808889;
	bh=C229THFQbGrcB9cyjsvsKcZ9sbmgJAm4NmfR6XoYqZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cvZ6rEAP2VOXNXBbvKJAnqkHPcfaC8ccLB1HRxNl4kcAIWbO7T+p9YYCrtWO5+rAG
	 TbzFRdQK5kntlavytxq6eAwWsPNVkswbO5xsvCz6chZxT2c7T3Y1AGc5mC5O6re0tC
	 LVrp4SO36iQPBC4rcVGCxfgR6PqsyVE2vWhs0Gmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C2BF80549; Wed, 23 Aug 2023 18:40:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFE7F80549;
	Wed, 23 Aug 2023 18:40:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A86CAF80551; Wed, 23 Aug 2023 18:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F58EF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F58EF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nVsbqBEG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFEB2638CF;
	Wed, 23 Aug 2023 16:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F4AC433C8;
	Wed, 23 Aug 2023 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692808790;
	bh=C229THFQbGrcB9cyjsvsKcZ9sbmgJAm4NmfR6XoYqZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVsbqBEG/hCtcCtrNy8D5jM6F3K0wxLq9O2CLNDHset52d193Tt50PaNzEPYy4rhZ
	 NP8Igh5w+y+xAEwh7Rtqvw7dx0PfST79drJ96Wyp9O6WQDXZ0+y6RSl9OJCHNehYP1
	 wV2tlNY/nWITv1wEJaTfvtdQL0Uck4tJ+5qZhvl7HjX3n7KmvYHOMwsh89Pw7dBSiO
	 94pOgTaPxhIUu6ohY+1lEwjcv1EE+4Qt9CCww1pimNwcakfTuWF3C8dah7TjGe0p6X
	 2vne5Ci2udrwm0tn3HRe+k5enDMs9J0qoLQ6Dg4lOEQfW4bUCmLg+gQX2WMSX2iuHj
	 s0BcXMlejV3EA==
Date: Wed, 23 Aug 2023 17:39:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Message-ID: <4347e7c1-fd23-4222-adec-7bb956bb198f@sirena.org.uk>
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
 <20230823154958.GF103419@ediswmail.ad.cirrus.com>
 <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
 <797d83be-feaf-04ec-9be6-9343d2ab3a33@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YXrpxZmjOItcCdHl"
Content-Disposition: inline
In-Reply-To: <797d83be-feaf-04ec-9be6-9343d2ab3a33@linux.intel.com>
X-Cookie: Some optional equipment shown.
Message-ID-Hash: HC4LG6ZHL267IRQHHJZ4P4M3OLY6OPAB
X-Message-ID-Hash: HC4LG6ZHL267IRQHHJZ4P4M3OLY6OPAB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HC4LG6ZHL267IRQHHJZ4P4M3OLY6OPAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YXrpxZmjOItcCdHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 11:26:12AM -0500, Pierre-Louis Bossart wrote:
> On 8/23/23 11:19, Mark Brown wrote:

> > Isn't that just going to be a function of the compiler being smart
> > enough to work out that there aren't overlapping uses of the two
> > variables and they can share stack space?  There's no reason not to help
> > it figure that out.

> One would think that compilers understand the variable scope, and
> free-up the stack when leaving a for loop scope?

Clearly it's possible, but it's the sort of thing I can imagine is left
to an optimisation pass and missed sometimes for whatever reason.

--YXrpxZmjOItcCdHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmNlAACgkQJNaLcl1U
h9CKqwf8Du57+HnVtqCXJSwiHVXGQPBAxIfiHvtP+fnMoLkqQGc83ZY5nZ3H7eQt
R2TA+1QWAPt2S9f5ZzH+MpWen/7bxOmA0NWHqlnXPJuwLVVI/5eMPTpLQEnEiiWU
Qlvo0/nteIcyYha+M8TM3JR0NJyvYeMcEsytkzRzWbLO+lA1QK1PKVvtDdk4rnig
4zXQ3hIltDTuaipCIzt6QsXvRf66aRjGMhVJLDrROcXaWrHTxUUgBG34JEDq0zcT
GrB61/+dp3m7RzVPAQMIUpfTsy9AjlOCl1bGmUkKqFuRVC4OrmCSogBe556ZeMzZ
wkoxGzyoJQRcIQfLYlZzfS+doG6yig==
=HeF6
-----END PGP SIGNATURE-----

--YXrpxZmjOItcCdHl--
