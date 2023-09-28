Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6A7B17AE
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 11:40:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA76E0F;
	Thu, 28 Sep 2023 11:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA76E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695894032;
	bh=Q953zgBzVNOmfSR6I+MiBDzdBX/UZ5WRXhMnmjEZ/4k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Cx+cP4Kdsi3ExXpfOB+zrj1O/rPm/Z/5SgrJa2uphqMkPc3UKVepPyXNarV7Azzuz
	 rCba6eAKqgzleW8tSN0Ffk7Lx50zhASBcsG54er62t/JeTwyzzCr+v8o/oAogGDoOJ
	 IBnl6me8na88eB1J8MjXHG21q3rbkXxO/H98wXDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37FFEF805B2; Thu, 28 Sep 2023 11:38:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7908CF805B2;
	Thu, 28 Sep 2023 11:38:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11F27F8057F; Thu, 28 Sep 2023 11:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 031A9F8047D
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 11:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 031A9F8047D
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C68F1A1C89;
	Thu, 28 Sep 2023 11:37:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3A2A81A1C84;
	Thu, 28 Sep 2023 11:37:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5A4AF1820F57;
	Thu, 28 Sep 2023 17:37:45 +0800 (+08)
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
Subject: [RFC PATCH v5 08/11] media: uapi: Add audio rate controls support
Date: Thu, 28 Sep 2023 17:00:16 +0800
Message-Id: <1695891619-32393-9-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: WTRKLWX2PEXS4CKUDASUJCODTZAZT5Q5
X-Message-ID-Hash: WTRKLWX2PEXS4CKUDASUJCODTZAZT5Q5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTRKLWX2PEXS4CKUDASUJCODTZAZT5Q5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio rate controls is used for user to configure
the audio sample rate to driver.

Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
new ID for ASRC rate control.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/common.rst        |  1 +
 .../media/v4l/ext-ctrls-asrc-rate.rst         | 36 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
 .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
 include/media/v4l2-ctrls.h                    |  1 +
 include/uapi/linux/v4l2-controls.h            | 13 +++++++
 include/uapi/linux/videodev2.h                |  1 +
 10 files changed, 73 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst

diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index ea0435182e44..fe6cd7ae60e4 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -52,6 +52,7 @@ applicable to all devices.
     ext-ctrls-fm-rx
     ext-ctrls-detect
     ext-ctrls-colorimetry
+    ext-ctrls-asrc-rate
     fourcc
     format
     planar-apis
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst
new file mode 100644
index 000000000000..28bf9e1628e1
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-asrc-rate.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _asrc-rate-controls:
+
+***************************
+ASRC RATE Control Reference
+***************************
+
+These controls is intended to support asynchronous sample
+rate converter.
+
+.. _v4l2-audio-asrc:
+
+``V4L2_CID_ASRC_SOURCE_RATE``
+    sets the rasampler source rate.
+
+``V4L2_CID_ASRC_DEST_RATE``
+    sets the rasampler destination rate.
+
+.. c:type:: v4l2_ctrl_asrc_rate
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_ctrl_asrc_rate
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``rate_integer``
+      - integer part of sample rate.
+    * - __s32
+      - ``rate_fractional``
+      - fractional part of sample rate, which is Q31.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index f9f73530a6be..93ce15330490 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -295,6 +295,10 @@ still cause this situation.
       - ``p_av1_film_grain``
       - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
+    * - struct :c:type:`v4l2_ctrl_asrc_rate` *
+      - ``p_asrc_rate``
+      - A pointer to a struct :c:type:`v4l2_ctrl_asrc_rate`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_ASRC_RATE``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..8c15a0bb0fbc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
         parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_ASRC_RATE``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_asrc_rate`, containing audio
+        parameters for asrc component.
+
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index e61152bb80d1..769e333a2b75 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_ASRC_RATE :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a662fb60f73f..2a72779f3508 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1168,6 +1168,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!area->width || !area->height)
 			return -EINVAL;
 		break;
+	case V4L2_CTRL_TYPE_ASRC_RATE:
+		break;
 
 	default:
 		return -EINVAL;
@@ -1868,6 +1870,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_ASRC_RATE:
+		elem_size = sizeof(struct v4l2_ctrl_asrc_rate);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..84766037db80 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1602,6 +1602,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_ASRC_SOURCE_RATE:
+	case V4L2_CID_ASRC_DEST_RATE:
+		*type = V4L2_CTRL_TYPE_ASRC_RATE;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..40475965f8e4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -89,6 +89,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_ctrl_asrc_rate *p_asrc_rate;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c3604a0a3e30..a08be3bd5977 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -112,6 +112,8 @@ enum v4l2_colorfx {
 
 /* last CID + 1 */
 #define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
+#define V4L2_CID_ASRC_SOURCE_RATE		(V4L2_CID_BASE + 45)
+#define V4L2_CID_ASRC_DEST_RATE			(V4L2_CID_BASE + 46)
 
 /* USER-class private control IDs */
 
@@ -3488,4 +3490,15 @@ struct v4l2_ctrl_av1_film_grain {
 #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
 #endif
 
+/**
+ * struct v4l2_ctrl_asrc_rate - ASRC sample rate.
+ *
+ * @rate_integer: integer part of rate.
+ * @rate_fractional: fractional part of rate, most time may be zero
+ */
+struct v4l2_ctrl_asrc_rate {
+	__u32 rate_integer;
+	__u32 rate_fractional;
+};
+
 #endif
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3630f50eedb1..166c51f537cc 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1840,6 +1840,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_tile_group_entry;
 		struct v4l2_ctrl_av1_frame __user *p_av1_frame;
 		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
+		struct v4l2_ctrl_asrc_rate __user *p_asrc_rate;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
-- 
2.34.1

