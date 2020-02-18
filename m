Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D216277F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 14:56:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F23AF1692;
	Tue, 18 Feb 2020 14:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F23AF1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582034204;
	bh=kST5t0Y3Qqo1GPTlAIDSVh0O6gPxFeifVhfZdHzeY1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBLc6auXqa3rjukgktMs6x6nXjSiikNqL+DtWBrwIaXksP0y4ooLbfiWwcO6jsLMK
	 pKZqJ60lzua6ThZeLHDNSZyQ69R7QM3MkJVZAT2Xis3gKeJOx7JawPZ/I3Esto3cxV
	 V1QYA8FONUk6nu+rzYNder6XQgbH6o0fCHZsIidM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D71C6F8014A;
	Tue, 18 Feb 2020 14:55:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F6DFF8014A; Tue, 18 Feb 2020 14:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6FF9F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 14:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FF9F800C4
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01IDsp7c031336,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01IDsp7c031336
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 21:54:51 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 18 Feb 2020 21:54:51 +0800
Received: from derek-pvm.localdomain (172.22.234.75) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 18 Feb 2020 21:54:50 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2 2/2] ASoC: rt5682: Add DAI clock binding info for WCLK/BCLK
 CCF usage
Date: Tue, 18 Feb 2020 21:51:52 +0800
Message-ID: <1582033912-6841-2-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582033912-6841-1-git-send-email-derek.fang@realtek.com>
References: <1582033912-6841-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.234.75]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

From: Derek Fang <derek.fang@realtek.com>

This patch describes that rt5682 can expose WCLK and BCLK clocks
and how to use.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 Documentation/devicetree/bindings/sound/rt5682.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
index 30e927a2..ac98151 100644
--- a/Documentation/devicetree/bindings/sound/rt5682.txt
+++ b/Documentation/devicetree/bindings/sound/rt5682.txt
@@ -32,6 +32,12 @@ Optional properties:
   The delay time is realtek,btndet-delay value multiple of 8.192 ms.
   If absent, the default is 16.
 
+- #clock-cells : Should be set to '<1>',  wclk and bclk sources provided.
+- clock-output-names : Name given for DAI clocks output.
+
+- clocks : phandle and clock specifier for codec MCLK.
+- clock-names : Clock name string for 'clocks' attribute, should be "mclk".
+
 Pins on the device (for linking into audio routes) for RT5682:
 
   * DMIC L1
@@ -53,4 +59,10 @@ rt5682 {
 	realtek,dmic1-clk-pin = <1>;
 	realtek,jd-src = <1>;
 	realtek,btndet-delay = <16>;
+
+	#clock-cells = <1>;
+	clock-output-names = "rt5682-dai-wclk", "rt5682-dai-bclk";
+
+	clocks = <&osc>;
+	clock-names = "mclk";
 };
-- 
2.7.4

