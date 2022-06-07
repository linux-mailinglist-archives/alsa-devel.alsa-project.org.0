Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B853FEA1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 14:21:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46BDA1811;
	Tue,  7 Jun 2022 14:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46BDA1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654604519;
	bh=w2aQJy8XTcqWcZ5VipuId8VpFh1nL10EEwBkOwvPTtQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lE2zpADTe5FrY9VIbU2lWhmsYmCXDpQCQ8tCohthtFrqawv+4nEshw1VtOoYlP1Eb
	 8O4IVz+oWrBQecb4uSt/eSCe0cFyB+uxfDjxWNyFv9I7gfO87FfrPHMBoUCFEZkUC1
	 dpMXleSx73mxGzDm2xPv3LX/bEi3R6bEBMaOpajc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3012F80248;
	Tue,  7 Jun 2022 14:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C113F80159; Tue,  7 Jun 2022 14:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA4EDF80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 14:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA4EDF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gI6YDL0Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 80B19B81F86;
 Tue,  7 Jun 2022 12:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D0BC34115;
 Tue,  7 Jun 2022 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654604455;
 bh=w2aQJy8XTcqWcZ5VipuId8VpFh1nL10EEwBkOwvPTtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gI6YDL0YkG7mKXGMOKq+mUybDcF6mtaMPz2d/YmYXxLK7gjJcQ+XVgKLFrlQdEhII
 XNZAn5ZLGk6qOfBUrWW4u+bTVXm9tlCZd95p2CW9TXAh2xIxt1OppGcEoJugBmg3uW
 MUI75PkbvmCjbqliTGFW5adTAuxW3uhug5XqwrzEmvhx7fwKUCFRXUc73dexjn/0MN
 5/aJI5Xjv9a6/nlVzAJXC2TyrDKfu7ks2ajEcy0aPAckWvqdmH2Phh08Dt2cRFHRvA
 EZooL/vzyEVRobNF/JGwj3u9ieuOuV5vw3iRqzJ21DQzT2dEbm38MAwkONlDdCL2Z7
 cxwfCcgT4R3/Q==
Date: Tue, 7 Jun 2022 13:20:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 2/3] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <Yp9CoibeiXff43//@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
 <20220606154441.20848-2-lukma@denx.de>
 <Yp4o2bQammYjv7Kt@sirena.org.uk> <20220607141309.11ec7503@ktm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oD4aHu7NoJLDSZnJ"
Content-Disposition: inline
In-Reply-To: <20220607141309.11ec7503@ktm>
X-Cookie: Where's SANDY DUNCAN?
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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


--oD4aHu7NoJLDSZnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 07, 2022 at 02:13:09PM +0200, Lukasz Majewski wrote:
> > On Mon, Jun 06, 2022 at 05:44:40PM +0200, Lukasz Majewski wrote:

> > I don't entirely follow the above - in what way might the core adjust
> > the clocking, and why would we want to allow the use of invalid
> > clocks? Surely that just makes error checking worse.

> Hmm, it is a bit complicated.

> When I enabed wm8940 support in mainline - the first call to
> wm8940_set_dai_sysclk (the set_sysclk callback) required mclk = 11997070
> frequency.

> With the current code [1] the initialization of the codec returns
> -EINVAL and the codec is not supported in the system:

> asoc-simple-card: probe of sound failed with error -22

Well, that looks like a bug in either simple-card or it's configuration
which should be fixed then (you should probably use audio-graph-card for
new things BTW).  If a machine driver just randomly sets a clock rate
that the system can't support and doesn't want then that's a problem,
presuambly it's getting that rate from somewhere.  Note that this is the
machine driver trying to set a clock rate, not the core.

--oD4aHu7NoJLDSZnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKfQqEACgkQJNaLcl1U
h9CwNQf/SQ1IIya40BCk6cTxfy5APPyLi0PkvOK018oGnfnEu32l/1vb6bVISsbX
PHvisytP3OCYODHV7aPKS3hOGYdzE6FE7dkh2BNITANR7b/2w+e035IeNDSb5pw6
VvBQSiOoKGvwiDcwC6qTf7FV7ok0IUAYiEZWs9288QnzfXy8lwEWFujAkEV/hV6q
nLx9rP0vwtEIAzzqOjtOZyFWDl7XT5+EdlRvxtSQopJzBieIcFuBBJQw9FJdr1Gk
Z9SrxAwfmyKeIhn5tegWV1NewUHZwaEnK7Vpc/j6LXkuhSBD20ngNMio5bTNy123
+mcivhXqL5A9VKdjhg1FpAdOWdBAFg==
=nfuP
-----END PGP SIGNATURE-----

--oD4aHu7NoJLDSZnJ--
