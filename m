Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E24ADA8B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 15:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7FD1664;
	Mon,  9 Sep 2019 15:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7FD1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568037344;
	bh=rA4T50WFTiVDNz4AiXcmKAqkF/p6LXTXBU14fIrNsmU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ceXdf6aZ0rU1UG+H+gAVlKWk19hDvFzcDP6BFhDfGDXjCtKX2WJDQyU/QltFQRh+j
	 bg3VKRx9UVJM6uR1AXjyEp2+qKGF9sN00h7O0S2Iys3UMO39XfxMeisNmfNhftRrL9
	 uEUbBx+v//QEgyS8nBAHi6XJ/MLVTo6AHST/7L0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC9AF800E6;
	Mon,  9 Sep 2019 15:53:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22678F800C9; Mon,  9 Sep 2019 15:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFE55F800E6
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 15:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE55F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SfCG2Ggh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cm68PPNUL9hpa20Iuq3N78KfFV9ZNG1FxC3bFlrLNBo=; b=SfCG2GghXvnLx5hk7+p07alq7
 rAtpln77hLd/I2OhSW53ZOqioUNmYHSKcBbb8mqu7CPtaK7xrY8P/BZAFJBwcbiTIiUNImLxvpA9q
 IP7v7eZk/iX6XwTN/nXk4BeApdZCIIVXbmK2eaCvwgK/XZDmHpv2JXbcjR+Uqt4JyETi8=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7K71-0002ZE-GF; Mon, 09 Sep 2019 13:53:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id DB8BCD02D3E; Mon,  9 Sep 2019 14:53:46 +0100 (BST)
Date: Mon, 9 Sep 2019 14:53:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <20190909135346.GG2036@sirena.org.uk>
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
 <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
 <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <7019a223-cc97-e1c6-907b-e6b3d626164f@baylibre.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-yi Chiang <cychiang@chromium.org>, linux-rockchip@lists.infradead.org,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v5 0/5] Add HDMI jack support on RK3288
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
Content-Type: multipart/mixed; boundary="===============5544324781756764198=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5544324781756764198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline


--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2019 at 09:37:14AM +0200, Neil Armstrong wrote:

> I'd like some review from ASoC people and other drm bridge reviewers,
> Jernej, Jonas & Andrzej.

> Jonas could have some comments on the overall patchset.

The ASoC bits look basically fine, I've gone ahead and applied
patch 1 as is since we're just before the merge window and that
way we reduce potential cross tree issues.  I know there's a lot
of discussion on the DRM side about how they want to handle
things with jacks, I'm not 100% sure what the latest thinking is
there.

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl12WWoACgkQJNaLcl1U
h9B58gf/azL9m1nPkR4phZ6A1RIN6d+L25pbHNjtM6SvzmLQ2nOUKncgKEgrHCE5
mcWbRDcvUMGOQFMG4agAnXPvWxyTzLKs8YJ6inLI7FzsF9cGKN4eKz9wDl3QsikV
ObslZLrhqTPe29AtSfIKfC9A3GRt9L0E6gG/D6YYa+ZzPEcJOSRMSsPQ+GXeHh1x
uM7ntqIIEWytr2RkEDT+QJHAqgPWz9yI1L9ynlcZfp9OXt/sO2rWPkpFhNyyjeBs
YFUpXp0aMmVtolJYrljTBVJ+DZeTX5JifotTePHJYEpavbMXJ9lcyTIMGL0bB94R
o4rqAkYpM8kK2jGNg2ojes7W5qdjlA==
=a5GI
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--

--===============5544324781756764198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5544324781756764198==--
