Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4A2DD478
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 16:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC72418B0;
	Thu, 17 Dec 2020 16:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC72418B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608219817;
	bh=AOopBWPtSLymPNiDYZjbtc3ahEZxEte0rveXMZ/4DPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXmEVYg9D3FLdSzF37wj7zZpnBJIZoSieuVwaYSyCvlabf+LVTizTfbnYkSWiRInJ
	 lH7tG2/wPAxtUUhqiIDBy+j5cM2si/W5xB8R4+I4KMEacHy1sASQPJwrDZB50F1EWe
	 LUIviAmVT97dMwPyRXc51YsPpAvmDrfwbbGv2BNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 532C1F804C2;
	Thu, 17 Dec 2020 16:41:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2960AF804C2; Thu, 17 Dec 2020 16:41:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C93DBF80260
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 16:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93DBF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZdUObY09"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BHFPi98001634; Thu, 17 Dec 2020 09:41:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=aMP9SGT4gnrlMbPsjRxvLdeVb+dW0Od9NGiAjNHZ9Go=;
 b=ZdUObY09lFBzRA8no5KR/ntljZAELrY2xAQPg3mQZRWOaESHNWQFv51c1VwXslEBq9uX
 Xbh3yP6D0tfrDCgRTTw6vpT+NOdTf5wyhnjqYgqv0QtnAw/Xj7/TrX9ZKIgJoij26oUB
 fNfLFtXAoeWuG5GDH1N/DQXniokp/eg5luGwfZzJOte/dvdZQT6BUQmErdUsi3iUwA/P
 /aDy70F8zaEitRU97wyVrtx4vP8tHzhg6aBAj+3QtGR0pH1/3mfvjNOCUseGLjYP221+
 RkcZR62t+EmHqULX3RTJtTyv4Do7HHd+gfQIs6tukeim54NFGJ8W9G3b4a1Ton4NtqLD Jg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35cu5rxy90-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Dec 2020 09:41:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 17 Dec
 2020 15:41:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 17 Dec 2020 15:41:46 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.236])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 304CF11CB;
 Thu, 17 Dec 2020 15:41:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>
Subject: [PATCH v3 2/6] ASoC: audio-graph-card: Add plls and sysclks DT
 bindings
Date: Thu, 17 Dec 2020 15:41:38 +0000
Message-ID: <20201217154142.24301-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217154142.24301-1-rf@opensource.cirrus.com>
References: <20201217154142.24301-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170108
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The audio-graph-card driver has bindings for configuring the clocking
for DAIs within a component, but is missing bindings for setting
up the PLLs and sysclks of the component.

This patch adds the two new bindings 'plls' and 'sysclks' so that the
audio-graph-driver can fully configure the component clocking.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/sound/audio-graph-card.txt       | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
index d5f6919a2d69..30405e64cfbb 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
@@ -32,6 +32,40 @@ Required properties:
 Optional properties:
 - pa-gpios: GPIO used to control external amplifier.
 
+- plls: A list of component pll settings. There are 4 cells per PLL setting:
+	- phandle to the node of the codec or cpu component,
+	- component PLL id,
+	- component clock source id,
+	- frequency (in Hz) of the PLL output clock.
+
+	The PLL id and clock source id are specific to the particular component
+	so see the relevant component driver for the ids. Typically the
+	clock source id indicates the pin the source clock is connected to.
+
+	The same phandle can appear in multiple entries so that several plls
+	can be set in the same component.
+
+- plls-clocks: A list of clock names giving the source clock for each setting
+	in the plls property.
+
+- sysclks: A list of component sysclk settings.  There are 4 cells per sysclk
+	setting:
+	- phandle to the node of the codec or cpu component,
+	- component sysclk id,
+	- component clock source id,
+	- direction of the clock: 0 if the clock is an input to the component,
+	  1 if it is an output.
+
+	The sysclk id and clock source id are specific to the particular
+	component so see the relevant component driver for the ids. Typically
+	the clock source id indicates the pin the source clock is connected to.
+
+	The same phandle can appear in multiple entries so that several sysclks
+	can be set in the same component.
+
+- sysclks-clocks: A list of clock names giving the source clock for each setting
+	in the sysclks property.
+
 -----------------------
 Example: Single DAI case
 -----------------------
@@ -335,3 +369,41 @@ Example: Multi DAI with DPCM
 			};
 		};
 	};
+
+-----------------------
+Example: Set component sysclks and PLLs
+-----------------------
+
+	sound {
+		compatible = "audio-graph-card";
+
+		clocks = <&audioclk>, <&pll1>;
+		clock-names = "audioclk", "pll1";
+
+		plls = <&cs47l15 MADERA_FLL1_REFCLK MADERA_FLL_SRC_MCLK1 98304000>;
+		plls-clocks = "audioclk";
+
+		sysclks = <&cs47l15 MADERA_CLK_SYSCLK_1 MADERA_CLK_SRC_FLL1 0>;
+		sysclks-clocks = "pll1";
+
+		dais = <&cpu_i2s_port>;
+
+		pll1: pll1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <98304000>;
+		};
+	};
+
+	cs47l15: codec@0 {
+		...
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			cs47l15_aif1_port: port@0 {
+				reg = <0>;
+				cs47l15_aif1: endpoint {
+					remote-endpoint = <&cpu_i2s_endpoint>;
+				};
+			};
+	};
-- 
2.20.1

