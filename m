Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DDE989A29
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 07:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8201914;
	Mon, 30 Sep 2024 07:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8201914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727674366;
	bh=NbyetRH8oTFCzTOoilkVMc3XjJuHIU7YcPWd5k/4M5g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KmoH5N0AMWZKf/Dx2KZ6iZOAdK87/JkQQOMdT9dTSukc0TZf1hZbeCL48G6gaLrE9
	 TXyJjEQAlu3dDYjQLgku7ZId4Y1cxWVtML3lQ2DkSEA3P3Tb9mLk2xCYzMhC5y85DO
	 uiBmkMDymWKrRqYU95jedCaSX3cbLWxe4OWOPmNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82EF2F805B3; Mon, 30 Sep 2024 07:32:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD32F8059F;
	Mon, 30 Sep 2024 07:32:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE60F80517; Mon, 30 Sep 2024 07:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96A39F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 07:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96A39F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=i5+pA7k5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48U0j2Pn013972;
	Mon, 30 Sep 2024 05:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jgiOEtWWIEx5t+733crHI5
	ePVCydglOQi6i5NFfxCyU=; b=i5+pA7k5oeXdlhUN/xBbn7OObUDZ0KuEIQgbdO
	cA9CIRcdklV5z6tXawM7AsQqiCyGBHXO03Cklmmx0pfG25cusWeqmVBUmoT87xDR
	QGcMJ6BnERzlkwkTNZ+TDvvJwdZ3OiuNWksr5v9CnGjBzcDop9d8mav1vVOxN1ge
	6iCH2RAXWYbDAk1AkHl50ws+O4+URlAjMWur8J5T/4KhZlyJU2XHmNCOTyGZ9WzI
	q+E6vkV6n3HN/l/6ukA6B4F0Nt59awzxoMX9SVHJDfaTOF57NteyO3QHRgJrr8/k
	Iszw0sUci9MqxC+/iUD15aq5zyyIEAKt6+ITr514e6cl+Ftg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa673j60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:31:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48U5VwMW019400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 05:31:58 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 29 Sep 2024 22:31:52 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, Rohit kumar <quic_rohkumar@quicinc.com>,
        "Mohammad Rafi
 Shaik" <quic_mohs@quicinc.com>
Subject: [PATCH v1] ASoC: codecs: lpass-macro: Add support for channel map
 mixer control
Date: Mon, 30 Sep 2024 11:01:11 +0530
Message-ID: <20240930053111.3986838-1-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: L6BPmGWeKMLibxdNUiIM0oI5Slm5Mksr
X-Proofpoint-ORIG-GUID: L6BPmGWeKMLibxdNUiIM0oI5Slm5Mksr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300038
Message-ID-Hash: OUVAEESISTAV2CKM2VSFWTE2ZMIFLWTR
X-Message-ID-Hash: OUVAEESISTAV2CKM2VSFWTE2ZMIFLWTR
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUVAEESISTAV2CKM2VSFWTE2ZMIFLWTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rohit kumar <quic_rohkumar@quicinc.com>

Add channel map mixer control for lpass macro codec DAIs.

Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/lpass-macro-common.c | 55 +++++++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h |  2 +
 sound/soc/codecs/lpass-rx-macro.c     | 12 ++++++
 sound/soc/codecs/lpass-tx-macro.c     |  9 +++++
 sound/soc/codecs/lpass-va-macro.c     |  9 +++++
 sound/soc/codecs/lpass-wsa-macro.c    | 12 ++++++
 6 files changed, 99 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..777af4885245 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -8,12 +8,67 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
 
 #include "lpass-macro-common.h"
 
 static DEFINE_MUTEX(lpass_codec_mutex);
 static enum lpass_codec_version lpass_codec_version;
 
