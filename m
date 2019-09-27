Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F5C025E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 11:29:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED40615E4;
	Fri, 27 Sep 2019 11:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED40615E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569576589;
	bh=j285CrNIXQQ78yAvFSmrKfNgdy3p2IQ6K2jrHiS2Myk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXIfonCKGHFXcKPDpw95vtijtiY1HO42NhGwo4XmVQRbd7L+C24oWm8Qq/zqh4jMp
	 GRNebOWcaATtRNfwDHVJ71OrbC0YYAiLVR1JoadqEwp4Y543yeAsOzlUrwEq9K3Tbw
	 G4dZC0HDKSsAmU7B6UeMI3xxXAore6tWnavhQ9Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA9FEF805F8;
	Fri, 27 Sep 2019 11:27:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 651C5F805A8; Fri, 27 Sep 2019 11:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id D3427F800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 11:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3427F800B3
X-UUID: d35aa753a4b34ede95ad268a835d7ebb-20190927
X-UUID: d35aa753a4b34ede95ad268a835d7ebb-20190927
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1733209468; Fri, 27 Sep 2019 17:27:10 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Sep 2019 17:27:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Sep 2019 17:27:00 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <mark.rutland@arm.com>, <robh+dt@kernel.org>,
 <linux@roeck-us.net>, <wim@linux-watchdog.org>
Date: Fri, 27 Sep 2019 17:26:54 +0800
Message-ID: <1569576417-20663-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1569576417-20663-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1569576417-20663-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 "yong.liang" <yong.liang@mediatek.corp-partner.google.com>,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 1/4] WIP: dt-bindings: mediatek: mt8183: Add
	#reset-cells
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

From: "yong.liang" <yong.liang@mediatek.corp-partner.google.com>

Add #reset-cells property and update example.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 .../devicetree/bindings/watchdog/mtk-wdt.txt        |  9 ++++++---
 .../dt-bindings/reset-controller/mt8183-resets.h    | 13 +++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 3ee625d0812f..ecb9ff784832 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -16,11 +16,14 @@ Required properties:
 
 Optional properties:
 - timeout-sec: contains the watchdog timeout in seconds.
+- #reset-cells: Should be 1.
 
 Example:
 
-wdt: watchdog@10000000 {
-	compatible = "mediatek,mt6589-wdt";
-	reg = <0x10000000 0x18>;
+watchdog: watchdog@10007000 {
+	compatible = "mediatek,mt8183-wdt",
+		     "mediatek,mt6589-wdt";
+	reg = <0 0x10007000 0 0x100>;
 	timeout-sec = <10>;
+	#reset-cells = <1>;
 };
diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
index 8804e34ebdd4..47dadcf3fd24 100644
--- a/include/dt-bindings/reset-controller/mt8183-resets.h
+++ b/include/dt-bindings/reset-controller/mt8183-resets.h
@@ -78,4 +78,17 @@
 #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
 #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
 
+#define MT8183_TOPRGU_MM_SW_RST                                 1
+#define MT8183_TOPRGU_MFG_SW_RST                                2
+#define MT8183_TOPRGU_VENC_SW_RST                               3
+#define MT8183_TOPRGU_VDEC_SW_RST                               4
+#define MT8183_TOPRGU_IMG_SW_RST                                5
+#define MT8183_TOPRGU_MD_SW_RST                                 7
+#define MT8183_TOPRGU_CONN_SW_RST                               9
+#define MT8183_TOPRGU_CONN_MCU_SW_RST                           12
+#define MT8183_TOPRGU_IPU0_SW_RST                               14
+#define MT8183_TOPRGU_IPU1_SW_RST                               15
+#define MT8183_TOPRGU_AUDIO_SW_RST                              17
+#define MT8183_TOPRGU_CAMSYS_SW_RST                             18
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
