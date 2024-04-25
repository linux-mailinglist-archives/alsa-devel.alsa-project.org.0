Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703158B2C75
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 00:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA90F1518;
	Fri, 26 Apr 2024 00:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA90F1518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082507;
	bh=c9cBIvB9gJ0iRjmdwjmxFBq3GIAlsGXKejPSwin0vYg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M2rnAc5tmUFM6D8TayBxw0eOqYwaRdHT0eA0veqE58U3B2/b1SoH84FYiHxKHqPNG
	 kjIBXyamtMNR3gfhtHlYaRIwYC9OnLevI+BdAJq6NhXnVpskSZ+ISFdiSfg9or4FC7
	 nxTnr5g5gMVoz7w6kiMFc5ct+JEHh8Qti6huGbcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB43AF897B6; Thu, 25 Apr 2024 23:54:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C69AF80602;
	Thu, 25 Apr 2024 23:54:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7312F8067C; Thu, 25 Apr 2024 23:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D64CF805AF
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 23:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D64CF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=lRUPpFq1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43PL8Sv7004910;
	Thu, 25 Apr 2024 21:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=TpwOAfyqOPAgZ/VwWPB8
	5gMdXpP36sPB+y45fk5KoPQ=; b=lRUPpFq1BWjmDUP6BzD9Fvz3f/2CxYKRSR/c
	B4X28sdl524SyDZJn0eA2fcwc6BCU8AyeBF0sSlAYtA9ltMVtBptB04uM/hLcr/N
	p333DROi4MYxLs6zJp4BgAfSAQNwXZnANbRy4IuG1a11RGnF5RFFvDDZFW66Wgyg
	LG8MowbjEWHS3rjXEKlVcZ68law26oqcnwQGF4dvKyi8xzg3ALg221B8py21r7vF
	SjcJmTaCanX13fDzOrR7mEeVQulnxQQZEQKHgemuTlXZ+ovlf3xUL727rzG/3hon
	WY0aqU2DR3kCZGkub4zja2kOwFdc04h+SzaA2E/G1Aj6nYD7dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenh3s64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43PLph3L008032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:43 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 14:51:43 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v20 24/41] ALSA: usb-audio: Prevent starting of audio stream
 if in use
Date: Thu, 25 Apr 2024 14:51:08 -0700
Message-ID: <20240425215125.29761-25-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240425215125.29761-1-quic_wcheng@quicinc.com>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nrJa8qm33rFcxlrClhMUE6sJVbutxsGG
X-Proofpoint-GUID: nrJa8qm33rFcxlrClhMUE6sJVbutxsGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250159
Message-ID-Hash: RJIHSJ6CBT66CZVUVGL4P6ZLQNZSK4VC
X-Message-ID-Hash: RJIHSJ6CBT66CZVUVGL4P6ZLQNZSK4VC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJIHSJ6CBT66CZVUVGL4P6ZLQNZSK4VC/>
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
 sound/usb/card.h |  1 +
 sound/usb/pcm.c  | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index d66cc0b139af..3c900e5afbce 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -165,6 +165,7 @@ struct snd_usb_substream {
 	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
 	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
+	unsigned int opened:1;		/* pcm device opened */
 	unsigned int running: 1;	/* running status */
 	unsigned int period_elapsed_pending;	/* delay period handling */
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 3adb09ce1702..3e6d33de6ce6 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1241,8 +1241,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
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
+	subs->opened = 1;
+	mutex_unlock(&chip->mutex);
+
 	runtime->hw = snd_usb_hardware;
 	/* need an explicit sync to catch applptr update in low-latency mode */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -1259,13 +1268,23 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 
 	ret = setup_hw_info(runtime, subs);
 	if (ret < 0)
-		return ret;
+		goto err_open;
 	ret = snd_usb_autoresume(subs->stream->chip);
 	if (ret < 0)
-		return ret;
+		goto err_open;
 	ret = snd_media_stream_init(subs, as->pcm, direction);
 	if (ret < 0)
-		snd_usb_autosuspend(subs->stream->chip);
+		goto err_resume;
+
+	return 0;
+
+err_resume:
+	snd_usb_autosuspend(subs->stream->chip);
+err_open:
+	mutex_lock(&chip->mutex);
+	subs->opened = 0;
+	mutex_unlock(&chip->mutex);
+
 	return ret;
 }
 
@@ -1274,6 +1293,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 	int direction = substream->stream;
 	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
 	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
 	snd_media_stop_pipeline(subs);
@@ -1287,6 +1307,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	subs->pcm_substream = NULL;
 	snd_usb_autosuspend(subs->stream->chip);
+	mutex_lock(&chip->mutex);
+	subs->opened = 0;
+	mutex_unlock(&chip->mutex);
 
 	return 0;
 }
