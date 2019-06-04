Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022BF34095
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D89516AF;
	Tue,  4 Jun 2019 09:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D89516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559634295;
	bh=gmsi6FJUj0PIyFxB9geInw5AP4kcxyzEKvGGwE/hECk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C8YVe4X90q94K/7OsmzyRhtE6Dgc4YxbsKCoPyvXZjVU2A+AQQ5HgiJDgoUhHSaTe
	 AwpxaBS7CkxmC/gEM3zT0/Pq/QOtTsRIlifq0vknv/tU/+LEdiqrZg45O37KfRWg0G
	 uwz3O821jyMU96V9v2+TNBFGPpLhfb7WGhPe5MQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05EB2F896FE;
	Tue,  4 Jun 2019 09:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A0E6F896F7; Tue,  4 Jun 2019 09:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DD02F896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DD02F896CE
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5D1EF20007;
 Tue,  4 Jun 2019 07:43:02 +0000 (UTC)
Date: Tue, 4 Jun 2019 09:43:01 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190604074301.p27e5towgehmraoy@flea>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-4-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190603174735.21002-4-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 3/9] ASoC: sun4i-i2s: Add regmap field
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
Content-Type: multipart/mixed; boundary="===============4300984769156885538=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4300984769156885538==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4iu232naw3x4dexg"
Content-Disposition: inline


--4iu232naw3x4dexg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2019 at 07:47:29PM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> On the newer SoCs this is set by default to transfer a 0 after

Which SoCs?

> each sample in each slot. However the platform that this driver

Which platform?

> was developed on had the default setting where it padded the audio
> gain with zeros. This isn't a problem whilst we have only support
> for 16bit audio but with larger sample resolution rates in the
> pipeline then it should be fixed to also pad. Without this the audio
> gets distorted.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>

Once the commit log fixed,
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4iu232naw3x4dexg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPYhBQAKCRDj7w1vZxhR
xcVmAQDSGaycvO/U1wpX1Ai6mvSxxamMb37KG7EScFKOC3oa5gEAzJ68Gg6XPP/O
EBu14S2afGHTqLHHKTGeLzVHp5ZKHwU=
=1Yj6
-----END PGP SIGNATURE-----

--4iu232naw3x4dexg--

--===============4300984769156885538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4300984769156885538==--
