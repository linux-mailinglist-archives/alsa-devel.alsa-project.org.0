Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83A81A9FD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 23:55:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C93FEB2;
	Wed, 20 Dec 2023 23:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C93FEB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703112909;
	bh=2NtuOoYqvcP3WGw/nQciMG+e8srYlg9NZdt+YVGFQ4M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uRZZoGTiEl8O0vHxzYPKV2zUh+oEJ0A+MN6+A2tjpvgjtHSZNoE9SXx3yVSJG1d5K
	 YLNeiIMdFtg6PpzOF40u27zoSQ98jfKISxO2iZqOa1vmf937/KHEMRl/RhCfj+JaAM
	 61Qab1PrwpdWvfa983hKimO/h0oJ/V+8bkWUhWyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3A71F806A5; Wed, 20 Dec 2023 23:48:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64908F89802;
	Wed, 20 Dec 2023 23:48:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04775F897A8; Wed, 20 Dec 2023 23:48:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD820F80588
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 23:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD820F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=P8qBrQVi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKM9amG029693;
	Wed, 20 Dec 2023 22:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=L2qotf6xpYYmqLwnEkW9
	ngHyZkfprz9VyYE0khXKWZA=; b=P8qBrQViITH8EHrC3aOh8uCVs//GZWxXzueP
	6tHdH1Sn/xCPPreImXbK0muh5cro03KEkC9ERR0nxbwdMoW0BpjTBrzPQsYyCVja
	FKB3wQIcDRl9TSclUEo+VSWEjImKddErW6bgsI6CWgZj2WDZpMQmQOcjK5J8NhRQ
	aadpA6VS5olatgVgtkZG3moQe/SgYTYPmQC4JMZY2yYFdcTtcTUcPOzxvmzzu/Ct
	rLJyr4HP8trrC6uIL8P3JgwRkZCIpCcWlN1ouXSD86fqQku5w6vQUhqiiBH/sscE
	Zt2On4ygS0xvQBDTCplMyG8AYkPbyYEWSIiaobNdZBmlR2bPtw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v3tmm2d5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 22:46:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BKMk3nh017756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 22:46:03 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 20 Dec 2023 14:46:03 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@linaro.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <agross@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v11 32/41] ASoC: qcom: qdsp6: Add PCM ops to track current
 state
Date: Wed, 20 Dec 2023 14:45:35 -0800
Message-ID: <20231220224544.18031-33-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220224544.18031-1-quic_wcheng@quicinc.com>
References: <20231220224544.18031-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Cv2__ddZnuM8VH6gbnDKw2Yfr42FnBRF
X-Proofpoint-ORIG-GUID: Cv2__ddZnuM8VH6gbnDKw2Yfr42FnBRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312200163
Message-ID-Hash: VKGAJVF2ROHCTE4JGEX45C3W2OWWGUAM
X-Message-ID-Hash: VKGAJVF2ROHCTE4JGEX45C3W2OWWGUAM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKGAJVF2ROHCTE4JGEX45C3W2OWWGUAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Register PCM callbacks so that the Q6USB DPCM backend dai link can track
and update the status of the PCM device.  Utilize the SOC USB state APIs to
ensure that the SND kcontrol for the offload status is updated properly.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 52 +++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index e41b83a58874..fd4da457d834 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -30,6 +30,9 @@
 struct q6usb_status {
 	struct snd_soc_usb_device *sdev;
 	unsigned int pcm_index;
+	bool prepared;
+	bool running;
+	int session_id;
 };
 
 struct q6usb_port_data {
@@ -81,14 +84,48 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	data->status[data->sel_card_idx].pcm_index = data->sel_pcm_idx;
+	data->status[data->sel_card_idx].prepared = true;
+	data->status[data->sel_card_idx].session_id =
+		snd_soc_usb_prepare_session(data->usb, data->sel_card_idx,
+						data->sel_pcm_idx);
 out:
 	mutex_unlock(&data->mutex);
 
 	return ret;
 }
 
+static int q6usb_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+
+	mutex_lock(&data->mutex);
+	data->status[data->sel_card_idx].running = true;
+	snd_soc_usb_set_session_state(data->usb,
+			data->status[data->sel_card_idx].session_id,
+			SND_SOC_USB_RUNNING);
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
+
+static void q6usb_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
+
+	mutex_lock(&data->mutex);
+	data->status[data->sel_card_idx].running = false;
+	data->status[data->sel_card_idx].prepared = false;
+	snd_soc_usb_shutdown_session(data->usb,
+			data->status[data->sel_card_idx].session_id);
+	mutex_unlock(&data->mutex);
+}
+
 static const struct snd_soc_dai_ops q6usb_ops = {
 	.hw_params = q6usb_hw_params,
+	.prepare = q6usb_prepare,
+	.shutdown = q6usb_shutdown,
 };
 
 static struct snd_soc_dai_driver q6usb_be_dais[] = {
@@ -149,10 +186,15 @@ static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
 	int pcmidx;
 	int cardidx;
 
+	mutex_lock(&data->mutex);
+
+	/* Don't allow changes to the offloading devices if session is busy */
+	if (data->sel_card_idx >= 0 && data->status[data->sel_card_idx].prepared)
+		goto out;
+
 	cardidx = ucontrol->value.integer.value[0];
 	pcmidx = ucontrol->value.integer.value[1];
 
-	mutex_lock(&data->mutex);
 	if ((cardidx >= 0 && test_bit(cardidx, &data->available_card_slot))) {
 		data->sel_card_idx = cardidx;
 		changed = 1;
@@ -203,8 +245,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
-		/* We only track the latest USB headset plugged in */
-		if (!data->idx_valid) {
+		/*
+		 * Update the latest USB headset plugged in, if session is
+		 * idle.
+		 */
+		if (!data->idx_valid &&
+			!data->status[data->sel_card_idx].prepared) {
 			data->sel_card_idx = sdev->card_idx;
 			data->sel_pcm_idx = 0;
 		}
