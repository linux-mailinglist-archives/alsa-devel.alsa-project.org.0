Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C860B529A9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Sep 2025 09:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A1760212;
	Thu, 11 Sep 2025 09:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A1760212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757574892;
	bh=xINmkOLabQw1Pt8CERYQylAn9hhuK4PE+W1b5aVKkHU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F5ym6hHLXit0RulXb0RZZCoC2PaZ9GVN+ZyumYgk1jRGh/DhhBslh0jbm5h7ssH5n
	 akMGpBItiVxpwJRs8ebYJeDO4yq658xs3WG9nu2CaI0YeOEdLdjdpOaCI/Jot0kOkd
	 MgaTswz7JWMvqXKcFrbYpQJIANyDjAbvoOf1COEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 781C5F805C6; Thu, 11 Sep 2025 09:14:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A05FBF805C8;
	Thu, 11 Sep 2025 09:14:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81724F80518; Thu, 11 Sep 2025 09:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88A24F802DB
	for <alsa-devel@alsa-project.org>; Thu, 11 Sep 2025 09:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A24F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=HE/zeTVE
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58B7Bdmi693253;
	Thu, 11 Sep 2025 02:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757574699;
	bh=sw0W0MvFvnxDpl+fs2Cqclu/ceL49VrWO42sAjkFkIg=;
	h=From:To:CC:Subject:Date;
	b=HE/zeTVEIN4oxDiZ+VhpBvwc9Er5/qIdBOrycp12DXeO2SFZSnczOQgmYXPUZ7p+X
	 v8tv2umeWTJDZhrhchxoHAOkBu85IoyPFXHmFvxUcbTGmqsHAlzYJvQFEkgB+3CCZa
	 W84IckwUaG5mMtNRcUw5SvicHEuHh/HfIkkczj8Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58B7BddZ1759242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 02:11:39 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 02:11:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 02:11:38 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.218])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58B7BZhv1453534;
	Thu, 11 Sep 2025 02:11:35 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix a potential race condition that
 causes a NULL pointer in case no efi.get_variable exsits
Date: Thu, 11 Sep 2025 15:11:31 +0800
Message-ID: <20250911071131.1886-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: RNHDMMAJNXEDO66NTOEBUCVRQ2A5HDN4
X-Message-ID-Hash: RNHDMMAJNXEDO66NTOEBUCVRQ2A5HDN4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNHDMMAJNXEDO66NTOEBUCVRQ2A5HDN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A a potential race condition reported by one of my customers that leads to
a NULL pointer dereference, where the call to efi.get_variable should be
guarded with efi_rt_services_supported() to ensure that function exists.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda.c     | 5 +++++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index 536940c78f00..96e6d82dc69e 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -193,6 +193,11 @@ int tas2781_save_calibration(struct tas2781_hda *hda)
 	efi_status_t status;
 	int i;
 
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
+		dev_err(p->dev, "%s: NO EFI FOUND!\n", __func__);
+		return -EINVAL;
+	}
+
 	if (hda->catlog_id < LENOVO)
 		efi_guid = tasdev_fct_efi_guid[hda->catlog_id];
 
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 008dbe1490a7..4dea442d8c30 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -317,6 +317,11 @@ static int tas2563_save_calibration(struct tas2781_hda *h)
 	unsigned int attr;
 	int ret, i, j, k;
 
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE)) {
+		dev_err(p->dev, "%s: NO EFI FOUND!\n", __func__);
+		return -EINVAL;
+	}
+
 	cd->cali_dat_sz_per_dev = TAS2563_CAL_DATA_SIZE * TASDEV_CALIB_N;
 
 	/* extra byte for each device is the device number */
-- 
2.43.0

