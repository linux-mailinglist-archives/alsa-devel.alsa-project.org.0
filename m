Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE24760AD8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 08:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20479EC1;
	Tue, 25 Jul 2023 08:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20479EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690267712;
	bh=ErXZNooESu6m/WLnIbGKfWXPXiEhNyXmySySlNyL3HU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jOdXjG4tVYMeT0lRIq/yHAwsePiYGvGanqsg9uL/I2S6xIRBX2JUAUnB2DFnEvJ2e
	 yC7KKanh4zhhRCt9wtMvRSU7ZaZkfN9KQ9vV7mHfNUWMiojxz8iESLrKvppJXYULIW
	 MrLIQTxjG339A8zdE7Lnh7dG+J9t1b5v7tpQV1zA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E0FDF802E8; Tue, 25 Jul 2023 08:46:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C373F80568;
	Tue, 25 Jul 2023 08:46:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E51CF80535; Tue, 25 Jul 2023 08:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83F96F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 08:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F96F80153
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E218B200B18;
	Tue, 25 Jul 2023 08:46:22 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7ADCF200706;
	Tue, 25 Jul 2023 08:46:22 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 90EAB1800318;
	Tue, 25 Jul 2023 14:46:20 +0800 (+08)
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
Subject: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output support
Date: Tue, 25 Jul 2023 14:12:17 +0800
Message-Id: <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 7QP6AKCJEWEDMWTO4BAEKOSWIWQHIWNK
X-Message-ID-Hash: 7QP6AKCJEWEDMWTO4BAEKOSWIWQHIWNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QP6AKCJEWEDMWTO4BAEKOSWIWQHIWNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio signal processing has the requirement for memory to
memory similar as Video.

This patch is to add this support in v4l2 framework, defined
new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
for audio case usage.

The created audio device is named "/dev/audioX".

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
 drivers/media/v4l2-core/v4l2-dev.c            | 17 ++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 52 +++++++++++++++++++
 include/media/v4l2-dev.h                      |  2 +
 include/media/v4l2-ioctl.h                    | 34 ++++++++++++
 include/uapi/linux/videodev2.h                | 19 +++++++
 6 files changed, 128 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index c7a54d82a55e..12f2be2773a2 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		requested_sizes[0] = f->fmt.meta.buffersize;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		requested_sizes[0] = f->fmt.audio.buffersize;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index f81279492682..67484f4c6eaf 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
 	bool is_meta = vdev->vfl_type == VFL_TYPE_VIDEO &&
 		       (vdev->device_caps & meta_caps);
+	bool is_audio = vdev->vfl_type == VFL_TYPE_AUDIO;
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
@@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
 	}
+	if (is_audio && is_rx) {
+		/* audio capture specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_cap);
+	} else if (is_audio && is_tx) {
+		/* audio output specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_out);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_out);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_out);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_out);
+	}
 	if (is_vbi) {
 		/* vbi specific ioctls */
 		if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
@@ -927,6 +941,9 @@ int __video_register_device(struct video_device *vdev,
 	case VFL_TYPE_TOUCH:
 		name_base = "v4l-touch";
 		break;
+	case VFL_TYPE_AUDIO:
+		name_base = "audio";
+		break;
 	default:
 		pr_err("%s called with unknown type: %d\n",
 		       __func__, type);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01ba27f2ef87..aa9d872bba8d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -188,6 +188,8 @@ const char *v4l2_type_names[] = {
 	[V4L2_BUF_TYPE_SDR_OUTPUT]         = "sdr-out",
 	[V4L2_BUF_TYPE_META_CAPTURE]       = "meta-cap",
 	[V4L2_BUF_TYPE_META_OUTPUT]	   = "meta-out",
+	[V4L2_BUF_TYPE_AUDIO_CAPTURE]      = "audio-cap",
+	[V4L2_BUF_TYPE_AUDIO_OUTPUT]	   = "audio-out",
 };
 EXPORT_SYMBOL(v4l2_type_names);
 
@@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool write_only)
 	const struct v4l2_sliced_vbi_format *sliced;
 	const struct v4l2_window *win;
 	const struct v4l2_meta_format *meta;
+	const struct v4l2_audio_format *audio;
 	u32 pixelformat;
 	u32 planes;
 	unsigned i;
@@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, bool write_only)
 		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
 			&pixelformat, meta->buffersize);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		audio = &p->fmt.audio;
+		pr_cont(", rate=%u, format=%u, channels=%u, buffersize=%u\n",
+			audio->rate, audio->format, audio->channels, audio->buffersize);
+		break;
 	}
 }
 
@@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
 	bool is_meta = vfd->vfl_type == VFL_TYPE_VIDEO &&
 		       (vfd->device_caps & meta_caps);
+	bool is_audio = vfd->vfl_type == VFL_TYPE_AUDIO;
 	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
 
@@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 		if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
 			return 0;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
+			return 0;
+		break;
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
+			return 0;
+		break;
 	default:
 		break;
 	}
@@ -1594,6 +1612,16 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 			break;
 		ret = ops->vidioc_enum_fmt_meta_out(file, fh, arg);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
+			break;
+		ret = ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
+		break;
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (unlikely(!ops->vidioc_enum_fmt_audio_out))
+			break;
+		ret = ops->vidioc_enum_fmt_audio_out(file, fh, arg);
+		break;
 	}
 	if (ret == 0)
 		v4l_fill_fmtdesc(p);
