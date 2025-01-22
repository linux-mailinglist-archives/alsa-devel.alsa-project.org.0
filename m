Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B298A19303
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2025 14:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6690A604C4;
	Wed, 22 Jan 2025 14:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6690A604C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737553975;
	bh=1l58LhS6j71Nt2V5lm/VmcPbRZSjF7oYJXn69kI4Ujg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BaEfC4a8PC4WiQLfK/gSZtdVYT9Uhq/lsG7rmUU6TE31i0Q86QWz6NxYnaRo6q6j0
	 Swpu+PN17i6GiFVxJxZYVDzvTzykT5Hvx7tv893qOBbb2XuAmKqYHwFhuITdvudAAA
	 DCHRWPacPY8wF7WMfnlGMf2dZNuAQ1gLCSWd4m1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A254F805B2; Wed, 22 Jan 2025 14:52:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D396F805B2;
	Wed, 22 Jan 2025 14:52:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C54AF801F7; Wed, 22 Jan 2025 14:51:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 238ACF800F3
	for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2025 14:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238ACF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pJ2eg98o
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MDpdpD196053
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 07:51:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737553899;
	bh=WTvq+CmTdl3clQwZIph1xhPWrgC2lLgOnrMdL4DkjNQ=;
	h=From:To:CC:Subject:Date;
	b=pJ2eg98orlDBEuxwf3xQ+1GYGrXRoC3iKJeaj86ExpHJsTqpnxM0OSYjaRNwCyGmy
	 DrFhq6DX8gozVeksoXLJO5/hq3B6z45glU19ksVYRJYKxsXy1ElRVcDYd7S3ekzQfR
	 PzKDEgTTdu6w7IhH7NevR0kX7Up/MY9bnWb4+T30=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MDpd2w057122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 07:51:39 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 07:51:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 07:51:38 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.127])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MDpZ8I099738;
	Wed, 22 Jan 2025 07:51:36 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [RESEND PATCH v1] MAINTAINERS: update entries in TEXAS INSTRUMENTS
 LOW/MIDDLE-POWER AUDIO AMPLIFIER (ASoC/HDA) DRIVERS and add entries for
 haptic driver
Date: Wed, 22 Jan 2025 21:51:32 +0800
Message-ID: <20250122135132.1141-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: UL6NQKPVOLCTIFMLXXBTQGPJA77V4JHB
X-Message-ID-Hash: UL6NQKPVOLCTIFMLXXBTQGPJA77V4JHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UL6NQKPVOLCTIFMLXXBTQGPJA77V4JHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to internal re-org, Kevin has no longer maintained audio driver.
With the job responsibility change, drop entries for the audio converter
and add entries for both haptics drivers and middle-power audio amplifier
drivers. Add audio converter, set the Status as Supported.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 MAINTAINERS | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58c3381725fb..41a4bd0cd0a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23206,25 +23206,42 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
 F:	sound/soc/ti/
 
-TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS
+TEXAS INSTRUMENTS LOW/MIDDLE-POWER AUDIO AMPLIFIER (ASoC/HDA) & HAPTICS DRIVERS
 M:	Shenghao Ding <shenghao-ding@ti.com>
-M:	Kevin Lu <kevin-lu@ti.com>
 M:	Baojun Xu <baojun.xu@ti.com>
 L:	linux-sound@vger.kernel.org
-S:	Maintained
+S:	Supported
+F:	Documentation/devicetree/bindings/input/ti,drv260x.yaml
+F:	Documentation/devicetree/bindings/input/ti,drv266x.yaml
 F:	Documentation/devicetree/bindings/sound/tas2552.txt
+F:	Documentation/devicetree/bindings/sound/tas5720.txt
 F:	Documentation/devicetree/bindings/sound/ti,tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas2781.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas5086.txt
+F:	Documentation/devicetree/bindings/sound/ti,tas57xx.yaml
+F:	Documentation/devicetree/bindings/sound/ti,tas5805m.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tpa6130a2.yaml
+F:	drivers/input/misc/drv2*.c
+F:	include/sound/tas2*.h
+F:	include/sound/tas5086.h
+F:	include/sound/tpa6130a2-plat.h
+F:	sound/pci/hda/tas2781_hda_i2c.c
+F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/tas5*.*
+F:	sound/soc/codecs/tpa6130a2.*
+
+TEXAS INSTRUMENTS AUDIO Converter (ASoC) and Touch Screen DRIVERS
+L:	linux-sound@vger.kernel.org
+S:	Maintained
 F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
+F:	Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	include/sound/tas2*.h
+F:	drivers/input/touchscreen/tsc2*.*
 F:	include/sound/tlv320*.h
-F:	include/sound/tpa6130a2-plat.h
-F:	sound/pci/hda/tas2781_hda_i2c.c
 F:	sound/soc/codecs/pcm1681.c
 F:	sound/soc/codecs/pcm1789*.*
 F:	sound/soc/codecs/pcm179x*.*
@@ -23234,9 +23251,8 @@ F:	sound/soc/codecs/pcm3060*.*
 F:	sound/soc/codecs/pcm3168a*.*
 F:	sound/soc/codecs/pcm5102a.c
 F:	sound/soc/codecs/pcm512x*.*
-F:	sound/soc/codecs/tas2*.*
+F:	sound/soc/codecs/pcm6240.*
 F:	sound/soc/codecs/tlv320*.*
-F:	sound/soc/codecs/tpa6130a2.*
 
 TEXAS INSTRUMENTS DMA DRIVERS
 M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>

base-commit: c4b9570cfb63501638db720f3bee9f6dfd044b82
-- 
2.34.1

