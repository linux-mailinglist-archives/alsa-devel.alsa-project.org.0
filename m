Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B427DB28A8C
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Aug 2025 06:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E80D6022C;
	Sat, 16 Aug 2025 06:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E80D6022C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755318525;
	bh=Esg2ApusHefEjks4oB99o3R10X7dJNo2nl0FDeReQuQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zd8JfC6+3BVZ4P/TnZdU7808Jfow1joJlNkwK72WvMcYafAYyuwrWDKVZgtZ509mx
	 uTOOsVU+AyOULiH2sNCSA8nomFQ0+IrA2V+UJs48ZA8gkuciQ5qo98Uw0pHI7sBiTV
	 aEZHesFNaHteu8tO3gv8lMpXlmqNWzB9XK8CG7Es=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1600FF805C6; Sat, 16 Aug 2025 06:28:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5BBAF805C9;
	Sat, 16 Aug 2025 06:28:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068A7F80508; Sat, 16 Aug 2025 06:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0277F800DF
	for <alsa-devel@alsa-project.org>; Sat, 16 Aug 2025 06:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0277F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=XBcjzuRl
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57G4RpGv2287569;
	Fri, 15 Aug 2025 23:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755318471;
	bh=cdEhyYP5Z26rmwIUQNXyNDdUNTis7R2NVlJzNymdpOI=;
	h=From:To:CC:Subject:Date;
	b=XBcjzuRl1KMbLNwgSi9d5qbSqSsg2X8bimzPuR0/NrlIrJqGnCa/ORS0d0wQZT15/
	 2y/5jlVnQN/S8XwDsRkbBU2MARoeNqz5eINXIJqFdbmW3QqWb6/m+o34UKdZYZd8GW
	 sgnASpjtLn/HlZwT7JSxQ7jhHBSq1ztq4avOlyns=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57G4RnRU3061512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 23:27:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 23:27:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 23:27:49 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57G4Rj5W1962932;
	Fri, 15 Aug 2025 23:27:46 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Add name prefix tas2781 for tas2781's
 dvc_tlv and amp_vol_tlv
Date: Sat, 16 Aug 2025 12:27:41 +0800
Message-ID: <20250816042741.1659-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: NLKA3O2LYXIWVCAERK3EOAQP2R2TG2OC
X-Message-ID-Hash: NLKA3O2LYXIWVCAERK3EOAQP2R2TG2OC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLKA3O2LYXIWVCAERK3EOAQP2R2TG2OC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With some new devices adding into the driver, dvc_tlv and amp_vol_tlv will
cause confusion for customers on which devices they support.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Put Fixes tag.
---
 include/sound/tas2781-tlv.h                    | 6 +++---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 +-
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 6 ++++--
 sound/soc/codecs/tas2781-i2c.c                 | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/sound/tas2781-tlv.h b/include/sound/tas2781-tlv.h
index ef9b9f19d212..273224df9282 100644
--- a/include/sound/tas2781-tlv.h
+++ b/include/sound/tas2781-tlv.h
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2781 driver implements a flexible and configurable
@@ -15,7 +15,7 @@
 #ifndef __TAS2781_TLV_H__
 #define __TAS2781_TLV_H__
 
-static const __maybe_unused DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 50, 0);
-static const __maybe_unused DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2781_dvc_tlv, -10000, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2781_amp_tlv, 1100, 50, 0);
 
 #endif
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 3471b9ab52cb..318f8c58ae61 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -269,7 +269,7 @@ static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
-		tas2781_amp_putvol, amp_vol_tlv),
+		tas2781_amp_putvol, tas2781_amp_tlv),
 	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
 		tas2781_force_fwload_get, tas2781_force_fwload_put),
 };
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 09a5d0f131b2..b9a55672bf15 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -494,9 +494,11 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 
 static struct snd_kcontrol_new tas2781_snd_ctls[] = {
 	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_AMP_LEVEL, 1, 0, 20, 0,
-		tas2781_amp_getvol, tas2781_amp_putvol, amp_vol_tlv),
+		tas2781_amp_getvol, tas2781_amp_putvol,
+		tas2781_amp_tlv),
 	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_DVC_LVL, 0, 0, 200, 1,
-		tas2781_digital_getvol, tas2781_digital_putvol, dvc_tlv),
+		tas2781_digital_getvol, tas2781_digital_putvol,
+		tas2781_dvc_tlv),
 	ACARD_SINGLE_BOOL_EXT(NULL, 0, tas2781_force_fwload_get,
 		tas2781_force_fwload_put),
 };
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index e4ca43e006db..ea3cdb8553de 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -910,10 +910,10 @@ static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
-		tas2781_amp_putvol, amp_vol_tlv),
+		tas2781_amp_putvol, tas2781_amp_tlv),
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2781_DVC_LVL,
 		0, 0, 200, 1, tas2781_digital_getvol,
-		tas2781_digital_putvol, dvc_tlv),
+		tas2781_digital_putvol, tas2781_dvc_tlv),
 };
 
 static const struct snd_kcontrol_new tas2781_cali_controls[] = {
-- 
2.43.0

