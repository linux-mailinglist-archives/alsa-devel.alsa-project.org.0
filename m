Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382437D0CE0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 12:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C6003E7;
	Fri, 20 Oct 2023 12:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C6003E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697796722;
	bh=AegNzgKgSGJpcOum8GanRYn3gl+Csxnc9YSA7if5DEk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Q2CpXCAuGR1rOhqt8AJCQMgvhlE9zaYNaUWMj3N/vkxnWG+VQjZHAtXlZ6pe0mKjH
	 cuUd61+EH0ZtZI0Eu+baLq0lBVpHY/ppM4jkk/3gbQ7cDW/muY/VntyfSdEW1Dddzg
	 1bNBqFAelm44nusWINyZvESedaX7mgmiQ4FZFVLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E44BF805C6; Fri, 20 Oct 2023 12:09:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB67FF805C6;
	Fri, 20 Oct 2023 12:09:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A7B0F805A9; Fri, 20 Oct 2023 12:09:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECCAEF80552
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 12:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECCAEF80552
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AD496201E8F;
	Fri, 20 Oct 2023 12:08:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D5A6201E9B;
	Fri, 20 Oct 2023 12:08:57 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 82D7E1834898;
	Fri, 20 Oct 2023 18:08:55 +0800 (+08)
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
Subject: [RFC PATCH v7 06/13] media: uapi: Add V4L2_CAP_AUDIO_M2M capability
 flag
Date: Fri, 20 Oct 2023 17:30:25 +0800
Message-Id: <1697794232-2607-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
References: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: DUUEUV2JDFMSQT26PXZN47IAHOHXFBI2
X-Message-ID-Hash: DUUEUV2JDFMSQT26PXZN47IAHOHXFBI2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUUEUV2JDFMSQT26PXZN47IAHOHXFBI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

V4L2_CAP_AUDIO_M2M is similar to V4L2_CAP_VIDEO_M2M flag.

It is used for audio memory to memory case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst    | 3 +++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 include/uapi/linux/videodev2.h                               | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 6c57b8428356..0b3cefefc86b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -259,6 +259,9 @@ specification the ioctl returns an ``EINVAL`` error code.
         video topology configuration, including which I/O entity is routed to
         the input/output, is configured by userspace via the Media Controller.
         See :ref:`media_controller`.
+    * - ``V4L2_CAP_AUDIO_M2M``
+      - 0x40000000
+      - The device supports the audio Memory-To-Memory interface.
     * - ``V4L2_CAP_DEVICE_CAPS``
       - 0x80000000
       - The driver fills the ``device_caps`` field. This capability can
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3e58aac4ef0b..da6d0b8e4c2c 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -197,6 +197,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
 replace define V4L2_CAP_IO_MC device-capabilities
+replace define V4L2_CAP_AUDIO_M2M device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3d4e490ce7c..d5da76607101 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -508,6 +508,7 @@ struct v4l2_capability {
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
 #define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+#define V4L2_CAP_AUDIO_M2M              0x40000000  /* audio memory to memory */
 
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
-- 
2.34.1

