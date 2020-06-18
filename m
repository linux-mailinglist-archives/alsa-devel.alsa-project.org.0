Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B4D1FF050
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017BA1768;
	Thu, 18 Jun 2020 13:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017BA1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478813;
	bh=HIeOK2FUMBmnW1/NNvAXlW885rfyhsEqw+RhGvl9w0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlNyT4KOxo1reHK5f+Fhx0uco0r3dcp96WxuYFmbcZE2V/c/Bbi9xFl84+nPDiLBq
	 6/O65MZYq7U/88JsRs3I3xSyFHVLq6B7KM9fbeLBB0LL7KXT51On1+HtVhOoZ3ZoQe
	 51+wpT52dzdCiSrwf5rGBTKB4gglZkWuZWfRQxY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2B61F802E0;
	Thu, 18 Jun 2020 13:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3DE5F802A9; Thu, 18 Jun 2020 13:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EA11F80217
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA11F80217
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 91F3DAF36;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/13] ALSA: hda/conexant: Convert to cdev-variant of mic-mute
 LED controls
Date: Thu, 18 Jun 2020 13:08:33 +0200
Message-Id: <20200618110842.27238-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200618110842.27238-1-tiwai@suse.de>
References: <20200618110842.27238-1-tiwai@suse.de>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch converts the remaining user of
snd_hda_gen_add_micmute_led() in Conexant codec driver into the new
snd_hda_gen_add_micmute_led_cdev().

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 396b5503038a..5a7c16e39d7a 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -640,12 +640,14 @@ static void cxt_fixup_gpio_mute_hook(void *private_data, int enabled)
 }
 
 /* turn on/off mic-mute LED via GPIO per capture hook */
-static void cxt_gpio_micmute_update(struct hda_codec *codec)
+static int cxt_gpio_micmute_update(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
 {
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct conexant_spec *spec = codec->spec;
 
-	cxt_update_gpio_led(codec, spec->gpio_mic_led_mask,
-			    spec->gen.micmute_led.led_value);
+	cxt_update_gpio_led(codec, spec->gpio_mic_led_mask, brightness);
+	return 0;
 }
 
 
@@ -665,7 +667,7 @@ static void cxt_fixup_mute_led_gpio(struct hda_codec *codec,
 		spec->mute_led_polarity = 0;
 		spec->gpio_mute_led_mask = 0x01;
 		spec->gpio_mic_led_mask = 0x02;
-		snd_hda_gen_add_micmute_led(codec, cxt_gpio_micmute_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, cxt_gpio_micmute_update);
 	}
 	snd_hda_add_verbs(codec, gpio_init);
 	if (spec->gpio_led)
-- 
2.16.4

