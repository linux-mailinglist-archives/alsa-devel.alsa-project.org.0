Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA9984FDF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 03:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB4C84D;
	Wed, 25 Sep 2024 03:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB4C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727226221;
	bh=29VWA0DxT8hK6fkCwQrxvdJBmifY1Kc1/JCR3kgrfD8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z2A5R+XUc1uZ3Ir7d064RYU9FpchQ2gG0mEBQlwJZeBjLX9BYDiBf2/k16Cjth/og
	 gMe5bwlPRSTqtQKISpBGjuOGLbBCFQC+oMsLesgFizdgkHQFXZXtjXEpQJZ2hqAlL0
	 b37GyhU1hP9oLc4e1ScALBiNIodfn/FIn3WQ+xbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BA53F806F9; Wed, 25 Sep 2024 03:01:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C132BF805E6;
	Wed, 25 Sep 2024 03:01:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A38DF8061C; Wed, 25 Sep 2024 03:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3D72F8058C
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 03:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D72F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Ykb8MUlM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48OIkFbR032044;
	Wed, 25 Sep 2024 01:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/OTeliDf1Ah9/XP4Pomi7vIYaEPF2MJpZ2JrUJEjg8=; b=Ykb8MUlMoJgYtCKg
	y78goUlRE7E/PoPFVIaONXzaCJD66JJBy1Z8c/aH0nG3pYivrhDsStcwtHbsJVmH
	WQTJgloNw7ybp157II9MMw92ZEH0LYk06uUMhRy5/jr0aEg3kjOWegoTS29VUWol
	Y82bD94eSFOVXtzgVJk2mTDw0K4SHJT+IH/aUSqBD/6n3xjtqWXLsngpi18GuZ83
	NRnh8s2Cb/m+QqYKCS+LZf3yUOYp7UDdikoc9l2mKxRBX6B3cqx/KnLktUZ7M4A1
	ab47tPoMG0FsGpSoiZ0QgwBJoomWrO56BjTXmP51OaoYe3tJ3uyoKzUDNhIiOphQ
	jcYrhg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7ujj7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48P10E1h018666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:14 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 18:00:14 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 11/32] ALSA: usb-audio: Check for support for requested
 audio format
Date: Tue, 24 Sep 2024 17:59:39 -0700
Message-ID: <20240925010000.2231406-12-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _dI47_NJLD4LSXMEyzRgsKR6LCjuzCS2
X-Proofpoint-ORIG-GUID: _dI47_NJLD4LSXMEyzRgsKR6LCjuzCS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250005
Message-ID-Hash: GBJL2POOMJ7IINF7M3FX7JFFQERBHS5Z
X-Message-ID-Hash: GBJL2POOMJ7IINF7M3FX7JFFQERBHS5Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBJL2POOMJ7IINF7M3FX7JFFQERBHS5Z/>
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
