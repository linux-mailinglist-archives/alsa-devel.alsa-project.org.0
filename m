Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CC96FF082
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 13:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF1382E;
	Thu, 11 May 2023 13:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF1382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683804416;
	bh=7ceo9rEx5DWSOqfq2GgQmHg5yNoSKjl9et2SQ/6cC7w=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VAI0Y1M8uw9a4dZNgkzxCanvab/n1BpNUMWjPfXS01Csxwtr1eHBqyIpeOSjcF7An
	 ulhtD+gyxFKrd/jnb4AHKB7vwQaNj6SHgGIZtpIJudlkaMLmM6EnAR4hdKB3QM99ry
	 0ZdA5MBn6vfsv2fxdyMwob+L8TJ1u5ETm3ouDDvo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A4CF80310;
	Thu, 11 May 2023 13:26:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73BD4F8032D; Thu, 11 May 2023 13:26:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C610DF802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 13:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C610DF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=UhbggxeZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34B9SGgS004550;
	Thu, 11 May 2023 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=grbvt0XM5HD4zGTzp5d1D7puYVYO1aksB2M1JqLfzO4=;
 b=UhbggxeZbTUeeaijXWgOJ27Q1LuBikTcymAJ6D7oIgmUokQZsLlz5G57r8g+mFotisWx
 qYHiWW1zlpM8eEkE8LYcDM4sOFkUdqm03yw+K12GlMMEpzq0qUmU4y/T9w+SklHfV2I7
 a+htaRcm1iXBmKkF2Jmv7SVltVUhqJ0SAQFHyazB2v2DCe1lbDUrIOji2EkNZ4BCGkG2
 5pflzYoSVKiq6sHkiSYTC5Fl3k3MSjWGJX4DgirGfZ9je6sWP0XsAlVyaZx6CtYvbgXb
 XlK1mC5drHM/V4VbHiAH/hnJofIy3PiC3m+QfIAvUkGEWt3d0L22+nb+prOBIfwBsK1N Fg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgv1nrhpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 11:25:54 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 34BBPrvE002879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 11:25:53 GMT
Received: from hu-visr-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 11 May 2023 04:25:50 -0700
From: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
To: <quic_visr@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        "moderated list:QCOM AUDIO (ASoC) DRIVERS"
	<alsa-devel@alsa-project.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Date: Thu, 11 May 2023 16:55:32 +0530
Message-ID: <20230511112532.16106-1-quic_visr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: O2MUXd_E8MM0SNvXnho7Y0goRjqAiDs-
X-Proofpoint-ORIG-GUID: O2MUXd_E8MM0SNvXnho7Y0goRjqAiDs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=680
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110097
Message-ID-Hash: VZXLBW65MSJINC7ADJ65UNLUGERQSQV7
X-Message-ID-Hash: VZXLBW65MSJINC7ADJ65UNLUGERQSQV7
X-MailFrom: quic_visr@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZXLBW65MSJINC7ADJ65UNLUGERQSQV7/>
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
 sound/soc/codecs/lpass-tx-macro.c | 5 +++++
 1 file changed, 5 insertions(+)

Changes Since v1:
    
    - Check value with enum item value getting from control.
    - Removing of previously added code which is unwanted as already we get
      out with -EINVAL if value is out of bound.

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index da6fcf7f0991..de978c3d70b7 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -746,6 +746,8 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	val = ucontrol->value.enumerated.item[0];
+	if (val >= e->items)
+		return -EINVAL;
 
 	switch (e->reg) {
 	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
@@ -772,6 +774,9 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
 		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
 		break;
+	default:
+		dev_err(component->dev, "Error in configuration!!\n");
+		return -EINVAL;
 	}
 
 	if (val != 0) {
-- 
2.17.1

