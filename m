Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1598184F12
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 19:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645351865;
	Fri, 13 Mar 2020 19:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645351865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584125870;
	bh=UlTaerllM47iYcjXS8C5PL2oou6TgOmYUpkeKI2kt/w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1aOUN4ZXlBjbJBE1Px1PfF3d52Oh7bwNulv44VU2LvpNWwQwVBSxc79bh19Vs7cS
	 APzSzgjNRT1y+FHB8Cr4Pmli6CDcrOji93H1bP/4dqV0XsVbjS7s8qS6fAw151ZrT4
	 4/ByBWU1THg0FALQl8gpUDwn/uTsM+XXvJ6tysnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC01F80086;
	Fri, 13 Mar 2020 19:56:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E219AF801A3; Fri, 13 Mar 2020 19:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EECC6F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 19:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EECC6F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E2D431B;
 Fri, 13 Mar 2020 11:55:57 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 967893F534;
 Fri, 13 Mar 2020 11:55:56 -0700 (PDT)
Date: Fri, 13 Mar 2020 18:55:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: google,cros-ec-codec: Fix dtc
 warnings in example
Message-ID: <20200313185555.GM5528@sirena.org.uk>
References: <20200313180543.20497-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline
In-Reply-To: <20200313180543.20497-1-robh@kernel.org>
X-Cookie: This page intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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


--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2020 at 01:05:43PM -0500, Rob Herring wrote:
> Extra dtc warnings (roughly what W=1 enables) are now enabled by default
> when building the binding examples. These were fixed treewide in
> 5.6-rc5, but the newly added google,cros-ec-codec schema adds some new
> warnings:

v1 got applied, could you send an incremental diff please?

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5r1zoACgkQJNaLcl1U
h9A9xQf8D4qo5BE4kR0B6Xezo7p/pdK91FrKE6y5FfQTFK+hVGgN3ysMlWcUxwsR
hB1NLaFz/0f4w9iHu+vqbd3kZVt6WleRvq/MLJEVI+JHQEIKLfr+XGch+30iPwM7
lKwLR6O4N0XXDzXAQfXtsM/mP2NQo5iyEtlXIVAn7FI04zuzIuYu+TvU8XxhWn1P
OTg9c/D0/5P3fakLSPHFFVRTRnNBqgVrI+zh4P+Be4JNjRniOnUBLooa5hu0pWWE
+FyalDVC07RI/LTubgW+S2fkxk5HVjNIgrgOwYkd9sCFvshCO+3D/J8bYRnnRNub
Uxrn3/ec7Vd/yXBu2B0gpAQyqI8K5Q==
=pQ/m
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--
