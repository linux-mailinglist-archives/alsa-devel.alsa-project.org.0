Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F8655E0C
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 19:52:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C31C4B36;
	Sun, 25 Dec 2022 19:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C31C4B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671994339;
	bh=dhLOy25IOpgxWFwKRo9Btuhuxtrh/Z0K9WfeubAqDUI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LQ6gY9cCCIE1Z2B9ftofoQnA7igTBAQg7w14aO32hgRcUhwRQUfwDyUKxawfzbdOF
	 fOL4nG0QmRRvq5riOQlrtmXUMkkvh/paJfsXLCe4Wz1MVQN6FnkduBPSM2ec+bReDJ
	 T46hnDR0QL9dfOflEA/+IwFYkKaB59lLmDgQXQEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E4EF80551;
	Sun, 25 Dec 2022 19:49:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67AE3F804AD; Sat, 24 Dec 2022 00:32:58 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B2DF80423
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 00:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B2DF80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=khjnjDRI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BNNUajC003578; Fri, 23 Dec 2022 23:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yGMXiCHbXVpFo33Qf45AliLfR7qs1brkqEaKhNWnRYY=;
 b=khjnjDRI8QDO/BS5JVL15nvqY0H4nUh+Ef1t18kEvblyxTQyegC/v8Row6VmchBc84ZR
 twT8FnI3P/wbLSyPMLFsa9mXDdBCx8ENBEX3KFdmqHTxyA+SnlmFrKxwPxBdX37+ZS1h
 7iM3xvD9jCHVA4uyI+e/p3H55Ulb0kaa40zUm0RGM7Tx/6tBbBA69/3Bws54W1xPA+W1
 McoI3SFzxx1FETOo/IPGkFFRSKVhtmIBpdpZTw92QpdoH5e0C0H9RBACFl0/vrmeZsen
 mfjvBOvhw0k+Z+QAbh/infg+pIW9jXmmk9oN1G2TiyhwB4vJVI7wd0yZv4g+F1lFUy2j 4A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm3cjx2m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 23:32:45 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BNNWhw9001678
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Dec 2022 23:32:43 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 23 Dec 2022 15:32:43 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
 <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <andersson@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
 <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <agross@kernel.org>
Subject: [RFC PATCH 01/14] ASoC: Add SOC USB APIs for adding an USB backend
Date: Fri, 23 Dec 2022 15:31:47 -0800
Message-ID: <20221223233200.26089-2-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: ccQ_aq5PpeclQXVJiKqw8QziyKKcKHrc
X-Proofpoint-ORIG-GUID: ccQ_aq5PpeclQXVJiKqw8QziyKKcKHrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_08,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212230197
X-Mailman-Approved-At: Sun, 25 Dec 2022 19:49:45 +0100
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

Some platforms may want to register its USB port to be handled by the ASoC
framework.  Audio playback/capture support is also handled entirely by the
vendor ASoC drivers.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 31 +++++++++++++++++++
 sound/soc/Makefile      |  2 +-
 sound/soc/soc-usb.c     | 66 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/soc-usb.c

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
new file mode 100644
index 000000000000..7d52e5d2371c
--- /dev/null
+++ b/include/sound/soc-usb.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __LINUX_SND_SOC_USB_H
+#define __LINUX_SND_SOC_USB_H
+
+/**
+ * struct snd_soc_usb
+ * @component - Reference to DAPM component
+ * @connection_status_cb - callback to notify connection events
+ * @priv_data - vendor data
+ **/
+struct snd_soc_usb {
+	struct snd_soc_component *component;
+	int (*connection_status_cb)(struct snd_soc_usb *usb, int card_idx,
+				int connected);
+	void *priv_data;
+};
+
+int snd_soc_usb_connect(int card_idx);
+int snd_soc_usb_disconnect(void);
+void snd_soc_usb_set_priv_data(void *priv);
+void *snd_soc_usb_get_priv_data(void);
+
+struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev,
+			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
+			int connected));
+int snd_soc_usb_remove_port(void);
+#endif
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 507eaed1d6a1..3305ceb59d84 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
+snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-usb.o soc-utils.o soc-dai.o soc-component.o
 snd-soc-core-objs += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
 snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
 
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
new file mode 100644
index 000000000000..c6c376960e4d
--- /dev/null
+++ b/sound/soc/soc-usb.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/usb.h>
+#include <sound/soc.h>
+#include <sound/soc-usb.h>
+#include "../usb/card.h"
+
+struct snd_soc_usb *ctx;
+
+void *snd_soc_usb_get_priv_data(void)
+{
+	if (ctx)
+		return ctx->priv_data;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_get_priv_data);
+
+void snd_soc_usb_set_priv_data(void *priv)
+{
+	if (ctx)
+		ctx->priv_data = priv;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_set_priv_data);
+
+struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev,
+			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
+			int connected))
+{
+	struct snd_soc_usb *usb;
+
+	usb = devm_kzalloc(dev, sizeof(*usb), GFP_KERNEL);
+	if (!usb)
+		return ERR_PTR(-ENOMEM);
+
+	usb->connection_status_cb = connection_cb;
+	ctx = usb;
+
+	return usb;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
+
+int snd_soc_usb_remove_port(void)
+{
+	ctx = NULL;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
+
+int snd_soc_usb_connect(int card_idx)
+{
+	if (ctx && ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, card_idx, 1);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
+
+int snd_soc_usb_disconnect(void)
+{
+	if (ctx && ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, -1, 0);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disconnect);
