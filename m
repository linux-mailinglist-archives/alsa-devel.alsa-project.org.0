Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B7AB7FCB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9920762EF0;
	Thu, 15 May 2025 10:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9920762EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296181;
	bh=xNIfTGkI780wZHQ2WVNZ+qT39tb+IVh9Ga4eBwDUulU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JrABx+m6kFhvtYVaEinHNMWusOEYuc/Mkt+a6CRIyEtVL/ifRZ/TOIIO/XRmRi6bi
	 PK6vsmcw1FlRdtu5Tat2mIEeQmIamvjaADUgsrD1wUCIlrgG7oYZejnIKZjon/J90r
	 /n+UOEGbYbTtssVz9E5VK+O8VXCC321T6upXC7kM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17310F89980; Mon, 12 May 2025 00:19:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3199F89981;
	Mon, 12 May 2025 00:19:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C252CF89943; Mon, 12 May 2025 00:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F003F8993A
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 00:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F003F8993A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Eg2jNboC
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54BMJBx02599850
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 17:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747001951;
	bh=ksXu6KVUOE17kGSt7jEukOYl3EvAs3yKSKQVEF4EQZs=;
	h=From:To:CC:Subject:Date;
	b=Eg2jNboCd9edMYJY7ztO2RkfJZT4tQ+lKqLSfBtlbjEwZdv8NCkByo2b05OyPQMDt
	 9McHF8EdapM2oajcE6aJE/rh4vgi7n+hEAjM2ypkxjyMlev0yzvqr70N/yhWzBZ2+e
	 zfHvg68H3NwiX7PGzPtTskTl93R6sQ3HbFagFND8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54BMJBrs045269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 May 2025 17:19:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 11
 May 2025 17:19:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 11 May 2025 17:19:11 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54BMJ706062681;
	Sun, 11 May 2025 17:19:08 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix the ld issue reported by kernel
 test robot
Date: Mon, 12 May 2025 06:18:44 +0800
Message-ID: <20250511221844.1123-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: MAUEV3FL5MKWVUC7PKG5UOMDUVV25RFD
X-Message-ID-Hash: MAUEV3FL5MKWVUC7PKG5UOMDUVV25RFD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAUEV3FL5MKWVUC7PKG5UOMDUVV25RFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the ld issue reported by kernel test robot, moving the implementation
of tasdevice_remove from tas2781-comlib-i2c.c to tas2781-comlib.c.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/__;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJD
---
 sound/soc/codecs/tas2781-comlib-i2c.c | 6 ------
 sound/soc/codecs/tas2781-comlib.c     | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index a75b812618ee..c078bb0a8437 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -364,12 +364,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
 
-void tasdevice_remove(struct tasdevice_priv *tas_priv)
-{
-	mutex_destroy(&tas_priv->codec_lock);
-}
-EXPORT_SYMBOL_GPL(tasdevice_remove);
-
 MODULE_DESCRIPTION("TAS2781 common library for I2C");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index ad2f65359b15..076c1d955972 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -225,6 +225,12 @@ void tasdevice_dsp_remove(void *context)
 }
 EXPORT_SYMBOL_GPL(tasdevice_dsp_remove);
 
+void tasdevice_remove(struct tasdevice_priv *tas_priv)
+{
+	mutex_destroy(&tas_priv->codec_lock);
+}
+EXPORT_SYMBOL_GPL(tasdevice_remove);
+
 MODULE_DESCRIPTION("TAS2781 common library");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0

