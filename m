Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B391877DD6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 11:13:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 823C2E85;
	Mon, 11 Mar 2024 11:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 823C2E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710152018;
	bh=fgYQVMxpAmTgYDCZIFPEaCK+FRLJh6UXAq9wyXsuRvM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m8dRUf5Pwx5/WHDrDF7dtXFEpcMa4PgyzdAM4PWrkTvV1aWBXa0xvGeMWjIjmMO+z
	 qOzsABifbyXiLlSQzph0gR7CY9JrSPBozlQNhb0xCbCQmaP6WXPSzQMRTPVYGfW0uE
	 uzWrIBJr9idPhzwOBdkb8tia57HPGhF0xQFNEN2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB7DCF806DC; Mon, 11 Mar 2024 11:11:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A07DF806D9;
	Mon, 11 Mar 2024 11:11:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB7C1F806B1; Mon, 11 Mar 2024 11:11:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28254F80571
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 11:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28254F80571
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BB23E200F39;
	Mon, 11 Mar 2024 11:10:28 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 24C8D2007BB;
	Mon, 11 Mar 2024 11:10:28 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A2179180222A;
	Mon, 11 Mar 2024 18:10:25 +0800 (+08)
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
Subject: [PATCH v14 12/16] media: uapi: Declare interface types for Audio
Date: Mon, 11 Mar 2024 17:53:57 +0800
Message-Id: <1710150841-26991-13-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: YFDRGBYHMM6H7TUYWBIVWBX4DO3P5NTP
X-Message-ID-Hash: YFDRGBYHMM6H7TUYWBIVWBX4DO3P5NTP
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFDRGBYHMM6H7TUYWBIVWBX4DO3P5NTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Declare the interface types that will be used by Audio.
The type is MEDIA_INTF_T_V4L_AUDIO.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/mediactl/media-types.rst    |  5 +++++
 drivers/media/v4l2-core/v4l2-dev.c                  |  4 ++++
 drivers/media/v4l2-core/v4l2-mem2mem.c              | 13 +++++++++----
 include/uapi/linux/media.h                          |  1 +
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..adfb37430f8e 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -265,6 +265,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-INTF-T-V4L-SUBDEV:
 .. _MEDIA-INTF-T-V4L-SWRADIO:
 .. _MEDIA-INTF-T-V4L-TOUCH:
+.. _MEDIA-INTF-T-V4L-AUDIO:
 .. _MEDIA-INTF-T-ALSA-PCM-CAPTURE:
 .. _MEDIA-INTF-T-ALSA-PCM-PLAYBACK:
 .. _MEDIA-INTF-T-ALSA-CONTROL:
@@ -322,6 +323,10 @@ Types and flags used to represent the media graph elements
        -  Device node interface for Touch device (V4L)
        -  typically, /dev/v4l-touch?
 
+    *  -  ``MEDIA_INTF_T_V4L_AUDIO``
+       -  Device node interface for Audio device (V4L)
+       -  typically, /dev/v4l-audio?
+
     *  -  ``MEDIA_INTF_T_ALSA_PCM_CAPTURE``
        -  Device node interface for ALSA PCM Capture
        -  typically, /dev/snd/pcmC?D?c
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index bac008fcedc6..ca8462a61e1f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -844,6 +844,10 @@ static int video_register_media_controller(struct video_device *vdev)
 		intf_type = MEDIA_INTF_T_V4L_SUBDEV;
 		/* Entity will be created via v4l2_device_register_subdev() */
 		break;
+	case VFL_TYPE_AUDIO:
+		intf_type = MEDIA_INTF_T_V4L_AUDIO;
+		/* Entity will be created via v4l2_device_register_subdev() */
+		break;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 75517134a5e9..cda5e255305f 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1143,10 +1143,15 @@ int v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
 	if (ret)
 		goto err_rm_links0;
 
-	/* Create video interface */
-	m2m_dev->intf_devnode = media_devnode_create(mdev,
-			MEDIA_INTF_T_V4L_VIDEO, 0,
-			VIDEO_MAJOR, vdev->minor);
+	if (vdev->vfl_type == VFL_TYPE_AUDIO)
+		m2m_dev->intf_devnode = media_devnode_create(mdev,
+				MEDIA_INTF_T_V4L_AUDIO, 0,
+				VIDEO_MAJOR, vdev->minor);
+	else
+		/* Create video interface */
+		m2m_dev->intf_devnode = media_devnode_create(mdev,
+				MEDIA_INTF_T_V4L_VIDEO, 0,
+				VIDEO_MAJOR, vdev->minor);
 	if (!m2m_dev->intf_devnode) {
 		ret = -ENOMEM;
 		goto err_rm_links1;
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..9ff6dec7393a 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -260,6 +260,7 @@ struct media_links_enum {
 #define MEDIA_INTF_T_V4L_SUBDEV			(MEDIA_INTF_T_V4L_BASE + 3)
 #define MEDIA_INTF_T_V4L_SWRADIO		(MEDIA_INTF_T_V4L_BASE + 4)
 #define MEDIA_INTF_T_V4L_TOUCH			(MEDIA_INTF_T_V4L_BASE + 5)
+#define MEDIA_INTF_T_V4L_AUDIO			(MEDIA_INTF_T_V4L_BASE + 6)
 
 #define MEDIA_INTF_T_ALSA_BASE			0x00000300
 #define MEDIA_INTF_T_ALSA_PCM_CAPTURE		(MEDIA_INTF_T_ALSA_BASE)
-- 
2.34.1

