Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A281C25E
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 01:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB38DF2;
	Fri, 22 Dec 2023 01:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB38DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703205423;
	bh=KE8JomqGhhaKc477PWQz4tOtFHEsRBtTnQQgfXu07qk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oZ9O52t0Zrq51/nsT+0F7r1OzJg5qxYlLYQmYK1i05z6CG5VFMsfVO7wytiAmUsBP
	 OXEYPr0t64zOZ7bwube0etUNBFyzA10YYY3Fcrxi43SsR8IjRLnbTLM1guKI+cl1Bl
	 YQfihM9wSnyAcJZHhDRpwolAi9uBkEiWlQzijICc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51759F80212; Fri, 22 Dec 2023 01:36:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A5F8F80571;
	Fri, 22 Dec 2023 01:36:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA943F80212; Fri, 22 Dec 2023 01:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id C75B1F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 01:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C75B1F80124
Received: from fedori.lan (51b681e3.dsl.pool.telekom.hu
 [::ffff:81.182.129.227])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EE7.000000006584DA06.0013B20D;
 Fri, 22 Dec 2023 01:36:22 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda/tas2781: move set_drv_data outside
 tasdevice_init
Date: Fri, 22 Dec 2023 01:34:47 +0100
Message-ID: 
 <1398bd8bf3e935b1595a99128320e4a1913e210a.1703204848.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: SQPDSEUUE43D243KYDOB2MDE3WB2AGE6
X-Message-ID-Hash: SQPDSEUUE43D243KYDOB2MDE3WB2AGE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQPDSEUUE43D243KYDOB2MDE3WB2AGE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

allow driver specific driver data in tas2781-hda-i2c and tas2781-i2c

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c   | 2 ++
 sound/soc/codecs/tas2781-comlib.c | 2 --
 sound/soc/codecs/tas2781-i2c.c    | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index e4c54b2a012c..769604375745 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -659,6 +659,8 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	if (!tas_priv)
 		return -ENOMEM;
 
+	dev_set_drvdata(&clt->dev, tas_priv);
+
 	tas_priv->irq_info.irq = clt->irq;
 	ret = tas2781_read_acpi(tas_priv, device_name);
 	if (ret)
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 933cd008e9f5..00e35169ae49 100644
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

base-commit: 916d051730ae48aef8b588fd096fefca4bc0590a
prerequisite-patch-id: da39452ca686d78e5accad1c2c4aa22a5f5a6a65
-- 
2.43.0

