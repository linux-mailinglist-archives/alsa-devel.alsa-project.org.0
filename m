Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0E8B2BDD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 23:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2195310BE;
	Thu, 25 Apr 2024 23:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2195310BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714082357;
	bh=dtH+XypTk/Dtwesx70WStgcYULhuLJpaBE5SqAaS+wg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pdzV+5Esik7MoZtwnStbYHG9mAZAJh+G1uukUsYkJ5k3qJVP230caFRn8oR2rbJEw
	 UL4P4mN+fyI7OZnEd7x9x1PF89GwVKPbsia63K+k0FqeXKKtt3/jxqIiGB3bQc5oHk
	 jm575p7Y2ce0dLhFQ6pNlzZl2sZYU3+UQndn8KSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D5B5F8962C; Thu, 25 Apr 2024 23:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F63BF8962C;
	Thu, 25 Apr 2024 23:54:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57AF9F80548; Thu, 25 Apr 2024 23:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 344CFF8058C
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 23:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 344CFF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=la2oZcn8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43PLOkgF006493;
	Thu, 25 Apr 2024 21:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Hs3fpdD+l1O4EfSuPsgb
	K4Q6nEGroTvEVrnQjm293OU=; b=la2oZcn8BtHp/YLK8Ez+iQM/0T/Mn55NQJ8h
	2pj/wgdkllNXP557v5x6zvDdKY798lvLUARaWNMfzP7FuIEiCVy0Eq+fqDFRVpwp
	BcH50h4tufKIkOwNO2h5gApeqj3+Rjuu4rJpzTibvNjYGtwKRlC4ckluTbdK57+w
	l668MxMGfWk6Pk/gIrlh4nCj0lm8wVBd0umuX/TSjkmu3QeDg0SU96tc1WCIRqeI
	mGB3O2YS5Y+8n+9TjXSZ+OZzBDS5OjbrZqbu2LbBUQYS4saAykJP3okvZJ6pK39P
	GXNWiPnwWXi7uMAeAEW4W0Z/XqZcdtkLl5Lolh+79TynYJ0+EA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqx03852t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43PLpkIZ024627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 14:51:45 -0700
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
Subject: [PATCH v20 32/41] ASoC: qcom: qdsp6: Add PCM ops to track current
 state
Date: Thu, 25 Apr 2024 14:51:16 -0700
Message-ID: <20240425215125.29761-33-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: fMxg5XNXS-8TdSI1oSFPskeVazzmzhqg
X-Proofpoint-ORIG-GUID: fMxg5XNXS-8TdSI1oSFPskeVazzmzhqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250159
Message-ID-Hash: TLWMDUXYIGDYZZ45KK2DKA6PGAB2YMBX
X-Message-ID-Hash: TLWMDUXYIGDYZZ45KK2DKA6PGAB2YMBX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLWMDUXYIGDYZZ45KK2DKA6PGAB2YMBX/>
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
index 72ec7d45f916..32971395ab13 100644
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
@@ -149,9 +186,14 @@ static int q6usb_put_offload_dev(struct snd_kcontrol *kcontrol,
 	int changed = 0;
 	int idx;
 
+	mutex_lock(&data->mutex);
+
+	/* Don't allow changes to the offloading devices if session is busy */
+	if (data->sel_card_idx >= 0 && data->status[data->sel_card_idx].prepared)
+		goto out;
+
 	idx = ucontrol->value.integer.value[0];
 
-	mutex_lock(&data->mutex);
 	switch (type) {
 	case SND_SOC_USB_KCTL_CARD_ROUTE:
 		if (idx >= 0 && test_bit(idx, &data->available_card_slot)) {
@@ -210,8 +252,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
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