+static int lpass_macro_chmap_ctl_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dai *dai = info->private_data;
+	u32 *chmap_data = NULL;
+	u32 rx_ch_cnt = 0;
+	u32 tx_ch_cnt = 0;
+	u32 rx_ch, tx_ch;
+
+	chmap_data = kzalloc(sizeof(u32) * 2, GFP_KERNEL);
+	if (!chmap_data)
+		return -ENOMEM;
+
+	snd_soc_dai_get_channel_map(dai, &tx_ch_cnt, &tx_ch, &rx_ch_cnt, &rx_ch);
+	if (rx_ch_cnt) {
+		chmap_data[0] = rx_ch_cnt;
+		chmap_data[1] = rx_ch;
+	} else if (tx_ch_cnt) {
+		chmap_data[0] = tx_ch_cnt;
+		chmap_data[1] = tx_ch;
+	}
+	memcpy(ucontrol->value.bytes.data, chmap_data, sizeof(u32) * 2);
+
+	kfree(chmap_data);
+	return 0;
+}
+
+int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_soc_dai *dai, int dir)
+{
+	struct snd_pcm_chmap *info;
+	int ret;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, dir, NULL,
+				      2 * sizeof(u32), 0, &info);
+	if (ret < 0) {
+		kfree(info);
+		return ret;
+	}
+
+	/* override handlers */
+	info->private_data = dai;
+	info->kctl->get = lpass_macro_chmap_ctl_get;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(lpass_macro_add_chmap_ctls);
+
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
 	struct lpass_macro *l_pds;
diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index fb4b96cb2b23..23ed6836addf 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -40,6 +40,8 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev);
 void lpass_macro_pds_exit(struct lpass_macro *pds);
 void lpass_macro_set_codec_version(enum lpass_codec_version version);
 enum lpass_codec_version lpass_macro_get_codec_version(void);
+int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
+			       struct snd_soc_dai *dai, int dir);
 
 static inline void lpass_macro_pds_exit_action(void *pds)
 {
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 71e0d3bffd3f..05bd0f8d126b 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1954,10 +1954,22 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int rx_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_PLAYBACK;
+
+	if (dai->id == RX_MACRO_AIF_ECHO)
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops rx_macro_dai_ops = {
 	.hw_params = rx_macro_hw_params,
 	.get_channel_map = rx_macro_get_channel_map,
 	.mute_stream = rx_macro_digital_mute,
+	.pcm_new = rx_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver rx_macro_dai[] = {
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index a134584acf90..c7a8e2694e36 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1211,10 +1211,19 @@ static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int tx_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops tx_macro_dai_ops = {
 	.hw_params = tx_macro_hw_params,
 	.get_channel_map = tx_macro_get_channel_map,
 	.mute_stream = tx_macro_digital_mute,
+	.pcm_new = tx_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver tx_macro_dai[] = {
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index c781da476240..1a13f472ed3a 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -939,10 +939,19 @@ static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static int va_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops va_macro_dai_ops = {
 	.hw_params = va_macro_hw_params,
 	.get_channel_map = va_macro_get_channel_map,
 	.mute_stream = va_macro_digital_mute,
+	.pcm_new = va_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver va_macro_dais[] = {
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c989d82d1d3c..7c4fd4bf2668 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1344,9 +1344,21 @@ static int wsa_macro_get_channel_map(const struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int wsa_macro_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			     struct snd_soc_dai *dai)
+{
+	int dir = SNDRV_PCM_STREAM_PLAYBACK;
+
+	if (dai->id == WSA_MACRO_AIF_VI || dai->id == WSA_MACRO_AIF_ECHO)
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+
+	return lpass_macro_add_chmap_ctls(rtd, dai, dir);
+}
+
 static const struct snd_soc_dai_ops wsa_macro_dai_ops = {
 	.hw_params = wsa_macro_hw_params,
 	.get_channel_map = wsa_macro_get_channel_map,
+	.pcm_new = wsa_macro_pcm_new,
 };
 
 static struct snd_soc_dai_driver wsa_macro_dai[] = {
-- 
2.25.1