@@ -1670,6 +1698,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 		return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return ops->vidioc_g_fmt_meta_out(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return ops->vidioc_g_fmt_audio_out(file, fh, arg);
 	}
 	return -EINVAL;
 }
@@ -1781,6 +1813,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 			break;
 		memset_after(p, 0, fmt.meta);
 		return ops->vidioc_s_fmt_meta_out(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (unlikely(!ops->vidioc_s_fmt_audio_cap))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (unlikely(!ops->vidioc_s_fmt_audio_out))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_s_fmt_audio_out(file, fh, arg);
 	}
 	return -EINVAL;
 }
@@ -1889,6 +1931,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 			break;
 		memset_after(p, 0, fmt.meta);
 		return ops->vidioc_try_fmt_meta_out(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (unlikely(!ops->vidioc_try_fmt_audio_cap))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (unlikely(!ops->vidioc_try_fmt_audio_out))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_try_fmt_audio_out(file, fh, arg);
 	}
 	return -EINVAL;
 }
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index e0a13505f88d..0924e6d1dab1 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -30,6 +30,7 @@
  * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
  * @VFL_TYPE_SDR:	for Software Defined Radio tuners
  * @VFL_TYPE_TOUCH:	for touch sensors
+ * @VFL_TYPE_AUDIO:	for audio input/output devices
  * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
  */
 enum vfl_devnode_type {
@@ -39,6 +40,7 @@ enum vfl_devnode_type {
 	VFL_TYPE_SUBDEV,
 	VFL_TYPE_SDR,
 	VFL_TYPE_TOUCH,
+	VFL_TYPE_AUDIO,
 	VFL_TYPE_MAX /* Shall be the last one */
 };
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index edb733f21604..f840cf740ce1 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -45,6 +45,12 @@ struct v4l2_fh;
  * @vidioc_enum_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
  *	for metadata output
+ * @vidioc_enum_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
+ *	for audio capture
+ * @vidioc_enum_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
+ *	for audio output
  * @vidioc_g_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
@@ -79,6 +85,10 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_g_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_g_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio capture
+ * @vidioc_g_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
  * @vidioc_s_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
@@ -113,6 +123,10 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_s_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_s_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio capture
+ * @vidioc_s_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
  * @vidioc_try_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
@@ -149,6 +163,10 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_try_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_try_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio capture
+ * @vidioc_try_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio output
  * @vidioc_reqbufs: pointer to the function that implements
  *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
  * @vidioc_querybuf: pointer to the function that implements
@@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
 					struct v4l2_fmtdesc *f);
 	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
 					struct v4l2_fmtdesc *f);
+	int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f);
+	int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f);
 
 	/* VIDIOC_G_FMT handlers */
 	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
@@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
 				     struct v4l2_format *f);
 	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
 				     struct v4l2_format *f);
+	int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
+				      struct v4l2_format *f);
+	int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
+				      struct v4l2_format *f);
 
 	/* VIDIOC_S_FMT handlers */
 	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
@@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
 				     struct v4l2_format *f);
 	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
 				     struct v4l2_format *f);
+	int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
+				      struct v4l2_format *f);
+	int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
+				      struct v4l2_format *f);
 
 	/* VIDIOC_TRY_FMT handlers */
 	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
@@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
 				       struct v4l2_format *f);
 	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
 				       struct v4l2_format *f);
+	int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
+					struct v4l2_format *f);
+	int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
+					struct v4l2_format *f);
 
 	/* Buffer handlers */
 	int (*vidioc_reqbufs)(struct file *file, void *fh,
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3af6a82d0cad..e5051410928a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -153,6 +153,8 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	V4L2_BUF_TYPE_AUDIO_CAPTURE        = 15,
+	V4L2_BUF_TYPE_AUDIO_OUTPUT         = 16,
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
@@ -169,6 +171,7 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
+	 || (type) == V4L2_BUF_TYPE_AUDIO_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
 #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
@@ -2415,6 +2418,20 @@ struct v4l2_meta_format {
 	__u32				buffersize;
 } __attribute__ ((packed));
 
+/**
+ * struct v4l2_audio_format - audio data format definition
+ * @rate:		sample rate
+ * @format:		sample format
+ * @channels:		channel numbers
+ * @buffersize:		maximum size in bytes required for data
+ */
+struct v4l2_audio_format {
+	__u32				rate;
+	__u32				format;
+	__u32				channels;
+	__u32				buffersize;
+} __attribute__ ((packed));
+
 /**
  * struct v4l2_format - stream data format
  * @type:	enum v4l2_buf_type; type of the data stream
@@ -2423,6 +2440,7 @@ struct v4l2_meta_format {
  * @win:	definition of an overlaid image
  * @vbi:	raw VBI capture or output parameters
  * @sliced:	sliced VBI capture or output parameters
+ * @audio:	definition of an audio format
  * @raw_data:	placeholder for future extensions and custom formats
  * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
  *		and @raw_data
@@ -2437,6 +2455,7 @@ struct v4l2_format {
 		struct v4l2_sliced_vbi_format	sliced;  /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
 		struct v4l2_sdr_format		sdr;     /* V4L2_BUF_TYPE_SDR_CAPTURE */
 		struct v4l2_meta_format		meta;    /* V4L2_BUF_TYPE_META_CAPTURE */
+		struct v4l2_audio_format	audio;   /* V4L2_BUF_TYPE_AUDIO_CAPTURE */
 		__u8	raw_data[200];                   /* user-defined */
 	} fmt;
 };
-- 
2.34.1

