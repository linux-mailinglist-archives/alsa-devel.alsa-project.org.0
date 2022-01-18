Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E9492C39
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 18:23:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353D42BD9;
	Tue, 18 Jan 2022 18:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353D42BD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642526628;
	bh=nprtLpXrRfvglwbXoOGOQ6/KtgrFZDOqeMJxXlz0s0A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FHqrE30JAG5JfeA6z1y6yJb+9ji4+BjVq9vFFmaVQj26pKBEZPcyu6AaYNBDltiiB
	 B8fcOhSev/Q1cscffd7Xvf35/RF8Q8fo0/EnT7TOSFgW3ytcj5V7akMsR3gNWbAA6p
	 ErP6yHXG+CLhX8fP8dqzyNWa927rGt91XMYiK7SY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A486FF80240;
	Tue, 18 Jan 2022 18:22:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9B06F800D8; Tue, 18 Jan 2022 18:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4930F800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4930F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TK4R4ujo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF02A60EF9;
 Tue, 18 Jan 2022 17:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824F7C340E0;
 Tue, 18 Jan 2022 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642526556;
 bh=nprtLpXrRfvglwbXoOGOQ6/KtgrFZDOqeMJxXlz0s0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TK4R4ujoiynCj4SK6WpD8pNaaMAAg1E7afe4kJAjp/SwXXskZVB7P7pfm42MyyhU5
 zIR+LqYy9RKz7cG08fXze2SfdT9cnp9J2oz2wPB9mCyUUg7L7QCaPn//bArAzOupZ1
 OLCNvKWWAJg3oRcBLCSgxFBP9D4uGmY8SNKv0aGbNen/jPdgpWVoHUe5ETbT3IHm7P
 SHe4/F0ZYGmohxfI7SiUlH/oSQDAnnz+tuvYj7uVFwBYtOxUqiSgwtUbgnryk+P/ct
 9FUdHcNrkvGhrezFy1ZTRL7bOQ5eF7jhOQA90iMfVUwGWu7kTRNDmszkU+QVa/L+R8
 4oAq7e+qRmxFw==
Date: Tue, 18 Jan 2022 17:22:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: tlv320aic31xx: Define PLL clock inputs
Message-ID: <Yeb3VVmrUDIYw3AK@sirena.org.uk>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
 <20220117132109.283365-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tabkMTr0FaHh+1SV"
Content-Disposition: inline
In-Reply-To: <20220117132109.283365-3-ariel.dalessandro@collabora.com>
X-Cookie: Do YOU have redeeming social value?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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


--tabkMTr0FaHh+1SV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2022 at 10:21:06AM -0300, Ariel D'Alessandro wrote:
> Add constants for the different PLL clock inputs in tlv320aic31xx.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--tabkMTr0FaHh+1SV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm91QACgkQJNaLcl1U
h9Culwf/RPr3IjTPjy4XtWKgvBrp1Pai0Yj0+dMs5dFSjw/0kFwL+B1+1VUoq3vI
h4UkHtRogVAXjQ+ciJgSGz6NRlSjg6rJbuZ3DcYse48EWDrbZj8y1MNwI4Y1AIkm
QjXhSubuj/ahL+jWDJD3R4hXmdP3HrJJehztN73R1/chIwJDmJAXg1zSgU2NBsXy
DXKQRc4meJcv8Poq9gtebfbz2prqrfbBc+GyJsPYPjMVwvC8JSJA0GYGJJG9vmj2
OvRKjjRymO4WEawTzpCydcMlPtnZjUwmPl2u/TE9JamAxFxJC5CCaeybLOOET8kp
Pww0euG+OUvlDiGuAyJ4du3StSJ5Mg==
=v5Cq
-----END PGP SIGNATURE-----

--tabkMTr0FaHh+1SV--
