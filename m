Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F77D0CE8
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 12:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B516C1;
	Fri, 20 Oct 2023 12:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697796781;
	bh=lBHgs/DVa1/8Ergrmo/veYp88qntXAvpdm7iYHGzP9c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PmXmSDahiMvItI+t6OMvQFYL0Apd6PfjmlhF6Jqw/X/8HWrZYpNmbrJAzs+hNnvZW
	 awK8Tku5lmzHJnTfKhpUFtfew0MdSOabNT1OQLWokFjwkk+R9dOggnG9vkvtawHTqu
	 yhwF+lmItVeU6W9D2LreG/eU0iIrbK8MJVu/JdmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FC04F805F7; Fri, 20 Oct 2023 12:09:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 666F8F805F7;
	Fri, 20 Oct 2023 12:09:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2381F805BD; Fri, 20 Oct 2023 12:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D659F8025F
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 12:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D659F8025F
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BFE7D200895;
	Fri, 20 Oct 2023 12:09:03 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5BBC1201E84;
	Fri, 20 Oct 2023 12:09:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 61F1B1834898;
	Fri, 20 Oct 2023 18:09:01 +0800 (+08)
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
Subject: [RFC PATCH v7 10/13] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Date: Fri, 20 Oct 2023 17:30:29 +0800
Message-Id: <1697794232-2607-11-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
References: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: NTPWJUPYUG3EGNDLOMRO4UXXDWWSJLRK
X-Message-ID-Hash: NTPWJUPYUG3EGNDLOMRO4UXXDWWSJLRK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTPWJUPYUG3EGNDLOMRO4UXXDWWSJLRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixed point controls are used by the user to configure
a fixed point value in 64bits, which Q31.32 format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst  | 6 ++++++
 .../userspace-api/media/videodev2.h.rst.exceptions          | 1 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c                    | 5 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c                   | 2 ++
 include/uapi/linux/videodev2.h                              | 1 +
 5 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..2e15db0779f2 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -549,6 +549,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
         parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing parameter which is
+        Q31.32 format.
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index e61152bb80d1..2faa5a2015eb 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 002ea6588edf..e6a0fb8d6791 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -57,6 +57,7 @@ static int ptr_to_user(struct v4l2_ext_control *c,
 		return copy_to_user(c->string, ptr.p_char, len + 1) ?
 		       -EFAULT : 0;
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_FIXED_POINT:
 		c->value64 = *ptr.p_s64;
 		break;
 	default:
@@ -132,6 +133,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_FIXED_POINT:
 		*ctrl->p_new.p_s64 = c->value64;
 		break;
 	case V4L2_CTRL_TYPE_STRING:
@@ -540,7 +542,8 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
 		 */
 		if (ctrl->is_ptr)
 			continue;
-		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
+		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64 ||
+		    ctrl->type == V4L2_CTRL_TYPE_FIXED_POINT)
 			p_new.p_s64 = &cs->controls[i].value64;
 		else
 			p_new.p_s32 = &cs->controls[i].value;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a662fb60f73f..9d50df0d9874 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1187,6 +1187,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_INTEGER:
 		return ROUND_TO_RANGE(ptr.p_s32[idx], u32, ctrl);
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_FIXED_POINT:
 		/*
 		 * We can't use the ROUND_TO_RANGE define here due to
 		 * the u64 divide that needs special care.
@@ -1779,6 +1780,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	/* Prefill elem_size for all types handled by std_type_ops */
 	switch ((u32)type) {
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_FIXED_POINT:
 		elem_size = sizeof(s64);
 		break;
 	case V4L2_CTRL_TYPE_STRING:
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4ef08b3a9e39..ef8913d561bf 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1903,6 +1903,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_STRING        = 7,
 	V4L2_CTRL_TYPE_BITMASK       = 8,
 	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
+	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
 
 	/* Compound types are >= 0x0100 */
 	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,
-- 
2.34.1

