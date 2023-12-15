Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB08152A3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 22:56:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D7CCDF6;
	Fri, 15 Dec 2023 22:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D7CCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702677393;
	bh=YTO1ULoFnUcNEm3MWE6NNx+JKx6f/6i9LujoYGtYgk8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWahjhUjHUUGMt4WhbeYX7DUOlyCj0AyCJDzUWxnm1AO8MQ7ZOazCU25NX2VyXix9
	 3MfGnGEV2NFREYKWqVdDtgFVC5COWDciKxlQuP3dhkaXVuqfpQTzHeQzoij8oIY0Oy
	 ah5FeVmMbRYLJvK0GWZlCH/H3kv3akGQkzeX6LEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F1ECF80BF3; Fri, 15 Dec 2023 22:52:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A824F80800;
	Fri, 15 Dec 2023 22:52:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF5BF80557; Fri, 15 Dec 2023 22:51:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CAF1AF80578
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 22:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF1AF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=O2fuWzJv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BFICrkO032364;
	Fri, 15 Dec 2023 21:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=8aUObxKYV+uPq+60bdAB
	M9PBJEIsJx4xymaygMnyidk=; b=O2fuWzJvppWDWRUCE9zK8OaWWbRSKR3RrEyO
	NYJnSiaiUazHRgMbXPbo3LSLq1YqPva5I84cbDeMtuDmgtEx5i5dsSWKVHJwXjyV
	bXQc2z//3rn8R1+Z+D/9ilokV7f54NN59OOCoclO+j5uoRBIOyJb36uqZ3+Jfv+u
	RDdm/1alXDJ26JcFDCAeIyYXYZTkv7TOP6GSzYqMmQHWr8UEsNvz3vamrq+S8EAl
	/9q7cgXnM8wr6+NJo05y5cLIvC+2d8cmVrdanoo1crgCuVs8H5RIEHGDfueEx2+l
	naGQdiTuS78FhmK1NKxs/vqgA2lJlqAJPwCR47PhcBKkYOCMvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v0hdfa7e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3BFLoCHE008338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 21:50:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Dec 2023 13:50:11 -0800
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
Subject: [PATCH v10 21/41] ASoC: usb: Add PCM format check API for USB backend
Date: Fri, 15 Dec 2023 13:49:35 -0800
Message-ID: <20231215214955.12110-22-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231215214955.12110-1-quic_wcheng@quicinc.com>
References: <20231215214955.12110-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lCvD4yosucLHYD9RZsaT__0o_gaEI2Ab
X-Proofpoint-GUID: lCvD4yosucLHYD9RZsaT__0o_gaEI2Ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312150152
Message-ID-Hash: B4FJ6D6XWGYRXK5EOFBMUNXK6ETV6HCA
X-Message-ID-Hash: B4FJ6D6XWGYRXK5EOFBMUNXK6ETV6HCA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4FJ6D6XWGYRXK5EOFBMUNXK6ETV6HCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce a helper to check if a particular PCM format is supported by the
USB audio device connected.  If the USB audio device does not have an
audio profile which can support the requested format, then notify the USB
backend.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  2 ++
 sound/soc/soc-usb.c     | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 71e2e69ae3a2..f42e7f224549 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -38,6 +38,8 @@ struct snd_soc_usb {
 };
 
 const char *snd_soc_usb_get_components_tag(bool playback);
+int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
+			int direction);
 
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 2f3ef835052b..d62a51d9196c 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -80,6 +80,31 @@ void *snd_soc_usb_find_priv_data(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
 
+/**
+ * snd_soc_usb_find_format() - Check if audio format is supported
+ * @card_idx: USB sound chip array index
+ * @params: PCM parameters
+ * @direction: capture or playback
+ *
+ * Ensure that a requested audio profile from the ASoC side is able to be
+ * supported by the USB device.
+ *
+ * Return 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
+			int direction)
+{
+	struct snd_usb_stream *as;
+
+	as = snd_usb_find_suppported_substream(card_idx, params, direction);
+	if (!as)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB device
  * @component: USB DPCM backend DAI component
