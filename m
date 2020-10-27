Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54129BAEB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 17:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB9E1682;
	Tue, 27 Oct 2020 17:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB9E1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603816122;
	bh=kM+q5a/4CSozUbBt556ksVRBHVXOCmkxyQA/MctuzVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBuq9nipdMrKvqUi0lXcUvZtoKfp6+fcD5aqglG0+ujDnlEbwfeWc7CwoiawfHCU5
	 E4zUJFAASt5JIJXYE9PbL6pNGmUgUw6+yKiR0/IXDAvEMVqlD/P1QOhWwjHmpGnk1W
	 nffX5NKFWXwyOOkabnp/zW8lZyLHCxnaONP22KxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E7B3F80217;
	Tue, 27 Oct 2020 17:27:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D095F8020D; Tue, 27 Oct 2020 17:27:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F67F800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 17:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F67F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J0pkkZf0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 385F121655;
 Tue, 27 Oct 2020 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603816020;
 bh=kM+q5a/4CSozUbBt556ksVRBHVXOCmkxyQA/MctuzVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J0pkkZf0nkd5hT9kQnPgSGqY293gEZG5Qc5BHBXrcbnsjmpn7NKuFW75bGu28c4a/
 EeqnOK5o8KAPYd5pBFQmUXT4YcTrGa19RXW64meYpoXNSnooTYR5sgm17RtcwuREzK
 bdrStVPco0ZHfBJlJZTfCPNBx1yXpBkD0ZP8f7/o=
Date: Tue, 27 Oct 2020 16:26:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: hdmi: Avoid sleeping in atomic context
Message-ID: <20201027162655.GB4895@sirena.org.uk>
References: <20201027101558.427256-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
In-Reply-To: <20201027101558.427256-1-maxime@cerno.tech>
X-Cookie: That's no moon...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
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


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 11:15:58AM +0100, Maxime Ripard wrote:
> When running the trigger hook, ALSA by default will take a spinlock, and
> thus will run the trigger hook in atomic context.

Reviewed-by: Mark Brown <broonie@kernel.org>

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+YSk4ACgkQJNaLcl1U
h9Cr7AgAhRoOc4Gjttyj+tM4Dayl68xyuva+089cuxgC2SZpu4kBZCMfygj42A1b
XyU1mHn4CDblQ9xUZWdn5nhjNlxwhFLswRxz/f42ZiwsKk/GmYkiPEUM8gi31jBh
VyoWXXcDVeb+sUZi6wo7Oqca3PBC6xhUsdIVUh+zAksbJ6nTPKv5H+x3JnSY+l1A
Uk8k8xz9k00PdUJ08F6yLDFgWOIpurIRfrgcoSw69XXlcc2EOn55rf5k6ahS2jox
xw4p3amLaWmdna+zkFZEgorUskjjxO5tfcZenKZMTgXqvEjYo0h0Hl1d9qYwTxM0
P6XTxa6tghfpUovKg2IG87FZ1BZV2g==
=DS6+
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
