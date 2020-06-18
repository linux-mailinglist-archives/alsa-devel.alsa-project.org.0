Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF0C1FF063
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 685D61782;
	Thu, 18 Jun 2020 13:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 685D61782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592479058;
	bh=mNdxdwM1on5s/rtcnU+sNNfNYAKoYSJNu/DDzjjifk4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PzZWbqyKXnQX3X1vn1VcBP/8cA9fCyvcUYTtrk6TDSwp6cF08mti/fpM6C/+i1t6F
	 o9eOOdRjYbwGgEry0HcB24yKQui0dqyPsZJhYt2TiwYx4rNE1n1EJT3z7ComIedPo5
	 L3+JxEPZ4tAK1vLvMhYkPSM+U9DG/G2INI6O3/Yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD863F80331;
	Thu, 18 Jun 2020 13:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28239F802DF; Thu, 18 Jun 2020 13:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D94F8028F
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D94F8028F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB802AF32;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/13] ALSA: hda/sigmatel: Use the new vmaster mute LED helper
Date: Thu, 18 Jun 2020 13:08:40 +0200
Message-Id: <20200618110842.27238-12-tiwai@suse.de>
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

Convert the mute LED handling in Sigmatel/IDT codec to the new vmaster
mute helper.  A point to be cautiously handled is that the value
passed to the callback is inverted; the vmaster passes "enabled"
(0 = mute), while LED classdev passes "brightness" (1 = mute).

A positive side-effect by this change is that the driver gets also the
enum controls for the mute behavior like other drivers already had.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_sigmatel.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 3b796d0d7a67..d8ed69cb9df1 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -369,10 +369,9 @@ static unsigned int stac_vref_led_power_filter(struct hda_codec *codec,
 }
 
 /* update mute-LED accoring to the master switch */
-static void stac_update_led_status(struct hda_codec *codec, int enabled)
+static void stac_update_led_status(struct hda_codec *codec, bool muted)
 {
 	struct sigmatel_spec *spec = codec->spec;
-	int muted = !enabled;
 
 	if (!spec->gpio_led)
 		return;
@@ -396,9 +395,13 @@ static void stac_update_led_status(struct hda_codec *codec, int enabled)
 }
 
 /* vmaster hook to update mute LED */
-static void stac_vmaster_hook(void *private_data, int val)
+static int stac_vmaster_hook(struct led_classdev *led_cdev,
+			     enum led_brightness brightness)
 {
-	stac_update_led_status(private_data, val);
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
+
+	stac_update_led_status(codec, brightness);
+	return 0;
 }
 
 /* automute hook to handle GPIO mute and EAPD updates */
@@ -4316,7 +4319,7 @@ static int stac_parse_auto_config(struct hda_codec *codec)
 #endif
 
 	if (spec->gpio_led)
-		spec->gen.vmaster_mute.hook = stac_vmaster_hook;
+		snd_hda_gen_add_mute_led_cdev(codec, stac_vmaster_hook);
 
 	if (spec->aloopback_ctl &&
 	    snd_hda_get_bool_hint(codec, "loopback") == 1) {
-- 
2.16.4

