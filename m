Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DE7CCD77
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 22:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DCAE7F;
	Tue, 17 Oct 2023 22:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DCAE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697573135;
	bh=B5qewDDfZHGEiNDsCtPpnJsdl5SXeiTNnLgu9uOCb8I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QRewy+Uo7BKraPc1SyFnWpyX2DsCtMJzr1fHbZUJPT1b4KdfT+u/+If0Rhen0N2z4
	 U9bM6iFO/hJ2Q4PhCHkhh20tsBIH56jNDg65C6cqcdAaWene4kKTtD2+PFRsJmDgrS
	 L0Ej57mmdmONeoq+lgW6HEEhbawpq9EEgeA5QPBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDCA6F80610; Tue, 17 Oct 2023 22:02:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25679F80610;
	Tue, 17 Oct 2023 22:02:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7EB2F80600; Tue, 17 Oct 2023 22:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CD64F80564
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 22:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD64F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=dPcvQuaB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39HJx01M026011;
	Tue, 17 Oct 2023 20:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=vKvZJ8/paUyTbfzmfvENqjgOyObTZWvthersPXfiBAM=;
 b=dPcvQuaBHrfH2w1ba2Rz1Fr/UxWN7ezhYuqIYV67xiQBXQkpA+M71otIDb8vGjy7/Ofv
 JeMxAJdM9+2l22XQrPF3F2LNXLk8OKLOAGINJUQrMFOST8YNYF1iADaC63Rhyyk3Y75i
 MabLrWvzhhp6YR9+IBixee4n55C+9mVkHoCwvYHQUWF1moEw0t1X2GnSQfe8Fxn2kTVk
 G1JA8QXIcMZGjs6KPkd5Q5eqIGapE3VBCx934X6R5Vn74Ai4m1wz9Kr+iIIp1vhOOeS2
 MMf9p1dd0Uv/mAXQcNpDLs5c+6j+3bWXcEoQHRXhmD8lKeqXEXZkfC4C1GBy68K+YmGN oA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsnej9qj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 20:01:27 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39HK1Qcb027382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 20:01:26 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 17 Oct 2023 13:01:26 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v9 23/34] ALSA: usb-audio: Prevent starting of audio stream if
 in use
Date: Tue, 17 Oct 2023 13:00:58 -0700
Message-ID: <20231017200109.11407-24-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231017200109.11407-1-quic_wcheng@quicinc.com>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _qNx3be26sCbGbS-TINJy7LtsZG3Buau
X-Proofpoint-ORIG-GUID: _qNx3be26sCbGbS-TINJy7LtsZG3Buau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=995
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170169
Message-ID-Hash: OBGD5LAN2ESVCLXQP5V6MZFSNC7MB3CZ
X-Message-ID-Hash: OBGD5LAN2ESVCLXQP5V6MZFSNC7MB3CZ
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBGD5LAN2ESVCLXQP5V6MZFSNC7MB3CZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With USB audio offloading, an audio session is started from the ASoC
platform sound card and PCM devices.  Likewise, the USB SND path is still
readily available for use, in case the non-offload path is desired.  In
order to prevent the two entities from attempting to use the USB bus,
introduce a flag that determines when either paths are in use.

If a PCM device is already in use, the check will return an error to
userspace notifying that the stream is currently busy.  This ensures that
only one path is using the USB substream.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.h                  |  1 +
 sound/usb/pcm.c                   | 19 +++++++++++++++++--
 sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index e26292363cf0..01f7e10f30f4 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -164,6 +164,7 @@ struct snd_usb_substream {
 	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
 	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
+	unsigned int opened:1;		/* pcm device opened */
 	unsigned int running: 1;	/* running status */
 	unsigned int period_elapsed_pending;	/* delay period handling */
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 3adb09ce1702..c2cb52cd5d23 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1241,8 +1241,15 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
+	mutex_lock(&chip->mutex);
+	if (subs->opened) {
+		mutex_unlock(&chip->mutex);
+		return -EBUSY;
+	}
+
 	runtime->hw = snd_usb_hardware;
 	/* need an explicit sync to catch applptr update in low-latency mode */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -1259,13 +1266,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 
 	ret = setup_hw_info(runtime, subs);
 	if (ret < 0)
-		return ret;
+		goto out;
 	ret = snd_usb_autoresume(subs->stream->chip);
 	if (ret < 0)
-		return ret;
+		goto out;
 	ret = snd_media_stream_init(subs, as->pcm, direction);
 	if (ret < 0)
 		snd_usb_autosuspend(subs->stream->chip);
+	subs->opened = 1;
+out:
+	mutex_unlock(&chip->mutex);
+
 	return ret;
 }
 
@@ -1274,6 +1285,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 	int direction = substream->stream;
 	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
 	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
 	snd_media_stop_pipeline(subs);
@@ -1287,6 +1299,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	subs->pcm_substream = NULL;
 	snd_usb_autosuspend(subs->stream->chip);
+	mutex_lock(&chip->mutex);
+	subs->opened = 0;
+	mutex_unlock(&chip->mutex);
 
 	return 0;
 }
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 320ce3a6688f..bd6b84f72c74 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1413,12 +1413,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		goto response;
 	}
 
+	mutex_lock(&chip->mutex);
 	if (req_msg->enable) {
-		if (info_idx < 0 || chip->system_suspend) {
+		if (info_idx < 0 || chip->system_suspend || subs->opened) {
 			ret = -EBUSY;
+			mutex_unlock(&chip->mutex);
+
 			goto response;
 		}
+		subs->opened = 1;
 	}
+	mutex_unlock(&chip->mutex);
 
 	if (req_msg->service_interval_valid) {
 		ret = get_data_interval_from_si(subs,
@@ -1440,6 +1445,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,
 					info_idx);
+		if (ret < 0) {
+			mutex_lock(&chip->mutex);
+			subs->opened = 0;
+			mutex_unlock(&chip->mutex);
+		}
 	} else {
 		info = &uadev[pcm_card_num].info[info_idx];
 		if (info->data_ep_pipe) {
@@ -1463,6 +1473,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		}
 
 		disable_audio_stream(subs);
+		mutex_lock(&chip->mutex);
+		subs->opened = 0;
+		mutex_unlock(&chip->mutex);
 	}
 
 response:
