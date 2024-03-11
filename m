Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B682F877DD2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 11:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1472E9A;
	Mon, 11 Mar 2024 11:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1472E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710151998;
	bh=zItxLVW5Z3oKtQQHUpenFQi3aYHp+cZX947e2TReMKk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BXgnrZkUJ7cbNt5Idp0yOw5Ia0e3Woz0pXepR3kh54GYWD9C8fX9sDPjvFCTFOMNe
	 9uG/mvQ06fVSqoMOuVD6TIJpMc34TLajcx0FmZkiBfXQbdmcFEvD+T3GSwPWnFy5IJ
	 ajBQFh2w/veEvVm8SAKfGJOiWH52612j8qCtbVPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE3A2F806CF; Mon, 11 Mar 2024 11:11:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE4EF806C2;
	Mon, 11 Mar 2024 11:11:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A69F2F80686; Mon, 11 Mar 2024 11:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3608DF805B0
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 11:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3608DF805B0
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EFD2B200AD1;
	Mon, 11 Mar 2024 11:10:26 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 62291201422;
	Mon, 11 Mar 2024 11:10:26 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1D006183AD24;
	Mon, 11 Mar 2024 18:10:24 +0800 (+08)
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
Subject: [PATCH v14 11/16] media: uapi: Add audio rate controls support
Date: Mon, 11 Mar 2024 17:53:56 +0800
Message-Id: <1710150841-26991-12-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: K6OVKMZJJNGWSMMYVS3JW5SIOF7ZBXQG
X-Message-ID-Hash: K6OVKMZJJNGWSMMYVS3JW5SIOF7ZBXQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6OVKMZJJNGWSMMYVS3JW5SIOF7ZBXQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
new IDs for rate control.

Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../media/v4l/ext-ctrls-audio-m2m.rst         | 38 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  6 +++
 include/uapi/linux/v4l2-controls.h            |  5 +++
 3 files changed, 49 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
index 82d2ecedbfee..b137b7c442e6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
@@ -19,3 +19,41 @@ Audio M2M Control IDs
     The Audio M2M class descriptor. Calling
     :ref:`VIDIOC_QUERYCTRL` for this control will
     return a description of this control class.
+
+.. _v4l2-audio-asrc:
+
+``V4L2_CID_M2M_AUDIO_SOURCE_RATE (integer menu)``
+    This control specifies the audio source sample rate, unit is Hz
+
+``V4L2_CID_M2M_AUDIO_DEST_RATE (integer menu)``
+    This control specifies the audio destination sample rate, unit is Hz
+
+``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
+    This control specifies the offset from the audio source sample rate,
+    unit is Hz.
+
+    The offset compensates for any clock drift. The actual source audio
+    sample rate is the ideal source audio sample rate from
+    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offset.
+
+    The audio source clock may have some drift. Reducing or increasing the
+    audio sample rate dynamically to ensure that Sample Rate Converter is
+    working on the real sample rate, this feature is for the Asynchronous
+    Sample Rate Converter module.
+    So, userspace would be expected to be monitoring such drift
+    and increasing/decreasing the sample frequency as needed by this control.
+
+``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET (fixed point)``
+    This control specifies the offset from the audio destination sample rate,
+    unit is Hz.
+
+    The offset compensates for any clock drift. The actual destination audio
+    sample rate is the ideal source audio sample rate from
+    ``V4L2_CID_M2M_AUDIO_DEST_RATE`` plus this fixed point offset.
+
+    The audio destination clock may have some drift. Reducing or increasing
+    the audio sample rate dynamically to ensure that sample rate converter
+    is working on the real sample rate, this feature is for the Asynchronous
+    Sample Rate Converter module.
+    So, userspace would be expected to be monitoring such drift
+    and increasing/decreasing the sample frequency as needed by this control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 2a85ea3dc92f..91e1f5348c23 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1245,6 +1245,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 
 	/* Audio M2M controls */
 	case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
+	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:	return "Audio Source Sample Rate";
+	case V4L2_CID_M2M_AUDIO_DEST_RATE:	return "Audio Destination Sample Rate";
 	default:
 		return NULL;
 	}
@@ -1606,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
+	case V4L2_CID_M2M_AUDIO_DEST_RATE:
+		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a8b4b830c757..30129ccdc282 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -3495,6 +3495,11 @@ struct v4l2_ctrl_av1_film_grain {
 #define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x900)
 #define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
 
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 0)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 1)
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 2)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 3)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
2.34.1

