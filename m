Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D626D1C7FF5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 04:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBFE17DA;
	Thu,  7 May 2020 04:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBFE17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588817910;
	bh=mn/Hj7MjEmy1N7/t7Sts3MfCQ0me9pGJQj7D/wipLls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQHj2+u+dWBV8i89eMuHEi2q3FaJMF52eITvPrLd0ru1rMJLPGsjXjLBNLz1QJCMV
	 eq16Doy4+BInSMgWHl2681Tw+Rn8VRX5cwnNuCYZLmulh2rlLQfFjreDj+/vmFsGs2
	 loMVnn6J4y0JTyvzsBCsH+MLKWWpbvlQoRXvRwN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4CFF801D9;
	Thu,  7 May 2020 04:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDC55F8015F; Thu,  7 May 2020 04:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E837AF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 04:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E837AF8011C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0472Fix46013913,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0472Fix46013913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 7 May 2020 10:15:44 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 7 May 2020 10:15:44 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 7 May 2020
 10:15:44 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt1016: Add the devicetree file for the rt1016
Date: Thu, 7 May 2020 10:15:39 +0800
Message-ID: <20200507021539.7133-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507021539.7133-1-oder_chiou@realtek.com>
References: <20200507021539.7133-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB06.realtek.com.tw (172.21.6.99) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

The patch adds the devicetree file for the rt1016.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 .../devicetree/bindings/sound/rt1016.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rt1016.txt

diff --git a/Documentation/devicetree/bindings/sound/rt1016.txt b/Documentation/devicetree/bindings/sound/rt1016.txt
new file mode 100644
index 000000000000..2310f8ff259b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rt1016.txt
@@ -0,0 +1,17 @@
+RT1016 Stereo Class D Audio Amplifier
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "realtek,rt1016".
+
+- reg : The I2C address of the device.
+
+
+Example:
+
+rt1016: codec@1a {
+	compatible = "realtek,rt1016";
+	reg = <0x1a>;
+};
-- 
2.25.1

