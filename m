Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DD984BEAB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 21:27:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38DF2829;
	Tue,  6 Feb 2024 21:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38DF2829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707251219;
	bh=GCZTOpyn0Zr/27ByvG88St2jXBibIhL8nI1Rez9DQwA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N6cKc9bTti+f3SXNSQazdjflPX+4EBzanTGoIgvA+QdEELBIlzQAltY8bPFXvdBbY
	 8OFx8wgSs1EJ6meRSDXHNfjlCidI1hOfGwaDJcPa/m1P4tj+Rp0T0c7HXfTmn4/qxT
	 l878M2ICfLSYCVOO++N+LOHAWCisHKWVgiLclgf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1BDFF8057C; Tue,  6 Feb 2024 21:26:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A3FF805A9;
	Tue,  6 Feb 2024 21:26:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1040F801EB; Tue,  6 Feb 2024 21:26:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id B2CB6F80153
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 21:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CB6F80153
Received: from fedori.lan (51b69e54.dsl.pool.telekom.hu
 [::ffff:81.182.158.84])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000729AE.0000000065C295D9.001AD416;
 Tue, 06 Feb 2024 21:26:01 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: remove unused acpi_subysystem_id
Date: Tue,  6 Feb 2024 21:25:50 +0100
Message-ID: 
 <df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: XQB6AN5HSREU6LYBTJARBC5SHT6BXZLX
X-Message-ID-Hash: XQB6AN5HSREU6LYBTJARBC5SHT6BXZLX
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQB6AN5HSREU6LYBTJARBC5SHT6BXZLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The acpi_subysystem_id is only written and freed, not read, so
unnecessary.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781.h           |  1 -
 sound/pci/hda/tas2781_hda_i2c.c   | 10 ----------
 sound/soc/codecs/tas2781-comlib.c |  1 -
 3 files changed, 12 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 9aff384941de..99ca3e401fd1 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -103,7 +103,6 @@ struct tasdevice_priv {
 	struct tm tm;
 
 	enum device_catlog_id catlog_id;
-	const char *acpi_subsystem_id;
 	unsigned char cal_binaryname[TASDEVICE_MAX_CHANNELS][64];
 	unsigned char crc8_lkp_tbl[CRC8_TABLE_SIZE];
 	unsigned char coef_binaryname[64];
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 1bfb00102a77..02c85084aca5 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -129,18 +129,8 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 
 	acpi_dev_free_resource_list(&resources);
 	strscpy(p->dev_name, hid, sizeof(p->dev_name));
-	physdev = get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 
-	/* No side-effect to the playback even if subsystem_id is NULL*/
-	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
-	if (IS_ERR(sub))
-		sub = NULL;
-
-	p->acpi_subsystem_id = sub;
-
-	put_device(physdev);
-
 	return 0;
 
 err:
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 5d0e5348b361..3aa81514dad7 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -408,7 +408,6 @@ void tasdevice_remove(struct tasdevice_priv *tas_priv)
 {
 	if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
 		gpio_free(tas_priv->irq_info.irq_gpio);
-	kfree(tas_priv->acpi_subsystem_id);
 	mutex_destroy(&tas_priv->codec_lock);
 }
 EXPORT_SYMBOL_GPL(tasdevice_remove);

base-commit: 610010737f74482a61896596a0116876ecf9e65c
-- 
2.43.0

