Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8B6390282
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCB1172A;
	Tue, 25 May 2021 15:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCB1172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949343;
	bh=ujpR+zcEd+4R70TXQ708v6XHG57J515zpH/MOvlAcy8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1C8MqEVlZu/MpNR7lhepSYkESfyD8Fg+rtqFG9aec8gvyK6XIbB/i946wke82nu+
	 NrauGGq6UOmSsPnnTfihEgbk7STz4tw96+KqKHcAnHipmlNHtnq75yP6V9o4m+Om9c
	 r959KgNPLtkUuUVFWdCNnIJ1JVYr904trGWNUIR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1454AF804FB;
	Tue, 25 May 2021 15:24:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D4BF804F3; Tue, 25 May 2021 15:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C9CF804E4
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C9CF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="FvbLE/mC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="E5iHDMMQ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9531958071B;
 Tue, 25 May 2021 09:24:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 May 2021 09:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0sY59b1TrDjPi
 ASD9RGCdGoF4tj7/vODVPj+KEb/jBw=; b=FvbLE/mCeXK5Z+D8T6eb+aMBfu1dH
 rYc/P9IaptQhvZcmVQQLYCb5eg03tcgUa4+Ryn0CMNPBjnTY3EDZ/d10TbuCs0qR
 a95KOtPvKaRa4N6n+Q2MD1qrAAneJo08+HpFQXKu4id3zXKs8wfXG7QYHk7cHr1b
 RqswjbWS2KIBQYmMH4A/yotceUjRHuHDlRKQkds0d6/dLjWkwfQhqCeW5ZCi8rbA
 Nvcce3byZwft+jstIvvY7nK8KHrC2xIRvN1/L2YLAAW+b7wfsJsMxjHVc7Pdm400
 YLvCTKirBkehtw+DSa487/V+q+xuefBFLHcE2ppFvoM6pC9D/iineNCPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0sY59b1TrDjPiASD9RGCdGoF4tj7/vODVPj+KEb/jBw=; b=E5iHDMMQ
 s8/Wymo+TMeOKtPcsKpefoYHNZf3Yd11dyjoQdu1QAGeBlzmHR2ngUU0yJIZfVix
 wx7W/rNg90Is/WUoZnl0XU8U5YK05uORKfWjkpqmsqZFXl3r4h/NwS8/svclA5OG
 w/S2XVexpUMjrZH6O1+hLn44GYPOOC7CpvFuxNhIy8w9sLOjsrx1irAT/I/Xz/+D
 /yFGrrHE54JxNfxjtCdZ+sfNYJIXN40NBPIcVVep5JXAXhjaovhPqSZnguo6uHXW
 5YWyR6ITIjrarbwDQ9zvc1mdxN9adkEo5gnR0wcX4LVz2eMXefLxOhm9SRGrVGF+
 4Cukrq1jGblpFA==
X-ME-Sender: <xms:h_qsYNoKOYSCN-ynsi4g6CV4YUIVEmPjUrKGFYNZAYVkn0rj0GzPHw>
 <xme:h_qsYPqW9-AwW5T_WLTu4YukJ2zO3JpEq1YdLgk-xr9JDG4tVxFVqiUrcSaynskWq
 IGSOsrNq0AEW2vIQsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:h_qsYKM86CwRDUHpwg1Cppved6egCJB2PtM1rEmjknurtWUSF6CJSg>
 <xmx:h_qsYI6vg0o-laDP0y-YLHLb7hV5gZ1zz8XHBLodhOlFQLWB1p6xOQ>
 <xmx:h_qsYM4X90DCoppFLtS2HbNiB_nsdbVqk-iXCybDKPWE230nxsvXww>
 <xmx:h_qsYIN6hDEaBAWJpDUxuUNZatSx-0aQrO3xinl4CmsipVdT-4aVAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 09/12] drm/vc4: hdmi: Remove firmware logic for MAI
 threshold setting
Date: Tue, 25 May 2021 15:23:51 +0200
Message-Id: <20210525132354.297468-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
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

From: Dom Cobley <popcornmix@gmail.com>

This was a workaround for bugs in hardware on earlier Pi models
and wasn't totally successful.

It makes audio quality worse on a Pi4 at the higher sample rates

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0cf9949a749f..b7e3bd89e237 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1269,22 +1269,12 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	audio_packet_config |= VC4_SET_FIELD(channel_mask,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
-	/* Set the MAI threshold.  This logic mimics the firmware's. */
-	if (vc4_hdmi->audio.samplerate > 96000) {
-		HDMI_WRITE(HDMI_MAI_THR,
-			   VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQHIGH) |
-			   VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQLOW));
-	} else if (vc4_hdmi->audio.samplerate > 48000) {
-		HDMI_WRITE(HDMI_MAI_THR,
-			   VC4_SET_FIELD(0x14, VC4_HD_MAI_THR_DREQHIGH) |
-			   VC4_SET_FIELD(0x12, VC4_HD_MAI_THR_DREQLOW));
-	} else {
-		HDMI_WRITE(HDMI_MAI_THR,
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQHIGH) |
-			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQLOW));
-	}
+	/* Set the MAI threshold */
+	HDMI_WRITE(HDMI_MAI_THR,
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQHIGH) |
+		   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_DREQLOW));
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
-- 
2.31.1

