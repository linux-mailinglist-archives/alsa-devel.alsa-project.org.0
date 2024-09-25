Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F19985041
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 03:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCBCEDB;
	Wed, 25 Sep 2024 03:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCBCEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727226544;
	bh=prnyaP8xdPvgf7lPSdgoOnTFSQEEfdLilloaJUXm1RE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mmx7IUUqDy3UF9kFrsCuz7icZcUmk6K9fpFwfrzWej2Tv5UaMpI3bkEA14bsOsa4B
	 flkXTGqjyOFCDsvgg3bXxWLRuIYy0CGWcQXoSq0D4OpJDmgdpOedj7CJSRrAHF6W//
	 qTnc+0QZoWGNSVIhb3gSQXPnIgt2Uk6UJMVWDcaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3B2AF897D6; Wed, 25 Sep 2024 03:02:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19572F897C4;
	Wed, 25 Sep 2024 03:02:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 509B8F80717; Wed, 25 Sep 2024 03:01:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 23B46F805E3
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 03:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23B46F805E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=pjldD4f9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48OIJGAj001625;
	Wed, 25 Sep 2024 01:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHuzCQGYpXyTPH0RihFbQD623zcQRcB8CUdC3cqWdMA=; b=pjldD4f9IXUoQo+6
	v0DhTrFEJMo29LhW+GBGrrCDkdYe00bE7NcqwI+9FiM4djrz0OYEDpDczfE8hVOS
	3C4ivw4yDwn+gJEkjIdkLy9uf0kfmgkki+u+Q8lGxIs346X47HAtcOYfwHf6tlii
	nKkIuAjL9QutcCbd6MiS8pNOBegMxhWwd3107CTRhcnMeL7GXmsi1EwgCvzGSqFL
	pJODt2TPVDdE4uDtOhKtyhRE+WF1b/32DaW0U275vhBMnKZVfTvwlRmnMyJ4sPut
	MKHLvDF1hPGGlDdjZ7xTIhQeGkAoIoZft1FFbAoD6XVdMhTnvz8CtXkNMpsfYD/+
	XpGafg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyjg40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48P10Kac022123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:20 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 18:00:20 -0700
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
Subject: [PATCH v28 32/32] ASoC: usb: Rediscover USB SND devices on USB port
 add
Date: Tue, 24 Sep 2024 18:00:00 -0700
Message-ID: <20240925010000.2231406-33-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: vKi0Sn_XlvQ3aFwyj_s_nRXk2lodc4I0
X-Proofpoint-ORIG-GUID: vKi0Sn_XlvQ3aFwyj_s_nRXk2lodc4I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250005
Message-ID-Hash: WS25T7QW6CHU2G44HCIXMSBHZKCPHOQE
X-Message-ID-Hash: WS25T7QW6CHU2G44HCIXMSBHZKCPHOQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WS25T7QW6CHU2G44HCIXMSBHZKCPHOQE/>
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
index f88ccf90df32..3457bb51a0a1 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -252,6 +252,8 @@ void snd_soc_usb_add_port(struct snd_soc_usb *usb)
 	mutex_lock(&ctx_mutex);
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
+
+	snd_usb_rediscover_devices();
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
 
