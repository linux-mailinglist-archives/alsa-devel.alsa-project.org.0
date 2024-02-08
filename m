Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474A84ED79
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 00:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B922A1925;
	Fri,  9 Feb 2024 00:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B922A1925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707434873;
	bh=GgnICuH7GHv7SDlK6A+NlCN2HhLTGdZZc+5NwsH4lPE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gfJq163ipsbhSFaMq93VGC0vjbwLSKHwPjb6NLUdE3OV5LNhDa067nc35QVKD5hbU
	 EWiOcwZwxVy+hsAZsuLDO5DfYLgeLbxRwkVGQF7gLG5sYyC5awgz8kCQJ8k7E/qnMV
	 ktQ6Pp2YmbbSddg74cA1znZC+hJtpNLLaxCuYUJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F96FF89966; Fri,  9 Feb 2024 00:17:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77DA1F89967;
	Fri,  9 Feb 2024 00:17:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909BDF805D6; Fri,  9 Feb 2024 00:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 531E0F805D6
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 00:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 531E0F805D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=mwfLJ32a
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418Mm7mG001429;
	Thu, 8 Feb 2024 23:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=1gKa8uPfE60yWjTTUplQ
	LsTc6cS2VTs4IFAWikb6MkA=; b=mwfLJ32a4WxDD8ch1RYJpsy4UMZ4f+PZ9CA6
	z8NvoUbW75E1ZuaJDoECFUrq5jjXTfm0HLbjGR0sVyczbOjdjlJdPMpK9mwjRFNG
	hOfbjn0wg17yYu//58hJTj9btCimJClWaA7yZlWdiiyMwBxrXM0sgniN/yKfN2wu
	k8yUcQMgdYMYwKMs2MrJLF+WoKmhuhNQrnW0KWDdur+6qhpeEwsGKWml3T+h6PZj
	rbKANA8cD/itgRdfdLzxdxAdZDE6ig6gCSauCq3cNTsDKxIVpiELsyO5ryS2Gyrz
	fKyuYO0bMtr/FSl2wceiAy5VtVhFsWu5b8aY3/jYzqzO+J2RtA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4frwujuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 23:14:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 418NEUwB005652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 23:14:30 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 8 Feb 2024 15:14:29 -0800
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
Subject: [PATCH v14 51/53] ASoC: usb: Rediscover USB SND devices on USB port
 add
Date: Thu, 8 Feb 2024 15:14:04 -0800
Message-ID: <20240208231406.27397-52-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208231406.27397-1-quic_wcheng@quicinc.com>
References: <20240208231406.27397-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: L9tl1Hi6qOSqUvYvy-6cEpxSLUX6F09w
X-Proofpoint-GUID: L9tl1Hi6qOSqUvYvy-6cEpxSLUX6F09w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080131
Message-ID-Hash: ETOCX7KL6WS52X5DDP32ABWWIU4CZ5ZA
X-Message-ID-Hash: ETOCX7KL6WS52X5DDP32ABWWIU4CZ5ZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETOCX7KL6WS52X5DDP32ABWWIU4CZ5ZA/>
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
index dfd6f53898c5..4d6d6ab0601f 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -437,6 +437,8 @@ int snd_soc_usb_add_port(struct snd_soc_usb *usb)
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
