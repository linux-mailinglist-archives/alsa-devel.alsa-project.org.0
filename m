Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1446A53C829
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C701817;
	Fri,  3 Jun 2022 12:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C701817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654251084;
	bh=J55PX6csgV8KmYD5kOPsQtYHR74lOtEt0I9fGh4u6ms=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msHH7pjhf7me/I+pZf3ijh+LZMWZMO43KrluaxXj3ZZiQtWnrb1/87uBRew2E3pbL
	 6Kr/axNN2ucqrpdNdb/gR/v8xmcyr10mSQ/s8FZ9l2XMC8B3krhnsodeKFObByjS0X
	 yK75Ll6QvLEm9er+z15z8DP9uC1dYQ+v4fnRZfes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3375F800F5;
	Fri,  3 Jun 2022 12:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C7A0F804CC; Fri,  3 Jun 2022 12:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13B45F80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 12:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B45F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="So4TqyYF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29B99B822A5;
 Fri,  3 Jun 2022 10:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F536C385A9;
 Fri,  3 Jun 2022 10:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654251020;
 bh=J55PX6csgV8KmYD5kOPsQtYHR74lOtEt0I9fGh4u6ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=So4TqyYF9CaBN4+t1oqwZVvSwZh4KGaqP4+XpNl9bi4nplUQ9Lex4J80w4lg96812
 a+i7scDhovhfOwDPBrJSc0j4fN4nPK4f7ySYSNadvO8Jn66rfhgmHeUg6qCMVshlW6
 NyRc9PIn+UzFJBzLK6lkSTPRGsO94yjmh9mcATuqyPC4YY/bwsdp/ZMTqXp6Uo1tEF
 rCanOqy6nf11k1QVqN3LTTYSKBnOTeo0sayj2aoodzhCThEQrQGoGFvubB3rzY79sA
 +4zsFykm2ceJlEfMbyuyxASm5ky8SKg2IJB/oO489Ia7sMIT2RK5qC/YMhH5PUmYyo
 8zeCgxec806Gw==
Date: Fri, 3 Jun 2022 12:10:18 +0200
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off
 and on
Message-ID: <YpneCrGXLYeK9WB5@sirena.org.uk>
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
 <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
 <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
 <YpiR5ov8X/5yQACT@sirena.org.uk>
 <cd69d7e3-6a54-7438-b126-5962a8951ca3@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i5kKgdxwkXk3utbi"
Content-Disposition: inline
In-Reply-To: <cd69d7e3-6a54-7438-b126-5962a8951ca3@canonical.com>
X-Cookie: May your camel be as swift as the wind.
Cc: wtli@nuvoton.com, ctlin0@nuvoton.com, alsa-devel@alsa-project.org,
 kchsu0@nuvoton.com, David Lin <ctlin0.linux@gmail.com>
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


--i5kKgdxwkXk3utbi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2022 at 05:55:18PM +0800, Hui Wang wrote:
> On 6/2/22 18:33, Mark Brown wrote:

> > > Thanks for your comment. But it is weird, it doesn't work like you sa=
id,
> > > probably need specific route setting in the machine driver level?

> > Is this triggering due to reprogramming the PLL for one direction
> > while the other is already active (eg, starting a capture during
> > a playba

> Yes, it is. With the current machine driver of fsl-asoc-card.c, if starti=
ng
> a capture during a playback or starting a playback during a capture, the
> codec driver will reprogram PLL parameters while PLL is on.

So your patch fixes that case - note however that you're probably
getting an audio glitch in the already active stream while doing
this.  I'll send a patch which should improve that shortly.  BTW,
shouldn't the PLL power be left off if the output frequency is 0?

> And in another case, if the=A0 snd_soc_dai_set_pll() is called in the
> card->set_bias_level() instead of card_hw_params(), the PLL will keep bei=
ng
> off since check_mclk_select_pll() always returns false.

That should be fixable...

--i5kKgdxwkXk3utbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKZ3gYACgkQJNaLcl1U
h9AN6gf+M1F0w1bypWQFE+XhFlaGZmS/KQ5dSipgw8MCws6hQ9lR7pbU06hkF1CJ
KTSd9HBbpI5FKeEh/FL4IIuXrM/XD91RurxULoK+FNCkoM6RY+f5l0igRJgVf0oG
+9CroWnmUbVAmZ/AIseC1vDmKUPOO40zM7vDSkEzYpY3748d11jtDLae9bNr2gYe
jqMEM4cqcpoth3Jf6pGqrO6i6lP81DSSMstK1oYONS0XJkbhPz9ggLN6D9j92GwR
QlySPwzEDrbd6SWxWi0h6UpP9IfFF2leTzLQ4W9MBNpdSGcO2FXJX2BhVlcBUR8/
JwIYs8FeRL3naN3sdhCMh7CrFXBtJA==
=TVhA
-----END PGP SIGNATURE-----

--i5kKgdxwkXk3utbi--
