Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884CE8D1DA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1B21674;
	Wed, 14 Aug 2019 13:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1B21674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565781229;
	bh=5S3r92PL2r4/uuCEK1YaxiBz0uTctN9Z7DAjzK8v4N0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fssVY8ITK7ajAJb7Q2EO1EWiuMciYtx9qbUcof8ieS+rnXjTFAw2ufr5jFKT9DaG3
	 kEGykfimvtIqQrfxPoYhBrPK0obQ1HmZ0uGnbPYDqdP4dozoEXnv78o8NZt0iGBd43
	 UC1xGBU7D03tjKlqiZKKbIvNlVxpLAFqovjScuGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE83F80600;
	Wed, 14 Aug 2019 13:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 824ABF805AF; Wed, 14 Aug 2019 13:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303D5F805AA
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303D5F805AA
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 441D6240009;
 Wed, 14 Aug 2019 11:08:42 +0000 (UTC)
Date: Wed, 14 Aug 2019 09:20:46 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: codekipper@gmail.com
Message-ID: <20190814072046.metavychqvhuohwy@flea>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-13-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190814060854.26345-13-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 12/15] ASoC: sun4i-i2s: Add multi-lane
	functionality
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
Content-Type: multipart/mixed; boundary="===============1418185225911803792=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1418185225911803792==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qyuby3czmo42ymqj"
Content-Disposition: inline


--qyuby3czmo42ymqj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 08:08:51AM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> The i2s block supports multi-lane i2s output however this functionality
> is only possible in earlier SoCs where the pins are exposed and for
> the i2s block used for HDMI audio on the later SoCs.
>
> To enable this functionality, an optional property has been added to
> the bindings.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>

Wasn't the plan to support only stereo for now?

Either way, that property should be documented.

Maxime
--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qyuby3czmo42ymqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVO2TgAKCRDj7w1vZxhR
xRheAQDnbjxSxOz3vnVbgOs4yo3FPOLzvk/zjkD6SLnNZwzRngD/YbHNYcIMu7s8
wIIaiLlZLD55zQWzMfEKW1PxachR/g0=
=vuZB
-----END PGP SIGNATURE-----

--qyuby3czmo42ymqj--

--===============1418185225911803792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1418185225911803792==--
