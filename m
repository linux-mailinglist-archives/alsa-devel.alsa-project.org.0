Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CBA3B17A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2025 07:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9572604AB;
	Wed, 19 Feb 2025 07:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9572604AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739945570;
	bh=iXUqeelo6+wnmNEpdbEIOO9/BBhzbiMRW7aC7zC8Abk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SzgWkD4TY+KxMCg1yaZCo/JQdXePETMAtDRQpGpQLc5WH6/w9Jxfed/ClrqHpMSpw
	 ITXdN15NktomU1Spqxg9HGaFIN08Qi4+llofXr3NFi2pr+8QPOSA0dbKe4ujEOBvCN
	 wruIYoVuzIfaaBUuNHKIPqGFkuWFnPlqJ6wB1710=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8D9F8062D; Wed, 19 Feb 2025 07:11:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 367D1F8061A;
	Wed, 19 Feb 2025 07:11:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D78A9F8013D; Wed, 19 Feb 2025 07:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3631CF800E3
	for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2025 07:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3631CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=YtMYEH3r
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J6BGgx179437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 00:11:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739945476;
	bh=Heky75tj+uLcdqikRK3Ikg9XOVDU3NBtjpijRJyBNYI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YtMYEH3rbX5tyF0CrXbb+P5LtuFaM8cHa3Oi8nKjxNQQK1iokMZdkCE4ggRv/hP6L
	 ih9f5mqC4TZp4CEJL2Y7gOQFIxQsmESlEaGBDaJb6v/3bn4UUlEFoUQUURO8lYr9X2
	 DbX6NDnN4V3x/UX6n6BM3asGjtoEgi2ldVUg93eY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51J6BGMn050537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 00:11:16 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 00:11:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 00:11:15 -0600
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.207])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J6B2Zx062304;
	Wed, 19 Feb 2025 00:11:13 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2 4/4] ALSA: hda/tas2781: Support dsp firmware Alpha and Beta
 seaies
Date: Wed, 19 Feb 2025 14:10:57 +0800
Message-ID: <20250219061057.714-4-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250219061057.714-1-shenghao-ding@ti.com>
References: <20250219061057.714-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: XLCQPQI35SGV4XWCDUNWTLVKDYA2NLOY
X-Message-ID-Hash: XLCQPQI35SGV4XWCDUNWTLVKDYA2NLOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLCQPQI35SGV4XWCDUNWTLVKDYA2NLOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For calibration, basic version does not contain any calibration addresses,
it depends on calibration tool to convery the addresses to the driver.
Since Alpha and Beta firmware, all the calibration addresses are saved
into the firmware. In order to fallback the BASIC or older version, code
was added an extra branch to handle Alpha and Beta version.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes:
   | https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/2025
   | 02160812.P7szOygN-lkp@intel.com/__;!!G3vK!WriwhtbQGlg6p00bcWutlhb-y9vS
   | pDrSu5_g9oOzzGOoABdirEARTntFzyX6Ss3UPRDxi_E-IA$
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes:
   | https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/2025
   | 02160632.u0zxG7yD-lkp@intel.com/__;!!G3vK!VtEdfur3fZklvPVfHFFfFP60Ub2E
   | JYvmjSUZ65lJ6BsQPJDl1fjYRDqh3c6Q5y6sA70ssXDG5g$
---
 sound/pci/hda/tas2781_spi_fwlib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_spi_fwlib.c b/sound/pci/hda/tas2781_spi_fwlib.c
index 131d9a77d140..c90641119509 100644
--- a/sound/pci/hda/tas2781_spi_fwlib.c
+++ b/sound/pci/hda/tas2781_spi_fwlib.c
@@ -370,10 +370,10 @@ static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
 	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
 	unsigned char dev_idx = 0;
 
-	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
+	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781_BASIC_MIN) {
 		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
 		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
-	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
+	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION_BASE) {
 		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
 		n = ARRAY_SIZE(ppc3_mapping_table);
 	}
@@ -1605,7 +1605,7 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 	int rc = 0;
 
 	if (drv_ver == 0x100) {
-		if (ppcver >= PPC3_VERSION) {
+		if (ppcver >= PPC3_VERSION_BASE) {
 			tas_priv->fw_parse_variable_header =
 				fw_parse_variable_header_kernel;
 			tas_priv->fw_parse_program_data =
-- 
2.34.1

