Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE37A2BBD
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 02:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6C1E98;
	Sat, 16 Sep 2023 02:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6C1E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694823522;
	bh=lmZG01e0hKPj5XNvBupMutRk4GdXmURt9BymOq5vU88=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cz+qA6J1genKwFVUdEqPzegk8W/A6mmgD1eSB74SvU2UKxcn+1hPOhpQU9uNnL70K
	 RWt9V8aVC1QBesc2BeEH1WU1ILIySdwB+D5OygIPyVz0aF/PKEGr2iFiuqJVz1HHTs
	 lbwcq2WjjclBIkZml59jyteZ5TpkdzRTK4US80/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1047F806A9; Sat, 16 Sep 2023 02:12:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F28E4F806A9;
	Sat, 16 Sep 2023 02:12:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A31B5F80654; Sat, 16 Sep 2023 02:11:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 54FFAF80579
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 02:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54FFAF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=RP8i7ph6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FNuwIU028295;
	Sat, 16 Sep 2023 00:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=CL3FVM1qBZnRnbh0US8YjFD3CDy8ri2rtoQ7u0QpjGc=;
 b=RP8i7ph6Mjtc4QNt9JE2Y0ZyfC8aZH4/LVkj1vLvZPEij0et/SsRwlRxmilhsURrmNkN
 nx6gzdwJOakbgUHCBtkks5GSLhQfEFqHPwz/3mQCq094ZYBq52OnpGAg3s27Qd26xRpU
 Y/8D6hIjYNdLHGD97B+IJKf7jRanDtkLbMjgdEJF7fIsmuKmbSsSuNHyi3UBmxOsg1o4
 cvQeo81Pb0wt7ZCHbVIs5IhtsAH69vrPJCbpx28KGn1WjPy4udJeI1Eww6STV0NZcWMh
 tc6X+vkee41u6OAFFjRJY+q3ZNTX4cDtL0pp0bvkEIlWXL27Pd8pWGu1pbGxhlyDkliV sA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4vwc0k22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:10:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38G0Ak8a011939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:10:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 17:10:46 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v6 32/33] ALSA: usb-audio: Allow for rediscovery of connected
 USB SND devices
Date: Fri, 15 Sep 2023 17:10:25 -0700
Message-ID: <20230916001026.315-33-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230916001026.315-1-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EF7Eulyn5ZxPRfNGQE1IkVtlkE7qzxjH
X-Proofpoint-ORIG-GUID: EF7Eulyn5ZxPRfNGQE1IkVtlkE7qzxjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309160000
Message-ID-Hash: LPFZJZBXLYWUZKJANLPHR2CDU7GC4STZ
X-Message-ID-Hash: LPFZJZBXLYWUZKJANLPHR2CDU7GC4STZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPFZJZBXLYWUZKJANLPHR2CDU7GC4STZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In case of notifying SND platform drivers of connection events, some of
these use cases, such as offloading, require an ASoC USB backend device to
be initialized before the events can be handled.  If the USB backend device
has not yet been probed, this leads to missing initial USB audio device
connection events.

Expose an API that traverses the usb_chip array for connected devices, and
to call the respective connection callback registered to the SND platform
driver.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 19 +++++++++++++++++++
 sound/usb/card.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 88f431917c15..7d3f470754ca 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -202,6 +202,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 }
 EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
 
+/*
+ * in case the platform driver was not ready at the time of USB SND
+ * device connect, expose an API to discover all connected USB devices
+ * so it can populate any dependent resources/structures.
+ */
+void snd_usb_rediscover_devices(void)
+{
+	int i;
+
+	mutex_lock(&register_mutex);
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (usb_chip[i])
+			if (platform_ops && platform_ops->connect_cb)
+				platform_ops->connect_cb(usb_chip[i]);
+	}
+	mutex_unlock(&register_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
+
 /*
  * disconnect streams
  * called from usb_audio_disconnect()
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 01f7e10f30f4..c0aeda17ed69 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -221,11 +221,13 @@ int snd_usb_unregister_platform_ops(void);
 #if IS_ENABLED(CONFIG_SND_USB_AUDIO)
 struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 			struct snd_pcm_hw_params *params, int direction);
+void snd_usb_rediscover_devices(void);
 #else
 static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
 			struct snd_pcm_hw_params *params, int direction)
 {
 	return NULL;
 }
+static void snd_usb_rediscover_devices(void) { }
 #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
 #endif /* __USBAUDIO_CARD_H */
