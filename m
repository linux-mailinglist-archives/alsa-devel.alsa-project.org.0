Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED533646C3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 17:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBFAD167F;
	Mon, 19 Apr 2021 17:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBFAD167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618844981;
	bh=rEVbeVGAfmFbQe3Md2SQTjJPknC/BhdzjFEQReGzK2s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWYQX3fESyIc4n4KeFg/MJutIdflAAFwjGNDPr1XKXn3EbhHo7zIHy5t3keFq2uEA
	 qHqf50bAluGIcHOhTBXLf1t8BSyRqR6oSn0BixYOnd/a2G94w/y7EqeZGIAF4XAvKz
	 HI8vkw6OZ2WBtWaQYlBzRZQcgHbOEgtfCldAhZK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558F4F8014D;
	Mon, 19 Apr 2021 17:08:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C2BEF80274; Mon, 19 Apr 2021 17:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78A43F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 17:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A43F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fi2zvVWD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B18B61007;
 Mon, 19 Apr 2021 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618844917;
 bh=rEVbeVGAfmFbQe3Md2SQTjJPknC/BhdzjFEQReGzK2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fi2zvVWDb/79l6qru8t9NZc83ksj6rwSxy0TIFOan0z4bP45FPN4wedi/V4XFaVTJ
 Qr0S/o90D8Z4Cn21fZ+SvlVfk7kLNyNGBfANm7buQ/Abt2YnTMzN3f74zZOIb0ajsH
 rUkDLq5hTi2w1/JUrhMncrTLwdoM8iRjAe9fB9c7KbA651gjymvNGzkKglw39+cm2T
 wOL6CRExnTd0/Z45I6MeFfva9LR0U6VIGjY5S0shO4UHUCM87vZyxn6jfeQO9nlT96
 AbjH+2sp6JK3R2/CQy/99t8BcoocCNMJh1oKowCbeI0Md8msERxmvL/G+zUbtV4T7S
 BLrK/EXwL2NtA==
Date: Mon, 19 Apr 2021 16:08:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: simple-card-utils: Increase maximum number of
 links to 128
Message-ID: <20210419150811.GC5645@sirena.org.uk>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
 <20210416071147.2149109-2-thierry.reding@gmail.com>
 <8735vn59sw.wl-kuninori.morimoto.gx@renesas.com>
 <YH2Y/rd2/q5qHvnz@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <YH2Y/rd2/q5qHvnz@orome.fritz.box>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
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


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 19, 2021 at 04:51:42PM +0200, Thierry Reding wrote:

> Reducing from 128 to, say, 80 should eliminate that warning, but I
> wonder if perhaps a better solution for the longer term would be to
> allocate this structure on the heap rather than on the stack? That
> way we don't risk triggering this warning again in the future.

> The data structure seems to be only used during initialization, so
> something like a kzalloc()/kfree() pair doesn't seem like it would
> hurt much performance-wise. Add in the devm_ variants and the code
> complexity should also remain moderately low.

Yes, that'd be much better - ideally we wouldn't have a fixed limit of
any kind but that's a more involved change and quite possibly more
trouble than it's worth.

--8X7/QrJGcKSMr1RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB9nNsACgkQJNaLcl1U
h9BtqQf+NqO7dwVwfyX4OZoTOCgUuGBeATfGzoTv1JUlFRVOPRtSz/yr8bXBX1pv
VUJkG7m51kjhOCmwAVTZvsjGZbpIUhvYRZZjOgRoS0RiFt859djYrJn2e3ev/VYu
BV2d769ppcFKnlQAswG46Lvfq7MRCw3eHlJbdV16XDHL2OmCWAn1QWT302M2MY94
rBFe/PsZB/AM/uLcEJ3OReNrncPvx+d11sGPps8o5A7sVaY5E5r3JwBPMLkWsjZ8
nd9D1W/LtB7HSocGybfyRxulixOMagO4EroepEE0ecsTaRU7uHcZzUqiLO8xnC36
0BV18/QRDXq6BdUgevj+vAxz0sKQMg==
=G4a1
-----END PGP SIGNATURE-----

--8X7/QrJGcKSMr1RN--
