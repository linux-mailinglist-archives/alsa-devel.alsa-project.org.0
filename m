Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FD391528
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 12:40:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499931771;
	Wed, 26 May 2021 12:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499931771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622025601;
	bh=ZZ29t9rWQM4OHKScJo66H518G9wk4b5EkUEydCzI4Y8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qLetdPOxQc6nvSNtjLBhXGKfE1AZ7fH2Setg1ca/QX4KprY8ili7uK+fTDAzPgSaE
	 NLSO26lDijl4pTB6B1IeerIcX9KgzrSTNR0efiJ9JWIH5RXnhq3FrlcFWLO9n+GAoU
	 QKNo3R57RqxFqpEr1FOaujFViJ3JxIBsJzUbHhYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A1C4F80301;
	Wed, 26 May 2021 12:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47034F80300; Wed, 26 May 2021 12:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3140EF80274
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 12:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3140EF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="P1lTnzGR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZ29t9rWQM4OHKScJo66H518G9wk4b5EkUEydCzI4Y8=; b=P1lTnzGRnD6xJwViIxs2la/hmZ
 aLW8qo6s0YSEySGWYLrL9g/N7VCscyCT9z2V8VztvKYpidgHTEP9P7AA1hG2wBJZkbalafJod5ino
 R5WUr/PCJdJHYLWghQcE7V6KxGS5EUjbOc1/X1oVS9wSR4TvP1JwrxcbwLEAEDqcMDOM=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqvh-005xmI-5B; Wed, 26 May 2021 10:38:25 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id F01C7D05865; Wed, 26 May 2021 11:38:59 +0100 (BST)
Date: Wed, 26 May 2021 11:38:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 04/12] ASoC: hdmi-codec: Add iec958 controls
Message-ID: <YK4lQ1WJ+bBAwnDz@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VHjauBDPfRurBChP"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-5-maxime@cerno.tech>
X-Cookie: Ahead warp factor one, Mr. Sulu.
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-doc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--VHjauBDPfRurBChP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 03:23:46PM +0200, Maxime Ripard wrote:
> The IEC958 status bits can be exposed and modified by the userspace
> through dedicated ALSA controls.

Acked-by: Mark Brown <broonie@kernel.org>

--VHjauBDPfRurBChP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJUMACgkQJNaLcl1U
h9BbiAf9FlorXmTGbHpwvZBlli/cOILFyMcqSLtmFjeQQEQ/Hw/zi+ovr1CDHxx7
GGjEpFOC3ThNwPXOMCPBcJ9KI7dkJL5rk+Hb4nChrNno8iZLrEy9O73H5iATxn5o
HTnqWXd2c9DDAFeNnYPkXrqH4jntmdlprTBBwHaCfX216S7uK1+3y+wGGN2ssCoq
Icvel1+KQ/o9MdMhs9cuDRw6e3GYNVqEK82wOLfKL6AstDOmVt6IJ+PvOG/h4NSD
mRSQ/XDsW/iXataTHhEjyihRhDEjSQ9MXd7gCtKitVBetbKUhO6EDY/hY7aV3J1i
OpnoP0ODzC13oVmNXUGkksNvsjhFgw==
=vtry
-----END PGP SIGNATURE-----

--VHjauBDPfRurBChP--
