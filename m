Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE326283CB2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 18:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EF417A3;
	Mon,  5 Oct 2020 18:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EF417A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601916238;
	bh=AxsolZRRpicOH80CeqJAsxxZV37hmtrPa3osuJHjK/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eUaYve3X/UB0vuCNW/7/T6aN9Ywe89/mdpPIT0SxWXsuGwzxtO8lMdNTI3DkIScKf
	 XaootsbZuITXNZP8tp0pa3P3/abUdhImTmL63dVPTJoku9DXeHm1rHYcUn8i3oSZXV
	 D7AIm00Od+2aZl3cCnfi01JXbwG5AUv9v43zsGCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A5BF80260;
	Mon,  5 Oct 2020 18:42:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF756F8025A; Mon,  5 Oct 2020 18:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9A8F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 18:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9A8F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zsIocvg7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 223F620774;
 Mon,  5 Oct 2020 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601916104;
 bh=AxsolZRRpicOH80CeqJAsxxZV37hmtrPa3osuJHjK/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zsIocvg780vJMKfndJd8Ch9WcRMZ7L0bNxhhXx4SDc+TRLVTN8QN/R8gOaBoKDZfJ
 Ks4/Mt2SSZbpaO6zJm44ycxoW6BlY69x95bKdd4nL3tJSXgc5IgjZce1+WJU5sktYb
 SIZ4X/KLz5gKS7ajef8c33Hl5/W/U+Tfs2Ml58uE=
Date: Mon, 5 Oct 2020 17:40:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 03/13] ASoC: Intel: Remove rt5640 support for baytrail
 solution
Message-ID: <20201005164041.GA29181@sirena.org.uk>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
 <20201004100128.5842-4-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20201004100128.5842-4-cezary.rojewski@intel.com>
X-Cookie: Bedfellows make strange politicians.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, krzysztof.hejmowski@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, ppapierkowski@habana.ai,
 marcin.barlik@intel.com, zwisler@google.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, tiwai@suse.com, andriy.shevchenko@linux.intel.com,
 cujomalainey@chromium.org, vamshi.krishna.gopal@intel.com
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


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 04, 2020 at 12:01:18PM +0200, Cezary Rojewski wrote:
> byt-rt5640 is deprecated in favor of bytcr_rt5640 used by
> sound/soc/intel/atom and SOF solutions both. Remove redundant machine
> board and all related code.

This doesn't apply against current code, please check and resend.

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97TIgACgkQJNaLcl1U
h9B07gf+Om8f+yQtWGdueW5UC81wPzuHweP4eA7CSqvsbrz0szkKtFOgWHDgZTc/
jkHpItPOmGpL8FVKZCklbuxdGvssIbtSUIWEfR1o/UWBOmCpY/ZlSJ0u8gbdSmzy
f8zni6MuA2jWlHZRAfsdTXBxtri2exVSN4bme9EfDFeh2MfgQI5BoD4lSuHVsoZN
iMqNBoCJzJxsX4uxdTnxuXPROYDPsN+FygGAO2hzxsFGjKiIKhYs6L7SjUCf0Egx
BpLXmp1n5Uoc78+I4scsnOuztGYY3J+Uou6o3sK8lpm8jkd93aQU5+H0Oq8wD59u
ZwqW4FzWJelOtDltO2JhpJrUeTjSbg==
=589V
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
