Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE5790C84
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 16:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63D09825;
	Sun,  3 Sep 2023 16:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63D09825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693751995;
	bh=enV+SqyecbOfVcUbHoqUCBK6vvS9LXOU9qkKPFqeik8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EeUFAl+oLjIq4E85hAbIB18OpvxEsg/xBjD0cw6x4KSgpAlif2PLtW1fCean9MSfS
	 2C82gYaiw8LFh4nVQRdmfr4SnEK6ofO1pIzjjCDO1SCOc5JTRnN/jO2zn7lcScva88
	 IOAwk6Wowg4yM0p+XWhX29LmcmYBzrrKMkcufHWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5006DF804F3; Sun,  3 Sep 2023 16:38:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF661F80558;
	Sun,  3 Sep 2023 16:38:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B97FF8047D; Sun,  3 Sep 2023 16:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3815AF80141
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 16:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3815AF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=WIb4ofuC
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 383EcN98003267;
	Sun, 3 Sep 2023 09:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693751903;
	bh=v6pe/Dt8AerprFgjS5Gcdn7rSGlsyB+4xsmT0PdVs2A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WIb4ofuCndyGlZVpvm3YB2Gvnl2n3dUBMiN0aIEEcz4ZyjY7HehtxwUHRSJnm8rR+
	 FAP9GM/D3DL/ZV+mXIfkFD2cBr9yHvQWknORkbSBQOsQaikGLRVnbPkXGjAKV3meoU
	 tz2KdjwxFMcjHlSE31sh5F5ukiPzoUnCyoVRt1lo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 383EcNWo018035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 3 Sep 2023 09:38:23 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 3
 Sep 2023 09:38:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 3 Sep 2023 09:38:22 -0500
Received: from LT5CG31242FY.dhcp.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 383Ec9Ew064460;
	Sun, 3 Sep 2023 09:38:17 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <mengdong.lin@intel.com>, <baojun.xu@ti.com>,
        <thomas.gfeller@q-drop.com>, <peeyush@ti.com>, <navada@ti.com>,
        <broonie@kernel.org>, <gentuser@gmail.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 2/2] ALSA: hda/tas2781: Update tas2781 HDA driver
Date: Sun, 3 Sep 2023 22:37:58 +0800
Message-ID: <20230903143759.92-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20230903143759.92-1-shenghao-ding@ti.com>
References: <20230903143759.92-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: IBTQEBRNLSIDVXRXGL4H2HIZWDVRFUPM
X-Message-ID-Hash: IBTQEBRNLSIDVXRXGL4H2HIZWDVRFUPM
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBTQEBRNLSIDVXRXGL4H2HIZWDVRFUPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support ACPI_ID both TXNW2781 and TIAS2781, update dsp/bypass mode
switching in tasdevice_program_put.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
Changes in v1:
 - Add comment on dsp/bypass mode in tasdevice_program_put and
   tasdevice_info_programs
 - TIAS2781 has been used by our customers, see following dstd.dsl. We
   have discussed this with them, they requested TIAS2781 must be
   supported for the laptops already released to market, their new laptop
   can switch to TXNW2781
   Name (_HID, "TIAS2781")  // _HID: Hardware ID
   Name (_UID, Zero)  // _UID: Unique ID
   Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
   {
       If ((SPID == Zero))
       {
          Return ("17AA3886")
       }

       If ((SPID == One))
       {
           Return ("17AA3884")
       }
   }
---
 sound/pci/hda/tas2781_hda_i2c.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb80280293..5250d300a2 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -199,8 +199,11 @@ static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
+	/* 0:			dsp mode
+	 * non-zero:	bypass mode
+	 */
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = tas_fw->nr_programs - 1;
+	uinfo->value.integer.max = tas_fw->nr_programs;
 
 	return 0;
 }
@@ -238,7 +241,10 @@ static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
 	int max = tas_fw->nr_programs - 1;
 	int val, ret = 0;
 
-	val = clamp(nr_program, 0, max);
+	/* 0:			dsp mode
+	 * non-zero:	bypass mode
+	 */
+	val = (nr_program) ? max : 0;
 
 	if (tas_priv->cur_prog != val) {
 		tas_priv->cur_prog = val;
@@ -647,7 +653,9 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	const char *device_name;
 	int ret;
 
-	if (strstr(dev_name(&clt->dev), "TIAS2781"))
+	if (strstr(dev_name(&clt->dev), "TXNW2781"))
+		device_name = "TXNW2781";
+	else if (strstr(dev_name(&clt->dev), "TIAS2781"))
 		device_name = "TIAS2781";
 	else
 		return -ENODEV;
@@ -824,6 +832,7 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
 
 static const struct acpi_device_id tas2781_acpi_hda_match[] = {
 	{"TIAS2781", 0 },
+	{"TXNW2781", 1 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
-- 
2.34.1

