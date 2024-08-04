Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69265946BF2
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2024 04:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F3741F6;
	Sun,  4 Aug 2024 04:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F3741F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722737830;
	bh=pMNWvnX0oXqGdbUFqY1gy7d59DBaFMQ6daE7FrQ2cok=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C77qXf1bsEeVPsvzxQ0EPC9wMjgq3I4WBRKkxXoHIE6gamuF3IF3BX6YrmB1n86FT
	 mZgPUcrV+IxrZEBjYQJ292R+1Z3H0pZ+L6pT1WRmc0U1xNRF06Bft9RfchAlpXn5Px
	 NDzuriwdgm3cR9Xgwb4RRRc3wMoDfWNWqOoSx104=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D0E0F805B0; Sun,  4 Aug 2024 04:16:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F42AF805AD;
	Sun,  4 Aug 2024 04:16:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6D32F800B0; Sun,  4 Aug 2024 04:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1170AF800B0
	for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2024 04:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1170AF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Vsgt6i1M
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4742B4cg017298;
	Sat, 3 Aug 2024 21:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722737464;
	bh=0M1j4GPHFXZKwZggPzkLnpr55RObTkvzbmxuiEEK9Eg=;
	h=From:To:CC:Subject:Date;
	b=Vsgt6i1MlAno3BKPtlNE0rD7Kbx178yhETsfQaXquMFuW+2ZkhXddQ2k0LeJjjKpr
	 8YZmP6Z5fejFO06J9rc16Du7gP+Hl9Xe3HscEJS1zeDTl7EVEasE39GCx9XQazN+i+
	 HKaQd0UP1zzUAKYpTpvbxMzjD6PfsNm+l0X6Kp6E=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4742B4Ea088546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 3 Aug 2024 21:11:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 3
 Aug 2024 21:11:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 3 Aug 2024 21:11:03 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.49])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4742B0rN048121;
	Sat, 3 Aug 2024 21:11:01 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <robinchen@ti.com>,
        <alsa-devel@alsa-project.org>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] MAINTAINERS: update entries in TEXAS INSTRUMENTS AUDIO
 (ASoC/HDA) DRIVERS and add entries for haptic driver
Date: Sun, 4 Aug 2024 10:10:53 +0800
Message-ID: <20240804021054.1035-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: 5PUHGGGDWAEMVTO65AAAQK2KXF7EG2BH
X-Message-ID-Hash: 5PUHGGGDWAEMVTO65AAAQK2KXF7EG2BH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PUHGGGDWAEMVTO65AAAQK2KXF7EG2BH/>
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
 MAINTAINERS | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..34639103e463 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22567,37 +22567,30 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
 F:	sound/soc/ti/
 
-TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
+TEXAS INSTRUMENTS AUDIO (ASoC/HDA) & HAPTICS DRIVERS
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

