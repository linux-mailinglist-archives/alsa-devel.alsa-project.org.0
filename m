Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823DA964F7F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 21:44:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF951E7F;
	Thu, 29 Aug 2024 21:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF951E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724960665;
	bh=J1svPEIffxJD2IJa5lWQ/KFyWo46tR5p6hGuj44588U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSr1VH9/EJOmmpaIpD+SoYRME5yZBzJ7MYJHzCgFUuvTynkZXWpJvqgpEVkQxUBEU
	 I3dxSY0vX7H7HSDmLsjNEcLrLg71LJMMk1YZRyBKCVH0Q3OYcnYVzBJ7whMaOzvRkb
	 5vPD9NQP2ulGcVVLJ1N43iiVXRiEzJzVe1k8Ejns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E394F806E1; Thu, 29 Aug 2024 21:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 081FCF806D4;
	Thu, 29 Aug 2024 21:42:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B819AF80603; Thu, 29 Aug 2024 21:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 673CAF80589
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 21:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673CAF80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=N+KwBr9T
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47TH5EAk001073;
	Thu, 29 Aug 2024 19:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1RSOvuBUkgY2fh6KVJExP7DX9MIqpliyqr6fSmzzPs=; b=N+KwBr9TxgOekZWb
	XB7+JF+GkvRgFvaGh1lJGGlBn0w0G1Km/ofc8KbbUER99Ag+vust0AZxnaQvKo1D
	ViGZJKm7gZtTQeIGuYvZhe2154hIWNBY7QqfOuFHgWqwgLO1AyHJ2zSyoPLjprnM
	yJ8EV6G8vA1HQOAFH8dZkVX97bsTauAPN4w/Ko/d38pyZY0vBFDCv2XK2eUTYpmM
	t87o47OrGhd9VZNX2K40cAyiepo6eJNuYnqCpWIqOPSiIoNPIN6b0EXMYjY0xAQh
	JmDoC7lORycNIIledKS7WIX519MiEfm+Y5unteaOPA1IBcqXToHGaWrRl/xzpU0D
	lH2v5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw6gm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47TJfRum019305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:27 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:26 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 10/33] ALSA: usb-audio: Export USB SND APIs for modules
Date: Thu, 29 Aug 2024 12:40:42 -0700
Message-ID: <20240829194105.1504814-11-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TADTKQNExF8fH_VSiI_ZGkfWZ2WIPTeZ
X-Proofpoint-GUID: TADTKQNExF8fH_VSiI_ZGkfWZ2WIPTeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290139
Message-ID-Hash: R6MXIXYK3RFV2NFXAN3XZXWVHQAPOXHJ
X-Message-ID-Hash: R6MXIXYK3RFV2NFXAN3XZXWVHQAPOXHJ
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6MXIXYK3RFV2NFXAN3XZXWVHQAPOXHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some vendor modules will utilize useful parsing and endpoint management
APIs to start audio playback/capture.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c     |  4 +++
 sound/usb/endpoint.c |  1 +
 sound/usb/helper.c   |  1 +
 sound/usb/pcm.c      | 75 +++++++++++++++++++++++++++++++-------------
 sound/usb/pcm.h      | 11 +++++++
 5 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index bdb04fa37a71..c6d9d8d548b4 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1022,6 +1022,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
 		wake_up(&chip->shutdown_wait);
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
 
 /* autosuspend and unlock the shutdown */
 void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
@@ -1030,6 +1031,7 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
 	if (atomic_dec_and_test(&chip->usage_count))
 		wake_up(&chip->shutdown_wait);
 }
+EXPORT_SYMBOL_GPL(snd_usb_unlock_shutdown);
 
 int snd_usb_autoresume(struct snd_usb_audio *chip)
 {
@@ -1052,6 +1054,7 @@ int snd_usb_autoresume(struct snd_usb_audio *chip)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_autoresume);
 
 void snd_usb_autosuspend(struct snd_usb_audio *chip)
 {
@@ -1065,6 +1068,7 @@ void snd_usb_autosuspend(struct snd_usb_audio *chip)
 	for (i = 0; i < chip->num_interfaces; i++)
 		usb_autopm_put_interface(chip->intf[i]);
 }
