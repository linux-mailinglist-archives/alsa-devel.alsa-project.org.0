Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5A3A2B86
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 14:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44393179A;
	Thu, 10 Jun 2021 14:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44393179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623328054;
	bh=SMCTCfVGYyElEle+nuusCDs4AKD20x5AWJSG/78ZM3Q=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dn24VWaeV5fxTPcPO0suRrwIkPxDkw18eW4TPD9CYTbAKOB94aYJ/ytAHLruGNQHE
	 N6ueeNxSrtce97955xNj9PwaqaQvuNUTXGHU2apO5NkpAbo/SKzhzaBl6V8mF4nBG+
	 JwaUhxqxUaMQEscJ0rL4Qtkm8xdoK78xSzcH0RjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA32F800FC;
	Thu, 10 Jun 2021 14:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8EC5F80218; Thu, 10 Jun 2021 14:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F20FEF800FC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 14:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F20FEF800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="hufp3yt3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EyB9o7Ds"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0A5342396;
 Thu, 10 Jun 2021 08:25:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Jun 2021 08:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=uHio+4NIJ30iZUQOLrOe+MHQN4Sn7Af3MGSexW5w2ps=; b=hufp3yt3
 de8jPWnUZ25P43F3IykGVCi9XgBRZS2x61/71w0pFKMTJcMO9ON3msRCEh0LlLlk
 xzXKCq7kSJFW4u9exfsmgaKua4Unr+zP39zxv+5aN3DN/hpGBwYvK7xJubVwaO1D
 qCROwhzBqOP4vnH9WzkDdiSPuBLR9NuIdiS8REy4SmqzFHWcgqfo7p+vhIdXHnbB
 7OvFLaTL+jPoLoZTO0RuC4IpcgYXQECwX5hkAOHLmFmRsXklHzOTtcG7ctxD8aYW
 4+AB2aLYCS4X/6mvoIoBBnzEmXtpHIbg9vpukIloTntKAtBW7fbf1TlXqcwRU9CT
 Aqu2/TPwgbwaMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=uHio+4NIJ30iZUQOLrOe+MHQN4Sn7
 Af3MGSexW5w2ps=; b=EyB9o7DsGY9CuOi1kBEWYqPdraY21EYolZfAkA8eMyGc4
 pnxEdC4PN1GJY1Pp2F9xxYvYtmt0XiHXLnEt+yRDAP8mbMMjZP/M4pQx+x9O3eQL
 YW1NnJ/qFvtn+cbSGjCk82Obh7zQXhQQ17aq6V+W2SXKp4MKlExKpsvyDpOsfdj6
 tDRky6m55vbq3Z3rDhCLrTnY70JlBGgYt7EVQh9WREZVp6/00iGm/IUFqIPqRgiZ
 OwtP8p+qaNclriRVfDo9DjuXWfA4ysZ1m1rbXQ6dZ275UgvOEAEhtqVJroZG4NyI
 anyGh7/UtOXXUj9LCCQOY92OMESfPZ4xxpqvBZhUw==
X-ME-Sender: <xms:0QTCYHrGmzKu1eaFc4iYinPp7RG4Wdq9s1MPkR7RgGu9_xFeWSoaow>
 <xme:0QTCYBo6E40GdbMHzyX_rnPeRsErqukbrrs7crs7AFsA5njwW_zOP12ZigetZ8rEe
 IqXOiYjyg1T16lfo-A>
X-ME-Received: <xmr:0QTCYENxu2qhnxUvHdq2qXJ03nC4fQj8Dthlsf2Lm56OlW9BQCl1Z1bL1l4QNkAPG-wid1xHHKE1oqdgLQMVuZiAPYKLnoef_X5p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgfdvuedtvdevvddvvddtheevvdelgefhgefhleeuvdfhheduhfehffeuhfejffeg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0QTCYK7XOKLlL5JE6wujqWuwBrCaZc4RSqt2AOhRuND-C3vPjpOJlQ>
 <xmx:0QTCYG7tpRgVTc1woTzO_GHiTUWP2BBjUBl_cnxxlyhu8nqeSQTr-g>
 <xmx:0QTCYCiIRVg0S9Rdv2tM8UUJUriwahw_c13uAetSBJZ28Si37uj61w>
 <xmx:0gTCYDy3OvQaZaL83E1A_JOFP4CBtIF_A8Llyit8jQPQGt41O7vL-3mIhEo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 08:25:52 -0400 (EDT)
Date: Thu, 10 Jun 2021 14:25:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
Subject: [GIT PULL] HDMI codec improvements, v2
Message-ID: <20210610122550.jnriewchqspdcrwk@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7tlmdj33bp5wxhna"
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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


--7tlmdj33bp5wxhna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's a PR for the changes to hdmi-codec that need to be shared between
drm-misc-next and ASoC.

This is the second iteration, fixing a bisection issue with compilation

Thanks!
Maxime


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/asoc-hdmi-codec-improvements-v2

for you to fetch changes up to 2fef64eec23a0840c97977b16dd8919afaffa876:

  ASoC: hdmi-codec: Add a prepare hook (2021-06-10 11:48:56 +0200)

----------------------------------------------------------------
Improvements to the hdmi-codec driver and ALSA infrastructure around it
to support the HDMI Channel Mapping and IEC958 controls

----------------------------------------------------------------
Maxime Ripard (5):
      ALSA: doc: Clarify IEC958 controls iface
      ALSA: iec958: Split status creation and fill
      ASoC: hdmi-codec: Rework to support more controls
      ASoC: hdmi-codec: Add iec958 controls
      ASoC: hdmi-codec: Add a prepare hook

 .../sound/kernel-api/writing-an-alsa-driver.rst    |  13 +-
 include/sound/hdmi-codec.h                         |  12 +-
 include/sound/pcm_iec958.h                         |   8 +
 sound/core/pcm_iec958.c                            | 176 +++++++++++++----
 sound/soc/codecs/hdmi-codec.c                      | 219 +++++++++++++++++----
 5 files changed, 337 insertions(+), 91 deletions(-)

--7tlmdj33bp5wxhna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMIEzgAKCRDj7w1vZxhR
xWTFAP9Htr7a2qyESSYy+oZKtBB+ulMs7bWhtFqZEAHtQecZpgD/R7HTX4nAch5g
lwYonMvzPyUzYI2ah5Wvcqkp6B51fgg=
=6y7C
-----END PGP SIGNATURE-----

--7tlmdj33bp5wxhna--
