Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6363727E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:08:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F65C86E;
	Thu,  6 Jun 2019 13:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F65C86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559819324;
	bh=hBU/vZr4paXy353hX/4u/Dyb/GY/1qNUdE8ndnw8cdc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPCGe8fFGPZQQcMswdfMj2ZvqVu95wkgpgtwwDPOLKhC99hG41jcE1aXi8+AdK0+k
	 DrBq3uqyJGcE3+UDXD6xfGp7TQwmrOGI6bEfkFc9VnumUud/jt9XN58j1eZqJ26ge7
	 Hm34QjXmut21oii/yEnBp4aM4hjJZWOFE1oR3eso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD2C7F896FE;
	Thu,  6 Jun 2019 13:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87E2FF896F7; Thu,  6 Jun 2019 13:06:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 071E8F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 071E8F80768
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2F512E000F;
 Thu,  6 Jun 2019 11:06:47 +0000 (UTC)
Date: Thu, 6 Jun 2019 13:06:47 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Message-ID: <20190606110647.iojplb27mdo276xk@flea>
References: <20190605100801.2488-1-maxime.ripard@bootlin.com>
 <3BD9CEE4EBD5E74B98FE2D277EB60E0B38FF8117@IRSMSX104.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3BD9CEE4EBD5E74B98FE2D277EB60E0B38FF8117@IRSMSX104.ger.corp.intel.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: sun4i-i2s: Change SR and WSS
 computation
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
Content-Type: multipart/mixed; boundary="===============2561791017392879144=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2561791017392879144==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o7dxdhneu2w5lbt5"
Content-Disposition: inline


--o7dxdhneu2w5lbt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jun 05, 2019 at 04:36:28PM +0000, Rojewski, Cezary wrote:
> >+static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
> >+{
> >+	if (width < 16 || width > 24)
> >+		return -EINVAL;
> >+
> >+	if (width % 4)
> >+		return -EINVAL;
> >+
> >+	return (width - 16) / 4;
> >+}
> >+
> >+static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
> >+{
> >+	if (width < 16 || width > 32)
> >+		return -EINVAL;
> >+
> >+	if (width % 4)
> >+		return -EINVAL;
> >+
> >+	return (width - 16) / 4;
> >+}
> >+
> >+static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
> >+{
> >+	if (width % 4)
> >+		return -EINVAL;
> >+
>
> In the two above you start with boundary check before mod yet in
> this one the order is reversed.  Keeping the same order should prove
> more cohesive.

Indeed, I'll fix this.

>
> >+	if (width < 8 || width > 32)
> >+		return -EINVAL;
> >+
> >+	return (width - 8) / 4 + 1;
> >+}
> >+
>
> Other, probably less welcome suggestion is introduction of unified
> function which ones listed here would simply invoke. All of these
> "computations" differ in fact only in: min and max boundary. The +1
> for _sr_wss is negligible, you can append it on return.

It's not just about the min and max boundaries. It's also the offset
at which to start with (16 vs 8), and the offset to apply to the
result (0 vs 1).

That's 4 parameters out of 5 that are different. For something that
trivial, I don't think it's worth it to put it in common.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--o7dxdhneu2w5lbt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPjzxwAKCRDj7w1vZxhR
xU5ZAQDqFqCGgErcrAi4FdZbvdZZ+e5HA8TXh3Adj2HYz68TGAEAnsOVcPT4sWAS
/Bvn0cG01lOSXngr19W99FolGay/Lgk=
=cTma
-----END PGP SIGNATURE-----

--o7dxdhneu2w5lbt5--

--===============2561791017392879144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2561791017392879144==--
