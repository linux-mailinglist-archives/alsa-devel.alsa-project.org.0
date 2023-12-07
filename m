Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AC807CBE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:06:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C112CDF5;
	Thu,  7 Dec 2023 01:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C112CDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907600;
	bh=rUFZIXi9KTb6YvT5Z7CK9FLwWOrWrW57IBMXog4EssU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CELFwkrWyVwAzxlEe5UxOc+hhVXkxlw0vlSr1lyauMQPPJRPz6Y3Jb3FAFspn33Xx
	 t5zw1I6DnyC2JUmiYxf/+exMG0Ce699/BHRC7e2Anr+kc+WYyUoA4FOUJ9dPdjtLec
	 vhppkyUzBBm2hXffe3c4EgVJ4ruBJXVvKctqyiVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 458C2F806A1; Thu,  7 Dec 2023 01:05:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FA7F80680;
	Thu,  7 Dec 2023 01:05:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22678F805B3; Thu,  7 Dec 2023 01:04:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 52091F80616
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52091F80616
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716FB.0000000065710C15.001190CD;
 Thu, 07 Dec 2023 01:04:37 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 12/16] ASoC: tas2781: move set_drv_data outside tasdevice_init
Date: Thu,  7 Dec 2023 01:04:28 +0100
Message-ID: 
 <bb94a9560f8a7453a77ba736f4d99d3fa90259e7.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: RGBS3O4QGRODSDEK4L55AWV6K4SDXNJ5
X-Message-ID-Hash: RGBS3O4QGRODSDEK4L55AWV6K4SDXNJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGBS3O4QGRODSDEK4L55AWV6K4SDXNJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

allow driver specific driver data in tas2781-hda-ic2c and tas2781-i2c

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c   | 2 ++
 sound/soc/codecs/tas2781-comlib.c | 2 --
 sound/soc/codecs/tas2781-i2c.c    | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index f28383597ca8..290c41194139 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -734,6 +734,8 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	if (!tas_priv)
 		return -ENOMEM;
 
+	dev_set_drvdata(&clt->dev, tas_priv);
+
 	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
 		device_name = "TIAS2781";
 		tas_priv->load_calibration = load_calibration_efi_1;
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 635f97db033b..0c04735dd575 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -316,8 +316,6 @@ int tasdevice_init(struct tasdevice_priv *tas_priv)
 		tas_priv->tasdevice[i].cur_conf = -1;
 	}
 
-	dev_set_drvdata(tas_priv->dev, tas_priv);
-
 	mutex_init(&tas_priv->codec_lock);
 
 out:
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 55cd5e3c23a5..917b1c15f71d 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -689,6 +689,8 @@ static int tasdevice_i2c_probe(struct i2c_client *i2c)
 	if (!tas_priv)
 		return -ENOMEM;
 
+	dev_set_drvdata(&i2c->dev, tas_priv);
+
 	if (ACPI_HANDLE(&i2c->dev)) {
 		acpi_id = acpi_match_device(i2c->dev.driver->acpi_match_table,
 				&i2c->dev);
-- 
2.43.0

