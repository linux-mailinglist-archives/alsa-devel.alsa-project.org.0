Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1C7D0CE7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 12:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69A8DF0;
	Fri, 20 Oct 2023 12:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69A8DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697796764;
	bh=1jRbii/BkNUjq+lDVdVo8qO8tE5vxzWSxzyfm6hmtlA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TUjGFL8vqogRRzsolYNttyQLFazAZYr9ksLw0rKWOMNuFUAGaKMKDUDbXQErIyCQm
	 /++vsxRzZyowfcfgNQ8Oo2MwKSYD5nwMF/Wae83+9itrZXGnh9wfm857iGEWfJ2/g1
	 latV7RseJEWs85+SNsQpkALfGzZB+vWzmAUznYn4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3479F805F6; Fri, 20 Oct 2023 12:09:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC8DF805EC;
	Fri, 20 Oct 2023 12:09:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A391AF805C0; Fri, 20 Oct 2023 12:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44642F8056F
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 12:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44642F8056F
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D61C1201E8A;
	Fri, 20 Oct 2023 12:09:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 732DD201E75;
	Fri, 20 Oct 2023 12:09:04 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D8E3D181D0E5;
	Fri, 20 Oct 2023 18:09:02 +0800 (+08)
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
Subject: [RFC PATCH v7 11/13] media: uapi: Add audio rate controls support
Date: Fri, 20 Oct 2023 17:30:30 +0800
Message-Id: <1697794232-2607-12-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
References: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 34IVLCZBNRTOH3M5NRBV3XIJVWVB65X5
X-Message-ID-Hash: 34IVLCZBNRTOH3M5NRBV3XIJVWVB65X5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34IVLCZBNRTOH3M5NRBV3XIJVWVB65X5/>
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
 .../media/v4l/ext-ctrls-audio-m2m.rst          | 18 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c      | 12 ++++++++++++
 include/uapi/linux/v4l2-controls.h             |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
index 82d2ecedbfee..e6972a2d3b17 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
@@ -19,3 +19,21 @@ Audio M2M Control IDs
     The Audio M2M class descriptor. Calling
     :ref:`VIDIOC_QUERYCTRL` for this control will
     return a description of this control class.
+
+.. _v4l2-audio-asrc:
+
+``V4L2_CID_M2M_AUDIO_SOURCE_RATE``
+    Sets the audio source rate, unit is (Hz)
+
+``V4L2_CID_M2M_AUDIO_DEST_RATE``
+    Sets the audio destination rate, unit is (Hz)
+
+``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET``
+    Sets the offset for audio source rate, unit is (Hz).
+    Offset expresses the drift of clock if there is. It is
+    equal to real rate minus ideal rate.
+
+``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET``
+    Sets the offset for audio destination rate, unit is (Hz)
+    Offset expresses the drift of clock if there is. It is
+    equal to real rate minus ideal rate.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 2a85ea3dc92f..b695cbdd1f6e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1245,6 +1245,10 @@ const char *v4l2_ctrl_get_name(u32 id)
 
 	/* Audio M2M controls */
 	case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
+	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:	return "Audio Source Sample Rate";
+	case V4L2_CID_M2M_AUDIO_DEST_RATE:	return "Audio Dest Sample Rate";
+	case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:	return "Audio Source Sample Rate Offset";
+	case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:	return "Audio Dest Sample Rate Offset";
 	default:
 		return NULL;
 	}
@@ -1606,6 +1610,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
+	case V4L2_CID_M2M_AUDIO_DEST_RATE:
+		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
+		break;
+	case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:
+	case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:
+		*type = V4L2_CTRL_TYPE_FIXED_POINT;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index eb0f0a76f867..d433c6f0b533 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -3498,4 +3498,9 @@ struct v4l2_ctrl_av1_film_grain {
 #define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x900)
 #define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
 
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 0)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 1)
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 2)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 3)
+
 #endif
-- 
2.34.1

