Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A46241907
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 11:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CD81667;
	Tue, 11 Aug 2020 11:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CD81667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597138940;
	bh=n6vtsLFdbRcK4TQJz2ByUiW7VyXsAjXdGUb/m2WUNIw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QpWYdNDrSpobGi3laDYflHp8Bs7wdm+Ec7WMegDD0CyvLIdKiJIj+Lih1wWVTSTpG
	 Oobc2dbixxPF8LmsBWNoV1BUsdkPPKxPTWeTSWUED3FJyJdAUBow47jxUGPluxRZ22
	 3hFNLiHFjgoY9bo7ya7uhI382Q7gERi8v1wRPJOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C19F80161;
	Tue, 11 Aug 2020 11:40:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3961F8015B; Tue, 11 Aug 2020 11:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10D3EF80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 11:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D3EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aO7PY6Tq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85B0F20639;
 Tue, 11 Aug 2020 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597138829;
 bh=n6vtsLFdbRcK4TQJz2ByUiW7VyXsAjXdGUb/m2WUNIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aO7PY6Tq2sJ1yGmCiI7XgGl4JFu+22iRn+6716PePLmJPTj91PZ5S/CT/+n8uCnQ4
 n2FvMeJRoshMg/ANptGHbvPMXpGM/a2UgjwChZ9Ts5qbVZjoyvI3AHXOUAEFYjh4TB
 5c9UysfxM3s2H+snqraO0Lmp1K2oR3cEZUEdHSAk=
Date: Tue, 11 Aug 2020 10:40:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 07/13] ASoC: Intel: catpt: Event tracing
Message-ID: <20200811094000.GA6967@sirena.org.uk>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-8-cezary.rojewski@intel.com>
 <20200807150908.GN5435@sirena.org.uk>
 <2e964389-9917-91a4-5f41-7031e54f83a5@intel.com>
 <b7b1d286-0920-2c49-b227-1c49840d20b8@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <b7b1d286-0920-2c49-b227-1c49840d20b8@intel.com>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2020 at 09:30:20AM +0200, Cezary Rojewski wrote:
> On 2020-08-10 9:16 AM, Cezary Rojewski wrote:

> > Thought TRACE_INCLUDE_FILE/ _PATH are designed specifically to remove
> > the need for trace.h to go into mentioned folder. Based my decision on
> > fact that sound/hda and sound/core have their traces defined locally.

> > What's the preferred way?

If other sound stuff is using this it's fine.

> In regard to preferences, one more question Mark, if I may:
> 	snd_soc_catpt vs snd_soc_intel_catpt

> while developers usually prefer the shorter ones, I understand there might
> be some subsystem level preferences and currently chosen name could have
> easily slipped reviewers given the length of patchset.

I don't care either way here.

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8yZ3AACgkQJNaLcl1U
h9Cd3gf/ZquMbUCEg9ggRz3Csat3lFOxeZsuZkVfme7Mx+5S+sDDvNXQ48DMFdYz
ZXunA1jir0T5QLwQf4dwm9xNC46TM/Onw+I+T4CG6ccmX1Xnh6a6euqNwsVgz0qT
yzoN/Fgswb8AEYoAwUKjLZ/iCjTfjYVD2CUqFsEirdWI0cMnjBAISEYJ/PJFWZNo
Y+GoSsBwH10RHWmixGFREIybQlat/MASVszk/im4iorCWfN4jNDlU6Mdq6LHw3ae
h1Wl5thnGzwHV/51Dg6d+kX0uFfZx5vp2pmkRtWLtbxoLilgISbAeVsUGbF+M9EH
9ZuSkH6Mw1GiMtsYPz5JCtH7ysZqJw==
=vB/m
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
