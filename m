Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A03766DD
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:10:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22CA1693;
	Fri,  7 May 2021 16:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22CA1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620396635;
	bh=Gp/CE5A+gg2IQSkw3Meu3IKyeaPYj5D9Fu3TtbJLPwo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hk06BkNN9AAuXDbGYORHlwfzQfNvR5gvCDwtReQmgv5+50Ix72YXBYJ1KWlgX3m31
	 LCiAVvRav2XJwA1AWiwh6vP0WYpML5UR/m3NYeo/GFBRgJdzmMDOQa+oIqayuwp7Uj
	 flxeIGt/NyenrnQdkSiKSTmmE13ZeWP3C71RMTyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B899AF80279;
	Fri,  7 May 2021 16:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0F3F80507; Fri,  7 May 2021 16:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05479F80424
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05479F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="SCJjwuJA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AyEv4al1"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id D8D07FE2;
 Fri,  7 May 2021 10:05:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 07 May 2021 10:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1Y/6ibLlSr8pw
 II8mTAg1YDwMKwUM98nwretj7QAvbA=; b=SCJjwuJAiFT3COu62reNPC6HBe6NG
 2pQmxeyQ3cslLYKSi+YN4uvGJN2lxgJtR3dGgzcfHhGhH2QXfgzy4B9C4+UiYyDP
 RRytUs/zyTEWUzjEp9oraOY7bu+8FkouHSwXXXGCLiUWgJqtxalyy6+dPOoV3R+i
 YUesci7Ob5/pese7lICDtpUheWbUuo57u/akV1hTH43oVha0KDPtnbSmYz55sPkp
 hGaWCc+83hWJjh8OVYBvWUoWNg6hGqDjV3epsRYrpNV9FdAvojL+R6GNSqYhQHZN
 SW/lQme0KrkUY80em9Ou6RsDzfBkOkdvGF47YySCS0r9945BIau4UcmSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1Y/6ibLlSr8pwII8mTAg1YDwMKwUM98nwretj7QAvbA=; b=AyEv4al1
 k/00FANxirR6KuKDveL1t2xTS2v9DdbGZ+r3opG1NJ6pAdF12y6i1Ad25PWh8zZ3
 zNO1Uct17Q8AAYMSbYJ5AfqHWEj5QuUWu2QNbcob11Bwuy7O3IWo/YrI3VSn/poM
 rfqHWY7UwHyeeJ+EDIRhR3rHnyNHfOY5SYgPOQIXOCKfkXmLC0VKJ5VT17ymUTtS
 7Jcp0BmQF/nrqqOAS5QWlsg51ctBSTkvpR1VeGP02sFz/bACBI1n98Wqt2/1sgzA
 +OF/zIUwoOxT582kK4YetsM6CmJks/qloHa7XGs1i3qsM5xrlVip21gCh9/X4XGx
 QjED8BwlMDSqnQ==
X-ME-Sender: <xms:OkmVYGQ6_YQFvg2OQMwGZmZtOOUSBcHrdsrrwIiBdvW1nmrxm1mr-w>
 <xme:OkmVYLzQbfY2stP1piv0sWrpyM-rkYZMjmLDYs4qT8WqzmFpeTU-Igzkr-YTEQZmp
 1mG9B5YQG9QVI-I_ds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OkmVYD0g-wLcT-LOqVIa1dF2VpJYomCTN6eErnZfm8pufkBcdOhTGw>
 <xmx:OkmVYCD0AscbqTWgXaOmWaW1SOkLjmGYrIBYQwvP6Y3C63ahSR-R4w>
 <xmx:OkmVYPh1Wm1ShEqHYfmZ7V4f2nJbvegfG2ImJM7f4pgbNhGLnt-WeQ>
 <xmx:PEmVYLTOdVxETl46RmjLubofxfb24KSmyzbfzjO0YNJLqLmAXJQQGBuXZSo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/11] ARM: dts: bcm2711: Tune DMA parameters for HDMI audio
Date: Fri,  7 May 2021 16:03:34 +0200
Message-Id: <20210507140334.204865-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
References: <20210507140334.204865-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
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

From: Dom Cobley <popcornmix@gmail.com>

Enable NO_WAIT_RESP, DMA_WIDE_SOURCE, DMA_WIDE_DEST, and bump the DMA
panic and AXI priorities to avoid any DMA transfer error with HBR audio
(8 channel, 192Hz).

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 462b1dfb0385..8a7350cfcd9c 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -352,7 +352,7 @@ hdmi0: hdmi@7ef00700 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "wakeup", "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
-			dmas = <&dma 10>;
+			dmas = <&dma (10 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
@@ -395,7 +395,7 @@ hdmi1: hdmi@7ef05700 {
 				     <9>, <10>, <11>;
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "wakeup", "hpd-connected", "hpd-removed";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.31.1

