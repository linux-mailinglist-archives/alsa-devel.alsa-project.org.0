Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F355F6C0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 08:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A7C6163C;
	Wed, 29 Jun 2022 08:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A7C6163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656484612;
	bh=kD8x5SF2mMoXieR4rsqI9PayrhNF/ESPgILj/U4LbCw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSszcrXAhrOJl3FVS0/vSvSxTaN0gQ94ZZZwzMk4VnwZgFupQAHqN5ocK70fWA2dQ
	 6tY20nBjgW2SDkKwJptGhG0IVEs3cv894p8yEoQDsPZWrLo22wYL7eKQssuIPropgU
	 rQsOSTOAODjoRWb985WOTsKeeoXh4LuG6WJ654rI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4982BF804E6;
	Wed, 29 Jun 2022 08:35:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95376F804D9; Wed, 29 Jun 2022 08:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57FAAF80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 08:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FAAF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BlQHoeOh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30DF06197B;
 Wed, 29 Jun 2022 06:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE004C34114;
 Wed, 29 Jun 2022 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656484519;
 bh=kD8x5SF2mMoXieR4rsqI9PayrhNF/ESPgILj/U4LbCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BlQHoeOhcHIroWqX3+ffSH0dQxgfxPyVvNU4CAsIHIqF/ir2D3VvP1blcIH8ezI9J
 0J3o3PwT0u//5YEV14SbJcpvNzVnuppbHRd8cdaJziDmeuWu2p5HPED9hJ+9zrHWas
 4xoJdWaQe8obb/zht0+RN5ud3959layW9L0j3p0ZCnSCnlNOdPsqEfaAZVrjTh8jYu
 1g8DqpYg2kPXIZpO+3mRS5wxqq+o6z/QpfbNg+Yk1MPwzPwa7Cs0sN+utqgFMYvX/Y
 dgMtp3xJS1+KevpZbHbo5rYeCv0PttPvx8yTyNm38VJSnMXZ3lcs9BvBSPPfx21gTw
 i1Z+X0xxUJxdw==
Date: Wed, 29 Jun 2022 08:35:15 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
Message-ID: <Yrvyo1VtiXai4RM5@shikoro>
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
 <165469532489.615471.10019728812817999193.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zgXJFAuxaHdLCg9o"
Content-Disposition: inline
In-Reply-To: <165469532489.615471.10019728812817999193.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, geert+renesas@glider.be,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--zgXJFAuxaHdLCg9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next

Can we have this as a bugfix, pretty please? The warning is really annoying=
 on my Ebisu
board.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

--zgXJFAuxaHdLCg9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmK78qMACgkQFA3kzBSg
Kbb/eA//XGgGb0ScY5XMuhkfKdo9YbppR6hncMaCNwFA+DaKuQtDig9CjOfvfbiF
AiDuSZyx1kUQkbe7E0ivckD8TfXbY79aiW2kTTgE2BB2uxosOp6f+UBX0Zt0bw8d
TbG+1C7pm/NDh/sQre+NEt5+VAu/XYNlUKovnBXTnDU/vlHEUPEnHyaz8b1mvv5j
30jF8CBgiL7Io+wrEw7JGc/83L/lql3zZtGyIlIhfMT2Acx3nZJH4gYTePmdJbxh
sOgZm/SiFrEGRtqEfFhB7hjzd+4+eqktOckNWQGkMD2c4accxnoDz3+OXvkXzDoy
ntZLa/sqPfndIAEdsgAsIJ8Njtd3ERwOKIO73jjYBRiCO/70Jnw4B5/OheeTUatB
Q5T4RhKRm9pX2EiV3BzP5SYnxRNVPGRuwOpF8XFEs1wBdwmxWlpllEP2X4lQfO0v
7RfBEohUSblWbyj0nMS2sGIC3IXz1GvWd6EaaI4A+xzJJ/K4qGlMIKgW+AoK/o09
jRzQLtDHuFiQi08x1IKaRqCe5gSysFLQJ/wFvr+OUjvFArB9F8NRTlBS4+QK9ywc
gXs+ELuFZZOnxkGvP4rM9uQarT3H7oCnwK9TGDyjAv/LCpHqfKTJwDtYq4NjxXCT
QnDcNjtz8KNZgplQBvfqFDj93XPV3mxh7k8oc6ugGIcdcrPWaMg=
=TV+b
-----END PGP SIGNATURE-----

--zgXJFAuxaHdLCg9o--
