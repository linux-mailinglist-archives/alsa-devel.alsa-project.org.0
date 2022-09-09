Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFA5B3CFA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 18:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F38711693;
	Fri,  9 Sep 2022 18:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F38711693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662741015;
	bh=l8X707fTv5ib7dL7bozpVNfksVOWIll36JNKciNhmVc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RvVXYxI4Ew50m1Dc35XssKMCSbeEoQYRnYK1ztsC0Ik+0iHL+fZQZw5EbyHjUQvmV
	 xv+QweVHomHm9Q/V7845skQ3WktLQ1F6sKgIXKx8gTYihFShln6BzXRU3962JNcFh9
	 Ztt/BZIJ8K5aQmvlEoxGNLbnSJNjUrBfPFEYg7TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C458F8032B;
	Fri,  9 Sep 2022 18:29:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98C0F8023A; Fri,  9 Sep 2022 18:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C3EF80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 18:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C3EF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hL+Nxclp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA1FDB82583;
 Fri,  9 Sep 2022 16:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0185FC433C1;
 Fri,  9 Sep 2022 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662740943;
 bh=l8X707fTv5ib7dL7bozpVNfksVOWIll36JNKciNhmVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hL+NxclpqFVqsV3qZfGbefiizA6c+jW4D0nmAq1IP/Yg6AhTQVfvWUeeueCFNXCm5
 Imm2rvoSBXsYb3VJEVQCbKYNP/jrRyROQRQQ/g4JApT1OXDI7H6bgoQn8HIO7B0+a1
 HxStJE4pTJ/Be4oWWs/Ucy3fIMLsnjGXLikhJf47x61kN0gDWuKEMImmj72HX89szN
 OvA0MtAh+nawzEIResfmUAzvKf/GFtrp7+N5ak084riPJDpXaNTWsZ+3hgFvaHvNYV
 f6shTTdtCq4BqH7uKZcCRwXEj+FaZpdjKMzclDhJOiIEtet4c/Qo9U47NMxX3iDYIX
 vbOM7cpEEKsNQ==
Date: Fri, 9 Sep 2022 17:28:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(), and remove
 .remove function
Message-ID: <YxtpyvC/f6of8scT@sirena.org.uk>
References: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
 <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Vp4UAbmLzb8RzLvj"
Content-Disposition: inline
In-Reply-To: <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
X-Cookie: FORTH IF HONK THEN
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
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


--Vp4UAbmLzb8RzLvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 10:27:22AM +0200, Jerome Brunet wrote:
> On Fri 09 Sep 2022 at 01:21, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> > Current aiu-fifo.c is using kzalloc()/kfree(), but we can replace
> > it by devm_kzalloc(), and remove kfree().
> > This patch do it.

> I'm not sure about this change Kuninori.

> This is the dai probe, not the device driver probe.
> If I'm not mistaken it gets called when binding the card.

> The components and card drivers are different here.

> If the card probes several times for any reason, EPROBE_DEFER for
> example, wouldn't this allocate the memory several times without
> releasing it ?

Yes, indeed.  You'd need to move the allocation to the device level
probe to convert to devm (which *would* be a good thing to do if
possible).

--Vp4UAbmLzb8RzLvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbackACgkQJNaLcl1U
h9ATTQf+P207joBcu+aztOQbXAG89+VwTsW4CCyDJSEk18BZY+HqKptaadrPvWY9
IgMbSbEI1kXXpav0XYLDbvwSXRiqfDY/iSZCRkwoQVFOLah954qhOtYk0yTAzDGu
hVcYrYL+8cyli+81tXXgh4ew6gKkW4t0kioCCjE+cUTZ3PUpiLW8EchI1WX+AoNd
Dq6cwNoJ6FeimiSRT5z/fwXwJ9q072nYxu13jmSGXdcLkTIa6/d0+xv7Hokxb7rQ
wrUpW8cWUnoK+Wqv0sL2CdnBv96lukXqyIm8gR44QCA1PoJlI6ivINMIymtlLBPn
FevB/QKo64J/BGkWqYe7mYYt9SE5Fg==
=BIFc
-----END PGP SIGNATURE-----

--Vp4UAbmLzb8RzLvj--
