Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D56B176E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 01:03:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF2618AB;
	Thu,  9 Mar 2023 01:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF2618AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678320182;
	bh=d+p7PooFkK1JE/ldyWcSh+AHr3/nImEnmYulW0z7e5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IqRDsSYl6L3aREsDVQTKjviCS9gkSoGFOc53O+nlQotAOa/nlJjx5aEMSR63tJGwD
	 hUM0xOym7ovfaz92z6tivy/bMJEUBAFfyGkOwFlaJL31pGxgwcSpoUaD9EHDyFOb02
	 Y1Ce0htpWOYnpZh615E9fSZtqi61ay1/+UzJ6mdA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBE2F805BF;
	Thu,  9 Mar 2023 00:59:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB42FF80589; Thu,  9 Mar 2023 00:58:42 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B0D98F8053B
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 00:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D98F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Gmly7sgK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328LS3EZ020746;
	Wed, 8 Mar 2023 23:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3+NthnHMYb0aBxkwQRLsMo8vtaEUG/221TLwVqmJMEU=;
 b=Gmly7sgKkfc1d0omGkEa+yBZvNTIX2bkqGF/SBjQkiSeVJ5f7fg+sFZMigKCPJWOFotS
 tWuuxg0Ik4UsG2w2/lnC8/rhSmdCLTZelsEFm0rod1zRzxEAE8nI/9RgzkfnrecQCr1H
 gKtS0+8DoyK0Tm1err0ILfs7gvzno0qqUOxkFdcpdOfto4QFzM9cjtVwErNnlpTejHeZ
 hB5xFHLr/Fqu6My7gzqPePakLEnig1XBtcmeW9cXH8JNyD1VTXCyzo+VtMXHxijecIG+
 QqEA7cYDwu56sq8MR9CYbe8ccLeo+IvAX3p/pJsvS8HzEhJSXIYURsgKGk/wSrZ0tR0Z kw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6v2dsav0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 23:58:10 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 328NwAVo019912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 23:58:10 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:09 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
Subject: [PATCH v3 17/28] sound: soc: soc-usb: Add PCM format check API for
 USB backend
Date: Wed, 8 Mar 2023 15:57:40 -0800
Message-ID: <20230308235751.495-18-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ux-qZkq_KdfHJAs8QaRnLn750V-ITN5T
X-Proofpoint-ORIG-GUID: ux-qZkq_KdfHJAs8QaRnLn750V-ITN5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303080200
Message-ID-Hash: HBC5B4AQOL7OMMFW4XIQYXGKABG32BUN
X-Message-ID-Hash: HBC5B4AQOL7OMMFW4XIQYXGKABG32BUN
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com,
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBC5B4AQOL7OMMFW4XIQYXGKABG32BUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce a check for if a particular PCM format is supported by the USB
audio device connected.  If the USB audio device does not have an audio
profile which can support the requested format, then notify the USB
backend.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  3 +++
 sound/soc/soc-usb.c     | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 378992ea07bd..71e6e75e600a 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -23,6 +23,9 @@ struct snd_soc_usb {
 	void *priv_data;
 };
 
+int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
+			int direction);
+
 int snd_soc_usb_connect(struct device *usbdev, int card_idx);
 int snd_soc_usb_disconnect(struct device *usbdev);
 void snd_soc_usb_set_priv_data(struct device *dev, void *priv);
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 4293451cdd49..cdce1bb42df5 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -70,6 +70,19 @@ void *snd_soc_usb_get_priv_data(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_get_priv_data);
 
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
  * snd_soc_usb_add_port() - Add a USB backend port
  * @dev: USB backend device
