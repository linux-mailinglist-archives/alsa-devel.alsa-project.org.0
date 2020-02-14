Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BB15D78A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 13:39:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028131676;
	Fri, 14 Feb 2020 13:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028131676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581683996;
	bh=ZIP+T0JRcXtgWdJXzujPrPHXGZ3VhAJV/LupnQJ/aMM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kb/HApJxAJ8J0aBHh6N6ZLlBBxKeF9DjPa3r3SYk1dhG1If61WQd09/lPE0txJ+kx
	 FxX3AWOa5hmnz/vUefaEZUJV57Xd7hOwM8YJbSs3+57fAqB9ZmI7pBH0IAdAN8GCOU
	 ++RFdkn05TaM/++PtL3psnePPG9Nu0Fbn+wQff+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B0CF80138;
	Fri, 14 Feb 2020 13:38:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39316F8014F; Fri, 14 Feb 2020 13:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6A378F800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 13:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A378F800F0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E8F31FB;
 Fri, 14 Feb 2020 04:38:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D78C73F68F;
 Fri, 14 Feb 2020 04:38:04 -0800 (PST)
Date: Fri, 14 Feb 2020 12:38:03 +0000
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Message-ID: <20200214123803.GG4827@sirena.org.uk>
References: <1581666814-6380-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
In-Reply-To: <1581666814-6380-1-git-send-email-derek.fang@realtek.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 shumingf@realtek.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: rt5682: Add CCF usage for
	providing I2S clks
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
Content-Type: multipart/mixed; boundary="===============3245149428471417017=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3245149428471417017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zrag5V6pnZGjLKiw"
Content-Disposition: inline


--Zrag5V6pnZGjLKiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 03:53:33PM +0800, derek.fang@realtek.com wrote:

> +	parent_clk = clk_get_parent(hw->clk);
> +	if (!parent_clk)
> +		dev_warn(component->dev,
> +			"Parent mclk of wclk not acquired in driver. Please ensure mclk was provided as %d Hz.\n",
> +			CLK_PLL2_FIN);
> +
> +	if (parent_rate != CLK_PLL2_FIN)
> +		dev_warn(component->dev, "clk %s only support %d Hz input\n",
> +			clk_name, CLK_PLL2_FIN);
> +
> +	if (rate != CLK_48) {
> +		dev_warn(component->dev, "clk %s only support %d Hz output\n",
> +			clk_name, CLK_48);
> +		rate = CLK_48;
> +	}

Are these genuine restrictions of the hardware or is this just being
hard coded in the driver?

--Zrag5V6pnZGjLKiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5GlKoACgkQJNaLcl1U
h9C3ZQf+NUZ+gWsQ5TXSiXPLU3X/CzGdO+TjlqVPFmgQrgCqLvfffdnKDQrgf01J
vs2M8gX8vGp0Xo/6MGNPL0YqkOmcEVbK1u/knjpEFlr1orjs4dUqAHqFRHihEUYl
jdbFm9KYtTOPMhbrFdrsuwTBcpeVg2s43JNPFpPkfLe8dHc+1+af11xaEdpy7TeS
Si2ZMQwZi9QygE5l+bva7xoanjUxI48kq6s6igXKuX7OCGdy6Ed/ZlIpkzKSlsPV
RQ2h7xA8j1UQ3dwrReJUs+yvjEpsjnHRHaz06Ix3+L37KRPtdzj+FH1CgfgWy4PC
N99f8Ez89mok7DXIZ5DEB4mc9ctrcg==
=RJR3
-----END PGP SIGNATURE-----

--Zrag5V6pnZGjLKiw--

--===============3245149428471417017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3245149428471417017==--
