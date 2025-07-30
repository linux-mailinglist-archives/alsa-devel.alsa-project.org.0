Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B69B15FF3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 14:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319436026D;
	Wed, 30 Jul 2025 14:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319436026D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753877207;
	bh=FhJYgVdy7uv+pIWPhCaLWgy9qxucMXMybPT+uOiNyDQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aCCqwB8NfocT0J7qEjZV9Swd4B13UDNv9BfGdCsIJJO606+jhWMJOjHQBeHtkXDiC
	 raqM11R323oLqLWX2L3pAZH/o9U7rzaYk7ApW7jN0py2Q6SSDJmiLWaBqKL7SQGhdp
	 LcvmlfUCz3dex7SP9JXAGFBye4+GYA0jXmBhpoB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B52A5F8060E; Wed, 30 Jul 2025 14:05:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F212F8060C;
	Wed, 30 Jul 2025 14:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F242F80254; Wed, 30 Jul 2025 07:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 665ABF80152
	for <alsa-devel@alsa-project.org>; Wed, 30 Jul 2025 07:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 665ABF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ohQY84eD
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56U5X3892691312;
	Wed, 30 Jul 2025 00:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753853583;
	bh=jqs9ri/KCcvlHLen5ccn4YkIZlSKH8zl84oJtQdNKqk=;
	h=From:To:CC:Subject:Date;
	b=ohQY84eD1DstEFx8OEonZc8AXlpvx94K8hhenMrrcGVDdHznp+Ve0hEH4M0KOhVyG
	 +I8mIkeB5qulWmu44ZmaYzVhyfXeOgvx6JzSl3c5vL49RtSHjcL27aKYMc16Y1QjEN
	 90m4SQtOqx6YL5rDdtmp/X/ZHldjodNFhTZYi/kg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56U5X2GI3265370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 00:33:02 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 00:33:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 00:33:02 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56U5WwHI418872;
	Wed, 30 Jul 2025 00:32:59 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
        <13916275206@139.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Normalize the volume kcontrol name
Date: Wed, 30 Jul 2025 13:32:36 +0800
Message-ID: <20250730053236.57643-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QCLF5JGOAMPHCPCXMV3M4TXST2YVEPB4
X-Message-ID-Hash: QCLF5JGOAMPHCPCXMV3M4TXST2YVEPB4
X-Mailman-Approved-At: Wed, 30 Jul 2025 12:05:26 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCLF5JGOAMPHCPCXMV3M4TXST2YVEPB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As more devices become supported, add "tas2781" as a suffix before the
TLV name, correct the DVC step, and normalize the volume kcontrol name.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2781-tlv.h                    | 6 ++++--
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 4 ++--
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 5 +++--
 sound/soc/codecs/tas2781-i2c.c                 | 8 ++++----
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/sound/tas2781-tlv.h b/include/sound/tas2781-tlv.h
index d87263e43fdb..38b8f828a353 100644
--- a/include/sound/tas2781-tlv.h
+++ b/include/sound/tas2781-tlv.h
@@ -15,7 +15,9 @@
 #ifndef __TAS2781_TLV_H__
 #define __TAS2781_TLV_H__
 
-static const __maybe_unused DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
-static const __maybe_unused DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2781_dvc_tlv,
+	-10000, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2781_amp_tlv,
+	1100, 50, 0);
 
 #endif
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index a0b132681804..6ec93b27aa7f 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -265,9 +265,9 @@ static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 };
 
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
-		tas2781_amp_putvol, amp_vol_tlv),
+		tas2781_amp_putvol, tas2781_amp_tlv),
 	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
 		tas2781_force_fwload_get, tas2781_force_fwload_put),
 };
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 09a5d0f131b2..b4664a696bad 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -494,9 +494,10 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 
 static struct snd_kcontrol_new tas2781_snd_ctls[] = {
 	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_AMP_LEVEL, 1, 0, 20, 0,
-		tas2781_amp_getvol, tas2781_amp_putvol, amp_vol_tlv),
+		tas2781_amp_getvol, tas2781_amp_putvol, tas2781_amp_tlv),
 	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_DVC_LVL, 0, 0, 200, 1,
-		tas2781_digital_getvol, tas2781_digital_putvol, dvc_tlv),
+		tas2781_digital_getvol, tas2781_digital_putvol,
+		tas2781_dvc_tlv),
 	ACARD_SINGLE_BOOL_EXT(NULL, 0, tas2781_force_fwload_get,
 		tas2781_force_fwload_put),
 };
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9f4d965a1335..a51f20cd869a 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -908,12 +908,12 @@ static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
 };
 
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
-	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
-		tas2781_amp_putvol, amp_vol_tlv),
-	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
+		tas2781_amp_putvol, tas2781_amp_tlv),
+	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS2781_DVC_LVL,
 		0, 0, 200, 1, tas2781_digital_getvol,
-		tas2781_digital_putvol, dvc_tlv),
+		tas2781_digital_putvol, tas2781_dvc_tlv),
 };
 
 static const struct snd_kcontrol_new tas2781_cali_controls[] = {
-- 
2.43.0

