Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226B17E9B92
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:57:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3821CDF0;
	Mon, 13 Nov 2023 12:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3821CDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876661;
	bh=uGp62FVsvxNikJr4Eu9eqvDDo2AKTI4jlIp/QWLOBIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eIeQlOdXx3VlpAfGN1exJi2a+v2OtyBGob/0V6kK6AIwXT2Z2/WkJeneR+OqZygwr
	 I7HWYQqeShjeXEdy+YRFxORKRHqSJyi/4T64JXNXDGeLagYaseZrRKqNv5jr7wknQR
	 8CLzRN/MiBPDR6XGqFD02pYrfV2COFXUcF56llUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84823F805C8; Mon, 13 Nov 2023 12:55:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C38D2F805C4;
	Mon, 13 Nov 2023 12:55:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BD2F8055A; Mon, 13 Nov 2023 11:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4969CF801D5
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4969CF801D5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97AD760DE9;
	Mon, 13 Nov 2023 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2FBC433C7;
	Mon, 13 Nov 2023 10:22:11 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/8] v4l-utils: common: add v4l-audio support
Date: Mon, 13 Nov 2023 11:18:44 +0100
Message-ID: 
 <266ef16e47abee5b13754324cc99943d73e38245.1699870530.git.hverkuil-cisco@xs4all.nl>
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
Message-ID-Hash: WU3ZOOU5IHGRQ6GB3BP56MUIAKP7AFVV
X-Message-ID-Hash: WU3ZOOU5IHGRQ6GB3BP56MUIAKP7AFVV
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:54:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WU3ZOOU5IHGRQ6GB3BP56MUIAKP7AFVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The media/v4l2-info sources now understand the new Audio types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/common/media-info.cpp | 3 +++
 utils/common/media-info.h   | 1 +
 utils/common/v4l2-info.cpp  | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 95e4c74f..060e8b64 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -44,6 +44,7 @@ static constexpr struct {
 	{ "swradio", MEDIA_TYPE_SDR },
 	{ "v4l-subdev", MEDIA_TYPE_SUBDEV },
 	{ "v4l-touch", MEDIA_TYPE_TOUCH },
+	{ "v4l-audio", MEDIA_TYPE_AUDIO },
 	{ "media", MEDIA_TYPE_MEDIA },
 	{ "frontend", MEDIA_TYPE_DVB_FRONTEND },
 	{ "demux", MEDIA_TYPE_DVB_DEMUX },
@@ -280,6 +281,7 @@ static constexpr flag_def interface_types_def[] = {
 	{ MEDIA_INTF_T_V4L_SUBDEV, "V4L Sub-Device" },
 	{ MEDIA_INTF_T_V4L_SWRADIO, "V4L Software Defined Radio" },
 	{ MEDIA_INTF_T_V4L_TOUCH, "V4L Touch" },
+	{ MEDIA_INTF_T_V4L_AUDIO, "V4L Audio" },
 
 	{ MEDIA_INTF_T_ALSA_PCM_CAPTURE, "ALSA PCM Capture" },
 	{ MEDIA_INTF_T_ALSA_PCM_PLAYBACK, "ALSA PCM Playback" },
@@ -335,6 +337,7 @@ static constexpr flag_def entity_functions_def[] = {
 	{ MEDIA_ENT_F_PROC_VIDEO_DECODER, "Video Decoder" },
 	{ MEDIA_ENT_F_PROC_VIDEO_ENCODER, "Video Encoder" },
 	{ MEDIA_ENT_F_PROC_VIDEO_ISP, "Image Signal Processor" },
+	{ MEDIA_ENT_F_PROC_AUDIO_RESAMPLER, "Audio Resampler" },
 	{ MEDIA_ENT_F_VID_MUX, "Video Muxer" },
 	{ MEDIA_ENT_F_VID_IF_BRIDGE, "Video Interface Bridge" },
 	{ 0, nullptr }
diff --git a/utils/common/media-info.h b/utils/common/media-info.h
index a862b70b..578040b4 100644
--- a/utils/common/media-info.h
+++ b/utils/common/media-info.h
@@ -14,6 +14,7 @@ enum media_type {
 	MEDIA_TYPE_RADIO,
 	MEDIA_TYPE_SDR,
 	MEDIA_TYPE_TOUCH,
+	MEDIA_TYPE_AUDIO,
 	MEDIA_TYPE_SUBDEV,
 	MEDIA_TYPE_DVB_FRONTEND,
 	MEDIA_TYPE_DVB_DEMUX,
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 4f8c2aa7..00de69ae 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -97,6 +97,8 @@ static std::string cap2s(unsigned cap)
 		s += "\t\tExtended Pix Format\n";
 	if (cap & V4L2_CAP_DEVICE_CAPS)
 		s += "\t\tDevice Capabilities\n";
+	if (cap & V4L2_CAP_AUDIO_M2M)
+		s += "\t\tAudio Memory-to-Memory\n";
 	return s;
 }
 
@@ -191,6 +193,10 @@ std::string buftype2s(int type)
 		return "Metadata Capture";
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return "Metadata Output";
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		return "Audio Capture";
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return "Audio Output";
 	case V4L2_BUF_TYPE_PRIVATE:
 		return "Private";
 	default:
-- 
2.42.0

