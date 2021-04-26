Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436336B3D3
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 15:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A41415F9;
	Mon, 26 Apr 2021 15:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A41415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619442615;
	bh=v6nzSTqCkTxg14dtckRzPnuB+FzduqW7BAd/04y+8dM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IL66uX/KxEbNetAg+L3ILQDq8OIuoFjY6qBTUiAUhu1ElhBszL//e2kRChcSoKGhQ
	 FMFDHAog2VKgqXzQRNlfAFoo+pHn9qCp5PPmi3rBPyYcRUnrygj5YTWf2slB0PwatK
	 4zzxAjt3CSshnFaNxIn/nx19C/2qWHj17bz9up7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 276C1F80171;
	Mon, 26 Apr 2021 15:08:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0046F800E3; Mon, 26 Apr 2021 15:08:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD342F800E3
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 15:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD342F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMeyZJM5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E114660FD7;
 Mon, 26 Apr 2021 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619442511;
 bh=v6nzSTqCkTxg14dtckRzPnuB+FzduqW7BAd/04y+8dM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMeyZJM5QI4gT608qMZDi04PyzDTQ8IO8zVnP+MyWt0CZ3gN4l5xLl3Y1SN/gAYEC
 RFQGAP5oaD4CX2w64PAWjNKAw5CJv0DOOWLN4Tjk4l5wMl0cpWLPRxtn0zI97Vpzrx
 z6+9bzdU8J/+2rXw2ZD30eMkNO6/nHDTT2fxNnsOU/uKS1a535oQNQRLFwtY70COOZ
 nIp5fLgjcBuT1EwmUzmdXmo3OIjp5H5kSn8LeOG6pXYslXTDKHqa2pqg1LjlKxIyEz
 DdLG//0mdR3uKAvryoVY2eBP1MO3SOcvhHT4M4UMN6e754/xomEDl4nEPVPoZ/CHwZ
 T7kByIjxL54JQ==
Date: Mon, 26 Apr 2021 14:08:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/7] ASoC: soc-core: add snd_soc_runtime_get_dai_fmt()
Message-ID: <20210426130801.GD4590@sirena.org.uk>
References: <871rb3hypy.wl-kuninori.morimoto.gx@renesas.com>
 <87y2dbgk47.wl-kuninori.morimoto.gx@renesas.com>
 <20210423183503.GK5507@sirena.org.uk>
 <874kft4lp8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline
In-Reply-To: <874kft4lp8.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 26, 2021 at 03:13:55PM +0900, Kuninori Morimoto wrote:

> > If the sound card specifies something why not just use it verbatim
> > instead of trying to merge?

> I'm thinking the way that for example select "format" automatically,
> but specify others from Card, etc (= not all settings).
> Because as you are concerning, some driver might has complex limitations for some parts.
> We want to manually and directly select it from Card in such case.

> My idea was very simple, but indeed I could understand your concern.
> I have no good idea so far, but want to consider about it more.

Yeah, the only thing I can think of is big lists of configurations.
That's not the end of the world but it's potentially annoying, we should
be able to get helpers that make life easier I guess.

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCGuzAACgkQJNaLcl1U
h9AR6wf/SefMmhki0UwePpRLSJdGLQz424Rb5zX1rOf53hfVbSy8BREXCs/QNUN3
jXVrW9/lCsb5FbV/8IRIOjvvmlfA16EZjhRKICRjnhrHXTT5xFrqxEkvRqxxC8Ov
6up+/GB7uXx1h4rwRxbof3lLLOWsNKDTpG8whMDBs6UlLUycYjJoCZePKm+iPFGa
fIx7Qhw4Tq9Q9lPL7EW17ONj8gIHlv6akPEEWuQQ4Vcm5gxes4r5QrkOJ++Az81M
tXJ9SkQ2N2A/NlLzBhtPF2+wL71/iAs3bIHVXPHpU2FjrQ3GVo5053DUqeAbutS2
Dd9JmGyUQI0xFlDvvsDAmzTL9yAELQ==
=VpQz
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
