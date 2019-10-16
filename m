Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ABAD9026
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 13:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B6D1666;
	Wed, 16 Oct 2019 13:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B6D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571227101;
	bh=IizU4G5mdkiu1VWLNqEt/jicYst9I+DbBxMd+iA9Q0E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p0DPu8zRJpphg2/rn44QLjqbjGBVq34tjmLL7XWTgfcPo+0oSEuS8TQh2q6k80G54
	 QNNK1XiAi9aoaD2yVAE64CZmwKZPkPIWacC5nr311mte3NCR5TSQDiyVFqbfjdEIkj
	 Y/PRUOBULWRwuFYoGxxK9Hc4xoF4Y7sdBU8jI5rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9693F80362;
	Wed, 16 Oct 2019 13:56:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85E5CF80362; Wed, 16 Oct 2019 13:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80FF5F80322
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 13:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FF5F80322
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9GBuMp9020854,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9GBuMp9020854
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 19:56:22 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS12.realtek.com.tw (172.21.6.16) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 19:56:21 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 16 Oct 2019 19:56:17 +0800
Message-ID: <20191016115617.23213-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: dt-bindings: rt1011: add r0 and
	temperature device property
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

From: Shuming Fan <shumingf@realtek.com>

Typically, the r0 (calibration data) and temperature were measured in the factory.
This information is written into the non-volatile area
where keeps data whether factory reset or OS update.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 Documentation/devicetree/bindings/sound/rt1011.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt1011.txt b/Documentation/devicetree/bindings/sound/rt1011.txt
index 35a23e60d679..02d53b9aa247 100644
--- a/Documentation/devicetree/bindings/sound/rt1011.txt
+++ b/Documentation/devicetree/bindings/sound/rt1011.txt
@@ -20,6 +20,14 @@ Required properties:
         |     1     |    1     |   0x3b     |
         -------------------------------------
 
+Optional properties:
+
+- realtek,temperature_calib
+  u32. The temperature was measured while doing the calibration. Units: Celsius degree
+
+- realtek,r0_calib
+  u32. This is r0 calibration data which was measured in factory mode.
+
 Pins on the device (for linking into audio routes) for RT1011:
 
   * SPO
@@ -29,4 +37,6 @@ Example:
 rt1011: codec@38 {
 	compatible = "realtek,rt1011";
 	reg = <0x38>;
+	realtek,temperature_calib = <25>;
+	realtek,r0_calib = <0x224050>;
 };
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
