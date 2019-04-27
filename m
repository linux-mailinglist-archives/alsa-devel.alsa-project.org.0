Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B13FB416
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 19:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC56D85F;
	Sat, 27 Apr 2019 19:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC56D85F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556385719;
	bh=NN7xGso7FyKMAJ+5Av1ffu5K/6/rXYct3bbyvx6SD8s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXjEKapnYc4S4cgdCqDMLu+uocDYnniaAHgHHMFp2+u9n0viw9P50SLMpUobVulwp
	 SRP45LESGOadwwVnpCXChK05kU69EmlSyXw5VY/Sq9vx8yJl4uFKC9vqqwJu9xR8Mh
	 +tlJMe1hiEVTq/TDyMVuKJs6riYELuOxlEnvk/3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC73DF896EE;
	Sat, 27 Apr 2019 19:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFE1F896DB; Sat, 27 Apr 2019 19:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E34B1F8068A
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 19:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34B1F8068A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HhlKpnRo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cUFd9bBqyIjSpu2JKklR45l5xgM+O1Ph3GrnzX9A+Hs=; b=HhlKpnRorrYhQKhKHMcM8UqRt
 e5SnXivzM/nMrJF/15t7wGHt43oe3Xd+9aoNRk1MPbBFttn6lJ/Ac74as8RrkaGufMpv74VP0klZ1
 cR15IfjdqQxoZqWopcZPoQOu+XM0b6VKubm4WJJyvHR4DFQ2UsBVHl+QC/zIgTwFZykyk=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKQzY-0004bi-I9; Sat, 27 Apr 2019 17:20:00 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 2A564441D3B; Sat, 27 Apr 2019 18:19:55 +0100 (BST)
Date: Sun, 28 Apr 2019 02:19:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20190427171955.GH14916@sirena.org.uk>
References: <20190426125925.04F3F3FB4A@swsrvapps-01.diasemi.com>
MIME-Version: 1.0
In-Reply-To: <20190426125925.04F3F3FB4A@swsrvapps-01.diasemi.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Akshu Agrawal <Akshu.Agrawal@amd.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: Use clk_round_rate to handle
 enabled bclk/wclk case
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
Content-Type: multipart/mixed; boundary="===============1538478834783060717=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1538478834783060717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2019 at 01:59:24PM +0100, Adam Thomson wrote:

> +		/*
> +		 * Rounding the rate here avoids failure trying to set a new
> +		 * rate on an already enabled wclk. In that instance this will
> +		 * just set the same rate as is currently in use, and so should
> +		 * continue without problem.
> +		 */
> +		sr = clk_round_rate(wclk, sr);
>  		ret = clk_set_rate(wclk, sr);
>  		if (ret) {
>  			dev_err(component->dev,

Don't we need to validate that the rounded rate is actually viable for
the parameters we're trying to set here?  If there's missing constraints
causing something to try to do something unsupportable then we should
return an error rather than silently accept.

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEjzoACgkQJNaLcl1U
h9ALMQf+PNlF6FLSTdYpAXPOqsdtjPPZj8JtUbmOAWcn9I/uWpH1kt8CRbciXAzW
GkU6ykRQUDErfkyZzMEE//9l+OZ//LHMAJjq53SRUIMj21RCMc81bH4d5OGD5zms
2N+cAZUBqUN6xOPfQdaGTWpFoXgIjZ13lDiNnM0Jw5RkV+3CVWMPNJlnOWX8jdog
S1gdGvRGyZn0wZ8iqsTISJ+phqtlFxgsNLM5DXPs5o/4RdjhHRW1u+L4BtOz1f8H
Mso/GrYbrgPSvn/9vah4vbkkHrwAbuy68dejwyEQtAFU80BZj0sG3K4TrjBiivn5
Rlm43XIswMUKG8rx1G6jxRVYWs2y6A==
=65do
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--

--===============1538478834783060717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1538478834783060717==--
