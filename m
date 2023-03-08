Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C35476B1761
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 01:01:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EEBA18B6;
	Thu,  9 Mar 2023 01:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EEBA18B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678320112;
	bh=vc7sna2pZV6hgGJ/T/sRs9b1PhbBvhN2b0itrWfSaiY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hD7bK/HhivMwRsk3RpyMKbxiO5+dlEJe2rjoqNtssYV3EAr5/VWAYW/LF6W4gDCRp
	 toynTGGnIvkbn9xRbbttOyWH8XniQdtvwjmMftO6YqLZ1WYr0bEzVkegCaf5AycMZp
	 17lBQxPQLngG1vPjE3BCinINLyT9zchsGIqWdBYU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 476F4F805AE;
	Thu,  9 Mar 2023 00:58:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AE94F8057D; Thu,  9 Mar 2023 00:58:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD0FF8052E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 00:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD0FF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=RMDUlOn/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328LmFDZ014287;
	Wed, 8 Mar 2023 23:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=6YtyWBu73MG6j0G7M6pu38juGRIr/PJeyrfMxwYjDnw=;
 b=RMDUlOn/9TF/SQ7R8WSV6p1BQgG1rrEZxlU9CwSOGnjOXGvxdPU/Ozg4sRDoUa2OjYQa
 3gIT7AYm/majeDtmoYFp252YdoxfRTw4JI0rHCzBljgEs+IAUoUfut6QPPvPuXa3xnjY
 jPDFaFYvocFp5xSD2fdUncxwtt8Rg7BQZ5jimYUnr5cIGz+w2TPl2rF6lpfOFWPcqIxK
 87NZrZVVoFNkjhtxvTVHsltdZht5nuQ2eWkfucpwG6o07y9t4FS5v36gGIn4tUtLKujk
 /CoR3+W7uNxr3SZLMn3lEU0SPy6x55b9PGE0ECF6H7mGzV/Dw0zHd7dgFYKZ2Ak61Hc4 0Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6ffku8pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 23:58:10 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 328Nw9VW016273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 23:58:09 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:08 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
Subject: [PATCH v3 14/28] sound: usb: pcm: Export fixed rate check USB SND API
Date: Wed, 8 Mar 2023 15:57:37 -0800
Message-ID: <20230308235751.495-15-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: f7ozWSWjL6LQN4bznyaSTTiwAkl9MvD3
X-Proofpoint-ORIG-GUID: f7ozWSWjL6LQN4bznyaSTTiwAkl9MvD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
Message-ID-Hash: MAS72AP5W7JDGXTE45FJ2J7OAYWQD3EH
X-Message-ID-Hash: MAS72AP5W7JDGXTE45FJ2J7OAYWQD3EH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAS72AP5W7JDGXTE45FJ2J7OAYWQD3EH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some modules will handle calling snd_usb_endpoint_open() instead of the USB
SND framework.  The USB SND endpoint open function added a new argument to
determine if the connect USB device can support multiple sampling rates.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 4576a36dc9b2..482c160cbc17 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -186,6 +186,7 @@ bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 	}
 	return true;
 }
+EXPORT_SYMBOL_GPL(snd_usb_pcm_has_fixed_rate);
 
 static int init_pitch_v1(struct snd_usb_audio *chip, int ep)
 {
