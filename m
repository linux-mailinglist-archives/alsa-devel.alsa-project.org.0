Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819F1F7B94
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108D8167D;
	Fri, 12 Jun 2020 18:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108D8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591979032;
	bh=iJeNYjBay9kPP4A5LTAR5DZ94856kkb6aQkDg7EUEfM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4ZvKw3xc0F4xA4b4jjA+zpgFJKdtsfpHOJqIYZzsL1MAL7lmWmZwG5yByL9k51z5
	 UCfqnlF4gK0PmmaHcSAS2xQgNl5Jf2v/psRrKm6vJ2ZnjjdcPNfQaJVuIxy11IBIzs
	 KIcy58mowYDCkWLhgtdWcgAR66zaPR+jSdAEKb+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A27F8021E;
	Fri, 12 Jun 2020 18:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2A4F80058; Fri, 12 Jun 2020 18:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5DEDF80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5DEDF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sk3O96U4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80A7B207ED;
 Fri, 12 Jun 2020 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591978923;
 bh=iJeNYjBay9kPP4A5LTAR5DZ94856kkb6aQkDg7EUEfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sk3O96U4XvJlnvDc10zG5h0qO97oovjIMj5ZHNllLE+H5pV7ownE7rCmPGrVzmnZl
 bFstBMTBUq9TZO6SypcCDjb3Jm0BbD7umz+5aUPJefTS3FIXcFl9CGtRVjOCGisyj3
 r++pZU6refOpamxe+bNDxvg1lidFT1r/BWkzpUA8=
Date: Fri, 12 Jun 2020 17:22:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/2] ASoC: tas2562: Update shutdown GPIO property
Message-ID: <20200612162200.GM5396@sirena.org.uk>
References: <20200612160603.2456-1-dmurphy@ti.com>
 <20200612160603.2456-2-dmurphy@ti.com>
 <20200612160922.GL5396@sirena.org.uk>
 <0e482167-71c2-a128-b8b4-a054557d30e9@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XbHSybK3LHOYQtWI"
Content-Disposition: inline
In-Reply-To: <0e482167-71c2-a128-b8b4-a054557d30e9@ti.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--XbHSybK3LHOYQtWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 11:18:57AM -0500, Dan Murphy wrote:
> On 6/12/20 11:09 AM, Mark Brown wrote:
> > On Fri, Jun 12, 2020 at 11:06:03AM -0500, Dan Murphy wrote:

> > > -	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shut-down-gpio",
> > > +	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown",
> > >   						      GPIOD_OUT_HIGH);

> > This also changes the name from shut-down to shutdown which will be
> > incompatible (IIRC we do try -gpio as well as -gpios).

> Yes the non-standardish name was highlighted by Rob[1].

Yes, but we released with it so it's an ABI now and we should still
support the old name.

--XbHSybK3LHOYQtWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jq6gACgkQJNaLcl1U
h9BzxQf/QiA93xBEhd9/ppWpJGvrGk7h7PnHwz0Sfj31AjXhepYvMgj4suWMGwKA
Gi3rynuB3Qgx2+7DRRDKCGvTtplJCym0LG8RFDUpHn5vxd2MVAoM1EH9dmt9K38V
8I365oLxycOvMDytNH5fy2B9W2FBCtTBvixRmiTma1qz4LkkL5AyCZBmnQ00siy2
uY/JnhaAReVRgfsD+bTnENMhfNnWMxZr7eOxSW2kVZ6Fcwi7NqRL/Sq4JcCJ0oTR
uL7P8k0/FlL2b90dEMTsnkKgkIYA6WoyRWFhInHHAi6fvARLTCqRnvD6YA0d07H/
sWYx88BFU626JK4hLyFMJOCZA+d7gw==
=pT/J
-----END PGP SIGNATURE-----

--XbHSybK3LHOYQtWI--
