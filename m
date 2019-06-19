Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F934BA62
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 15:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E290169E;
	Wed, 19 Jun 2019 15:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E290169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560951885;
	bh=uGQG0+Fb6y47qdRzBs/3Pactsm10yFi3oX98pndglTQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X9xuaPS2KZWS2AE4ZoaLESy/OiHjoLakqOpoKaOeUeiHimHSAsUhenA3z58J60ozK
	 RSp8Ok2ftXTaMgDzk531RqZle/6MqX4133AHLFm6qP+9nF9vFbJdaDor4OohVc+Z7o
	 Q6kXADgeTON+JB66JlULD2JB4m9zwKkgisotkcrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD578F89734;
	Wed, 19 Jun 2019 15:42:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BBF9F89702; Wed, 19 Jun 2019 15:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86416F80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 15:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86416F80C87
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ngobzyIX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDdSdv003080; Wed, 19 Jun 2019 08:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=2ql+gvu+ditouxByWHzzjagS21G7iQlQk1V9h7Fhqws=;
 b=ngobzyIXPQ6BugdkPailRliW9IKGhKLcucDh+F7owqCPhG9WzGYJKT1EfeKf/lt0ZnwX
 aTmGGYdrWjFx96kTdfWSWeq0Fj/9d0tzUlgJBevGAA1Ncd5JKT72WPcU5XDuIUl8yLlZ
 YOGoBiakDLvndWZ3raIrw1k7DCOAuRBJs156Rj7Z1i8DaeBynI/np2rWVGziCNQuFqWP
 eyJ2/HiF81VVg1+jfd+68ZArQhp3XRIChzYoqCG9dPV93HbCzWlc59QY+TkI75UtUoMR
 LHfo3ej3MX1Ns9LsFdFeuUp30wwhBbd/PvRYLHUpkbLYiKHpmPCmfv9TcdKK1Y8g0KoJ Lg== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2t780gh1pr-1;
 Wed, 19 Jun 2019 08:42:00 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
 by mail1.cirrus.com (Postfix) with ESMTP id 7EC59611C8C5;
 Wed, 19 Jun 2019 08:41:59 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 19 Jun
 2019 14:41:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 19 Jun 2019 14:41:59 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 38B5845;
 Wed, 19 Jun 2019 14:41:59 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Wed, 19 Jun 2019 14:41:55 +0100
Message-ID: <20190619134159.23580-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190112
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org
Subject: [alsa-devel] [PATCH v3 1/5] ASoC: madera: Add DT bindings for
	Cirrus Logic Madera codecs
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

The Cirrus Logic Madera codecs are a family of related codecs with
extensive digital and analogue I/O, digital mixing and routing,
signal processing and programmable DSPs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Minor tweak to out-mono to allow shorter arrays to be passed.

Thanks,
Charles

 Documentation/devicetree/bindings/sound/madera.txt | 67 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/sound/madera.h                 | 29 ++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/madera.txt
 create mode 100644 include/dt-bindings/sound/madera.h

