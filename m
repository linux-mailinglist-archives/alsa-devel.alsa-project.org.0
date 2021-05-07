Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6743766BF
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:06:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB31836;
	Fri,  7 May 2021 16:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB31836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620396381;
	bh=O4VdvwRDQDVwI2PDKrtvDAdxWx0ftS6VU3I2UpvCfd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=um6FMv1e0CEfnOAvOe2K3QIFKYw5EEpXBXtmRAAd+x9t9grniof5cUYHBxh/NJObE
	 k/1LsHz0VopuX/Ui/WXYTdsXwILF0m48gUbDB5pMBfbyjY9EvKqaCenf4xAG/HA6w5
	 tG6JpHYJ/DPMJDEVErChvX1CkYAfExylIhInj9uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5AE8F8026A;
	Fri,  7 May 2021 16:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C2F1F8025F; Fri,  7 May 2021 16:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E85A6F8010B
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85A6F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="lcuLsf1F"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NOzm3ELu"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7A917FD7;
 Fri,  7 May 2021 10:04:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 07 May 2021 10:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=Vtd9BNGxnWTVrdv1sQguNv4d3w
 rORv5ukuxA87nXxow=; b=lcuLsf1Fk/QbKv7GOAiqnZGzSJS6VzQqtd0tMX9vfl
 2cmkq5e8LWKaHxZjaKeaOV8KnOaJOE/W7CazrXkXZdsRuZSxVq4brh4YCuDrXty8
 wEZ1+1dVTC+J1UP/JLYimwBah7NXBWEAJl86BUenMUAIYWBcKPT77o9U4UK7iURd
 EiHLqgBQQX+N94OSG/DFdVuxZ7nXzaJOjAUXhnH7HM1CZQPYcaCS74RIaAGvgUy2
 C24LrF5RrBbHJbfo+1DVHbNjdVXItfsL8feocLev/ei8/eIUPVCdm1khKUOINFpj
 1PcLPfpTdMSDyZcyrRZQFotKfNPFS+NVHXuvC8go14JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vtd9BN
 GxnWTVrdv1sQguNv4d3wrORv5ukuxA87nXxow=; b=NOzm3ELuTbOQwprurNuRlp
 HsFUqA9CGaHZKhxQG6LiJR6cebgZKW+gg1YiiItyfpkUVMJ0K/4HYNVdSIpWrF1Y
 y3oZReI8y8yhCDMNcGf/GgcpzOgZNWkdwiStAuEOa+U4rNcKpO9XGBTAA9VPNO1f
 NxYK1No9qQqr18rzjXQqgnICVZm7SQrxWDPFAa0F4YjxAPD5RAnjSw7p7XXB577b
 ZAlE0VDFs0JP5wjTP1f10uYYP+pRMRi2BvpHCHPTiPFVZnam3IMLbCRXT+OjxaPF
 bLxSf5gAkDY1qSol0fRcgmkFTBROxfRfsm9hgSUNzXXjLOAKbRYdfAMQlGAV4jrQ
 ==
X-ME-Sender: <xms:80iVYKMpfbY09CTVVlgVGNQez9IRi3y0p-3RQE6JTJLyup230Ze7EQ>
 <xme:80iVYI9I7Spa6OfWxjIZfG5_XS0JTQgpEvLr8YBTVjlb3jxRCI91PhEQuHE5j-D1w
 YFyUKsNfHnWBMjF8EI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetteeltddujefhffdtuefgudffleelleehjeeggeffuddvvdfgvdfhhfelgfet
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:80iVYBS3bFPT9iZqv1Wn2jIAxLoA6Y3F5DXWpKAxl7WS5OlhnafUCw>
 <xmx:80iVYKtXGZVZY0ijBSeAxJBS9608yg8EevjzyL38tzhUBOOFQSpQRg>
 <xmx:80iVYCe6dZiHOnqmpKw0q8e4kx7ZQC4_41m2iWE7DDIRwneQvrltoA>
 <xmx:9kiVYGPRLnKrgzWi5QtLBvQ7_Ra0vCOaF48JtfHBTfdeQZx8pOPZAJ-n3pM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:04:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/11] drm/vc4: hdmi: Enable Channel Mapping, IEC958,
 HBR Passthrough using hdmi-codec
Date: Fri,  7 May 2021 16:03:23 +0200
Message-Id: <20210507140334.204865-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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
One thing that felt a bit weird is that even though=0D
https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-dri=
ver.html#iec958-s-pdif=0D
mentions that the iec958 mask control should be a mixer control and the=0D
default control should be a PCM one, it feels a bit weird to have two diffe=
rent=0D
control type for two controls so similar, and other drivers are pretty=0D
inconsistent with this. Should we update the documentation?=0D
=0D
Thanks!=0D
Maxime=0D
=0D
Dom Cobley (5):=0D
  drm/vc4: hdmi: Set HD_CTL_WHOLSMP and HD_CTL_CHALIGN_SET=0D
  drm/vc4: hdmi: Set HDMI_MAI_FMT=0D
  drm/vc4: hdmi: Set VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE=0D
  drm/vc4: hdmi: Remove firmware logic for MAI threshold setting=0D
  ARM: dts: bcm2711: Tune DMA parameters for HDMI audio=0D
=0D
Maxime Ripard (6):=0D
  snd: iec958: split status creation and fill=0D
  ASoC: hdmi-codec: Rework to support more controls=0D
  ASoC: hdmi-codec: Add iec958 controls=0D
  ASoC: hdmi-codec: Add a prepare hook=0D
  drm/vc4: hdmi: Register HDMI codec=0D
  drm/vc4: hdmi: Remove redundant variables=0D
=0D
 arch/arm/boot/dts/bcm2711.dtsi |   4 +-=0D
 drivers/gpu/drm/vc4/Kconfig    |   1 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c | 322 ++++++++++++++-------------------=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h |   5 +-=0D
 drivers/gpu/drm/vc4/vc4_regs.h |  30 +++=0D
 include/sound/hdmi-codec.h     |  12 +-=0D
 include/sound/pcm_iec958.h     |   8 +=0D
 sound/core/pcm_iec958.c        | 131 +++++++++-----=0D
 sound/soc/codecs/hdmi-codec.c  | 219 +++++++++++++++++-----=0D
 9 files changed, 456 insertions(+), 276 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
