Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B351141F6A6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 23:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41BCB16DC;
	Fri,  1 Oct 2021 23:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41BCB16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633122542;
	bh=mXVaTxsfvOAUOQFQGEpk2x+XfOp0w09cQnTkUuM5EsE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iA/bwzEEZTAGxhRaR7zOO6BuQtT+eCq4vQhqq8iZm/KXW4e2Kd2PcGEt0ERLJCCTf
	 4ZUr1rKhvzquCbRo0d0xH6mT2t8k7b1tQthg3VPMrsuNLslroXXdHi7e9kELpnTqux
	 S6GdXWygH2BNXQMjWaYvwoSE/eqa8MJpi6jBpLUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3503F801F7;
	Fri,  1 Oct 2021 23:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A2D4F80245; Fri,  1 Oct 2021 23:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C87CEF801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 23:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C87CEF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d5cCyXx7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8C7B61ABF;
 Fri,  1 Oct 2021 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633122453;
 bh=mXVaTxsfvOAUOQFQGEpk2x+XfOp0w09cQnTkUuM5EsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5cCyXx7B8LI8ZI7WwJztYBfC/FT1QBSOqdrq8zy2cKkKSV8ZqLoZecop1raM6yKI
 uCCMFyKBmV428jW9V5TBJj3v7I4UflEgPvBaLnwuyYjB6mOAsjS2DYpCyJvcEvExwW
 K18asF6i9rgPBFfr0Sg5TcWYbc63AgIUZiRzuOgaYXiaPlI8zoVRvR7aBk7YibF8kl
 BQHQAQW3aEJIW4ZZuZuQzHESBXs8lCMAEoElw/okJcxaMrtg94zppqJL/IOGfReBrk
 sa9JuebnLN6XGEZPvdnXEJeF5fiS2c7JBLnq9VjXcyhmaHnguwIKCYk3Ytfd2zx6iJ
 xhLOAclbeFOWA==
Date: Fri, 1 Oct 2021 22:06:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 09/16] ASoC: add Rich Graph Card Yaml Document
Message-ID: <20211001210642.GF5080@sirena.org.uk>
References: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
 <87h7etusv4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline
In-Reply-To: <87h7etusv4.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: "Pok pok pok, P'kok!"
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


--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 10:22:39AM +0900, Kuninori Morimoto wrote:

> +  multi:
> +    description: Multi-CPU/Codec node
> +  dpcm:
> +    description: DPCM node
> +  codec2codec:
> +    description: Codec to Codec node

I think I need to have another look through this sometime next week but
other than the naming thing discussed in the other subthread I think the
only issues I see at a high level are the standard concern about putting
DPCM into an ABI which I think we're stuck with having to do right now,
and also if we can merge multi and CODEC-CODEC links more.  There's bits
you've called out in your changelog as needing further work but I think
it's OK to add things incrementally.

Overall it's looking pretty good, thanks for working on this.

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFXeGEACgkQJNaLcl1U
h9A0cAf+IV9hzaWF+L7aFmf/7tWk0y+zP/9GLxAdMYf5IcFgEOg5+bkCt05WujEp
rbPIkazUhm8kxtADsibqGANt880l3McuIaZVFWEC3R0IkLcuiWAhLZw9KHpTEd3x
NmEcyrbXOMp87cvE8p8IzM8rnazRhirBejk+pcBVUi5adLFOr0GiT4FQPhyl+5Bf
H6xkz2pVKGHGX3UT4YmRG8aPeuJohsCenf37XjaC6YgWMuPT3f/2pWg/Q4zS2LPh
dKjJC45ihV7v6d3irBNvWhPhGp5nwkBslFn9SskYYhTQ13kvi1IUTg7ouwYr7Yce
kccuourrPWSSDnbg9uUbHqrYZRDJWw==
=s8AN
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