diff --git a/Documentation/devicetree/bindings/sound/madera.txt b/Documentation/devicetree/bindings/sound/madera.txt
new file mode 100644
index 0000000000000..5e669ce552f47
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/madera.txt
@@ -0,0 +1,67 @@
+Cirrus Logic Madera class audio codecs
+
+This describes audio configuration bindings for these codecs.
+
+See also the core bindings for the parent MFD driver:
+See Documentation/devicetree/bindings/mfd/madera.txt
+
+and defines for values used in these bindings:
+include/dt-bindings/sound/madera.h
+
+These properties are all contained in the parent MFD node.
+
+Optional properties:
+  - cirrus,dmic-ref : Indicates how the MICBIAS pins have been externally
+    connected to DMICs on each input, one cell per input.
+    <IN1 IN2 IN3 ...>
+    A value of 0 indicates MICVDD and is the default, other values depend on the
+    codec:
+    For CS47L35 one of the CS47L35_DMIC_REF_xxx values
+    For all other codecs one of the MADERA_DMIC_REF_xxx values
+    Also see the datasheet for a description of the INn_DMIC_SUP field.
+
+  - cirrus,inmode : A list of input mode settings for each input. A maximum of
+    16 cells, with four cells per input in the order INnAL, INnAR INnBL INnBR.
+    For non-muxed inputs the first two cells for that input set the mode for
+    the left and right channel and the second two cells must be 0.
+    For muxed inputs the first two cells for that input set the mode of the
+    left and right A inputs and the second two cells set the mode of the left
+    and right B inputs.
+    Valid mode values are one of the MADERA_INMODE_xxx. If the array is shorter
+    than the number of inputs the unspecified inputs default to
+    MADERA_INMODE_DIFF.
+
+  - cirrus,out-mono : Mono bit for each output, maximum of six cells if the
+    array is shorter outputs will be set to stereo.
+
+  - cirrus,max-channels-clocked : Maximum number of channels that I2S clocks
+    will be generated for. Useful when clock master for systems where the I2S
+    bus has multiple data lines.
+    One cell for each AIF, use a value of zero for AIFs that should be handled
+    normally.
+
+  - cirrus,pdm-fmt : PDM speaker data format, must contain 2 cells
+    (OUT5 and OUT6). See the PDM_SPKn_FMT field in the datasheet for a
+    description of this value.
+    The second cell is ignored for codecs that do not have OUT6.
+
+  - cirrus,pdm-mute : PDM mute format, must contain 2 cells
+    (OUT5 and OUT6). See the PDM_SPKn_CTRL_1 register in the datasheet for a
+    description of this value.
+    The second cell is ignored for codecs that do not have OUT6.
+
+Example:
+
+cs47l35@0 {
+	compatible = "cirrus,cs47l35";
+
+	cirrus,dmic-ref = <0 0 CS47L35_DMIC_REF_MICBIAS1B 0>;
+	cirrus,inmode = <
+		MADERA_INMODE_DMIC MADERA_INMODE_DMIC /* IN1A digital */
+		MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN1B single-ended */
+		MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN2 differential */
+		0 0 	/* not used on this codec */
+	>;
+	cirrus,out-mono = <0 0 0 0 0 0>;
+	cirrus,max-channels-clocked = <2 0 0>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index addc269ad75e9..55d8b3d1a5cff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ W:	https://github.com/CirrusLogic/linux-drivers/wiki
 S:	Supported
 F:	Documentation/devicetree/bindings/mfd/madera.txt
 F:	Documentation/devicetree/bindings/pinctrl/cirrus,madera-pinctrl.txt
+F:	include/dt-bindings/sound/madera*
 F:	include/linux/irqchip/irq-madera*
 F:	include/linux/mfd/madera/*
 F:	drivers/gpio/gpio-madera*
diff --git a/include/dt-bindings/sound/madera.h b/include/dt-bindings/sound/madera.h
new file mode 100644
index 0000000000000..9ff4eae5259b0
--- /dev/null
+++ b/include/dt-bindings/sound/madera.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Device Tree defines for Madera codecs
+ *
+ * Copyright (C) 2016-2017 Cirrus Logic, Inc. and
+ *                         Cirrus Logic International Semiconductor Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef DT_BINDINGS_SOUND_MADERA_H
+#define DT_BINDINGS_SOUND_MADERA_H
+
+#define MADERA_INMODE_DIFF		0
+#define MADERA_INMODE_SE		1
+#define MADERA_INMODE_DMIC		2
+
+#define MADERA_DMIC_REF_MICVDD		0
+#define MADERA_DMIC_REF_MICBIAS1	1
+#define MADERA_DMIC_REF_MICBIAS2	2
+#define MADERA_DMIC_REF_MICBIAS3	3
+
+#define CS47L35_DMIC_REF_MICBIAS1B	1
+#define CS47L35_DMIC_REF_MICBIAS2A	2
+#define CS47L35_DMIC_REF_MICBIAS2B	3
+
+#endif
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
