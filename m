Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8286A5FD
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 02:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F9E5B70;
	Wed, 28 Feb 2024 02:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F9E5B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709084934;
	bh=irvpJAWyfYNQcdfNO9eBX7aEjGvO1TfGb3rNzRGKzbI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NOlVnzcixCeV00wvUsGEazN+GUVvNxleb73GsLIKM3APlSLQn2IJ2paJ/DY+948CE
	 ATwFPRxacp4NFviWUKEbE17g8cObw1o7RtVD2pyXaKVNj7UL4Z+F4c03t0daHhW9xK
	 r2v3KtRM4E13sFtoUanB2Be2NZMjBpL5U0gv08pk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85282F898FF; Wed, 28 Feb 2024 02:39:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E560EF898FE;
	Wed, 28 Feb 2024 02:39:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFB3F89722; Wed, 28 Feb 2024 02:38:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A92D0F805B3
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 02:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A92D0F805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=RXUgZVEY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41S0K1bW014149;
	Wed, 28 Feb 2024 01:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=gnJwXYlppG20lIVQdlnZ
	4yd3yQRuw/0NNcN3kah4t3c=; b=RXUgZVEYasFrv1KjXEqbQgeYFKZAzlwNBHtr
	Z4MXH2B4TNlgfxkO4fovFroYl0SC5v5f/5z1qAgJQt5h2nw5/8mT6/dX0g/3mHzr
	JjIuzw2v14yUI3YqL4wefjO3hG9J1jXzP9FOX5+giFcIXQBr+ddaPL6y2GSo0aVu
	LIEc/xen/PGeP0LZyxYsBHBfMhT8BpElBUintULhXSZBrwUe06zQkDwpBd3j35Es
	boaM2XU56NLEQZXIYt4EXjp9gLZoPItgf/JBf5BSF2b2sbW0AIRpp1NuTzfY9i55
	JR/SWNT9C5kFPC7xAIPBO0eKOSeZloFFtyNOaDg6pHlNKeCDSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whp65rmgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 01:36:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41S1aeGk016772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 01:36:40 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 17:36:40 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v18 39/41] ASoC: usb: Rediscover USB SND devices on USB port
 add
Date: Tue, 27 Feb 2024 17:36:17 -0800
Message-ID: <20240228013619.29758-40-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240228013619.29758-1-quic_wcheng@quicinc.com>
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xr4uAord8Ajo7Y2BMtV_WP9jFJhxIU2p
X-Proofpoint-ORIG-GUID: xr4uAord8Ajo7Y2BMtV_WP9jFJhxIU2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_11,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280011
Message-ID-Hash: 2ZKRWIQVFRGHSFMBG3PK7PDRAM2FZN2N
X-Message-ID-Hash: 2ZKRWIQVFRGHSFMBG3PK7PDRAM2FZN2N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZKRWIQVFRGHSFMBG3PK7PDRAM2FZN2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In case the USB backend device has not been initialized/probed, USB SND
device connections can still occur.  When the USB backend is eventually
made available, previous USB SND device connections are not communicated to
the USB backend.  Call snd_usb_rediscover_devices() to generate the connect
callbacks for all USB SND devices connected.  This will allow for the USB
backend to be updated with the current set of devices available.

The chip array entries are all populated and removed while under the
register_mutex, so going over potential race conditions:

Thread#1:
  q6usb_component_probe()
    --> snd_soc_usb_add_port()
      --> snd_usb_rediscover_devices()
        --> mutex_lock(register_mutex)

Thread#2
  --> usb_audio_disconnect()
    --> mutex_lock(register_mutex)

So either thread#1 or thread#2 will complete first.  If

Thread#1 completes before thread#2:
  SOC USB will notify DPCM backend of the device connection.  Shortly
  after, once thread#2 runs, we will get a disconnect event for the
  connected device.

Thread#2 completes before thread#1:
  Then during snd_usb_rediscover_devices() it won't notify of any
  connection for that particular chip index.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/soc-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 53c4e399909e..821caff2061d 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -554,6 +554,8 @@ int snd_soc_usb_add_port(struct snd_soc_usb *usb)
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