+EXPORT_SYMBOL_GPL(snd_usb_autosuspend);
 
 static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 {
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8f65349a06d3..9876abb80853 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1513,6 +1513,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	mutex_unlock(&chip->mutex);
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_endpoint_prepare);
 
 /* get the current rate set to the given clock by any endpoint */
 int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index bf80e55d013a..4322ae3738e6 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -62,6 +62,7 @@ void *snd_usb_find_csint_desc(void *buffer, int buflen, void *after, u8 dsubtype
 	}
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(snd_usb_find_csint_desc);
 
 /*
  * Wrapper for usb_control_msg().
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 08bf535ed163..18467da6fd9e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -148,6 +148,16 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
 	return found;
 }
 
+const struct audioformat *
+snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+		    unsigned int rate, unsigned int channels, bool strict_match,
+		    struct snd_usb_substream *subs)
+{
+	return find_format(fmt_list_head, format, rate, channels, strict_match,
+			subs);
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_format);
+
 static const struct audioformat *
 find_substream_format(struct snd_usb_substream *subs,
 		      const struct snd_pcm_hw_params *params)
@@ -157,6 +167,14 @@ find_substream_format(struct snd_usb_substream *subs,
 			   true, subs);
 }
 
+const struct audioformat *
+snd_usb_find_substream_format(struct snd_usb_substream *subs,
+			      const struct snd_pcm_hw_params *params)
+{
+	return find_substream_format(subs, params);
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_substream_format);
+
 bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 {
 	const struct audioformat *fp;
@@ -461,20 +479,9 @@ static void close_endpoints(struct snd_usb_audio *chip,
 	}
 }
 
-/*
- * hw_params callback
- *
- * allocate a buffer and set the given audio format.
- *
- * so far we use a physically linear buffer although packetize transfer
- * doesn't need a continuous area.
- * if sg buffer is supported on the later version of alsa, we'll follow
- * that.
- */
-static int snd_usb_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
+int snd_usb_hw_params(struct snd_usb_substream *subs,
+		      struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fmt;
 	const struct audioformat *sync_fmt;
@@ -499,7 +506,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (fmt->implicit_fb) {
 		sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
 								hw_params,
-								!substream->stream,
+								!subs->direction,
 								&sync_fixed_rate);
 		if (!sync_fmt) {
 			usb_audio_dbg(chip,
@@ -579,15 +586,28 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_usb_hw_params);
 
 /*
- * hw_free callback
+ * hw_params callback
  *
- * reset the audio format and release the buffer
+ * allocate a buffer and set the given audio format.
+ *
+ * so far we use a physically linear buffer although packetize transfer
+ * doesn't need a continuous area.
+ * if sg buffer is supported on the later version of alsa, we'll follow
+ * that.
  */
-static int snd_usb_hw_free(struct snd_pcm_substream *substream)
+static int snd_usb_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+
+	return snd_usb_hw_params(subs, hw_params);
+}
+
+int snd_usb_hw_free(struct snd_usb_substream *subs)
+{
 	struct snd_usb_audio *chip = subs->stream->chip;
 
 	snd_media_stop_pipeline(subs);
@@ -603,6 +623,19 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_hw_free);
+
+/*
+ * hw_free callback
+ *
+ * reset the audio format and release the buffer
+ */
+static int snd_usb_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_usb_substream *subs = substream->runtime->private_data;
+
+	return snd_usb_hw_free(subs);
+}
 
 /* free-wheeling mode? (e.g. dmix) */
 static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
@@ -1746,8 +1779,8 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 static const struct snd_pcm_ops snd_usb_playback_ops = {
 	.open =		snd_usb_pcm_open,
 	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_playback_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
@@ -1758,8 +1791,8 @@ static const struct snd_pcm_ops snd_usb_playback_ops = {
 static const struct snd_pcm_ops snd_usb_capture_ops = {
 	.open =		snd_usb_pcm_open,
 	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_capture_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 388fe2ba346d..c096021adb2b 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -15,4 +15,15 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
 int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 				    struct audioformat *fmt);
 
+const struct audioformat *
+snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+		    unsigned int rate, unsigned int channels, bool strict_match,
+		    struct snd_usb_substream *subs);
+const struct audioformat *
+snd_usb_find_substream_format(struct snd_usb_substream *subs,
+			      const struct snd_pcm_hw_params *params);
+
+int snd_usb_hw_params(struct snd_usb_substream *subs,
+		      struct snd_pcm_hw_params *hw_params);
+int snd_usb_hw_free(struct snd_usb_substream *subs);
 #endif /* __USBAUDIO_PCM_H */
