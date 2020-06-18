Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478331FF04B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDC8F1768;
	Thu, 18 Jun 2020 13:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDC8F1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478754;
	bh=jjtWPGs6oWcEXs+HuTTpXY/+AlxlaKHHzx8pHDfB9IM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+qFBmXFkVdrss+3DkRf109wUu954sJgGT1uId+HnkWUWDOqxKYCiu8MktH+ieY+8
	 gzziqc2jVtbgzJ5rbsqszB2KHlAgJ8RNz0NxM3VPmgB/ur1ovKwvvnzihtpHAQ07gu
	 QTOCJnd409dYLVLDTvPy9PaIpxQeOEUNOqGe7RTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C81F802D2;
	Thu, 18 Jun 2020 13:09:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F1FF802BC; Thu, 18 Jun 2020 13:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B088F801EB
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B088F801EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 95649AF37;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/13] ALSA: hda/sigmatel: Convert to cdev-variant of mic-mute
 LED controls
Date: Thu, 18 Jun 2020 13:08:34 +0200
Message-Id: <20200618110842.27238-6-tiwai@suse.de>
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
snd_hda_gen_add_micmute_led() in IDT/Sigmatel codec driver into the
new snd_hda_gen_add_micmute_led_cdev().

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_sigmatel.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index a608d0486ae4..3b796d0d7a67 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -320,15 +320,18 @@ static void stac_gpio_set(struct hda_codec *codec, unsigned int mask,
 }
 
 /* hook for controlling mic-mute LED GPIO */
-static void stac_capture_led_update(struct hda_codec *codec)
+static int stac_capture_led_update(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
 {
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct sigmatel_spec *spec = codec->spec;
 
-	if (spec->gen.micmute_led.led_value)
+	if (brightness)
 		spec->gpio_data |= spec->mic_mute_led_gpio;
 	else
 		spec->gpio_data &= ~spec->mic_mute_led_gpio;
 	stac_gpio_set(codec, spec->gpio_mask, spec->gpio_dir, spec->gpio_data);
+	return 0;
 }
 
 static int stac_vrefout_set(struct hda_codec *codec,
@@ -4636,7 +4639,7 @@ static void stac_setup_gpio(struct hda_codec *codec)
 		spec->gpio_dir |= spec->mic_mute_led_gpio;
 		spec->mic_enabled = 0;
 		spec->gpio_data |= spec->mic_mute_led_gpio;
-		snd_hda_gen_add_micmute_led(codec, stac_capture_led_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, stac_capture_led_update);
 	}
 }
 
-- 
2.16.4

