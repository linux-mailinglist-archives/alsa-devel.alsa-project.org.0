Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD97290AE2
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A87817EC;
	Fri, 16 Oct 2020 19:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A87817EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602869859;
	bh=9ip03HrfBiAPRQK0OLmzy2E3wMa2gd3Zh7uATJ6kw/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KK5SVpGlb5l1ONjPuZlfjXSEe/qXelHFBgOoioiht885GhvR0FjuPHhwAsJuHzjjN
	 Ksu77JZrZ7HH8pzJiUAAhI5mLQdDynBKZeNBdyXzy0bPRbFXvxMh1Itt6txsyQ6isH
	 xnLJvt8T4xCKLawuErnNyrV+novvtPEh4WeeP7qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B52F80279;
	Fri, 16 Oct 2020 19:35:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C899DF80279; Fri, 16 Oct 2020 19:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4DC3F80224
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4DC3F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="K8sEWQL7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09GHQNpN024410; Fri, 16 Oct 2020 12:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=9T+LsXyb9i7uI1E4HpwrFelai64CiEIwmAXKtnGXQt8=;
 b=K8sEWQL73uz/mscJPLGrNV+/J5uCbWyzu/0OQ6w9rDSXqd9gEjX5vK7RB6vwSaYHbxF/
 pZemWz0KD2uL/EdHNNJ4MSEEfnXzojUxGhK3s33I/hSoN4tFyo93cfe3L81Q98FGVdel
 RkB9vRHSlrDP+waqPMBM4pHAVRRaWfV9enWUBlM1EEULKuZthAmOC8AwFNoL4yfbcXnq
 Qwp2tDmlhJ4meRVopdehLQCXhk3kHROvAuFYB9S/Kj5xcXGrOkL9zdwgdc+r76VphZ4m
 FoYSM/iiJnSZGoTgOyv/Hi71jVN1DLBWSNF7CBrUhg53hnujngetpLj/QLjJmnKtrOcg Aw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac20jk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 12:35:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 18:35:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 18:35:45 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1641045;
 Fri, 16 Oct 2020 17:35:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH v2 2/7] ASoC: audio-graph-card: Add plls and sysclks DT
 bindings
Date: Fri, 16 Oct 2020 18:35:36 +0100
Message-ID: <20201016173541.21180-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016173541.21180-1-rf@opensource.cirrus.com>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=629 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160130
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

This adds the two new properties 'plls' and 'sysclks' to the dt bindings.
These add the ability to set values that will be
passed to snd_soc_component_set_sysclk() and snd_soc_component_set_pll().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../bindings/sound/audio-graph-card.txt       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
index d5f6919a2d69..59bbd5b55b59 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
@@ -32,6 +32,19 @@ Required properties:
 Optional properties:
 - pa-gpios: GPIO used to control external amplifier.
 
+- plls: A list of component pll settings that will be applied with
+      snd_soc_component_set_pll. Each entry is a phandle to the node of the
+      codec or cpu component, followed by the four arguments id, source,
+      frequency_in, frequency_out. Multiple entries can have the same phandle
+      so that several plls can be set in the same component.
+
+- sysclks: A list of component sysclk settings that will be applied with
+      snd_soc_component_set_sysclk. Each entry is a phandle to the node of
+      the codec or cpu component, followed by the four arguments id, source,
+      frequency, direction. Direction is 0 if the clock is an input, 1 if it
+      is an output. Multiple entries can have the same phandle so that several
+      clocks can be set in the same component.
+
 -----------------------
 Example: Single DAI case
 -----------------------
@@ -335,3 +348,34 @@ Example: Multi DAI with DPCM
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
+		sysclks = <
+			&cs47l15 1 4 98304000 0
+			&cs47l15 8 4 147456000 0
+		>;
+		plls = <
+			&cs47l15 1 0 24576000 98304000
+		>;
+
+		dais = <&cpu_i2s_port>;
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

