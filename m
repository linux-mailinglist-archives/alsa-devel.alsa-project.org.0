Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D17790C83
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 16:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21A22206;
	Sun,  3 Sep 2023 16:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21A22206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693751975;
	bh=XnJ+rBd204cD0RhuvzREtSVPd6pW1pZ5s9jN9JZC2E4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sM7khud14PqwW/VoyOael1pSjKKX5856NRJxhrY3k2wRe1HqolCFMxBfTCOhbWrvB
	 6CV+A1DZUI4yo67uZnpXEGg2C6U3yUfBUfnGBXGHdduYvZ4dGw5ZE++LiVbyJtUytH
	 5jDDSIYy+wGsDPDE5CJ5Ju7jRQ0cuT08ONdBJNcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF1DBF80431; Sun,  3 Sep 2023 16:38:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDCDF80431;
	Sun,  3 Sep 2023 16:38:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9957FF80494; Sun,  3 Sep 2023 16:38:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D163EF800F5
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 16:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D163EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=hQwhUfAD
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 383EcHLk094173;
	Sun, 3 Sep 2023 09:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693751897;
	bh=VPP3534bL1twBj+oAPOmEti95elGY30cahr0lXxhNOw=;
	h=From:To:CC:Subject:Date;
	b=hQwhUfADdrfaT2P1ZjStTaj/kYzbWzl9sOtuSrpX1Kpz8sAHmN6J+6yEWJOp51BAs
	 cEJwusx6wXT72yrqHFS7hZ5t4Tpxn3RsGdtigfuVFvvbJ2kTZn2DRBBlyjWe4/fu4m
	 8L8wox2NgJhrGvJVEJFgSlfuRMaz+jShPrJi5CMk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 383EcHjC038931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 3 Sep 2023 09:38:17 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 3
 Sep 2023 09:38:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 3 Sep 2023 09:38:16 -0500
Received: from LT5CG31242FY.dhcp.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 383Ec9Ev064460;
	Sun, 3 Sep 2023 09:38:10 -0500
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
Subject: [PATCH v1 1/2] ALSA: hda/tas2781: Update tas2781 HDA driver
Date: Sun, 3 Sep 2023 22:37:57 +0800
Message-ID: <20230903143759.92-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: PFDGITJWYF5G2NWQTQLC4NEXFPSRNVE7
X-Message-ID-Hash: PFDGITJWYF5G2NWQTQLC4NEXFPSRNVE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFDGITJWYF5G2NWQTQLC4NEXFPSRNVE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support ACPI_ID both TXNW2781 and TIAS2781, and revert structure
cs35l41_dev_name.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
Changes in v1:
 - Redefine tas2781_generic_fixup, remove hid param
 - TIAS2781 has been used by our customers, see following dstd.dsl. We
    have discussed this with them, they requested TIAS2781 must be
    supported for the laptops already released to market, their new
    laptops will switch to TXNW2781
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
 - Add TXNW2781 support in comp_match_tas2781_dev_name
 - revert from scodec_dev_name back to cs35l41_dev_name
---
 sound/pci/hda/patch_realtek.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a07df6f929..1dc50fdbdf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6745,7 +6745,7 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 	}
 }
 
-struct scodec_dev_name {
+struct cs35l41_dev_name {
 	const char *bus;
 	const char *hid;
 	int index;
@@ -6754,7 +6754,7 @@ struct scodec_dev_name {
 /* match the device name in a slightly relaxed manner */
 static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
 {
-	struct scodec_dev_name *p = data;
+	struct cs35l41_dev_name *p = data;
 	const char *d = dev_name(dev);
 	int n = strlen(p->bus);
 	char tmp[32];
@@ -6773,19 +6773,27 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
 static int comp_match_tas2781_dev_name(struct device *dev,
 	void *data)
 {
-	struct scodec_dev_name *p = data;
+	const char *bus = data;
 	const char *d = dev_name(dev);
-	int n = strlen(p->bus);
+	int n = strlen(bus);
 	char tmp[32];
 
 	/* check the bus name */
-	if (strncmp(d, p->bus, n))
+	if (strncmp(d, bus, n))
 		return 0;
 	/* skip the bus number */
 	if (isdigit(d[n]))
 		n++;
+
+	/* exactly match either TXNW2781 or TIAS2781 */
+	/* the rest must be exact matching */
+	snprintf(tmp, sizeof(tmp), "-%s:00", "TXNW2781");
+
+	if (!strcmp(d + n, tmp))
+		return 1;
+
 	/* the rest must be exact matching */
-	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
+	snprintf(tmp, sizeof(tmp), "-%s:00", "TIAS2781");
 
 	return !strcmp(d + n, tmp);
 }
@@ -6795,7 +6803,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct alc_spec *spec = cdc->spec;
-	struct scodec_dev_name *rec;
+	struct cs35l41_dev_name *rec;
 	int ret, i;
 
 	switch (action) {
@@ -6824,24 +6832,17 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 }
 
 static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
-	const char *bus, const char *hid)
+	const char *bus)
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct alc_spec *spec = cdc->spec;
-	struct scodec_dev_name *rec;
 	int ret;
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
-		if (!rec)
-			return;
-		rec->bus = bus;
-		rec->hid = hid;
-		rec->index = 0;
 		spec->comps[0].codec = cdc;
 		component_match_add(dev, &spec->match,
-			comp_match_tas2781_dev_name, rec);
+			comp_match_tas2781_dev_name, (void *)bus);
 		ret = component_master_add_with_match(dev, &comp_master_ops,
 			spec->match);
 		if (ret)
@@ -6888,7 +6889,7 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
 static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
-	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
+	 tas2781_generic_fixup(cdc, action, "i2c");
 }
 
 /* for alc295_fixup_hp_top_speakers */
-- 
2.34.1

