Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9B27DEF
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B911672;
	Thu, 23 May 2019 15:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B911672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558617585;
	bh=6E53KQBc8Ltg50U2CMtM5m0oUzsHIfkI35x9+v+K2/U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c6hdiR7Uw426PpqO9ArfWKoVGsVpHXmS4bydIfOxTXlNpUrGNPz0eYKS+PHKLTnZD
	 YUIpuQl7y5nED/8FauexKZHbOmA1c1SCb3k59OAHx7KSMbarjD+25ZHlgmiQrL0WXZ
	 oo7ZjmXhboofKHnW0F/R2mGaheFm6nRbQ0H6Jg1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 386BCF89670;
	Thu, 23 May 2019 15:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1636F89674; Thu, 23 May 2019 15:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FDA4F89625
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 15:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FDA4F89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lw7G/4Rr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSnzH8gIbU9tJo6la2gamT3PIFGOBGMMJHt4i5H7kKg=; b=lw7G/4RrH9Bm3DNiQrsfJaqQe
 WKKv/vODnOA81N7DCMb7ceVMt8TQQRWXaUgPnbWJJZFLUaBwQMA0ZfqYDpZWTLh+EeH/NQaVUhn8A
 XpGQal/q4oCNwN67wjZz8c7ROPNr+jWnTZGBbk6QZXYgFNulj2mcg4ytF/WYo4/m86N8s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTnbU-0000By-Ks; Thu, 23 May 2019 13:17:52 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 27CAA1126D24; Thu, 23 May 2019 14:17:52 +0100 (BST)
Date: Thu, 23 May 2019 14:17:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190523131752.GE17245@sirena.org.uk>
References: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
 <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
X-Cookie: I brake for chezlogs!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] Applied "ASoC: simple-card: Fix configuration of
 DAI format" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============6553809291604183197=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6553809291604183197==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Content-Disposition: inline


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 09:54:25AM +0100, Jon Hunter wrote:

> Please can you drop this patch?

> Per some offline review with Morimoto-san, it turns out that the actual
> issue resided in my DT (which was incorrect) and not the simple-card
> machine driver.

Sure, can you send a patch doing a revert with a commit log explaining
why please?

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmnX8ACgkQJNaLcl1U
h9DyeAf/aqaSRpEHFdpE0yh4ivOxtAiWHU4BGbL0CGJ3CqeO3BzuYJQHxDNAgNWe
6+jnVf+RcMVwAFOJ3E4fqt6rYsQ+qIf/aHRGKmUX++TapvVWGnYCMZ6QK3FugGdp
9YAdt2Go05f+SuPe8xCpgnh2NZubzLRmKycDBbW9xc9C7OOgi+2BxXpdyL7Z66bH
cYsJ/OdsgDBVnrl2wT4xVMfS6C4x93ym2m4BZEls7E9tyV3E4niW/wMcTlC3I2gd
SvunVwfZf/3SagJYwJpOBl2zFX/Mi27G+b0O3uCXpidWAZag2CgDPtB2CoAH7/XH
r9LWxEXv8rzMATbdPAIp9UFP+BE4JA==
=jm60
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--

--===============6553809291604183197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6553809291604183197==--
