Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628027605CE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 04:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6AA210;
	Tue, 25 Jul 2023 04:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6AA210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690252786;
	bh=d+p7PooFkK1JE/ldyWcSh+AHr3/nImEnmYulW0z7e5Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F7CMpKH6km5Y6BG0e9InvGv1Jo8K6Tjlqc8Ib3gzjJGuq9NZXhsdtqDiLkA0FJjdl
	 Q0WK2R/HdfT7iMAxbqkrY+YBVkwHeW6ttAUszN/VqkqlATR08T1Cw1A5B9JsevYEh8
	 4vzMdfxUwRYFGTenOKqp0cQ8gBQiea7UVvJhUhjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3258F80621; Tue, 25 Jul 2023 04:35:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC32F80617;
	Tue, 25 Jul 2023 04:35:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD730F80608; Tue, 25 Jul 2023 04:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66091F80557
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66091F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=I8vWh4wP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36P2EmnC003501;
	Tue, 25 Jul 2023 02:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=3+NthnHMYb0aBxkwQRLsMo8vtaEUG/221TLwVqmJMEU=;
 b=I8vWh4wPKSYeijGDJ1upyaylIV+i0z4N+cxt2L/gt9F1RmBosmmBry8AOPPnS2X7J48y
 TsdMofzRn8SnnqRu2SLDA6cD93rULqlBuuDbIz7jFkoFTlGGolTiQ3fm3EjjSbJnTcSW
 GI4gYkHM5olG4TV+iR2i3CmdpCC4OzrTw9C+SuyQky/BMbfyB1XYV68L/DeyGQwCG58N
 2bsogYL1jzk5dAjR1YLFeUegLMUGvuh1R6IrL16WL644QEnUilqL3c8oiUNpGrdzvxaB
 HXW5w2ovjkxQg6BtJkvFLBoj21X7+79eCirnshnUz9nSv36o7U4cX5Xse7oOyhy9bGoA zQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1vh8h4c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36P2YhjW015218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 02:34:43 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 24 Jul 2023 19:34:42 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <Thinh.Nguyen@synopsys.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <quic_jackp@quicinc.com>, <pierre-louis.bossart@linux.intel.com>,
        <oneukum@suse.com>, <albertccwang@google.com>,
        <o-takashi@sakamocchi.jp>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v4 20/32] sound: soc: soc-usb: Add PCM format check API for
 USB backend
Date: Mon, 24 Jul 2023 19:34:04 -0700
Message-ID: <20230725023416.11205-21-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230725023416.11205-1-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3JKeuQ05a1I3dbzzhtDwm3Qy-8MgHshD
X-Proofpoint-GUID: 3JKeuQ05a1I3dbzzhtDwm3Qy-8MgHshD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250020
Message-ID-Hash: UBQ3D5TSJ5R3PY7WJL6NNQNEBUBYJ34M
X-Message-ID-Hash: UBQ3D5TSJ5R3PY7WJL6NNQNEBUBYJ34M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBQ3D5TSJ5R3PY7WJL6NNQNEBUBYJ34M/>
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
