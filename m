Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4F6BD57D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 17:24:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E84F2E;
	Thu, 16 Mar 2023 17:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E84F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678983858;
	bh=ntbVqT/Oid2sufd8/ToZ6mjA46yGSEpFNXxar2Qt3f4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nUPJ6wclZS+xAcUC+HKzoyY5JTe9Xp5Zt0HMpFIeqNATFzd2qVtC0wmlG4yvcgM+o
	 wAvj/JvCpfCiOb5wbe1PsL/294c7W564ynB+bhyHSwY+VW59jnxCXC6NjVOwXSY1zq
	 sjhC1LglGYdk8UKL4yTC4zOslGq6clenFilUGgVk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBF7DF8032D;
	Thu, 16 Mar 2023 17:23:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42F14F80423; Thu, 16 Mar 2023 17:23:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E48E9F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 17:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48E9F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=juqyQqag
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GDV56A018052;
	Thu, 16 Mar 2023 16:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=DGUvrfDfGZ0mbCeDP3/EhKDi0cTkzcFUFWcFAevMCBI=;
 b=juqyQqagh6XfT4n0bC6pdOcYosEk5GGDLFnh82f1MBoagZUbQxz9lLyDWQ4pZsk1/JOj
 lSYjCdulBRqIZ3l6YPJPoXuCZcqhehcA3GcIyeNeKYETigB7q/cECgAKyPGVpVOwFory
 ediP4M3yG8Y/L1p9i2i8/8gPIboEjtQD8ixnIqjAdDMOWnx4eT6z+0Y4wtDy2qEL3UaV
 YUoUdHl0YPcvIhoqMyjHAVS/f28nwLb6qrhvGdW9QFmYzGi7ecq0lBXZcU4STx2Dvc8J
 IkTGvoT0Ner7Yl813JH3pBsXMhUjZplntzp08yg8w/8+u3eHF6qNWZyO3kRdj4uUoFZw kQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbst923ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 16:23:10 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 32GGNABF019780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 16:23:10 GMT
Received: from hu-visr-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 16 Mar 2023 09:23:07 -0700
From: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
To: <quic_visr@quicinc.com>
Subject: [PATCH] ASoC: codecs:rx-macro: Fixing uninitialized variables.
Date: Thu, 16 Mar 2023 21:52:49 +0530
Message-ID: <20230316162249.17044-1-quic_visr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PRpImEHXJKZHExf2lT0jZY0_lmw7rFrh
X-Proofpoint-GUID: PRpImEHXJKZHExf2lT0jZY0_lmw7rFrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=725 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303160130
Message-ID-Hash: XQV2E4HWSQP6IRHRLFT4CJ5OJH7HN2GJ
X-Message-ID-Hash: XQV2E4HWSQP6IRHRLFT4CJ5OJH7HN2GJ
X-MailFrom: quic_visr@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQV2E4HWSQP6IRHRLFT4CJ5OJH7HN2GJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Initializing the uninitialized variables to avoid any unexpected garbage
value to be propagated further.

Signed-off-by: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a73a7d7a1c0a..0c8b79ff2fc5 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2219,6 +2219,8 @@ static void rx_macro_hd2_control(struct snd_soc_component *component,
 				 u16 interp_idx, int event)
 {
 	u16 hd2_scale_reg, hd2_enable_reg;
+	hd2_scale_reg = 0;
+	hd2_enable_reg = 0;
 
 	switch (interp_idx) {
 	case INTERP_HPHL:
-- 
2.17.1

