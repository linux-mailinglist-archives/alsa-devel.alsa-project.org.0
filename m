Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C736390281
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECE501732;
	Tue, 25 May 2021 15:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECE501732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949328;
	bh=J6WMTsThQCqvlSZpFSA6LQUkXUfoLLGOAeVfBoZF4jU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0bX61Jz9zeYtf1RBwBoQ72IotOptK6OCNO+91Ops+8veA47u2/JmFU8iwYYwgWLI
	 pEBA4tGJ2QecJqBy8r+Ftn1OAxLH+J6VDEmNJAsDtn8Ha3Dz+TBzUGeTkPyBdpGnCd
	 KuAEyss/hneZVrlVZU/g8ISqryZO+2DC62wgqyZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48ECF804E7;
	Tue, 25 May 2021 15:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F529F804EC; Tue, 25 May 2021 15:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA8CEF804E4
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA8CEF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="ef0fmN1j"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lM2yCJrz"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A2F43580719;
 Tue, 25 May 2021 09:24:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 May 2021 09:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4b2mNvTKelvV4
 QtZzZ4o99zSOddTCT0oSNz5mzzNQEA=; b=ef0fmN1jOG3/gBYA4Te+ErkIvrZ6W
 RRg1rYUUtUaKyef6sHCfeT0g9VPshYi0v0mGkfmGJUL99xhb8SK3j8W0ULgyTDNN
 FpyM2Ds77Jz3ztWuPClkfTZveyRwFSkT+wZTzSCq1ATPHtuv0DT817siOwPNd+mI
 m/exnG+ins/sIHuYaRV5POd/j9o9LVx4BdeBMq4+/3k+ABcaJKPvYydU6iO3IPXH
 vw3QxkksIP3Z1qxitHQdmsAnyQIgHcx/wEcgcs/UlgvoS1lfPrWew0Sf0W9iarRL
 nNOYRLW+nWHkXIpbt+XUy0j+qUkOi88faQDH//M60J8PmSvAQVkiCWFXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4b2mNvTKelvV4QtZzZ4o99zSOddTCT0oSNz5mzzNQEA=; b=lM2yCJrz
 CXhiY/VvclOCjVIbbuT/yhrQj7jxRf0Y5maaJxmXmkNv0EWHgHgJyAF1/CgJYaWO
 Aj3kdqbvW14S4ppRJnKaE70DFeTdYr0qHH59LDdVaP5YDt7191q+rTXaN7OmPYPy
 f4ZKazwPFfbR2zWYT1SvD5w18aPhK4edJ0VE/aCMqzVdW7bdzVgHSvqw1f/ruYcC
 Kw0FNEguBB+MK2AjixtoRwqBVWm0DT/u7LTpZgASTP0/MrmtE6pQt0IDMnSJ/zNG
 u3zeJSUVQSB9hWWJqiLwMZdY9sVtroy7JsnfKehkOI+xmPDXAxkyJ7h9FcD1jHov
 OtX0p4N1v3ru5w==
X-ME-Sender: <xms:gPqsYAbuCwKl6ZFAumMboudmrMfdWK7tvxsdw2JuRpGk6K3FOukUgA>
 <xme:gPqsYLbYa4AjoSTNKeM4qAv0TmBAFHudIqUVa-2l_vwRqnc7gTMgM2IDsqjIeN36X
 a5Ce2NTsihuWxnGF8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gPqsYK8hxyUOJXTaMOpIBfaeLZB9fHg3mnx313-gXhzdl4hnCgHOeA>
 <xmx:gPqsYKr9QxJR-GS0f5EGBefvNxYN4BPCuI06I5_c4w0C6KGxEHp-Zw>
 <xmx:gPqsYLqB1V3UjIGQut1ErUWlH6WCQfISNKJJZMPPUqreXUp-X_rhpg>
 <xmx:hfqsYG9KWmUlSI3IFR5o612INxEIdq5pjq1YHrxm6Co_IhNoAccjHg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 08/12] drm/vc4: hdmi: Set VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE
Date: Tue, 25 May 2021 15:23:50 +0200
Message-Id: <20210525132354.297468-9-maxime@cerno.tech>
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

Without this bit set, HDMI_MAI_FORMAT doesn't pick up
the format and samplerate from DVP_CFG_MAI0_FMT and you
can't get HDMI_HDMI_13_AUDIO_STATUS_1 to indicate HBR mode

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 2c2f21ee0451..0cf9949a749f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1288,6 +1288,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
+		   VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE |
 		   VC4_SET_FIELD(channel_mask, VC4_HDMI_MAI_CHANNEL_MASK));
 
 	channel_map = vc4_hdmi->variant->channel_map(vc4_hdmi, channel_mask);
-- 
2.31.1

