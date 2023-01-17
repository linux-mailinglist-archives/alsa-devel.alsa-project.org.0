Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2266DD56
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 680736533;
	Tue, 17 Jan 2023 13:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 680736533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957851;
	bh=CH00r/9Pn2XE7EulWgDqTXg/j/uImnDKxyYLPQzgINQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FXU+pcYFCdL+sBIV0E+xPVSX/SGcCQ4LF00HLJKxkLLRJmRT1m/o8zUp/4/i0csut
	 BFtydYYQGFPYmflTMiirUonn2diTN4enLxHdiuhUJxcAZA9A+MqnSGOpUp0A5601kM
	 0T+3lxuKozD8GlUkOGo6Dqe+WfJbiU4O9wlEBEms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F9E8F804E6;
	Tue, 17 Jan 2023 13:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A4A8F8047B; Tue, 17 Jan 2023 13:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47579F80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:16:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47579F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n4pAaYCi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C525D61309;
 Tue, 17 Jan 2023 12:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FC4C433D2;
 Tue, 17 Jan 2023 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673957786;
 bh=CH00r/9Pn2XE7EulWgDqTXg/j/uImnDKxyYLPQzgINQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n4pAaYCijnR2Jh5ardSYMv+kNtARk43yKUR8aFoN1eAK1nSCtowM3er26Hk5owErw
 qJF83rQVcLuw76etpoXDqglX6bl2e3yCWOA6185/HeUwfjtjzgK/xfXgMUDsZ+5XLy
 ww9aSWVpLO5Od8LFZpHVZqvgSMb1x1o1U/qvEvPV0DsNQh0JMugR6ATQ2UFalaJqVc
 Tms6XBCTyy5tM6vgoaWFuHZStKPmAS586riWX+TAhRVPgxSmcLxIcxT511GOLDGJFy
 vWyR6KgnzKHYAe+tl0Cbkv7edbON6+kQmC/txTj0Qyqu3JAoFlkOGTcN7Nhdutfrnh
 449aUVP27GDGQ==
Date: Tue, 17 Jan 2023 12:16:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Message-ID: <Y8aRlJRsCjIzYuqa@sirena.org.uk>
References: <5a34e6f7-eaf1-8128-81e4-81f65541d9a8@linux.intel.com>
 <1a14e117-4216-b98d-f972-c9a02cf79d1e@amd.com>
 <eb12ed5d-a9f9-cb8d-28f5-ac84c75cf441@linux.intel.com>
 <90782037-109b-b197-ca17-b7d199931f7d@amd.com>
 <e73032b1-ac5b-4a3a-e2a0-8ac121853dee@linux.intel.com>
 <Y8G3mPUDWWUu/3ZR@sirena.org.uk>
 <ef05d550-c2aa-e256-58ec-612c2a3294ca@amd.com>
 <62272f17-bb97-aa10-d5d9-0914595e5431@linux.intel.com>
 <b61474ce-01a9-7602-e3c0-df8fdc5191c6@amd.com>
 <625915d5-0c2a-ce63-e71b-ff4f4f2c6d07@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tNkUA4FEK8u/5lc6"
Content-Disposition: inline
In-Reply-To: <625915d5-0c2a-ce63-e71b-ff4f4f2c6d07@linux.intel.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, vkoul@kernel.org, "Limonciello,
 Mario" <mario.limonciello@amd.com>, "Mukunda,
 Vijendar" <vijendar.mukunda@amd.com>, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--tNkUA4FEK8u/5lc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 17, 2023 at 05:51:03AM -0600, Pierre-Louis Bossart wrote:
> On 1/17/23 05:33, Mukunda,Vijendar wrote:

> [    2.758904] rt1316-sdca sdw:0:025d:1316:01:0: ASoC: error at
> snd_soc_component_update_bits on sdw:0:025d:1316:01:0 for register:
> [0x00003004] -110

> The last one is clearly listed in the regmap list.

> You probably want to reverse-engineer what causes these accesses.
> I see this suspicious kcontrol definition that might be related:

> 	SOC_SINGLE("Left I Tag Select", 0x3004, 4, 7, 0),

Looks like a case for putting the CODEC in cache only mode...

--tNkUA4FEK8u/5lc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPGkZQACgkQJNaLcl1U
h9CzBwf+PhuLttG+/GNupysKygNCy0Z6q5gL3sKpB9KTyaLYIgN0ZY4bLEUHXQE6
mQrf8QZG0TdQsxq9oAedn7rtOQ11ev/lXJ8mj0pF9xArwaWhfILwAW80qANdc6Wq
pZuAU5JwqoAfib/5xCcoQmGK37giNEltn14fV2BnAwbYgUbFsfY479ydXUvsDoHl
E/pOTZ/PotFq1mO0F/J0Wy2bh4kUSyNvnQ3Tu6tqU2BrViskQf9+AdkpKmD3qYZB
YGunhLBrGdFmbAEz1meauMlIgI9qWwIuCxsqlgW4hXauuk49ZtUsLKokCkaQ04l7
En1HWemmcmLjbHs/mTCxB4s6k1Qzvw==
=VA1T
-----END PGP SIGNATURE-----

--tNkUA4FEK8u/5lc6--
