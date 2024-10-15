Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45F99F98B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 23:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3B8DFA;
	Tue, 15 Oct 2024 23:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3B8DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729028027;
	bh=29VWA0DxT8hK6fkCwQrxvdJBmifY1Kc1/JCR3kgrfD8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PLsLi7WDym4BtCcSl69ihKrZBG260cd3Z+tFX13EIfb+lxjRmMWo3kAgMPkIL2fqe
	 E32nuclzL4cA83BphLZNWhpIaoH24GohVRmK+Lhk3R4e88ETtkwJRIAfhO4GK50qDN
	 bRja7YsFfgQwCJEAdH3NeBwFfYqo3Ecl9hC7VIBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51DA5F80794; Tue, 15 Oct 2024 23:30:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B77F80793;
	Tue, 15 Oct 2024 23:30:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3CF5F805D3; Tue, 15 Oct 2024 23:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75C04F8058C
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 23:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75C04F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ilgchOVL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49FBHrZT019289;
	Tue, 15 Oct 2024 21:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/OTeliDf1Ah9/XP4Pomi7vIYaEPF2MJpZ2JrUJEjg8=; b=ilgchOVL5V2+fJaz
	mE35ncSNjyGB0duUjbNpJ71hny9D5SkWwvMdoXvHhXE3+pyM1Pv/izk6d82MiArC
	u2ZWi3uULWhnVWNQrPC91kR3uQrz2G4SNEJkTp/M0+vE7SFT9tXG2eGDlTXXAZYR
	0IVr74qu1wRWiFg8kXOa1SBwg7I/9fEhJyykzZaM9wjL69DmgcV1GbOM8pVyoFOC
	hnsdVPUVzmH+YCYx3JROUW7+p3cral3bjF0St3hyI7/ra50AwbOGGhUR5cp67BAF
	LdFxIoPWstpB2B4huHl0CzO/Sw7DqNdqOhJtFeuKaKCC3G765tntbiN5s8UwiUc2
	bzE59g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rs46s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49FLTUaE029927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:30 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:30 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v29 12/33] ALSA: usb-audio: Check for support for requested
 audio format
Date: Tue, 15 Oct 2024 14:28:54 -0700
Message-ID: <20241015212915.1206789-13-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bHJM5MlTYia8_2WguANOuWYPovLPF3RL
X-Proofpoint-GUID: bHJM5MlTYia8_2WguANOuWYPovLPF3RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143
Message-ID-Hash: QEQ4MBAC5BCUZ2BD5NAJ3HC3NIBZDNPY
X-Message-ID-Hash: QEQ4MBAC5BCUZ2BD5NAJ3HC3NIBZDNPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEQ4MBAC5BCUZ2BD5NAJ3HC3NIBZDNPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for checks on a specific USB audio device to see if a requested PCM
format is supported.  This is needed for support when playback is
initiated by the ASoC USB backend path.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 32 ++++++++++++++++++++++++++++++++
 sound/usb/card.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index c6d9d8d548b4..1f9dfcd8f336 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -119,6 +119,38 @@ static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
 
+/*
+ * Checks to see if requested audio profile, i.e sample rate, # of
+ * channels, etc... is supported by the substream associated to the
+ * USB audio device.
+ */
+struct snd_usb_stream *
+snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
+				  int direction)
+{
+	struct snd_usb_audio *chip;
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+
+	/*
+	 * Register mutex is held when populating and clearing usb_chip
+	 * array.
+	 */
+	guard(mutex)(&register_mutex);
+	chip = usb_chip[card_idx];
+
+	if (chip && enable[card_idx]) {
+		list_for_each_entry(as, &chip->pcm_list, list) {
+			subs = &as->substream[direction];
+			if (snd_usb_find_substream_format(subs, params))
+				return as;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
+
 /*
  * disconnect streams
  * called from usb_audio_disconnect()
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 6ec95b2edf86..4f4f3f39b7fa 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -207,4 +207,7 @@ struct snd_usb_stream {
 	struct list_head list;
 };
 
+struct snd_usb_stream *
+snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
+				  int direction);
 #endif /* __USBAUDIO_CARD_H */
