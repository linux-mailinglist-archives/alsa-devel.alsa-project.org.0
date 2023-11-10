Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895A7E795F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 07:33:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F1693A;
	Fri, 10 Nov 2023 07:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F1693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699597975;
	bh=b2NwS36qOsnR30IJpVkR3HsmeLXaOH6NnIecBbP8Yd4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SGuwvToF0glZ/H2g8g1i52mePyyuEJpw0d2zvNOlGgfnSm0m3zmXuHweau47dtdVn
	 1mO2xHtDcZa5JlWV+P97hheV9cVhOuCv61LqsfLR7kBh+SFL7xhapS90TOJM6g2beU
	 SzEyjnDHBthQ8qyrmE9396SiSKbvM1lKEi8+TO00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7DEEF805AF; Fri, 10 Nov 2023 07:31:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63727F805A8;
	Fri, 10 Nov 2023 07:31:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECE7BF8016D; Fri, 10 Nov 2023 07:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAC13F80557
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 07:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC13F80557
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EB9C1A1C9E;
	Fri, 10 Nov 2023 07:28:07 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 16FCB1A1C90;
	Fri, 10 Nov 2023 07:28:07 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 26C6D183AD44;
	Fri, 10 Nov 2023 14:28:05 +0800 (+08)
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
Subject: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Date: Fri, 10 Nov 2023 13:48:04 +0800
Message-Id: <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 3PX23ESCE5GZKG5QGBDLJF2TPCAT5ASJ
X-Message-ID-Hash: 3PX23ESCE5GZKG5QGBDLJF2TPCAT5ASJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PX23ESCE5GZKG5QGBDLJF2TPCAT5ASJ/>
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
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  | 13 +++++++------
 .../userspace-api/media/v4l/vidioc-queryctrl.rst    |  9 ++++++++-
 .../userspace-api/media/videodev2.h.rst.exceptions  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c            |  5 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c           |  2 ++
 include/uapi/linux/videodev2.h                      |  1 +
 6 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index e8475f9fd2cf..e7e5d78dc11e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -162,13 +162,13 @@ still cause this situation.
     * - __s32
       - ``value``
       - New value or current value. Valid if this control is not of type
-	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
-	not set.
+	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
+	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
     * - __s64
       - ``value64``
       - New value or current value. Valid if this control is of type
-	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
-	not set.
+	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
+	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
     * - char *
       - ``string``
       - A pointer to a string. Valid if this control is of type
@@ -193,8 +193,9 @@ still cause this situation.
     * - __s64 *
       - ``p_s64``
       - A pointer to a matrix control of signed 64-bit values. Valid if
-        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
-        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
+        this control is of type ``V4L2_CTRL_TYPE_INTEGER64``,
+        ``V4L2_CTRL_TYPE_FIXED_POINT`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD``
+        is set.
     * - struct :c:type:`v4l2_area` *
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..f3995ec57044 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -235,7 +235,8 @@ See also the examples in :ref:`control`.
       - ``default_value``
       - The default value of a ``V4L2_CTRL_TYPE_INTEGER``, ``_INTEGER64``,
 	``_BOOLEAN``, ``_BITMASK``, ``_MENU``, ``_INTEGER_MENU``, ``_U8``
-	or ``_U16`` control. Not valid for other types of controls.
+	``_FIXED_POINT`` or ``_U16`` control. Not valid for other types of
+	controls.
 
 	.. note::
 
@@ -549,6 +550,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
         parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
+      - any
+      - any
+      - any
+      - A 64-bit integer valued control, containing parameter which is
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
index cf8c44595a1d..9482ac66a675 100644
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

