Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468AA96F0F7
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 12:06:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35EAE85;
	Fri,  6 Sep 2024 12:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35EAE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725617180;
	bh=jUu/gw9EyeaLrWHEIcS7oVbSQyZEBWsLMRaM9p5I8zY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NMV7t/k7QzEl4fNWosfiUlOqnYnDe+aXL3y02VlW8trZBAKSw6zG49Z2vqMjrOJLL
	 5jhJJRhKZx2gYAXoeS+PQtKToDTwJ3hSTHO2rxejyc+qzOEXcaeRuZvyYm+nm34T4N
	 RHuUOmgbDolPz4kFTyiYuXS+ZNc0Av96WsXEntSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91EABF805DA; Fri,  6 Sep 2024 12:05:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9B9F805D6;
	Fri,  6 Sep 2024 12:05:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45583F805C0; Fri,  6 Sep 2024 12:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98DE0F805B6
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 12:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98DE0F805B6
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 43FE5201072;
	Fri,  6 Sep 2024 12:05:36 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 082B6201073;
	Fri,  6 Sep 2024 12:05:36 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E1475180031E;
	Fri,  6 Sep 2024 18:05:30 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 1/6] ALSA: compress: Add output rate and output format
 support
Date: Fri,  6 Sep 2024 17:43:52 +0800
Message-Id: <1725615837-24872-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
References: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: WZOQ54SWEVGOSWUPL2CXPIPGNRIJZXIY
X-Message-ID-Hash: WZOQ54SWEVGOSWUPL2CXPIPGNRIJZXIY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZOQ54SWEVGOSWUPL2CXPIPGNRIJZXIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
struct snd_codec_desc, these are used for accelerator usage.

Current accelerator example is sample rate converter (SRC).
Define struct snd_codec_desc_src for descript minmum and maxmum
sample rates. And add 'src_d' in union snd_codec_options
structure. These are mainly used for capbility query.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/uapi/sound/compress_params.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bc7648a30746 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
@@ -347,6 +355,9 @@ union snd_codec_options {
  * @modes: Supported modes. See SND_AUDIOMODE defines
  * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
  * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent data)
  * @reserved: reserved for future use
  *
  * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +381,12 @@ struct snd_codec_desc {
 	__u32 modes;
 	__u32 formats;
 	__u32 min_buffer;
-	__u32 reserved[15];
+	__u32 pcm_formats;
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec
@@ -395,6 +411,8 @@ struct snd_codec_desc {
  * @align: Block alignment in bytes of an audio sample.
  *		Only required for PCM or IEC formats.
  * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
  * @reserved: reserved for future use
  */
 
@@ -411,7 +429,8 @@ struct snd_codec {
 	__u32 format;
 	__u32 align;
 	union snd_codec_options options;
-	__u32 reserved[3];
+	__u32 pcm_format;
+	__u32 reserved[2];
 } __attribute__((packed, aligned(4)));
 
 #endif
-- 
2.34.1

