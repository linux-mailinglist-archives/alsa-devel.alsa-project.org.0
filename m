Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1D7E9BA3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:58:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7FB850;
	Mon, 13 Nov 2023 12:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7FB850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876701;
	bh=ya5Av2A9lM9UOpq1HoA4ESVhIjREWU3565xQjoHfShU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gxj3/zWZ2dzpZuUR1bcXwZO04sOEUqfltAnCztr6Toj3sgliGDab5yEVF/RlZFeRY
	 LKRonMnMBYF9aNAsX6orou2p+umkPJNnmvmB0VRUfZgiGbk5VH7W79Vli7cDch+qeE
	 Qt/q6ATa0UGz0YZIBj3cI1VjTMOjXg247F5F7fzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFABEF80570; Mon, 13 Nov 2023 12:57:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D32F802E8;
	Mon, 13 Nov 2023 12:57:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E3BF80551; Mon, 13 Nov 2023 11:22:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B5C6F8022B
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5C6F8022B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CC4F60DE8;
	Mon, 13 Nov 2023 10:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01175C433C8;
	Mon, 13 Nov 2023 10:22:09 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/8] v4l-utils: add v4l-audio support to helper headers
Date: Mon, 13 Nov 2023 11:18:43 +0100
Message-ID: 
 <6551a96a857c767160ec8a01301583c450c3b7e0.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: 
 <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
References: 
 <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: SRS0=a+Jp=G2=xs4all.nl=hverkuil-cisco@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZF3NAW5NTDHOEG42GKZ7E2MZO5YZJ3EY
X-Message-ID-Hash: ZF3NAW5NTDHOEG42GKZ7E2MZO5YZJ3EY
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF3NAW5NTDHOEG42GKZ7E2MZO5YZJ3EY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add v4l-audio support to helper headers.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/common/cv4l-helpers.h |  7 ++++++
 utils/common/v4l-helpers.h  | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 91a04146..235368ec 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -78,6 +78,13 @@ public:
 	bool has_rds_out() const { return v4l_has_rds_out(this); }
 	bool has_sdr_cap() const { return v4l_has_sdr_cap(this); }
 	bool has_sdr_out() const { return v4l_has_sdr_out(this); }
+	bool has_touch() const { return v4l_has_touch(this); }
+	bool has_meta_cap() const { return v4l_has_meta_cap(this); }
+	bool has_meta_out() const { return v4l_has_meta_out(this); }
+	bool has_audio_cap() const { return v4l_has_audio_cap(this); }
+	bool has_audio_out() const { return v4l_has_audio_out(this); }
+	bool has_audio_m2m() const { return v4l_has_audio_m2m(this); }
+	bool has_m2m() const { return v4l_has_m2m(this); }
 	bool has_hwseek() const { return v4l_has_hwseek(this); }
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index f8e96d58..a01b3e48 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -404,6 +404,26 @@ static inline bool v4l_has_touch(const struct v4l_fd *f)
 	return v4l_g_caps(f) & V4L2_CAP_TOUCH;
 }
 
+static inline bool v4l_has_audio_cap(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_audio_out(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_audio_m2m(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_m2m(const struct v4l_fd *f)
+{
+	return v4l_has_vid_m2m(f) || v4l_has_audio_m2m(f);
+}
+
 static inline bool v4l_has_hwseek(const struct v4l_fd *f)
 {
 	return v4l_g_caps(f) & V4L2_CAP_HW_FREQ_SEEK;
@@ -449,6 +469,10 @@ static inline __u32 v4l_determine_type(const struct v4l_fd *f)
 		return V4L2_BUF_TYPE_META_CAPTURE;
 	if (v4l_has_meta_out(f))
 		return V4L2_BUF_TYPE_META_OUTPUT;
+	if (v4l_has_audio_cap(f))
+		return V4L2_BUF_TYPE_AUDIO_CAPTURE;
+	if (v4l_has_audio_out(f))
+		return V4L2_BUF_TYPE_AUDIO_OUTPUT;
 
 	return 0;
 }
@@ -701,6 +725,10 @@ static inline void v4l_format_s_pixelformat(struct v4l2_format *fmt, __u32 pixel
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		fmt->fmt.meta.dataformat = pixelformat;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		fmt->fmt.audio.audioformat = pixelformat;
+		break;
 	}
 }
 
@@ -722,6 +750,9 @@ static inline __u32 v4l_format_g_pixelformat(const struct v4l2_format *fmt)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return fmt->fmt.meta.dataformat;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return fmt->fmt.audio.audioformat;
 	default:
 		return 0;
 	}
@@ -1063,6 +1094,9 @@ v4l_format_g_sizeimage(const struct v4l2_format *fmt, unsigned plane)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return plane ? 0 : fmt->fmt.meta.buffersize;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return plane ? 0 : fmt->fmt.audio.buffersize;
 	default:
 		return 0;
 	}
@@ -1187,12 +1221,22 @@ static inline bool v4l_type_is_meta(unsigned type)
 	       type == V4L2_BUF_TYPE_META_OUTPUT;
 }
 
+static inline bool v4l_type_is_audio(unsigned type)
+{
+	return type == V4L2_BUF_TYPE_AUDIO_CAPTURE ||
+	       type == V4L2_BUF_TYPE_AUDIO_OUTPUT;
+}
+
 static inline unsigned v4l_type_invert(unsigned type)
 {
 	if (v4l_type_is_planar(type))
 		return v4l_type_is_output(type) ?
 			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
 			V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	if (v4l_type_is_audio(type))
+		return v4l_type_is_output(type) ?
+			V4L2_BUF_TYPE_AUDIO_CAPTURE :
+			V4L2_BUF_TYPE_AUDIO_OUTPUT;
 	return v4l_type_is_output(type) ?
 		V4L2_BUF_TYPE_VIDEO_CAPTURE :
 		V4L2_BUF_TYPE_VIDEO_OUTPUT;
-- 
2.42.0

