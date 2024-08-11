Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C794E020
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Aug 2024 07:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79699EC1;
	Sun, 11 Aug 2024 07:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79699EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723354378;
	bh=b8CW4c/6Nd6c4UOmnSTQaEDu3v75tfUytdfjWYBcX5k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZBRcCupB2MULZczLty02C8XN9ex9z0mL7UbfRLZvN124aFfOVAGGF6iwDO2pE76o/
	 yNZIrX6BKHUwQaFAzOjh2XX8lvmQleuG7HIeLpBh7pRJzYEtHeEqjhMGi2SqujUatb
	 17PnP2jlWZcSIXwgdlxrWkBecKduHAi80kpg7fOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A907F805BE; Sun, 11 Aug 2024 07:32:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B659DF805AF;
	Sun, 11 Aug 2024 07:32:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A60EF800B0; Sun, 11 Aug 2024 07:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A6C7F800B0
	for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2024 07:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A6C7F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pgAIUNrd
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47B5Estc127538;
	Sun, 11 Aug 2024 00:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723353294;
	bh=dKv5oKRSD9gOCXzLcHTQOIALI08gMLiZsQmG5gcQiRU=;
	h=From:To:CC:Subject:Date;
	b=pgAIUNrdm4i+xxnEuQ24btrf2defI094C3rn9ytG+mjFoKglXsnyfuuHCnh5vWysg
	 c2Jir28fZl2XCfZFqRnRynKiWZZEOrVSzSaeYQLmbM2VVjNg9ZIheZmoWU4n5jowCm
	 XEGCkoIcgu6Fj6yU26A04rJlyQ9sXKgt8jx6tuRg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47B5Es5n003011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Aug 2024 00:14:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 11
 Aug 2024 00:14:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 11 Aug 2024 00:14:53 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.152])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47B5EoFa002056;
	Sun, 11 Aug 2024 00:14:51 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <robinchen@ti.com>,
        <alsa-devel@alsa-project.org>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] MAINTAINERS: update entries in TEXAS INSTRUMENTS
 LOW/MIDDLE-POWER AUDIO AMPLIFIER (ASoC/HDA) DRIVERS and add entries for
 haptic driver
Date: Sun, 11 Aug 2024 13:14:44 +0800
Message-ID: <20240811051445.1600-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: ABFCXTVTZG5AVUKIHAKRZDAIPBSPQJAQ
X-Message-ID-Hash: ABFCXTVTZG5AVUKIHAKRZDAIPBSPQJAQ
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABFCXTVTZG5AVUKIHAKRZDAIPBSPQJAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to internal re-org, Kevin is no longer mnaintaining audio driver.
Due to job change to Shenghao Ding and Baojun Xu, drop entries for the
audio converter and add entries for both haptics drivers and middle-
power audio amplifier drivers.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Add the detailed information of the maintained drivers.
---
 MAINTAINERS | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..d1f7e096b270 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22569,37 +22569,30 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
 F:	sound/soc/ti/
 
-TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
+TEXAS INSTRUMENTS LOW/MIDDLE-POWER AUDIO AMPLIFIER (ASoC/HDA) & HAPTICS DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
-M:	Kevin Lu <kevin-lu@ti.com>
 M:	Baojun Xu <baojun.xu@ti.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/input/ti,drv260x.yaml
+F:	Documentation/devicetree/bindings/input/ti,drv266x.yaml
 F:	Documentation/devicetree/bindings/sound/tas2552.txt
+F:	Documentation/devicetree/bindings/sound/tas5720.txt
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2781.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
-F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
-F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
-F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
-F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
+F:	Documentation/devicetree/bindings/sound/ti,tas5086.txt
+F:	Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
 F:	Documentation/devicetree/bindings/sound/tpa6130a2.txt
+F:	drivers/input/misc/drv2*.c
 F:	include/sound/tas2*.h
-F:	include/sound/tlv320*.h
+F:	include/sound/tas5086.h
 F:	include/sound/tpa6130a2-plat.h
 F:	sound/pci/hda/tas2781_hda_i2c.c
-F:	sound/soc/codecs/pcm1681.c
-F:	sound/soc/codecs/pcm1789*.*
-F:	sound/soc/codecs/pcm179x*.*
-F:	sound/soc/codecs/pcm186x*.*
-F:	sound/soc/codecs/pcm3008.*
-F:	sound/soc/codecs/pcm3060*.*
-F:	sound/soc/codecs/pcm3168a*.*
-F:	sound/soc/codecs/pcm5102a.c
-F:	sound/soc/codecs/pcm512x*.*
 F:	sound/soc/codecs/tas2*.*
-F:	sound/soc/codecs/tlv320*.*
+F:	sound/soc/codecs/tas5*.*
 F:	sound/soc/codecs/tpa6130a2.*
 
 TEXAS INSTRUMENTS DMA DRIVERS
-- 
2.34.1

