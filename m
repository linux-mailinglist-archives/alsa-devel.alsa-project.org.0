Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDD655E15
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 19:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 009F84B51;
	Sun, 25 Dec 2022 19:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 009F84B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671994473;
	bh=mPJDfiir+0xC2SKRXSaMpgnPMH7Lu1gkMtw5P4seqoI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NXfXnt37BSgqpN28oFBjxeo9yQiC0BpPObMs3YHfAQ6bhxtWTtqLs6L9vTq/YMk+M
	 hTwqfBo8g7kNjdKYX/bpbmXyUleBgGSHpShx07XW/CqgIGTx7eqcrrOaVXpPJDOTpf
	 8+s96Tx+nibkNOXlbU4Avz0mCQRvf0kekDqkuiI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67D0DF805AF;
	Sun, 25 Dec 2022 19:49:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82762F804AD; Sat, 24 Dec 2022 00:33:02 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id BD405F804CB
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 00:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD405F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Tv9gXXHz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BNNRW5f026949; Fri, 23 Dec 2022 23:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hTI5FHC1YAemhozMegfqvLXGLlmKwd7KUrOXylR/oc4=;
 b=Tv9gXXHzolqDQ+A3DaaETNrc301xcPACjVAHXzaGyvzkTbXvqDVw/jShEUQuMdJK371N
 +JJ3m4xA9tYnrEyF1UkuZxUtLdgHul9irhsasJkuuBnCFDorcKI+FzzfjMYYOfWgUQd1
 2NDunGRYBdHgV6gTmBjtJ3nEgHQedwrMcct+LN3thBSvfpzD1EUy6aB8YJH3zRqRO45w
 gUGO12CF/NXsLxh7xbuBqWHfsV/iAhOHJDw5TtNiK+RmdVlATpGaY49z7z8dc0GnrPNU
 SjdLgoXjOAnrNdg30eGvXb+FLUuMXjNTU3rv4mNHokVVh000eLVuyt5WOXFHtq5FNUIe +w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brx5g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 23:32:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BNNWkmd001854
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 23:32:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 23 Dec 2022 15:32:46 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
Subject: [RFC PATCH 10/14] sound: usb: card: Check for support for requested
 audio format
Date: Fri, 23 Dec 2022 15:31:56 -0800
Message-ID: <20221223233200.26089-11-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221223233200.26089-1-quic_wcheng@quicinc.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hEsPdu6rderHJlTTpN2IAY96ibDhSSSt
X-Proofpoint-GUID: hEsPdu6rderHJlTTpN2IAY96ibDhSSSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_08,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230197
X-Mailman-Approved-At: Sun, 25 Dec 2022 19:49:46 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
 quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Allow for checks on a specific USB audio device to see if a requested PCM
format is supported.  This is needed for support for when playback is
initiated by the ASoC USB backend path.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 19 +++++++++++++++++++
 sound/usb/card.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 396e5a34e23b..9b8d2ed308c8 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -133,6 +133,25 @@ int snd_usb_unregister_vendor_ops(void)
 }
 EXPORT_SYMBOL_GPL(snd_usb_unregister_vendor_ops);
 
+struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
+			struct snd_pcm_hw_params *params, int direction)
+{
+	struct snd_usb_stream *as;
+	struct snd_usb_substream *subs = NULL;
+	const struct audioformat *fmt;
+
+	if (usb_chip[card_idx] && enable[card_idx]) {
+		list_for_each_entry(as, &usb_chip[card_idx]->pcm_list, list) {
+			subs = &as->substream[direction];
+			fmt = find_substream_format(subs, params);
+			if (fmt)
+				return as;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * disconnect streams
  * called from usb_audio_disconnect()
diff --git a/sound/usb/card.h b/sound/usb/card.h
index a785bb256b0d..d4936b6054fc 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -213,4 +213,7 @@ struct snd_usb_vendor_ops {
 
 int snd_usb_register_vendor_ops(struct snd_usb_vendor_ops *ops);
 int snd_usb_unregister_vendor_ops(void);
+
+struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
+			struct snd_pcm_hw_params *params, int direction);
 #endif /* __USBAUDIO_CARD_H */
