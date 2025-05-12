Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C8AB7FC7
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1177162E1D;
	Thu, 15 May 2025 10:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1177162E1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296156;
	bh=j7ThaJ6DoNp4f6FP5Vx08GnRwirFs4dn5fHGZ/vDP80=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iGbWf74JAKjWFhSrLuJvNYqzIOrYdS6hnIeZ/4n+9cO0p0P+F0aF9RuiFnIqPtAhx
	 rcyQ7WrcwAoCJ9YHtHInf7vWb3lg/ZagAJyoPeZMwGGi1PzM7I7y/ggwvs/hUeeyXM
	 260DS3fy05Aecw3Fy3+w70ND7P3WyqyBJecmkhRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3C41F89AA5; Tue, 13 May 2025 01:48:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 814FBF89A9E;
	Tue, 13 May 2025 01:48:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC56DF89A90; Tue, 13 May 2025 01:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78C91F898A7
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 01:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78C91F898A7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=az/3o0Zq
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CNmft92906862
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 18:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747093721;
	bh=PFrxyO8NYd8Cc14aEEJRvZuwU4+a4IQOvRHRkG3cqHA=;
	h=From:To:CC:Subject:Date;
	b=az/3o0ZqPQf6iYx2+sr6S0beipBqVm9hMymvyKLXP3qcPoe1H0beGVtQpyGdTs2gB
	 LuQWXSfZOBru9tJ58fXjFoNiPNsxhJrqnnjxuLHqsq/8KUjV1kuE5kd4wJfdNzR+IX
	 gTlu+K8Fi1+HPbyKp/SWJ6B2xgG0JhYVRcuK+zBA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CNmfYT065211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 18:48:41 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 18:48:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 18:48:40 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CNmbHf114132;
	Mon, 12 May 2025 18:48:37 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v3] ALSA: hda/tas2781: Fix the ld issue reported by kernel
 test robot
Date: Tue, 13 May 2025 07:48:33 +0800
Message-ID: <20250512234833.772-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: PCJOX7RYHGCSPY6MMTZ3XXJASWXB4MTA
X-Message-ID-Hash: PCJOX7RYHGCSPY6MMTZ3XXJASWXB4MTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCJOX7RYHGCSPY6MMTZ3XXJASWXB4MTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
However, tasdevice_remove() used for not only for I2C but for SPI being
still in that lib caused ld issue.
All errors (new ones prefixed by >>):
>> ld.lld: error: undefined symbol: tasdevice_remove
   >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
   >>>               vmlinux.o:(tas2781_hda_remove)
To fix this issue, the implementation of tasdevice_remove was moved from
tas2781-comlib-i2c.c to tas2781-comlib.c.

Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v3:
 - Drop the report tag in the patch description.
v2:
 - put the Fixes tag to point out the commit that introduced the regression
 - Add compiling error information reported by kernel test robot into patch
   description.
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

