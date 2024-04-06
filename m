Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3A89AB15
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 15:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B8C2C2F;
	Sat,  6 Apr 2024 15:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B8C2C2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712410068;
	bh=ZMt+t5X0UPIOOA6m/9szrjEDqQbT72VimPT91MbFNiE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kKiLDxR5rqYe523cP4+Qnz7+OEgjSvXqLjbNJ2eEH+5cSbXbX6LPqMPxKb7xufHV3
	 N1EfSmxeokcY34H7jij+pA79U+w2i3/jj6i0w/5GydjY6LJP4eTAhTtZeyK2NFohpa
	 qQFw2pC72pNWvl3M5zFOGBwi+b5qfz3MpDI9M25w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 156F4F80580; Sat,  6 Apr 2024 15:27:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D1DAF8058C;
	Sat,  6 Apr 2024 15:27:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 638D1F8020D; Sat,  6 Apr 2024 15:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7FCEF8015B
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 15:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7FCEF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=rn2nm+5H
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 436DKIdt109838;
	Sat, 6 Apr 2024 08:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712409618;
	bh=39x7AmNp8Efzg8sUTGbGQMPThf+ziuu6HzOTHuarGAA=;
	h=From:To:CC:Subject:Date;
	b=rn2nm+5H14g7Dmqw4gH1ylBAQ1ZpdmW28jNIIfOH1ujqg9D9A/A/ll58qLg0L8/c3
	 2COkFVO8l7Mxdj3bjb6OvO6v0hov64YIjoUtKWm06IIPCs8f2xYD5ncPKhiwVSUV0g
	 Nl+eNAYmFDz4m/6zxs4ckXxfd3vP8TBNK0ylxaGk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 436DKIlZ012778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 6 Apr 2024 08:20:18 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 6
 Apr 2024 08:20:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 6 Apr 2024 08:20:18 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.249])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 436DKCgl087460;
	Sat, 6 Apr 2024 08:20:13 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <bard.liao@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kevin-lu@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <navada@ti.com>, <v-po@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ALSA: hda/tas2781: correct the register for pow calibrated
 data
Date: Sat, 6 Apr 2024 21:20:09 +0800
Message-ID: <20240406132010.341-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: D2V3IYCMZCEFYSVDBKVFXLNJCHIWU6XP
X-Message-ID-Hash: D2V3IYCMZCEFYSVDBKVFXLNJCHIWU6XP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2V3IYCMZCEFYSVDBKVFXLNJCHIWU6XP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Calibrated data was written into an incorrect register, which cause
speaker protection sometimes malfuctions

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - Add a bit more info desciption
 - No blank line between Fixes and Singed-off-by tags
 - https://lore.kernel.org/all/20240404122530.1049-1-shenghao-ding@ti.com/
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 48dae3339305..75f7674c66ee 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -514,10 +514,10 @@ static int tas2563_save_calibration(struct tasdevice_priv *tas_priv)
 static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
 {
 	static const unsigned char page_array[CALIB_MAX] = {
-		0x17, 0x18, 0x18, 0x0d, 0x18
+		0x17, 0x18, 0x18, 0x13, 0x18,
 	};
 	static const unsigned char rgno_array[CALIB_MAX] = {
-		0x74, 0x0c, 0x14, 0x3c, 0x7c
+		0x74, 0x0c, 0x14, 0x70, 0x7c,
 	};
 	unsigned char *data;
 	int i, j, rc;
-- 
2.34.1

