Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 218A41FF057
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72B3174B;
	Thu, 18 Jun 2020 13:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72B3174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478913;
	bh=rOhGWbWtuZ405+D5NDcfDcvjhmOGTSi+6trYlwZs54w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uuoIX8K11Hz+vNspf+wRR5SI7VAmdu028NDY22THRYa5y7jU0XcLLE60OgBuVMpMJ
	 izaRgfg1rF5GYxX9Jwy/KQzz0k0ZvVqOYYOVtgwQOxCPGIYYqN2wZDGQj+ZxjMPL9H
	 IQ+8WfmhUYCF0alxw+bSknIyjfALNKO5Xsf3VM2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C45F802F8;
	Thu, 18 Jun 2020 13:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C02F8F802DC; Thu, 18 Jun 2020 13:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6F25F80245
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F25F80245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CAEBEAF4D;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/13] ALSA: hda/conexant: Use the new vmaster mute LED helper
Date: Thu, 18 Jun 2020 13:08:39 +0200
Message-Id: <20200618110842.27238-11-tiwai@suse.de>
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

Convert the mute LED handling in Conexant codec to the new vmaster
mute helper.  A point to be cautiously handled is that the value
passed to the callback is inverted; the vmaster passes "enabled"
(0 = mute), while LED classdev passes "brightness" (1 = mute).

Also the assignment of the default vmaster hook is moved at a later
point after the mute hook is set up.  This assures no nested hook.

Finally, since we enable the mute-LED kcontrols always in the helper
side, the extra vmaster_mute_enum flag set up is dropped.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 5a7c16e39d7a..d796963b80d7 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -137,14 +137,16 @@ static void cx_auto_vmaster_hook(void *private_data, int enabled)
 }
 
 /* turn on/off EAPD according to Master switch (inversely!) for mute LED */
-static void cx_auto_vmaster_hook_mute_led(void *private_data, int enabled)
+static int cx_auto_vmaster_mute_led(struct led_classdev *led_cdev,
+				    enum led_brightness brightness)
 {
-	struct hda_codec *codec = private_data;
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct conexant_spec *spec = codec->spec;
 
 	snd_hda_codec_write(codec, spec->mute_led_eapd, 0,
 			    AC_VERB_SET_EAPD_BTLENABLE,
-			    enabled ? 0x00 : 0x02);
+			    brightness ? 0x02 : 0x00);
+	return 0;
 }
 
 static int cx_auto_init(struct hda_codec *codec)
@@ -566,7 +568,7 @@ static void cxt_fixup_mute_led_eapd(struct hda_codec *codec,
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mute_led_eapd = 0x1b;
 		spec->dynamic_eapd = 1;
-		spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook_mute_led;
+		snd_hda_gen_add_mute_led_cdev(codec, cx_auto_vmaster_mute_led);
 	}
 }
 
@@ -631,12 +633,14 @@ static void cxt_update_gpio_led(struct hda_codec *codec, unsigned int mask,
 }
 
 /* turn on/off mute LED via GPIO per vmaster hook */
-static void cxt_fixup_gpio_mute_hook(void *private_data, int enabled)
+static int cxt_gpio_mute_update(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
 {
-	struct hda_codec *codec = private_data;
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct conexant_spec *spec = codec->spec;
-	/* muted -> LED on */
-	cxt_update_gpio_led(codec, spec->gpio_mute_led_mask, !enabled);
+
+	cxt_update_gpio_led(codec, spec->gpio_mute_led_mask, brightness);
+	return 0;
 }
 
 /* turn on/off mic-mute LED via GPIO per capture hook */
@@ -662,7 +666,7 @@ static void cxt_fixup_mute_led_gpio(struct hda_codec *codec,
 	};
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		spec->gen.vmaster_mute.hook = cxt_fixup_gpio_mute_hook;
+		snd_hda_gen_add_mute_led_cdev(codec, cxt_gpio_mute_update);
 		spec->gpio_led = 0;
 		spec->mute_led_polarity = 0;
 		spec->gpio_mute_led_mask = 0x01;
@@ -990,8 +994,6 @@ static int patch_conexant_auto(struct hda_codec *codec)
 
 	cx_auto_parse_eapd(codec);
 	spec->gen.own_eapd_ctl = 1;
-	if (spec->dynamic_eapd)
-		spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
 
 	switch (codec->core.vendor_id) {
 	case 0x14f15045:
@@ -1024,17 +1026,8 @@ static int patch_conexant_auto(struct hda_codec *codec)
 		break;
 	}
 
-	/* Show mute-led control only on HP laptops
-	 * This is a sort of white-list: on HP laptops, EAPD corresponds
-	 * only to the mute-LED without actualy amp function.  Meanwhile,
-	 * others may use EAPD really as an amp switch, so it might be
-	 * not good to expose it blindly.
-	 */
-	switch (codec->core.subsystem_id >> 16) {
-	case 0x103c:
-		spec->gen.vmaster_mute_enum = 1;
-		break;
-	}
+	if (!spec->gen.vmaster_mute.hook && spec->dynamic_eapd)
+		spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
-- 
2.16.4

