Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B239024E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBFAE1732;
	Tue, 25 May 2021 15:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBFAE1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949137;
	bh=tJlsEoPAq62HKeO4vOlwhxHqr+17s6b/jcXLHUsALFA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dY5wFpTlwKXy2GcX5Up0k0ox5Nt2gQ0nyeicMNtppWYhagURXyJ73a2tHs2mOYBnC
	 tmFmoUEIBDol6GwmwF4yz6if32ybIMdY6YcB78ezqEK+9z4tENX/pjO6wux81TLlkE
	 rDJOlc5Hf7dJyKY8+st0+tn66h4ZU0To7S9g5ym8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE99F8026F;
	Tue, 25 May 2021 15:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A87CCF8026B; Tue, 25 May 2021 15:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA739F8019D
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA739F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="gY/l9Y4y"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iKg6Rsbg"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D0895806F5;
 Tue, 25 May 2021 09:24:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 25 May 2021 09:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=//Ua6fbgPleRns58xLPwp5jsqA
 31DFCIgTLmVQxIlOI=; b=gY/l9Y4yEV+9tfP6NhGchNf6Fddn5xxWvcbxze7GQn
 tswF59QrAZiEf2afAPXpxnnWGpf0HWliG54DtxAypGPQ5GXrBgqQfNIGzCx7PVfB
 isSb0cnYBWjHxjBP18ULuQ6p/Y5K6JSgmTtL7+s3IlmvtD9lPSVu+pzFIcCmPNoK
 TmZe7SgXPgEAqVvAmaGcLc0xc9dOUVoM1mtSjqRDuW3W4stTdrAeb9RjyKOtc0I1
 EPn35x/qODsKuUV4OCvOUwIAoQCH91YheC4s8wMKvFuED2a8/9JTCs8GBwSNm6qA
 lSaSD2gWaK2mSomItDLjlMYG5gHzqTs2OjmGjbFPkPcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=//Ua6f
 bgPleRns58xLPwp5jsqA31DFCIgTLmVQxIlOI=; b=iKg6RsbgbJcU90Psd75MtD
 oDDO9BFYIic1Xh64LQocuvGl1m1hePlfJ+iyOaOTapCwpx+4r3nBfzl8nko+gcjK
 RaWZirgcmCvZCY2WUCFWPZfmfOU9txtZehPH+vu4Cia3P5FxmS+2gwpHfFSJUgYx
 yJUZKky58IuhbKV+ZhC3BMGC2NgAjX07WXUnu3dQKFZNApuWGdk8ouKSCmKEkm8L
 OKDuxuNPfVPSH6j6yW4v4KcCKWWOjoznkAQuGci5YRRQUu7be06nuKf69+v9QlLd
 tfSV//8NubYLyC0LMX1AnLzVwwx+FxNT3OVLIeLuUwUjAJcGw9ol0bihl9xETmeQ
 ==
X-ME-Sender: <xms:bfqsYD7Fw4uQljLFdiipKZQC4sUfQberi_XdDUMBs0MIHpKahwJJ5A>
 <xme:bfqsYI7Lrka4hcgGATu8PmxwGc7e5cenwruxS5oPE89w20Jwne-3Bm1A1UjhpdSHx
 Ug7nFZs3bzne1vlvIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bfqsYKeXluUEyRFpIuLmgDx8_Naxxw5R871SZ_bTtXtLd3j3y5cByw>
 <xmx:bfqsYEIINvLP5Du-qUwAapcVhrJnl5K6W9Sxtlt0jwkTGF2t02lbsA>
 <xmx:bfqsYHKUiMEMP6ym6SilSXugksNS91AOZmbj9FU7T9FN291d6lMC6Q>
 <xmx:cPqsYDDXWC2Iq0Kw3OsuEBXtiABKDAb8RK3xRJ7zjxS0fGy0gXqcIA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:23:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 00/12] drm/vc4: hdmi: Enable Channel Mapping, IEC958,
 HBR Passthrough using hdmi-codec
Date: Tue, 25 May 2021 15:23:42 +0200
Message-Id: <20210525132354.297468-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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

Hi,=0D
=0D
hdmi-codec allows to have a lot of HDMI-audio related infrastructure in pla=
ce,=0D
it's missing a few controls to be able to provide HBR passthrough. This ser=
ies=0D
adds more infrastructure for the drivers, and leverages it in the vc4 HDMI=
=0D
controller driver.=0D
=0D
Thanks!=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Added an extra patch to clarify the iec958 controls iface policy=0D
  - Added kerneldoc for the new iec958 PCM functions=0D
  - s/EXPORT_SYMBOL/EXPORT_SYMBOL_GPL=0D
  - Used the ALSA prefix where relevant=0D
  - Rebased on drm-misc-next-2021-05-17=0D
=0D
Dom Cobley (5):=0D
  drm/vc4: hdmi: Set HD_CTL_WHOLSMP and HD_CTL_CHALIGN_SET=0D
  drm/vc4: hdmi: Set HDMI_MAI_FMT=0D
  drm/vc4: hdmi: Set VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE=0D
  drm/vc4: hdmi: Remove firmware logic for MAI threshold setting=0D
  ARM: dts: bcm2711: Tune DMA parameters for HDMI audio=0D
=0D
Maxime Ripard (7):=0D
  ALSA: doc: Clarify IEC958 controls iface=0D
  ALSA: iec958: Split status creation and fill=0D
  ASoC: hdmi-codec: Rework to support more controls=0D
  ASoC: hdmi-codec: Add iec958 controls=0D
  ASoC: hdmi-codec: Add a prepare hook=0D
  drm/vc4: hdmi: Register HDMI codec=0D
  drm/vc4: hdmi: Remove redundant variables=0D
=0D
 .../kernel-api/writing-an-alsa-driver.rst     |  13 +-=0D
 arch/arm/boot/dts/bcm2711.dtsi                |   4 +-=0D
 drivers/gpu/drm/vc4/Kconfig                   |   1 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 322 ++++++++----------=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h                |   5 +-=0D
 drivers/gpu/drm/vc4/vc4_regs.h                |  30 ++=0D
 include/sound/hdmi-codec.h                    |  12 +-=0D
 include/sound/pcm_iec958.h                    |   8 +=0D
 sound/core/pcm_iec958.c                       | 176 +++++++---=0D
 sound/soc/codecs/hdmi-codec.c                 | 219 +++++++++---=0D
 10 files changed, 508 insertions(+), 282 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
