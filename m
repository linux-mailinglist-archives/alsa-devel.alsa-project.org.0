Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FA2033A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 12:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6896416C6;
	Thu, 16 May 2019 12:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6896416C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558001615;
	bh=haMofYDQsTRPii5Gcwfq26QxmL5qtfGzMcfmAOxzegw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WE4cU2dH7E/ySwcTFsb8LIa0Iwe+tpDuey0Xj/HIS2068OZvylt3QKZHKHApwIPU7
	 mmjElnITtag2ct9KLKAoLM/qhfMGlaZkUE0EE28frjA4zATSBFd6K8P4AjbUiaf+HR
	 OwmbQ/qKgbBUr5IlygPa+YWhSVq0bYURqoDVOQWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA80F896B6;
	Thu, 16 May 2019 12:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA996F896B6; Thu, 16 May 2019 12:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B4C8F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 12:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B4C8F80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GNk6DCqF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IzKP9HLNlXee2M6iLMR2LM7xnjvarDZVD2/6gMH+Tcg=; b=GNk6DCqF9bgIUJZ/MEMc9fegQ
 35Vx2DnTyiPqsu7Y6lI7IgL1vj/3eHS+pUx+lqDfCSVJMJqWIUXs3CB/BXWkuJM3p2TA9Zf/sbg/y
 ZkklGYCeOADwzVt0vwXha0hmy0KzYr8xO0b8VC31LoqzIqnmf2E2cJXTL3Yc7JW6Xu8r0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRDMS-00061J-O3; Thu, 16 May 2019 10:11:40 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id AD4D11126D3F; Thu, 16 May 2019 11:11:36 +0100 (BST)
Date: Thu, 16 May 2019 11:11:36 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190516101136.GC5598@sirena.org.uk>
References: <95eb314ef6d47ee6581094a406516a6069278d56.1557986457.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <95eb314ef6d47ee6581094a406516a6069278d56.1557986457.git.shengjiu.wang@nxp.com>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: cs42xx8: Add reset gpio handling
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
Content-Type: multipart/mixed; boundary="===============2596954816796875517=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2596954816796875517==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 06:04:58AM +0000, S.j. Wang wrote:

> +	cs42xx8->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
> +							GPIOD_OUT_HIGH);
> +	if (IS_ERR(cs42xx8->gpiod_reset))
> +		return PTR_ERR(cs42xx8->gpiod_reset);

You also need a binding document update for this.

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdN1cACgkQJNaLcl1U
h9B77wf6Am2asgXqw+nI5Ts2nEP5jHpq8r6uTGJ7oAsVZ/DvX7MFJgwRwYwmfaiI
DcGaR6tx0sMwGjHVhLVu4mMG7vAgjkkwNMi7OArvG9hF+c9A4CLy84gQMlxwScqQ
TR562sJfuDfzwI5sA0+FSuZAg3To/WGO9X+wKcH9IASntblmxesPPuMpxwNwb89M
xVNTgRrRWSzfjWptZFCbWrRsoFv8BCov9zXx3UfDbjFMT2CQ86l88QuQs1RwHOB9
/k7pwiObaEGOngMKkg+UIRo34myrsc/RtBNpSwdXX37KpMeXjQ0nIVOIPGbjyxrl
n9xbKAC+csBlahOJM6VzPQyXiCAQmA==
=gQpf
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--

--===============2596954816796875517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2596954816796875517==--
