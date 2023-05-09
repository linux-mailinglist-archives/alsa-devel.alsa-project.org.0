Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C936FD716
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD9B1088;
	Wed, 10 May 2023 08:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD9B1088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700462;
	bh=2M02ebnGIewbrEITWuAZ7/FCFmKIEQf6kC2tHTOX6Hs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tMwyLWI1+0EJ4F6rvUkNkU5H7CvWC9c3cloEmuf3+H1X2cMdxWh7b8wtcepmZfPsT
	 oYVHWRj/hP+eHlTpvJU5JBPxVaoCbWg6Tuc+V1GdYHYgBlxOtccexnNh4z6n4TjriU
	 zj3OE5jSI3e6L/dKl47j8yX66BiZ1BLw14QE30ws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 614D5F80579;
	Wed, 10 May 2023 08:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E55BF8032D; Tue,  9 May 2023 08:13:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 04FB1F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04FB1F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=g/jo66Sc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3495ql8r024411;
	Tue, 9 May 2023 06:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=UVEqIfKORB02MyJwCsP9d4eCJn2qAVZv4WLwhGDzlYU=;
 b=g/jo66ScLFVKLQKX2Xse6X3dUFLzCjIh0qBX1+KfJuZDV/CGidepes5d7qp398uZ1OHi
 O1WaPhe3tZ2wFzMifET3DCXDKeODZAm7uXB8WdZ5y5jgxy6qMeIsiPyN3gx1wBa17VUz
 /5FmEZVJnqoEDoiy+/vZrU1vaRbvnFdBYNIXdCzvkChnPjnKW9q6LQs9f5mLZfEHgucc
 eqDfEKyKxwCE8iE3HvD18TC6zot5ZRK8OURzQjuQvRdRZ94AMtXFl1AxFXfX13JZ86TG
 B11i6S0MfkIre6Ls3dC+RAcAonIW80m8uMltFgHomrGab6t+mNS73XbPdcboM3tcATy5 og==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf77h8x3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 06:13:47 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 3496Dlkp019337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 May 2023 06:13:47 GMT
Received: from hu-visr-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 8 May 2023 23:13:43 -0700
From: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
To: 
Subject: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Date: Tue, 9 May 2023 11:43:21 +0530
Message-ID: <20230509061321.10218-1-quic_visr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EcP1u69BsWcyJyrsF201S06REH2ObrNZ
X-Proofpoint-ORIG-GUID: EcP1u69BsWcyJyrsF201S06REH2ObrNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=694
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090047
X-MailFrom: quic_visr@quicinc.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: LLSAG4NC6K5JP364PHA7I4LGYF24LJSK
X-Message-ID-Hash: LLSAG4NC6K5JP364PHA7I4LGYF24LJSK
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:17 +0000
CC: quic_visr@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLSAG4NC6K5JP364PHA7I4LGYF24LJSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When we run syzkaller we get below Out of Bounds error.

"KASAN: slab-out-of-bounds Read in regcache_flat_read"

Below is the backtrace of the issue:

BUG: KASAN: slab-out-of-bounds in regcache_flat_read+0x10c/0x110
Read of size 4 at addr ffffff8088fbf714 by task syz-executor.4/14144
CPU: 6 PID: 14144 Comm: syz-executor.4 Tainted: G        W
Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
Call trace:
dump_backtrace+0x0/0x4ec
show_stack+0x34/0x50
dump_stack_lvl+0xdc/0x11c
print_address_description+0x30/0x2d8
kasan_report+0x178/0x1e4
__asan_report_load4_noabort+0x44/0x50
regcache_flat_read+0x10c/0x110
regcache_read+0xf8/0x5a0
_regmap_read+0x45c/0x86c
_regmap_update_bits+0x128/0x290
regmap_update_bits_base+0xc0/0x15c
snd_soc_component_update_bits+0xa8/0x22c
snd_soc_component_write_field+0x68/0xd4
tx_macro_put_dec_enum+0x1d0/0x268
snd_ctl_elem_write+0x288/0x474

By Error checking and checking valid values issue gets rectifies.

Signed-off-by: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index da6fcf7f0991..6575b0bb6a47 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -746,6 +746,10 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	val = ucontrol->value.enumerated.item[0];
+	if (val < 0 && val > 15) {
+		dev_err(component->dev, "Wrong value for DMIC configuration");
+		return -EINVAL;
+	}
 
 	switch (e->reg) {
 	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
@@ -772,6 +776,9 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
 		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
 		break;
+	default:
+		dev_err(component->dev, "Error in configuration!!\n");
+		return -EINVAL;
 	}
 
 	if (val != 0) {
@@ -785,13 +792,19 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 			snd_soc_component_write_field(component, mic_sel_reg,
 						      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
 			dmic = TX_ADC_TO_DMIC(val);
-			dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
-			snd_soc_component_write_field(component, dmic_clk_reg,
-						CDC_TX_SWR_DMIC_CLK_SEL_MASK,
-						tx->dmic_clk_div);
+			if (dmic < 4) {
+				dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
+				snd_soc_component_write_field(component, dmic_clk_reg,
+							      CDC_TX_SWR_DMIC_CLK_SEL_MASK,
+								tx->dmic_clk_div);
+			} else {
+				dev_err(component->dev, "dmic for clk sel is wrong,
+					expected less than 4 but received %d\n", dmic);
+				return -EINVAL;
+			}
+
 		}
 	}
-
 	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 }
 
-- 
2.17.1

