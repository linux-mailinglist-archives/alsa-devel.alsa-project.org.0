Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AE9E473
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 11:35:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5601B820;
	Tue, 27 Aug 2019 11:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5601B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566898541;
	bh=HQ6egKceo2q1K9f/oE0CIg2Wt9p5IYpjYudC2C9v34U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=juosAqlRhgJZft67yBzMRVt2MuhU6GdxTtBqr+0ZKTiuILC9yKsZrPzqPN6cZMOuR
	 Cj+3bH91hoPo6q1nABFKEjlx0GGEIRTsw1gCNd6cF4Nof3uQbEI/88ufyD1PqIiJRc
	 G7v+jQ7rYBOLPBa0XIM6kZhTfsRUV8tUJ8U0/xrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1A8F802A0;
	Tue, 27 Aug 2019 11:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F1E8F80274; Tue, 27 Aug 2019 11:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43397F80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 11:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43397F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HwKJsmjY"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55DD8217F5;
 Tue, 27 Aug 2019 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566898471;
 bh=ccm7nUqPvgOcQuTQ/JJPGjonenSfitNN8svivPYeMTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HwKJsmjYOsgBrhTnTDNEZ0KVRtYoP7/0SLNj3Ze7UGB0xbuK0zNIHNCNCjCc26MUw
 tpwE5Dhiyj2Z28Q8YtSBvgO7zVVL3uvrD3ojHixwE+ssGC0yP5LDGMr6DJpPIG3AKS
 CH1lM4k+cFEDp6OGLIVHak/oht0VNcJAbecWgyb8=
Date: Tue, 27 Aug 2019 11:34:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: codekipper@gmail.com
Message-ID: <20190827093429.fkh4cqbygxxyvkk3@flea>
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-3-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190826180734.15801-3-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v6 2/3] ASoC: sun4i-i2s: Add regmap field
 to sign extend sample
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
Content-Type: multipart/mixed; boundary="===============1010978614382541581=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1010978614382541581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akegy5smhxynsxc7"
Content-Disposition: inline


--akegy5smhxynsxc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 26, 2019 at 08:07:33PM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> On the newer SoCs such as the H3 and A64 this is set by default
> to transfer a 0 after each sample in each slot. However the A10
> and A20 SoCs that this driver was developed on had a default
> setting where it padded the audio gain with zeros.
>
> This isn't a problem whilst we have only support for 16bit audio
> but with larger sample resolution rates in the pipeline then SEXT
> bits should be cleared so that they also pad at the LSB. Without
> this the audio gets distorted.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>

If anything, I'd like to have less regmap_fields rather than more of
them. This is pretty easy to add to one of the callbacks, especially
since the field itself has been completely reworked from one
generation to the other.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--akegy5smhxynsxc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWT5JQAKCRDj7w1vZxhR
xe50AQC8TXvNs/xG05yTE5nduFlJSviusolNw2OzT+nU7+RGNQEAnLeDCfdAFcFV
+5qESFVCyahAR0NhHqHtWgxldOTPwgw=
=hUzD
-----END PGP SIGNATURE-----

--akegy5smhxynsxc7--

--===============1010978614382541581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1010978614382541581==--
