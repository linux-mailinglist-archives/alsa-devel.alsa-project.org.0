Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE13723C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 12:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 178C7950;
	Thu,  6 Jun 2019 12:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 178C7950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559818704;
	bh=qxGukgPOVwxd+6vHj4J8YYtjvvlPXETU6acNtA1b6Uo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vKOUxlrTbmaHU9i8ej1aJoFsqHl11jNSzLnObLBFJUctYCDtFl/TXClQcV3LdpJ1A
	 i4LlxaO5TExuQ+oVB7NZ2pMAwyzl5vv4ZeucB0fHkUp8bBwAuk73SVLc/CiOYMYOOa
	 2Utt+/hJXWmF1/mQoqznyjjj+ymZsRTa+mcE/znA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A77F896FE;
	Thu,  6 Jun 2019 12:56:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7739FF896F7; Thu,  6 Jun 2019 12:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F109F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 12:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F109F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Bd/0GWI3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/7Wv4BtQMP45GlLXRPUQsNZz8VQWEGvWkZ6KduQdomQ=; b=Bd/0GWI3d1/rKCUiXiNC9UeLy
 BWYZHgX45EV5c8p+FArhNua7sCu/IZuru4SkFctuvd/6G46PnpZ6sgoO+HdxbAP881ZIV8btFV93T
 oUQmL7wKbykoZ32ndzardKwptBLqoYJ67aHBp3DAPuIqXrUCtyGlKvCEQMtvPAEa69d78=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYq4P-0005NE-UL; Thu, 06 Jun 2019 10:56:34 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id EA345440046; Thu,  6 Jun 2019 11:56:32 +0100 (BST)
Date: Thu, 6 Jun 2019 11:56:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190606105632.GY2456@sirena.org.uk>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 000/146] ASoC: modern dai_link style
	support
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
Content-Type: multipart/mixed; boundary="===============5155269390993206129=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5155269390993206129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aWODCRBxMR7ARF42"
Content-Disposition: inline


--aWODCRBxMR7ARF42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 01:06:52PM +0900, Kuninori Morimoto wrote:

> I added posted Tested-by at ateml mikroe-proto,
> and Signed-off-by Pierre-Louis for some Intel patches,
> and new patch for new Intel bytcht_cx2072x

Are you sure those should be signoffs and not acks or reviewed-bys?

--aWODCRBxMR7ARF42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz48VwACgkQJNaLcl1U
h9A+fgf/VX5tPqfmaZ5eerBKtEU5Sav8frTJDHCrcpr3N9YV2H6O7bS1l5KpkARq
GAysCnM4HAQvI9FFfb/BCrTipccjKZusa7qI5XHiy/oAaPGhvDRIKbxVuAkUaS4x
oVYZ4h1q14Oawq93b6MhO5mnlMTZ7nLMDqzbap07VMy7JTHWwrrniFUp48ylfjiZ
ZInZZodZggN2Ort9tCoeRnR3Q+tQoq0Lco/wDKZzsLARkR36L2QZzNAAGGhjc2iF
7KR5tknNc5ijCzOBC0KsJezF3XhUTrbuXE+9C0iuSzJ3uCpwLC3K7vr06aGo6tO3
rA289e5tq5tHo6w7/11H8s1CTKPwaw==
=ataU
-----END PGP SIGNATURE-----

--aWODCRBxMR7ARF42--

--===============5155269390993206129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5155269390993206129==--
