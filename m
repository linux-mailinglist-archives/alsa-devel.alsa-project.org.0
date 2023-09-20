Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C57A78D0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 12:13:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDA3E72;
	Wed, 20 Sep 2023 12:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDA3E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695204817;
	bh=ej4c6dNQ/O5BWyGia2K6Ba0aelsNDe9yV3HOEh8spCE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NyLCTWqZCmMJ1Jz922KScnlXm7HZUrWkqxN0OrqRC9SGop0ukb+XRlba9cK4+bu+X
	 CMGUwE5xNrACIq3EyZabPCYAkHvZsUmODqd3btRz/BPVGK4pPH9cp5A6LhgMDOg/4Y
	 xGudHzh1f4cWTbpzl4Emi614jHX3e0yXjj5rUt6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB88F805EE; Wed, 20 Sep 2023 12:10:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19126F805E5;
	Wed, 20 Sep 2023 12:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D95BF800F4; Wed, 20 Sep 2023 12:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81BB9F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 12:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81BB9F800F4
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EFA6A200B75;
	Wed, 20 Sep 2023 12:10:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 893E0201BD3;
	Wed, 20 Sep 2023 12:10:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A56A1180327D;
	Wed, 20 Sep 2023 18:09:58 +0800 (+08)
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
Subject: [RFC PATCH v4 09/11] media: uapi: Add
 V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
Date: Wed, 20 Sep 2023 17:32:48 +0800
Message-Id: <1695202370-24678-10-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 3K5ZG53T25YLKDBMBCE4BA25AUXOO4SJ
X-Message-ID-Hash: 3K5ZG53T25YLKDBMBCE4BA25AUXOO4SJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3K5ZG53T25YLKDBMBCE4BA25AUXOO4SJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The input clock and output clock may not be the accurate
rate as the sample rate, there is some drift, so the convert
ratio of i.MX ASRC module need to be changed according to
actual clock rate.

Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control for user to
adjust the ratio.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/v4l/control.rst | 5 +++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 1 +
 include/uapi/linux/v4l2-controls.h                | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index 4463fce694b0..2bc175900a34 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -318,6 +318,11 @@ Control IDs
     depending on particular custom controls should check the driver name
     and version, see :ref:`querycap`.
 
+.. _v4l2-audio-imx:
+
+``V4L2_CID_USER_IMX_ASRC_RATIO_MOD``
+    sets the rasampler ratio modifier of i.MX asrc module.
+
 Applications can enumerate the available controls with the
 :ref:`VIDIOC_QUERYCTRL` and
 :ref:`VIDIOC_QUERYMENU <VIDIOC_QUERYCTRL>` ioctls, get and set a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..16f66f66198c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1242,6 +1242,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
 	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
+	case V4L2_CID_USER_IMX_ASRC_RATIO_MOD:			return "ASRC RATIO MOD";
 	default:
 		return NULL;
 	}
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c3604a0a3e30..b1c319906d12 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -162,6 +162,7 @@ enum v4l2_colorfx {
 /* The base for the imx driver controls.
  * We reserve 16 controls for this driver. */
 #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
+#define V4L2_CID_USER_IMX_ASRC_RATIO_MOD	(V4L2_CID_USER_IMX_BASE + 0)
 
 /*
  * The base for the atmel isc driver controls.
-- 
2.34.1

