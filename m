Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE674F828D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 17:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952861838;
	Thu,  7 Apr 2022 17:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952861838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649344213;
	bh=m+NDwwT5mnD5vEmEl6tEcP3rbdAB2sPSt8NXHIlxqW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O411Eb81jl18Ir3UPwfxaqFuODdQ4Z2r8lMOXhjq9EXnLjpU7NS4dyRyfcm8lSEhA
	 8UBVEpytqfMPtNgosZceMxiaRP4gzoZXUCdVhoZdYCuzXPyiONFmJ8efnUYoweHZeu
	 L4pvVb8svcNeFX8pEDIXg0G37eI7+7/j83WFe1ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15737F80054;
	Thu,  7 Apr 2022 17:09:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB0D3F8024C; Thu,  7 Apr 2022 17:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CAEAF80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 17:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CAEAF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R2wZaPyS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B26B61DE3;
 Thu,  7 Apr 2022 15:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDB7C385A4;
 Thu,  7 Apr 2022 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649344147;
 bh=m+NDwwT5mnD5vEmEl6tEcP3rbdAB2sPSt8NXHIlxqW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R2wZaPySvONmMrEegrR3cpKkl5c3i6zGNE0KwyoAV8inLlfJV50AdFw5NRke2dh7l
 EUpHdxALNtPKCj5aOCmbZuBb0mOCg4ZQWTasZBgGgvYb9hzcv/UyW7eBjBYEuBFrll
 ieWx7eM2wC9EyUtgW4QcKekzrfratW3/1ZFR+tOZAq1K4QLYjLcm02mnoIbIzebJht
 L79XQFZSWS5fzMJRlfJpaN+4N3f/U6ojFibVvrlj6j9rhPrbtJlZl0ft+s3t4DmMdL
 OA3qOLr/TH0RNbC0AttiqQ1aLy5bfyUCujyH9cs+sOAVa5YGtxWZRd0Db3dh8UZdu6
 yzabws6cp8p1Q==
Date: Thu, 7 Apr 2022 16:09:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Add jack kcontrol
Message-ID: <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
References: <20220407141316.5099-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dSCykcoLsRMrrTF1"
Content-Disposition: inline
In-Reply-To: <20220407141316.5099-1-akihiko.odaki@gmail.com>
X-Cookie: Look ere ye leap.
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


--dSCykcoLsRMrrTF1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 07, 2022 at 11:13:16PM +0900, Akihiko Odaki wrote:

> Create a jack kcontrol manually as rt5682 does not use DAPM pins
> for jack and will not have kcontrols for them.

Why not use DAPM for the jack?  Note that normally the jack is part of
the machine driver not the CODEC - there's no way the CODEC can know how
it's been wired in on any given system.

--dSCykcoLsRMrrTF1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJO/owACgkQJNaLcl1U
h9AEGgf/W3/sjKKCepOxRaMvpQ7VN2uIOJlDIBnK1XFdb4T1ujEE53raK3EDDf7g
a9FFb5FmG1ejbqW1XRe0OHqjuhUNWWu60gao+FhVFB0gdqhJo39i3IQ3Az1lwMDD
/rqeJtfWQMu01WQHkQkPY6Uw2pN2EaJlDQEd5g9r7RoU9GBqnY/+9ksFzFzdt6Cq
zhfjTEWqoVhCcY+ia3PM+BNGAcEl49mLoDyKn8TskVKSatVSEfqA+vq3SbmcnBXD
LwroN3WEfoD5g47ynxxLZIQ44E0lai1QQvpn8+Vuop01UE7Y5AnHwY+0vQ25mLE9
kAI5EKh7qZgRDm+SupMnx2KZ2KOb3w==
=q2D7
-----END PGP SIGNATURE-----

--dSCykcoLsRMrrTF1--
