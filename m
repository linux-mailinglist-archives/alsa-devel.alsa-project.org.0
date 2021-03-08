Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7FB330F56
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C8F188A;
	Mon,  8 Mar 2021 14:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C8F188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615210517;
	bh=51uVcKpepq3ZXNpD6aERSCG5PwwucDSsHlhKiD8Z4yI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRtOzVCsUd59KentY+S2BtHyHYyj101yrC9sSH25JhQhI4tNmigtjbXZUXXFkbGrY
	 3Ue7vTTzw4VmPO/GS5el207uNnvIhEdCvwSPwn7J7RYFJ6YokApgqrSa2P13JIQFoM
	 opzVXHJ8YoMKY0R7TpMKJ8bedDtkKJ3QtyIE20dE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22658F801ED;
	Mon,  8 Mar 2021 14:33:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFA80F801D8; Mon,  8 Mar 2021 14:33:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0D87F800D0
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0D87F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="euktYJ7v"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79898651C2;
 Mon,  8 Mar 2021 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615210414;
 bh=51uVcKpepq3ZXNpD6aERSCG5PwwucDSsHlhKiD8Z4yI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=euktYJ7vzpPhBSenFyoA268wuAEtkInnOqMpJ0RclN0Mcpw/RVMl7Bfm73MtZ7CwR
 Kuq81/9cNLfxn/r//PVJKaJyPCl7lujirVTS4WOevH+Wu6jxrIxgb+F1UFuiuIRGwG
 laQw3ZG3BiMtIaxxGKbamwOahrFFRAhCH4+qfiukxYOdWHPeJ+VmpQ8HMEOVBJ2oHk
 qJuAGClkMlD3SncD7P9ehRamI+hH/KNxBUuptBHkoIkm/3D7vbGw4qMxRDzrz8L5AV
 M7ICAIjM8c+Qd3mwKskhm9pV1E8C9UeswCuStjDcnObWccixoLtVv1PmDkc/Jxt7i8
 dG2tPnLcA9HYQ==
Date: Mon, 8 Mar 2021 13:32:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 6/8] ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count
Message-ID: <20210308133223.GB4656@sirena.org.uk>
References: <87tupqpg9x.wl-kuninori.morimoto.gx@renesas.com>
 <87lfb2pg8a.wl-kuninori.morimoto.gx@renesas.com>
 <94eb9f41-3d1d-8054-2f12-16fba9dddaea@linux.intel.com>
 <87tupmvbdj.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <87tupmvbdj.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Am I SHOPLIFTING?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 08, 2021 at 07:37:28AM +0900, Kuninori Morimoto wrote:

> Ah it is better :)
> Mark, can I repost it ?

Sure.

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBGJ2YACgkQJNaLcl1U
h9CfJAgAgqGS2c9t1ESbgHdn4uHt/vpr0Z2lYFBixVxBrTCZIlDwp+yfXD1Vqrgz
KN61XdOguUSlWT+BEi9JjE6QtHtd24HRwwOqkLpLeY28D4G7LiURoY4JbNZzC91Z
rxDqQNM6MmGZFWdl7SYMsW51pvpnvIiVVYZ8P8vXeUl16Nu+V0xum7o6eCrtnvrb
1U22qjwuoFLTcHSjQ3HvpcXri0ci1l1613wMcPnGq2uTlSwrZkACETDJ1cqoB6Tz
q2IpLttpV0cbCDynJeoFDydYgLe9blBlydhCGQdhhefnyl6q6zIRrWKGKpVzVlhJ
A+G+nkyngNHdFYOKyteOg1YWVNJqaw==
=XPKz
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
