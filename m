Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC40791793
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5323FE10;
	Mon,  4 Sep 2023 14:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5323FE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831862;
	bh=C5K5T8cLD6MsV3JuNrelh6EoFxmZ3DeI7zpx45M1in0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=So67V/tHanxSLBFiRQiTU5yRBtfeDAf5198v0F54xJQrQyCMPw+8XOm7nv2Zr3H2S
	 cXQCBPsPKye11SuCjWC8mTgTkr6tGPZR1Sf0DyU66qk63YajyHWpA0TueXPWkpo4GZ
	 CXNlxhzHyGpQF0nr3RC7Maw2u3RmluSG1g3UGnHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03E3BF805B3; Mon,  4 Sep 2023 14:49:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 525DEF805AD;
	Mon,  4 Sep 2023 14:49:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 477A0F8047D; Sun,  3 Sep 2023 18:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D44B8F80236
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 18:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D44B8F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=OXc3wHf5
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 383GEui4021076;
	Sun, 3 Sep 2023 11:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693757697;
	bh=4gcLlaEYGDGQOk6RQ1aDfmPPL3ddH9FwQ/oXw3nLfWY=;
	h=From:To:CC:Subject:Date;
	b=OXc3wHf5n3bPrDF2KhmSo/twCRcwTmR0QBK9nK7gbNN2mzBIhHOQG0Gbdgxtow/0P
	 SdT41yFq/whmvCVnS6QQguwsTuFYl3DYL1KQCkLl/0alFETHeDvOpsWJs/hpuGYvc4
	 DZ7t2YzfXzn3gOp8+tlh6JsZAEhCPtzM2dZXykkU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 383GEuk8105599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 3 Sep 2023 11:14:56 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 3
 Sep 2023 11:14:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 3 Sep 2023 11:14:56 -0500
Received: from LT5CG2035V3Q.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 383GEqlu016482;
	Sun, 3 Sep 2023 11:14:53 -0500
From: Kevin-Lu <kevin-lu@ti.com>
To: <broonie@kernel.org>, <peeyush@ti.com>, <navada@ti.com>,
        <baojun.xu@ti.com>
CC: <shenghao-ding@ti.com>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Kevin-Lu <kevin-lu@ti.com>
Subject: [PATCH v1] MAINTAINERS: Update the MAINTAINERS enties for TEXAS
 INSTRUMENTS ASoC DRIVERS
Date: Mon, 4 Sep 2023 00:14:37 +0800
Message-ID: <20230903161439.85-1-kevin-lu@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: kevin-lu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: L477B4M3ZFRTFS563HZR2W5T2IFDFYUH
X-Message-ID-Hash: L477B4M3ZFRTFS563HZR2W5T2IFDFYUH
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:48:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L477B4M3ZFRTFS563HZR2W5T2IFDFYUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the MAINTAINERS email for TEXAS INSTRUMENTS ASoC DRIVERS.

Signed-off-by: Kevin-Lu <kevin-lu@ti.com>

---
Change in v1:
Change Baojun Xu's email to a commonly used address
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88174736be51..8c8857826a79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21066,7 +21066,7 @@ F:	sound/soc/ti/
 TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
 M:	Kevin Lu <kevin-lu@ti.com>
-M:	Baojun Xu <x1077012@ti.com>
+M:	Baojun Xu <baojun.xu@ti.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/tas2552.txt
-- 
2.34.1

