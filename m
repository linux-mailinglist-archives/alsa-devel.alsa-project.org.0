Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6D634F987
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 09:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8402A1682;
	Wed, 31 Mar 2021 09:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8402A1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617174765;
	bh=QieTUbKCjqtXoQZgvu8uSGq9FqWK13uB2RvihS14WzI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g04LnmC2iUk/SyD5X43ymdInFNM7TvnK1TvgJtvUfIYDeu3JbKKwBa8MYDkpxUaR9
	 TehkYUn4dBp52tJ8JuPzoJaurF8L6l2xURJVdlVaYORrepBq2qe5Sd1QLQncO6SHpf
	 bKiD3/8GqEmPMHthoAtn0CzmQNn2HZaSKItlKcvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E16ADF8016E;
	Wed, 31 Mar 2021 09:11:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A98F7F80166; Wed, 31 Mar 2021 09:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B768F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 09:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B768F8013C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12V7Aqu36002573,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 12V7Aqu36002573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 31 Mar 2021 15:10:52 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 15:10:51 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>
Subject: [PATCH] dt-bindings: sound: add address-cells and size-cells
 information
Date: Wed, 31 Mar 2021 15:10:46 +0800
Message-ID: <20210331071046.12526-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 Jack Yu <jack.yu@realtek.com>, kenny_chen@realtek.com,
 linux-kernel@vger.kernel.org, derek.fang@realtek.com, shumingf@realtek.com,
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

Add address-cells and size-cells information to fix warnings
for rt1019.yaml.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 Documentation/devicetree/bindings/sound/rt1019.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt1019.yaml b/Documentation/devicetree/bindings/sound/rt1019.yaml
index c24c29eafa54..3d5a91a942f4 100644
--- a/Documentation/devicetree/bindings/sound/rt1019.yaml
+++ b/Documentation/devicetree/bindings/sound/rt1019.yaml
@@ -26,6 +26,8 @@ additionalProperties: false
 examples:
   - |
     i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
         rt1019: codec@28 {
             compatible = "realtek,rt1019";
             reg = <0x28>;
-- 
2.29.0

