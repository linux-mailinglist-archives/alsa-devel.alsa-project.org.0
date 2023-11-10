Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4755F7E795A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 07:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCDCB886;
	Fri, 10 Nov 2023 07:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCDCB886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699597941;
	bh=orFywOxdN9OopyOWYpP30CxIb0Xnu67zhvSilt6JLy4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=h9w+c5of7WC3/pu6BYSin2LC36Hj1lxVkGib9RifMGaxOttJXnjBevNXFBGZuuhxo
	 qVqcnkXRl4ml3uMi2kHCNZn23nLVfUG3YVbc28KaB8rxP+g6gi+SeZaa7kiaXThuMF
	 k64fOb47u0MrrsB98lTAn3mwWm7LJ1moHJW2U2iE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BFB8F8057E; Fri, 10 Nov 2023 07:31:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24863F80570;
	Fri, 10 Nov 2023 07:31:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE3FAF80564; Fri, 10 Nov 2023 07:28:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B4A7F80431
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 07:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B4A7F80431
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 128A9201C4A;
	Fri, 10 Nov 2023 07:28:01 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CE7CD201C54;
	Fri, 10 Nov 2023 07:28:00 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id CB548183AD50;
	Fri, 10 Nov 2023 14:27:58 +0800 (+08)
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
Subject: [PATCH v9 06/15] media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
Date: Fri, 10 Nov 2023 13:48:00 +0800
Message-Id: <1699595289-25773-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 3Q7QJDAVC2OFCHLINIML6DKT6QQQVH3P
X-Message-ID-Hash: 3Q7QJDAVC2OFCHLINIML6DKT6QQQVH3P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Q7QJDAVC2OFCHLINIML6DKT6QQQVH3P/>
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
index 6c57b8428356..1c0d97bf192a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -173,6 +173,9 @@ specification the ioctl returns an ``EINVAL`` error code.
 	interface. A video overlay device typically stores captured images
 	directly in the video memory of a graphics card, with hardware
 	clipping and scaling.
+    * - ``V4L2_CAP_AUDIO_M2M``
+      - 0x00000008
+      - The device supports the audio Memory-To-Memory interface.
     * - ``V4L2_CAP_VBI_CAPTURE``
       - 0x00000010
       - The device supports the :ref:`Raw VBI Capture <raw-vbi>`
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
index c3d4e490ce7c..5053f66c501a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -473,6 +473,7 @@ struct v4l2_capability {
 #define V4L2_CAP_VIDEO_CAPTURE		0x00000001  /* Is a video capture device */
 #define V4L2_CAP_VIDEO_OUTPUT		0x00000002  /* Is a video output device */
 #define V4L2_CAP_VIDEO_OVERLAY		0x00000004  /* Can do video overlay */
+#define V4L2_CAP_AUDIO_M2M		0x00000008  /* audio memory to memory */
 #define V4L2_CAP_VBI_CAPTURE		0x00000010  /* Is a raw VBI capture device */
 #define V4L2_CAP_VBI_OUTPUT		0x00000020  /* Is a raw VBI output device */
 #define V4L2_CAP_SLICED_VBI_CAPTURE	0x00000040  /* Is a sliced VBI capture device */
-- 
2.34.1

