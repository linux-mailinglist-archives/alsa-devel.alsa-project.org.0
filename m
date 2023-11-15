Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56F7E795B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 07:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C22BAE8;
	Fri, 10 Nov 2023 07:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C22BAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699597946;
	bh=7X9Bd1opLuXj+GGluY7cbJpqNijaZVO8ojsOVPmhCNA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SF/D7iHO8B3oSuCYTY1IohWty5pGxdrvwJGN+ViTeNDVPn+zMm4cyzSn8UIQGLQd/
	 031PeZv+opkrb76VZw0Lzi85tzAKLxxIpwwACQnFpUCgkzshT0hzcS2gTZTG5Qztoq
	 RyRYMeb03UgSfdRW0p18yCXda+q4kowfGZ0/TQM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC029F805AB; Fri, 10 Nov 2023 07:31:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EACF8057C;
	Fri, 10 Nov 2023 07:31:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 258B3F80563; Fri, 10 Nov 2023 07:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61082F80549
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 07:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61082F80549
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D952200B0F;
	Fri, 10 Nov 2023 07:28:06 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C5FA200B18;
	Fri, 10 Nov 2023 07:28:05 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A4ACA183AD50;
	Fri, 10 Nov 2023 14:28:03 +0800 (+08)
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
Subject: [PATCH v9 09/15] media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
Date: Fri, 10 Nov 2023 13:48:03 +0800
Message-Id: <1699595289-25773-10-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 3YE3VQVRPWAEJP5LMBZAPXL7TDTRIPLR
X-Message-ID-Hash: 3YE3VQVRPWAEJP5LMBZAPXL7TDTRIPLR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YE3VQVRPWAEJP5LMBZAPXL7TDTRIPLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Audio M2M class includes controls for audio memory-to-memory
use cases. The controls can be used for audio codecs, audio
preprocessing, audio postprocessing.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-audio-m2m.rst         | 21 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++++
 include/uapi/linux/v4l2-controls.h            |  4 ++++
 5 files changed, 34 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst

diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index ea0435182e44..d5366e96a596 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -52,6 +52,7 @@ applicable to all devices.
     ext-ctrls-fm-rx
     ext-ctrls-detect
     ext-ctrls-colorimetry
+    ext-ctrls-audio-m2m
     fourcc
     format
     planar-apis
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
new file mode 100644
index 000000000000..82d2ecedbfee
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
@@ -0,0 +1,21 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _audiom2m-controls:
+
+***************************
+Audio M2M Control Reference
+***************************
+
+The Audio M2M class includes controls for audio memory-to-memory
+use cases. The controls can be used for audio codecs, audio
+preprocessing, audio postprocessing.
+
+Audio M2M Control IDs
+-----------------------
+
+.. _audiom2m-control-id:
+
+``V4L2_CID_M2M_AUDIO_CLASS (class)``
+    The Audio M2M class descriptor. Calling
+    :ref:`VIDIOC_QUERYCTRL` for this control will
+    return a description of this control class.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index f9f73530a6be..e8475f9fd2cf 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -480,6 +480,10 @@ still cause this situation.
       - 0xa50000
       - The class containing colorimetry controls. These controls are
 	described in :ref:`colorimetry-controls`.
+    * - ``V4L2_CTRL_CLASS_M2M_AUDIO``
+      - 0xa60000
+      - The class containing audio m2m controls. These controls are
+	described in :ref:`audiom2m-controls`.
 
 Return Value
 ============
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..2a85ea3dc92f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1242,6 +1242,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
 	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
+
+	/* Audio M2M controls */
+	case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
 	default:
 		return NULL;
 	}
@@ -1451,6 +1454,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
 	case V4L2_CID_COLORIMETRY_CLASS:
+	case V4L2_CID_M2M_AUDIO_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read nor write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68db66d4aae8..7d318065a33d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -30,6 +30,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_M2M_AUDIO	0x00a60000	/* Audio M2M controls */
 
 /* User-class control IDs */
 
@@ -3485,6 +3486,9 @@ struct v4l2_ctrl_av1_film_grain {
 	__u8 reserved[4];
 };
 
+#define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x900)
+#define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
2.34.1

