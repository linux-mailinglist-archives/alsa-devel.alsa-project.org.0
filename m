Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBA4B619
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 12:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED2916AF;
	Wed, 19 Jun 2019 12:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED2916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560939582;
	bh=TS8i5lSeMFJ4i7fbxK67V4m1bZZKIFVNc9Of7glLV0o=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o2NCrsAUROwM6nybJsorwLSe1tpBpLI181NDWgyMpxf+kDJdp++sR2QORwSriDMbL
	 s+n3ms/E81WBlusJaL9b4U5dCZcC0jZaFsEzNfkRelSCaxv2GODBrGt2u+Qw/MA5fs
	 JGfphCdTeNzCmIbiqCzqQbrU7/v6leLFqY/bG8DQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BD1F896DF;
	Wed, 19 Jun 2019 12:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9769EF896C7; Wed, 19 Jun 2019 12:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD204F80CC4
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 12:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD204F80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 03:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="164983900"
Received: from macchian.itwn.intel.com ([10.5.230.135])
 by orsmga006.jf.intel.com with ESMTP; 19 Jun 2019 03:18:33 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Date: Wed, 19 Jun 2019 18:18:33 +0800
Message-Id: <1560939513-20601-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: mac.chiang@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
 liam.r.girdwood@intel.com
Subject: [alsa-devel] [v3] ASoC: max98357a: avoid speaker pop when playback
	startup
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mac Chiang <mac.chiang@intel.com>

Loud speaker pop happens during playback even when in slience
playback. Specify Max98357a amp delay times to make sure
clocks are always earlier than sdmode on.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
Changelog:
  v3:
    - rebase to branch for-next
  v2:
    - added device_property_read_u32() func
---
---
 .../devicetree/bindings/sound/max98357a.txt        |  4 ++
 sound/soc/codecs/max98357a.c                       | 55 ++++++++++++++++++----
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
index 28645a2..4bce14c 100644
--- a/Documentation/devicetree/bindings/sound/max98357a.txt
+++ b/Documentation/devicetree/bindings/sound/max98357a.txt
@@ -9,6 +9,10 @@ Optional properties:
 - sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
         If this option is not specified then driver does not manage
         the pin state (e.g. chip is always on).
+- sdmode-delay : specify delay time for SD_MODE pin.
+        If this option is specified, which means it's required i2s clocks
+        ready before SD_MODE is unmuted in order to avoid the speaker pop noise.
+        It's observed that 5ms is sufficient.
 
 Example:
 
diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 6f724c9..6f0e28f 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -19,24 +19,42 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 
+struct max98357a_priv {
+	struct delayed_work enable_sdmode_work;
+	struct gpio_desc *sdmode;
+	unsigned int sdmode_delay;
+};
+
+static void max98357a_enable_sdmode_work(struct work_struct *work)
+{
+	struct max98357a_priv *max98357a =
+	container_of(work, struct max98357a_priv,
+			enable_sdmode_work.work);
+
+	gpiod_set_value(max98357a->sdmode, 1);
+}
+
 static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
-	struct gpio_desc *sdmode = snd_soc_dai_get_drvdata(dai);
+	struct max98357a_priv *max98357a = snd_soc_dai_get_drvdata(dai);
 
-	if (!sdmode)
+	if (!max98357a->sdmode)
 		return 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		gpiod_set_value(sdmode, 1);
+		queue_delayed_work(system_power_efficient_wq,
+				&max98357a->enable_sdmode_work,
+				msecs_to_jiffies(max98357a->sdmode_delay));
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		gpiod_set_value(sdmode, 0);
+		cancel_delayed_work_sync(&max98357a->enable_sdmode_work);
+		gpiod_set_value(max98357a->sdmode, 0);
 		break;
 	}
 
@@ -90,14 +108,33 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 
 static int max98357a_platform_probe(struct platform_device *pdev)
 {
-	struct gpio_desc *sdmode;
+	struct max98357a_priv *max98357a;
+	int ret;
 
-	sdmode = devm_gpiod_get_optional(&pdev->dev,
+	max98357a = devm_kzalloc(&pdev->dev, sizeof(*max98357a), GFP_KERNEL);
+
+	if (!max98357a)
+		return -ENOMEM;
+
+	max98357a->sdmode = devm_gpiod_get_optional(&pdev->dev,
 				"sdmode", GPIOD_OUT_LOW);
-	if (IS_ERR(sdmode))
-		return PTR_ERR(sdmode);
 
-	dev_set_drvdata(&pdev->dev, sdmode);
+	if (IS_ERR(max98357a->sdmode))
+		return PTR_ERR(max98357a->sdmode);
+
+	ret = device_property_read_u32(&pdev->dev, "sdmode-delay",
+					&max98357a->sdmode_delay);
+
+	if (ret) {
+		max98357a->sdmode_delay = 0;
+		dev_dbg(&pdev->dev,
+			"no optional property 'sdmode-delay' found, default: no delay\n");
+	}
+
+	dev_set_drvdata(&pdev->dev, max98357a);
+
+	INIT_DELAYED_WORK(&max98357a->enable_sdmode_work,
+				max98357a_enable_sdmode_work);
 
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
