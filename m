Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290A77E7968
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 07:34:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545CDDE5;
	Fri, 10 Nov 2023 07:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545CDDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699598043;
	bh=p5xbyPSCDonIbqd/cGPvbdgW5glws+YIZni6XXtLSKw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZntK+KgsG5I0hde64J1h79RI+cDFeaOWEe8K0l11yW0J/Tutw6xD+XPn8zqEs35Cj
	 oPN0xfkQcmaZY5ckrEyZVdklQ7QfQUZjiBeVdVaDw1wqT6i+26XXgDG3A6KbY50B4+
	 UFRpP9i9KOPP3Y9Xje8SSkW0NQwTGxQgBT1Gthok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ECC5F805D7; Fri, 10 Nov 2023 07:31:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 820E2F801F5;
	Fri, 10 Nov 2023 07:31:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1F47F80431; Fri, 10 Nov 2023 07:29:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CDD9F8055A
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 07:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CDD9F8055A
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BA724200B18;
	Fri, 10 Nov 2023 07:28:11 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 81860201C40;
	Fri, 10 Nov 2023 07:28:11 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8BEC4180327D;
	Fri, 10 Nov 2023 14:28:09 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 13/15] media: uapi: Add an entity type for audio resampler
Date: Fri, 10 Nov 2023 13:48:07 +0800
Message-Id: <1699595289-25773-14-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: CRMYRDLSGR2UZYNRR3BL7ZKXAIN57NR5
X-Message-ID-Hash: CRMYRDLSGR2UZYNRR3BL7ZKXAIN57NR5
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRMYRDLSGR2UZYNRR3BL7ZKXAIN57NR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add and document a media entity type for audio resampler.
It is MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/mediactl/media-types.rst | 5 +++++
 include/uapi/linux/media.h                                 | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 3f0bcb18a5ca..2977d8723f11 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -208,6 +208,11 @@ Types and flags used to represent the media graph elements
 	  combination of custom V4L2 controls and IOCTLs, and parameters
 	  supplied in a metadata buffer.
 
+    *  -  ``MEDIA_ENT_F_PROC_AUDIO_RESAMPLER``
+       -  An Audio Resampler device. An entity capable of
+	  resampling a audio stream from one sample rate to another sample
+	  rate. Must have one sink pad and at least one source pad.
+
     *  -  ``MEDIA_ENT_F_VID_MUX``
        - Video multiplexer. An entity capable of multiplexing must have at
          least two sink pads and one source pad, and must pass the video
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 9ff6dec7393a..a8266eaa8042 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -125,6 +125,7 @@ struct media_device_info {
 #define MEDIA_ENT_F_PROC_VIDEO_ENCODER		(MEDIA_ENT_F_BASE + 0x4007)
 #define MEDIA_ENT_F_PROC_VIDEO_DECODER		(MEDIA_ENT_F_BASE + 0x4008)
 #define MEDIA_ENT_F_PROC_VIDEO_ISP		(MEDIA_ENT_F_BASE + 0x4009)
+#define MEDIA_ENT_F_PROC_AUDIO_RESAMPLER	(MEDIA_ENT_F_BASE + 0x400a)
 
 /*
  * Switch and bridge entity functions
-- 
2.34.1

