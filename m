Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26F391523
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 12:39:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74D88174D;
	Wed, 26 May 2021 12:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74D88174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622025583;
	bh=ApStfRDU0a2Bcxs0DU/lRdHOKyM7PDXIMldhjFKUC1g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c65NmvWYo2W7jBauZs/GtXdXIYb7WI+L+q8pPjhDeaxF+7+KTZv+2ZpNYAkZ75qV9
	 Ypfau5qoneRDqzitV3fgZC5xlP6d3t33xxdX6pLZxCkFxYC1agtC326QdicvtzbFwu
	 iaYhumb33+cTSo6sv0I43Z4D1Bg+ISXk8LIoqPBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBABEF8011B;
	Wed, 26 May 2021 12:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292AAF8025C; Wed, 26 May 2021 12:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30B81F80212
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 12:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30B81F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JzBt+Vx/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ApStfRDU0a2Bcxs0DU/lRdHOKyM7PDXIMldhjFKUC1g=; b=JzBt+Vx/khdrcQKa/bcrJCd6Zx
 fy2Ur+KbJUCQu1V1LvcbfXGMIpq0u2XGgTsHwqL30rHarLjr6Xz6zVL1S9wsQnQ6PHVGSK2FIujAL
 TKSE7rn7w5l1aH2jN1YNF5v2xXXSAyKpOYiIC3Jx24xd/ETeQhNWS7t3T/uOUNTrTawc=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqvN-005xlj-Gk; Wed, 26 May 2021 10:38:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 93E77D05836; Wed, 26 May 2021 11:38:40 +0100 (BST)
Date: Wed, 26 May 2021 11:38:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 03/12] ASoC: hdmi-codec: Rework to support more controls
Message-ID: <YK4lMLG6PlxzDJhs@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eIFZBnIxpSROlH5X"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-4-maxime@cerno.tech>
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


--eIFZBnIxpSROlH5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 03:23:45PM +0200, Maxime Ripard wrote:
> We're going to add more controls to support the IEC958 output, so let's
> rework the control registration a bit to support more of them.

Acked-by: Mark Brown <broonie@kernel.org>

--eIFZBnIxpSROlH5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJS8ACgkQJNaLcl1U
h9ABYQf/acYuDAkB3WhiZ1hCCQpVdonll1Aj3jSnr5WtK5yitGmh8cYms3T5uWUE
XmT9B52fCJh6IAHjAm9XZbBWm49ShM/pgA00Q6otZDb8zVSS6v39HIFvnRDDsRNx
ASGbUOdr4Z/1kPc4n8UDKlq45Dz8985Rtfoh5QknQEeD5P0zvNViwWcfjmVZ2UQ+
qJk9oC/WJIxhR6PyY8x0XbI4plfCO4WvEG9dEdKE4navagTtBVa5e9RxF1wyXK9r
dDaL9bRcRigdba+/DRBjrDrJEDQM5GUe9yT+znvJzcqmkPYt9q2qe6Wen6UxjKrf
seBlUHvVi2p9QEVe3haqTNcmB5vqzQ==
=RH7S
-----END PGP SIGNATURE-----

--eIFZBnIxpSROlH5X--
