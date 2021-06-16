Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B563AA57C
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 22:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C98616E7;
	Wed, 16 Jun 2021 22:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C98616E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623876129;
	bh=mhLIWZiGeiG2xrFjpuiGWElCi/uYrQ99Uv8/gqQ5NXk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KeisV6AReaWFNEx3DdnyHkcAXhZdX9V9cYqONd4VvA4F5mh17+mJR9o2jgY4zwlqD
	 lqR+qJhoofvxD50SHzBP9+IP5wd7VkBZWFaxVhKv4hHPmcFu8zIZBvUnl6zmKoWvRn
	 OqqBvfj0dkFGGih5iLTDOm9Ocg/Vjodi+rHcj4eE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA63DF80165;
	Wed, 16 Jun 2021 22:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8965F80423; Wed, 16 Jun 2021 22:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA3B1F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 22:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3B1F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qUajzdGG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E09D061076;
 Wed, 16 Jun 2021 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623876033;
 bh=mhLIWZiGeiG2xrFjpuiGWElCi/uYrQ99Uv8/gqQ5NXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qUajzdGGeCVQE2tR6QDK7HHm3PJpC7IP3CsF2AeFMLxGwLx9Lu4koeza4lUN+j2Re
 RtBQOUSxrAsTw71Op/fXcJFRzkK0e/6eqElJLtanjxwY0ZYvPdKGDMt93FYLNc4w0j
 OZ6XVJ0KodJeHZFSDEU9k6GOs/90t1d7yUPmENmgjnWrEPaYPzmjOrwrofRvVRi01k
 CrxSvL5q9HEfYl236pUogfptpAhUiY+Ayeg+NanQ+jnf8OBgy6Z5OugT1U1Ya2HLI6
 M0EcsUhfOPBIb98K+WfA6yZYB5Ullzn7kgtHwYH7u6vHw8H6L9d2Rl7c9tPJp/A1qO
 X7bZgewuVXBEw==
Date: Wed, 16 Jun 2021 21:40:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
Message-ID: <20210616204012.GD6418@sirena.org.uk>
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
 <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
 <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
 <7748e621-ba54-db90-6b56-23e006eb1dbe@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline
In-Reply-To: <7748e621-ba54-db90-6b56-23e006eb1dbe@linux.intel.com>
X-Cookie: Revenge is a form of nostalgia.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 16, 2021 at 11:23:36AM -0500, Pierre-Louis Bossart wrote:

> > On this platform there is no TDM support, so there were two I2S data lines.

> Interesting, I haven't seen such 'multi-lane' solutions so far for I2S.

They're moderately common for high end systems (eg, you'll see surround
sound systems do this) - it makes it easier to find higher performance
DACs if you can use regular stereo DACs and it helps a bit with layout
if you can run slower digital signals.  There's controllers upstream
that do this without needing to tie together multiple stereo controllers
on the SoC side, one of the variants of the Samsung I2S controllers does
it for example.

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDKYasACgkQJNaLcl1U
h9DJTgf9GVaBIAfl61pF8E56hCwdxoKRTFOYvXMS9Ro1gyi92ejk9latUAcVfHWS
qyfSyeafsZNSMo4/ZHQ6hesfIikj3o7+WDlBf7f74rjQ/2sF2FKVtzqN0CG0/WQ/
3lFWBL+U/OzQUyBp4GzjndcxgiArjFZ4FqQ0gLM/X/H+cSTThEULsPK1YVZKrbZo
2BUv284pzIGcc2+M7eJK/ssifFkGUBkRoBQGb61GKJSFP9JbWCGLN1iDpj+ruCv1
x6noeMrPikdrtg9bqg2B1xos7vBbi8fgRs/J1T6fynimQ/3G7VwBHJrX50aLoBnH
1lN8LTDUGFKCoBTiT5AUCd0K1Q1gUg==
=qHwR
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
