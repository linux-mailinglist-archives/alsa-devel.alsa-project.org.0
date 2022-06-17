Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF155007C
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 01:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC881E84;
	Sat, 18 Jun 2022 01:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC881E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655507794;
	bh=Zr7o5Ip/n+Z6hADKBqwvFtgoYqGmemiH5sEu5Gmn6Uo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQFCsJctpyLdMMOk0N647i4/H9+Sp0Dt/a/wpVB9b3xGD2u5wvRkHHgdgojZGLRuh
	 qRIqIwevD4ez61NNI6xtnf+Cs7DzIwW7Z2BAMYASK24Ylrk5He4WIYGP9dUOLBGU85
	 Y+7UGlq+HtC00S6ZdBgzVBW70vleReim7E4XkZBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D06F80528;
	Sat, 18 Jun 2022 01:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68211F80527; Sat, 18 Jun 2022 01:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F341CF8028B
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 01:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F341CF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NvVeNGxS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD5396174E;
 Fri, 17 Jun 2022 23:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E501C3411D;
 Fri, 17 Jun 2022 23:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655507729;
 bh=Zr7o5Ip/n+Z6hADKBqwvFtgoYqGmemiH5sEu5Gmn6Uo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NvVeNGxSrEC2+wGfvxgrs2TZcmVlqb9wr0ncY/ByguBP1mXwzGWAVvdmf0LsH45HE
 +DVp7mKlZSLTYhJNRz702Z034GHzBrZSGhEi7q4FIV2U3kshY8BMvSYmdb+5xtENhU
 aOhuH0AzI7OYW9MXFHzcNhQl5SWvGC2m7YN5Hcv5/jzNLjMJ0DDRUzeXuagimtgw27
 awG2KiyAITkD+LLOhe4OSfaeOtFcNHjs0QgJLRrHV8Q8HLHsmCNrnwD1JswlENPK18
 gCyduAV/sX5u5WEf5PpkQChZr7H4NGUzwZ5qJlJOUrySZ3ZrXvj2TgS8eEPgjgWe94
 V6Yc55jAL7BpQ==
Date: Sat, 18 Jun 2022 00:15:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: ops: Fix multiple value control type
Message-ID: <Yq0LDPDQitt22GDk@sirena.org.uk>
References: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pPAHYp+62yWsAIkg"
Content-Disposition: inline
In-Reply-To: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
X-Cookie: 98% lean.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
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


--pPAHYp+62yWsAIkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 18, 2022 at 12:37:08AM +0530, Sameer Pujar wrote:
> The commit aa2a4b897132("ASoC: ops: Fix boolean/integer detection for
> simple controls") fixes false positives with controls not ending in
> " Volume" string. But it now forces boolean type for the multi value
> controls. Fix this by adding a max check before assigning types.

Thanks but someone already sent a fix for this.

--pPAHYp+62yWsAIkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKtCwsACgkQJNaLcl1U
h9AzxAf/SF+Y2CEG3+wWqNxOf7VedEGHhfsNyQFyPMLv59ISuaZSpNk3P2M7VdqQ
5bXsu6P51V8UqWIk6beNVh/GBfTbOtzyWGbzNhDXD/1TUzNUgJfhOXrrNZTX9BpN
DzMsk/R1wkvbW23S27uAbgJ8FiLuo4vm7WLWNTucX5qbuG38Zpubo4yQPvTsvohz
jgegrI/x1W5kzYPxIOiKkFzewnpsFcmjepQMSrJq0bVzpSRzI3moUPgrg/tN8lli
wS41tgbu4I7kDVubBqg0oTYceaic03bTQrsnG8Ayof0SvFpStpCTHdwGh45QQWYg
pqVKaC5OXvQzKnp2QBa8Jgv15AI4BQ==
=pb6W
-----END PGP SIGNATURE-----

--pPAHYp+62yWsAIkg--
