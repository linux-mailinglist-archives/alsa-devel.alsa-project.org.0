Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27860AEE
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 19:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E374C16A1;
	Fri,  5 Jul 2019 19:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E374C16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562347096;
	bh=XfT+25hq71CThU/7wSTm1kdyFDkNm0UKTlEDDKt6tWY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kagt8zbm/OvArOCQjVUY3s2PeVbm0EeGcek+F5XcS4AOvOqHiSsUyIiouYJBB3orU
	 LIqiEBb3FF+T+3kBbx5xA0Kcgsegj3Y/r8QbqUUdkMwYbHmqzThqtPGfZ70ZdVd8L8
	 5sPFHFb4GJPEI4L/znPgTQFRHL/A4JB+PSnE6gY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E44DF80133;
	Fri,  5 Jul 2019 19:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E9BF8011F; Fri,  5 Jul 2019 19:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8FE4F800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 19:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8FE4F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="itGBlD/H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HKEyNx+1XrxknoW82kLLhbqysgbib6tL6sBEaXoa+FI=; b=itGBlD/HeUPpNoN4qsN1uixLm
 5X32bE/IGmQQdOgCnkMiPo9HFqoCesf3SYKUlSgC3ipJfsqtATXfgH7PXzc02kiKHWbJzoJ2VfyUq
 Wns8aGyFJFVoGcbTpZOYFd/9Nvcm7wcmJ/SSeg8Gt2ueIgE9wBd62k6dDPvJm++5xqVlE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjRop-0004YR-Ea; Fri, 05 Jul 2019 17:16:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C902F2742A29; Fri,  5 Jul 2019 18:16:18 +0100 (BST)
Date: Fri, 5 Jul 2019 18:16:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Message-ID: <20190705171618.GA35842@sirena.org.uk>
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-3-cychiang@chromium.org>
 <VI1PR06MB41425D1F24AC653F08AFA463ACF50@VI1PR06MB4142.eurprd06.prod.outlook.com>
 <CAFv8NwJXbJo=z_NDj+JQHD9LOmnbfM8v_N1uHn4sdBzF-FZQfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8NwJXbJo=z_NDj+JQHD9LOmnbfM8v_N1uHn4sdBzF-FZQfA@mail.gmail.com>
X-Cookie: Haste makes waste.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "dianders@chromium.org" <dianders@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, "dgreid@chromium.org" <dgreid@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/4] drm: bridge: dw-hdmi: Report connector
 status using callback
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
Content-Type: multipart/mixed; boundary="===============0647851841106878576=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0647851841106878576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2019 at 03:31:24PM +0800, Cheng-yi Chiang wrote:

> It was a long discussion.
> I think the conclusion was that if we are only talking about
> hdmi-codec, then we just need to extend the ops exposed in hdmi-codec
> and don't need to use
> hdmi-notifier or drm_audio_component.

What I'd picked up from the bits of that discussion that I
followed was that there was some desire to come up with a unified
approach to ELD notification rather than having to go through
this discussion repeatedly?  That would certianly seem more
sensible.  Admittedly it was a long thread with lots of enormous
mails so I didn't follow the whole thing.

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0fheEACgkQJNaLcl1U
h9BXfgf8Djh9t+tRCpOZtbD0eqLrC0mbgK6xvHKXz2Asdi73S29NTI0EsIjf8oZ3
Pz6/6L7lp75cOGU0EoQEzBtCuMIBCEXPI0gewu+FMjVlL3vhvV8svBfRuUZztzn9
12ImYdI/oGK5DDKw7UkhuSxjjoEdnStnEA7qmB/XjH5eH05C2P4xQBYLATEo52oh
jGMW1fSAh+dnQ8A3N9kAJLl9AF+f/eXzWfw3jfoelzQJPikX16xa5UE/U+ukQZ7F
B79Nr4Lp2n9ORhA+GXIk6HVSsoBDqUTOpjH4+zjgDXe9nYK+BBSJ5AX8aZlxBY7C
AP6VWjYU5x92p6hdgtNtqK0pmZ2SZA==
=5Rc/
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============0647851841106878576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0647851841106878576==--
