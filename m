Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F898B4F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 08:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999301654;
	Thu, 22 Aug 2019 08:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999301654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566454761;
	bh=kORdtX1k2AI/2LX5ki8Pfk8BuP4+VuTrbnjjlvr+3WU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zfk8cdpXAZSRcf6Jyxn5fU1FTLxDeI2uX0QBNvlje0hftCAeZ97BcWwwKJ5EXurmb
	 /DqXVPdjn/+ch8QK5kpoDiLXnQxd0CrEFD+3IauaxH6S/6XaRaMbuKpPNVMv9TG4L2
	 oSgb+wbI8+PlMYD9sqc0yOafSmgaKWiJYPTntGpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6131F80391;
	Thu, 22 Aug 2019 08:17:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33AAEF8036E; Thu, 22 Aug 2019 08:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44E1EF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 08:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44E1EF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BcfzdWD0"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 765A92082F;
 Thu, 22 Aug 2019 06:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566454641;
 bh=QWkVZTnE7TpfYPs/BbkIMDM7h34eTIN/1qjE1rfxHwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BcfzdWD0XF0SvN09G3WsSZHnoDTZ83QxE8ZR1f16L256nUV/JVvpNPaiyzA+8OCtk
 c3zlzAvy7VGv7iaCj4ulKymKVJbvIbmf717l/WcghKB6uQeggpSclZyaOUf80zD9hs
 HAWzVixeMrx0mJ2IEtaZKFcHSAvnKY+pbEpx/VC8=
Date: Thu, 22 Aug 2019 08:17:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: codekipper@gmail.com
Message-ID: <20190822061717.yjvnnr326psa4r4c@flea>
References: <20190821162320.28653-1-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190821162320.28653-1-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-i2s: incorrect regmap for A83t
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
Content-Type: multipart/mixed; boundary="===============6542849773711835896=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6542849773711835896==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ufzyzs2ggwjbupx"
Content-Disposition: inline


--5ufzyzs2ggwjbupx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Markus,

On Wed, Aug 21, 2019 at 06:23:20PM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>

The patch is ok, but you should have a commit log here.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5ufzyzs2ggwjbupx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV4zbQAKCRDj7w1vZxhR
xfPfAP4zvSBPA7HpdlMc4iMU5KhOSpimaoOr1DymhZ0Xnazn6AD/aHTHKG9yy3Ej
6/fLGUWkpxamiWdf2Mz7J6d0XQjJuww=
=CDu6
-----END PGP SIGNATURE-----

--5ufzyzs2ggwjbupx--

--===============6542849773711835896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6542849773711835896==--
