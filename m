Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF644AFF2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 16:01:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA141655;
	Tue,  9 Nov 2021 16:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA141655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636470082;
	bh=dWKdK73IMyUlKNgSZ++V+JORAEH3nUi3kyZlKRW+Qnw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VW5qoUd2PQH/5EJrAsR2BTwmDeNO3M47+c+0FFHUZT1+YvSSZ6q9oHENXcU24s5I1
	 iMytBoFJmKugsLIPM6Nf2tO2DxBKou/r8z3ayuVk4U69zb3Wu6cmea4sHchjIzD0ID
	 of81X/ZlCGOUtAeisWGqhfKu5K/hwGzghe//BXVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56965F80224;
	Tue,  9 Nov 2021 16:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1B20F802D2; Tue,  9 Nov 2021 16:00:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A40F801D8
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 15:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A40F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jJ+coPXC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69F5560F6E;
 Tue,  9 Nov 2021 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636469992;
 bh=dWKdK73IMyUlKNgSZ++V+JORAEH3nUi3kyZlKRW+Qnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJ+coPXCLbzyS8S7CZVjaRZs6fcKILsvBJ0wqUzxgy60v12Hrc3E1dnSl8oxZHohk
 iD1XpPzGN1EIdSaY3iPLrqrGECSW2+9dAMVUoo5USrwktGOVMwYsaOow20fMboIwKG
 0eFL/kabqGVwZvmpbQg0Y4QD16TG15IQDAlJmHKYO8O7Rb33ppSRON0UKPD8cfIL0n
 Jk11jlG9L22JN5yHKKFk3YvZcWL7lI7bjDGWsfS5FrNOYsXT64yIjwZXFyXGfqsOi/
 vebhJsWm/BCA5/+VsWi5nCUcfoh04t+Wsq77LCaEz0XjuhclP4cQs97ngGCeFRbQ/N
 PSHSf5000HTFA==
Date: Tue, 9 Nov 2021 14:59:47 +0000
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: sound: wlf,wm8903: Convert txt bindings
 to yaml
Message-ID: <YYqM48HTtoz0XeR9@sirena.org.uk>
References: <20211028124639.38420-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xGLz+eQnaXl9JzSJ"
Content-Disposition: inline
In-Reply-To: <20211028124639.38420-1-david@ixit.cz>
X-Cookie: Elevators smell different to midgets.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 - <patches@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~okias/devicetree@lists.sr.ht
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


--xGLz+eQnaXl9JzSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 28, 2021 at 02:46:38PM +0200, David Heidelberg wrote:
> Convert the Wolfson WM8903 Ultra-Low Power Stereo CODEC Device Tree
> binding documentation to json-schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--xGLz+eQnaXl9JzSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGKjOIACgkQJNaLcl1U
h9A9/gf9GFEmiu9kGC1QseVVmf0pGCj+z4nAP/giOgiIeD3dlFfdJjOu68/djoRO
pr8bKXnnEk1Dni8yYOk/E44HS8oINhAyxyH4/o2QktLeydfkXZHrFQH8H8Xen2ry
doYd1Y8GBaWd92niZTkkB3srdBXW7ASvaalP35UfMdwclQAsiwRp1wrN/8nyEXLe
g1XTkPeV6YLvopI97p0kgMepcwaMBv1kyn4O6ZTZZER3tgQwBz8VBm5/s5Gxvd96
f8jOKdh00qYyLANI1mNp/2WRNnw/AgHLom2flRap6+y37zp7N+cFAFQtpn/V40C1
UtDArKO5n+/iw9HMFNejXZ0X9+9PiQ==
=ll7b
-----END PGP SIGNATURE-----

--xGLz+eQnaXl9JzSJ--
