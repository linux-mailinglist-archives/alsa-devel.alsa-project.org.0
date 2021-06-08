Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E160839FA87
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 17:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8570117D2;
	Tue,  8 Jun 2021 17:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8570117D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623165926;
	bh=GFGUZWZbriaubxkWTVl1AEN5VqIdF7tGORQZqBgXF80=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KSw65sGNria8vb4USr2KST6Cdfzjgwm2gXRQ4YbW04BZOHh0qTPhiZcIh2ngc3wBq
	 oGmvvOg+S2lsxNgrR9cuw6Pnn8PysSre+oiN1NQHV4iSfvkbidO7RxXG6i9pb2DAUS
	 MKymRF1ocZZJL7s87MI8wMgA2xtJ6HKsIdHgd/T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 035EAF800FD;
	Tue,  8 Jun 2021 17:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE20F80218; Tue,  8 Jun 2021 17:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB0EAF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 17:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB0EAF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="fAtMdnhz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HiSKB7Sq"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0690A1AE3;
 Tue,  8 Jun 2021 11:23:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 08 Jun 2021 11:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=7y+uu7kjB/1PI/97u+3Bl7gH1MSy9rD9XBavvjyKxLY=; b=fAtMdnhz
 IH79WIzcvnXdYUwK56lX0yBX0x1PVBlOI5eaq402NUAbatPBsQNQ12GYr35118nk
 JirqjxKmHSB93e/l/JMYqImlSpXd1okJzd+Zq2CGPElvIUwt9B1K4gqYOtW/mpUs
 N2pHvi5G4MoT/dduYQJxcVlFASkMBdUPYsobzsVfQ9kn2YUezWzMg06kDC8A0a9r
 H2TJcsEs0khPMZjKo/YoMeNWsuIAn0bnYw+o5GAaXLRwj68qjb9pvCecYhKj07aA
 xQQs548fDT3dMKiubaV8pjU/Z8o6ESgz7UsPi+OHDFnDqvE6yOdXXAe1btsEbVIF
 1OUfMEwrCY11pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=7y+uu7kjB/1PI/97u+3Bl7gH1MSy9
 rD9XBavvjyKxLY=; b=HiSKB7SqJr7JN9g6FQgeesiy7qdMJQkDFTmUrqSWeIPV6
 tFneGKnf6whSoeH7C7Wc/FVlDdZQKk3DxV3jVbqOZ3R1PNswV1Mv7vE4qmLCN1pY
 QgGF9heok9m5b+qghBTHRDAgmpdVCy0O8Fn6MXItkGVETTzNeopK5f3njBUbhDuo
 D1xF4pGbAO1+cmDKup2utWIPWWa6J0/+JxumILrJ1ew5tC1wl+QA9TAApimtFX9Z
 vyvxDMBf8VMASKFkIewxUkhXNhLRTmL+raTmntdW0BAm4xv1FruuRplR2lX5D+Bm
 KgFtIEJxgdBVu6HwDwONi8X67leyq0UUwz5W+Ly8g==
X-ME-Sender: <xms:eou_YN6I9-LYANK9Qju6gN6erksi8ZytCyk5pk_Z8LaW3LnmQQD3AQ>
 <xme:eou_YK7W-gC6jaHeFnzCcuy2uTQhw99Kq2FJ-PFH8z8Oo7rgijv1TesSJaek9j59c
 D-kDXXr8sHzM32zHpc>
X-ME-Received: <xmr:eou_YEcUdotV86-P3tmQ-rvCRkjQMovnR0C6TjjYcsQ4MD7Fg2afxSGwQ_nFfRz4fTtomnpiD9tI3DnZ01iwHT7Dx7cdO6CpYAf8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgfdvuedtvdevvddvvddtheevvdelgefhgefhleeuvdfhheduhfehffeuhfejffeg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eou_YGLY1f83SCSMoncIj1dUr904TFcz3RPtjUy9A0fkau0fkdTuKA>
 <xmx:eou_YBLyEMEFnykEOArFE01s_eBZi33Iqq7qaZihva4zMJ4Zhp755Q>
 <xmx:eou_YPzZMbNRVw_98DuEbJLSOITBUkfYec1SWIIvpZWg8vm_QClbDw>
 <xmx:fYu_YOAswCdz633QlnOCAuovSDIa5uNZSmrKkpQo6URrSfjpqTEIqJaPeVk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 11:23:38 -0400 (EDT)
Date: Tue, 8 Jun 2021 17:23:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HDMI codec improvements
Message-ID: <20210608152336.3shidfqym2pgmj7p@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fwxzgs5ela337bru"
Content-Disposition: inline
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


--fwxzgs5ela337bru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's a PR for the changes to hdmi-codec that need to be shared between
drm and ASoC.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/asoc-hdmi-codec-improvements

for you to fetch changes up to aee87e9c8fc0efbe933f0a8371990a0754ac65fd:

  ASoC: hdmi-codec: Add a prepare hook (2021-06-08 17:06:00 +0200)

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

--fwxzgs5ela337bru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL+LeAAKCRDj7w1vZxhR
xbqGAPsFnhFdpchvC16PX4Op2mccZlmHaLb/MDY8uwfEmI5eEwD+I6yA2y5j/xCD
j6KX6j/zPQw8pWbM7NQf1k11KS2I4wo=
=9+IQ
-----END PGP SIGNATURE-----

--fwxzgs5ela337bru--
