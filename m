Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D8C7F3FD4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 09:12:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023F1E74;
	Wed, 22 Nov 2023 09:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023F1E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700640777;
	bh=1/vy8yc0RAEw02wOPocJO4TrS5C92I8rPyJDiAY9dNI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WdtSZJ5BZwFj8mMb27fR/EJBfWAmT5u8mQIKeuWFYBbbpvyJgoboKPeglUOdc4p3v
	 Gkrpkz06wOMRHR00drw5EsTHMhegbkkCXLrSWClkq8i//fTy9ZslbJ1OqabQcbrU1w
	 AuYf+SfUIouwyAoUjhRUANm/KUw/ShyaRRpKgI/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D815AF806AE; Wed, 22 Nov 2023 09:11:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0710F80689;
	Wed, 22 Nov 2023 09:11:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61588F8055B; Wed, 22 Nov 2023 09:04:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 111D1F80567
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 09:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 111D1F80567
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BB0611A10DB;
	Wed, 22 Nov 2023 09:04:13 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 576D91A1662;
	Wed, 22 Nov 2023 09:04:13 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5DC45181D0E2;
	Wed, 22 Nov 2023 16:04:11 +0800 (+08)
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
Subject: [PATCH v11 13/15] media: vivid: add fixed point test controls
Date: Wed, 22 Nov 2023 15:23:56 +0800
Message-Id: <1700637838-6743-14-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 5TGFSP3HK624ABLGZ35FDUMD34JJNQQA
X-Message-ID-Hash: 5TGFSP3HK624ABLGZ35FDUMD34JJNQQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TGFSP3HK624ABLGZ35FDUMD34JJNQQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add fixed point test controls, one is for Q4.16 format
another one is for Q63 format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/media/test-drivers/vivid/vivid-core.h |  2 ++
 .../media/test-drivers/vivid/vivid-ctrls.c    | 26 +++++++++++++++++++
 include/media/v4l2-ctrls.h                    |  3 +++
 3 files changed, 31 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index cfb8e66083f6..f65465191bc9 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -222,6 +222,8 @@ struct vivid_dev {
 	struct v4l2_ctrl		*boolean;
 	struct v4l2_ctrl		*int32;
 	struct v4l2_ctrl		*int64;
+	struct v4l2_ctrl		*int32_q16;
+	struct v4l2_ctrl		*int64_q63;
 	struct v4l2_ctrl		*menu;
 	struct v4l2_ctrl		*string;
 	struct v4l2_ctrl		*bitmask;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..2444ea95b285 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -38,6 +38,8 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_INT_Q4_16		(VIVID_CID_CUSTOM_BASE + 17)
+#define VIVID_CID_INT64_Q63		(VIVID_CID_CUSTOM_BASE + 18)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -182,6 +184,28 @@ static const struct v4l2_ctrl_config vivid_ctrl_int64 = {
 	.step = 1,
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_int32_q16 = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_INT_Q4_16,
+	.name = "Integer 32 Bits Q4.16",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = v4l2_ctrl_fp_compose(-16, 0, 16),
+	.max = v4l2_ctrl_fp_compose(15, 0xffff, 16),
+	.step = 1,
+	.fraction_bits = 16,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_int64_q63 = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_INT64_Q63,
+	.name = "Integer 64 Bits Q63",
+	.type = V4L2_CTRL_TYPE_INTEGER64,
+	.min = v4l2_ctrl_fp_compose(-1, 0, 63),
+	.max = v4l2_ctrl_fp_compose(0, LLONG_MAX, 63),
+	.step = 1,
+	.fraction_bits = 63,
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U32_ARRAY,
@@ -1670,6 +1694,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->button = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_button, NULL);
 	dev->int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int32, NULL);
 	dev->int64 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int64, NULL);
+	dev->int32_q16 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int32_q16, NULL);
+	dev->int64_q63 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int64_q63, NULL);
 	dev->boolean = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_boolean, NULL);
 	dev->menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_menu, NULL);
 	dev->string = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_string, NULL);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c35514c5bf88..d18fd116238b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1593,4 +1593,7 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
  */
 int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 
+/* Composite function for integer and fractional bits */
+#define v4l2_ctrl_fp_compose(i, f, fraction_bits) (((s64)(i) << fraction_bits) + (f))
+
 #endif
-- 
2.34.1

