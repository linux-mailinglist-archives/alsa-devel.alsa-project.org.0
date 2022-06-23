Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1C557851
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:02:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2E01EE4;
	Thu, 23 Jun 2022 13:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2E01EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982134;
	bh=YtvSlsb5Q7atw4iecr/pkDWUYQmASVHtIjHd6A/1NEs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWrINhsb2pku/bzeUghMoVpX7BbzSUAdDZvNs5v7XkxUDTGOiG99z+8IYHWvpZ30x
	 Z3ey59v1bcEvNadqdH7r6VGgLrz/Gj8hbC3hYgGFJwQI81fWdaMtZUr5cRBjzMm43a
	 Jxls503zM6wDs0zC2NvseMi5wq0os0n5m1UZCJ2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24266F804CC;
	Thu, 23 Jun 2022 13:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB896F804C1; Thu, 23 Jun 2022 13:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C31F800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 13:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C31F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nhw4Zq46"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A675B82247;
 Thu, 23 Jun 2022 11:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CFFC3411B;
 Thu, 23 Jun 2022 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655982070;
 bh=YtvSlsb5Q7atw4iecr/pkDWUYQmASVHtIjHd6A/1NEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nhw4Zq46iiecL8+S7YiG+rOa67ScuNb5azPosxSmLA6WKJIU4N85AjAuj1gcDjZhf
 loeSspMFusxpspo4tNsts1d5dmhcO8XBfrH9GNU0TBgSizf7cjTo4EwN51Orhj23W2
 KuqrpkcER/2bpsH15M3qUbXFuv7bTZMZ/nqVM4PZYgjDP1A6Z0OFaMbbOaxjgYoPN6
 mwN0tQVVh1s4XQOyavg27TXjcw0A4jaTYJOw8BL43grqq4FI8N+TyapZqIdTU5aXnC
 OV4oVD701F3wUpjO8ob7L4VajoVPG/rLsOJQMBi0S7NKUwD12QPGzSz10zk7fWrD5N
 kQqUTV12m2rpQ==
Date: Thu, 23 Jun 2022 12:01:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: topology: KUnit: Followup prototype change of
 snd_soc_unregister_card()
Message-ID: <YrRH8LAU9sBbx/1r@sirena.org.uk>
References: <20220622210629.286487-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aGC6+CHMROrsykh3"
Content-Disposition: inline
In-Reply-To: <20220622210629.286487-1-u.kleine-koenig@pengutronix.de>
X-Cookie: I had pancake makeup for brunch!
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel test robot <lkp@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Miaoqian Lin <linmq006@gmail.com>,
 kernel@pengutronix.de, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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


--aGC6+CHMROrsykh3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 11:06:29PM +0200, Uwe Kleine-K=F6nig wrote:

> I'm a bit surprised that sound/soc/soc-topology-test.c isn't built for
> ARCH=3Darm allmodconfig (that was my build test and that's the reason I
> didn't notice the issue before submission of my change). I didn't look
> into that though.

It's not built for an x86 allmodconfig either, it's only built if you're
specifically building for kunit which seems like an issue with kunit
when there's not much automation covering it...

--aGC6+CHMROrsykh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0R+8ACgkQJNaLcl1U
h9BsQQf/QsxjnB78RgFVxdK6aDlPNCyy3U35tSr1u6ipbRUnQE79ANMQk4BR55cq
nclm2Ln9z64dFt9gaV9gRwSNYWOctJngoqvWM1qt++SfTe0tfdfy7qRTdsPNuTQT
zQ1noMq9o2Blz/vO14/L4xzHrndMAxSisDupILacTU5BOnow9I7MS0OFIgK0VqSQ
pDvGR+Z8WaYEfeDtu6YNXCd2xM+pO/xb4Eb71vora+wYEEPbrFGd47lS5dyn27gc
wx65hDHP+GHBnQlVdWht/NZu2zPLiY0ktW9qDbTSzLiFKorCr/8TbWN3AorYFlj4
ko9umVA524RU9FloJEy9rkHXG7b99w==
=vuZg
-----END PGP SIGNATURE-----

--aGC6+CHMROrsykh3--
