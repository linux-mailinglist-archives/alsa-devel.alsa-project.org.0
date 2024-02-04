Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7C849043
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Feb 2024 21:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC94F82C;
	Sun,  4 Feb 2024 21:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC94F82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707077014;
	bh=tpbjTw4X23EhfXeKly94uyy0NFWMMOuT2ePsQRoyPa0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M6YjpFFfGNZTEn55Kze/ofiPigYYvqDb0pWtPumX19yKHhWL68CWE+rYmb9BTKsyx
	 jhb+SXhN2v5PT+YjuAnA4AKd9dI9+uInJTB/tERh/SZKUOViM3ajEUuPwC2qxEJoOW
	 jj6Ke9DgNX8qChVoLJhb+ZMtXIwnvr3LV6XVT2KI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42322F805AC; Sun,  4 Feb 2024 21:03:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62327F805A0;
	Sun,  4 Feb 2024 21:03:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26BD9F801EB; Sun,  4 Feb 2024 21:01:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 086D4F8016E
	for <alsa-devel@alsa-project.org>; Sun,  4 Feb 2024 21:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 086D4F8016E
Received: from fedori.lan (51b68916.dsl.pool.telekom.hu
 [::ffff:81.182.137.22])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007429F.0000000065BFED1F.001A84E5;
 Sun, 04 Feb 2024 21:01:35 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: add module parameter to tascodec_init()
Date: Sun,  4 Feb 2024 21:01:17 +0100
Message-ID: 
 <118dad922cef50525e5aab09badef2fa0eb796e5.1707076603.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: 2SDOP42K6W2F4DDLRJI6BT6SMINFVRKQ
X-Message-ID-Hash: 2SDOP42K6W2F4DDLRJI6BT6SMINFVRKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SDOP42K6W2F4DDLRJI6BT6SMINFVRKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tascodec_init() of the snd-soc-tas2781-comlib module is called from
snd-soc-tas2781-i2c and snd-hda-scodec-tas2781-i2c modules. It calls
request_firmware_nowait() with parameter THIS_MODULE and a cont/callback
from the latter modules.

The latter modules can be removed while their callbacks are running,
resulting in a general protection failure.

Add module parameter to tascodec_init() so request_firmware_nowait() can
be called with the module of the callback.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 include/sound/tas2781.h           | 1 +
 sound/pci/hda/tas2781_hda_i2c.c   | 2 +-
 sound/soc/codecs/tas2781-comlib.c | 3 ++-
 sound/soc/codecs/tas2781-i2c.c    | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index b00d65417c31..9aff384941de 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -142,6 +142,7 @@ struct tasdevice_priv {
 
 void tas2781_reset(struct tasdevice_priv *tas_dev);
 int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
+	struct module *module,
 	void (*cont)(const struct firmware *fw, void *context));
 struct tasdevice_priv *tasdevice_kzalloc(struct i2c_client *i2c);
 int tasdevice_init(struct tasdevice_priv *tas_priv);
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 2dd809de62e5..1bfb00102a77 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -710,7 +710,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 
-	ret = tascodec_init(tas_hda->priv, codec, tasdev_fw_ready);
+	ret = tascodec_init(tas_hda->priv, codec, THIS_MODULE, tasdev_fw_ready);
 	if (!ret)
 		comps->playback_hook = tas2781_hda_playback_hook;
 
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index b7e56ceb1acf..5d0e5348b361 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -267,6 +267,7 @@ void tas2781_reset(struct tasdevice_priv *tas_dev)
 EXPORT_SYMBOL_GPL(tas2781_reset);
 
 int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
+	struct module *module,
 	void (*cont)(const struct firmware *fw, void *context))
 {
 	int ret = 0;
@@ -280,7 +281,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		tas_priv->dev_name, tas_priv->ndev);
 	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
 	tas_priv->codec = codec;
-	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+	ret = request_firmware_nowait(module, FW_ACTION_UEVENT,
 		tas_priv->rca_binaryname, tas_priv->dev, GFP_KERNEL, tas_priv,
 		cont);
 	if (ret)
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 32913bd1a623..b5abff230e43 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -566,7 +566,7 @@ static int tasdevice_codec_probe(struct snd_soc_component *codec)
 {
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
-	return tascodec_init(tas_priv, codec, tasdevice_fw_ready);
+	return tascodec_init(tas_priv, codec, THIS_MODULE, tasdevice_fw_ready);
 }
 
 static void tasdevice_deinit(void *context)

base-commit: d4ea2bd1bb502c54380cc44a4130660494679bb8
-- 
2.43.0

