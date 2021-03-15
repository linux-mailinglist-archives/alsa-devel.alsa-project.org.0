Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C29633B141
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 12:39:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899DA170E;
	Mon, 15 Mar 2021 12:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899DA170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615808391;
	bh=8gXgJowDrl+HwLckEpzI7NxazwDx7AH/kUL5bDJHzaw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aRzXDXW8rbf+doXcLwcMsyxkabF9pl54GEfZWNGLrddsECE5oDdbfTA++0ivYKGp5
	 oKWRuGNyJCv+MMdKC8kzuiynnfxtwJ6b2jU4Fkfg3lhQpVLhYcyQs109FKgLKJltCU
	 gNqYjwh9PypcUdBnS+fW/Ctd9CViAHZSepnk7Br0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4F5EF801F7;
	Mon, 15 Mar 2021 12:38:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25E7FF80171; Mon, 15 Mar 2021 12:38:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DA79F8013F
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 12:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA79F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LvaKUSUZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A999764E61;
 Mon, 15 Mar 2021 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615808294;
 bh=8gXgJowDrl+HwLckEpzI7NxazwDx7AH/kUL5bDJHzaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvaKUSUZ7wgU+9vKyWh6C4gR6Lx25AnBt43qqiHvhp/6WCOld2p6OoM3u+E5291A8
 oknhEqnL2gFxHUHi7WUGwYTx4rNBQagBm/JkyWdDGnr63B/GbUMHeVheptFG6fhtY3
 tEhnXz/4KAvlEuxQoPiekyLcKI0gVPESczWslUh6FGvwoyxYuWU6jrABLHhhisxNHt
 60FKuPbuhsfY5/E/F6jd5vE/NEflwKzjm7h7REnCR3WTbOpTNBCMhFv7H1p7Ikjh1d
 AIHgIASX/5E4sltAxP8GURfXb4ouGAwosThhvh3dF29liwLpZmTTNy0x3YmLJnydBX
 HDsnFWiM0cwcA==
Date: Mon, 15 Mar 2021 11:36:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] sound: soc: codecs: Remove unnecessary THIS_MODULE
Message-ID: <20210315113658.GA4595@sirena.org.uk>
References: <1615623786-16302-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <1615623786-16302-1-git-send-email-wangqing@vivo.com>
X-Cookie: Close cover before striking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 13, 2021 at 04:23:02PM +0800, Wang Qing wrote:
> As THIS_MODULE has been set in module_platform_driver(), so remove it.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBPRtoACgkQJNaLcl1U
h9BJSAf/eVvdpF1V9OpXSWXBOkL30BgGpsVL+gnWp1HqwDm2w2UTToMWSwAmAX2T
y98sKx2z4zjwKhL3WpA3TmCJkMe9b2zlwSYo34aFVBUoZjgBm8PnkWdnI1u+rCnd
+keSrOMkunuPSQSaxLg23n2riViyUcTZ7kJs15Lvlt93Y5jG1UooUSB+Pkb3h03A
LQp7YCNq76JmS9FtDrbb/S80P594qWpKWDWTKFZD1TN1CGRRLVO9XBkMRbj5cP+g
eRaSP3E8EjmU3JhZvVNDqDhcYM7DhBu/2iKT/h70sb6Um6GETXWViC2UlyNIjPO8
vS2M9KBz25eWZtWgIvP1NGysSHXjSw==
=zA9T
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
