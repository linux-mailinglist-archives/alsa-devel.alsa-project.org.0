Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C6A5AE40C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A853FAE9;
	Tue,  6 Sep 2022 11:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A853FAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662456255;
	bh=BkVpuO4Pdqh+nOQs5RcEFINPsGL+ExtJYMRVscnQ4Ak=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y6uymB38ccYP5dZNstqkSqU+o4wc2syAPsdNW4Uq+H+vkN3uFA2Bz7GUqwygB+FAu
	 E1FT+UuDu+yzumC7o60Wfi6HBGOwnwR7MZYKBr8SuRolnJSfQrVM8zO9Va2Q9vHgqC
	 fuNnf+k9QbFr3eUAg6hHqMnuoEx5B6tG/irIhuXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A772F8024C;
	Tue,  6 Sep 2022 11:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC913F80249; Tue,  6 Sep 2022 11:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6C02F8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 11:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C02F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="I73U0m3n"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="sDFCR88S"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 278441F951;
 Tue,  6 Sep 2022 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662456188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=w1Wz85j5ZbnSIROojE5MkTEgxW5BxqE0pCktgk0VqEU=;
 b=I73U0m3n1/mWlEGIxAfG14dqY82UvIvIoG6zDiyjsENDczvcM3l/2avDl7nadku74JjAW8
 sAPThDjm/fupb3PWDXrcAxVBzNx4KEmR2s9ncIsqZsSCPagQ9fEr1j62MqjwU+JGsdljEY
 bB1wPu+lmx6Xg/sPMmg/AvZ1/rG98sM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662456188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=w1Wz85j5ZbnSIROojE5MkTEgxW5BxqE0pCktgk0VqEU=;
 b=sDFCR88SDtyPU8KUmYPtjVF8T+ZiE9SDHq5WVvUIcWpsxOvR0kv8Q0GmI2czTYV6EoTFio
 z88iCtvdqPtMm+Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 106DC13A19;
 Tue,  6 Sep 2022 09:23:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M55mA3wRF2P5aQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 06 Sep 2022 09:23:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: beep: Simplify keep-power-at-enable behavior
Date: Tue,  6 Sep 2022 11:23:06 +0200
Message-Id: <20220906092306.26183-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The recent fix for IDT codecs to keep the power up while the beep is
enabled can be better integrated into the beep helper code.
This patch cleans up the code with refactoring.

Fixes: 414d38ba8710 ("ALSA: hda/sigmatel: Keep power up while beep is enabled")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_beep.c       | 15 +++++++++++++--
 sound/pci/hda/hda_beep.h       |  1 +
 sound/pci/hda/patch_sigmatel.c | 25 ++-----------------------
 3 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/sound/pci/hda/hda_beep.c b/sound/pci/hda/hda_beep.c
index 53a2b89f8983..e63621bcb214 100644
--- a/sound/pci/hda/hda_beep.c
+++ b/sound/pci/hda/hda_beep.c
@@ -118,6 +118,12 @@ static int snd_hda_beep_event(struct input_dev *dev, unsigned int type,
 	return 0;
 }
 
+static void turn_on_beep(struct hda_beep *beep)
+{
+	if (beep->keep_power_at_enable)
+		snd_hda_power_up_pm(beep->codec);
+}
+
 static void turn_off_beep(struct hda_beep *beep)
 {
 	cancel_work_sync(&beep->beep_work);
@@ -125,6 +131,8 @@ static void turn_off_beep(struct hda_beep *beep)
 		/* turn off beep */
 		generate_tone(beep, 0);
 	}
+	if (beep->keep_power_at_enable)
+		snd_hda_power_down_pm(beep->codec);
 }
 
 /**
@@ -140,7 +148,9 @@ int snd_hda_enable_beep_device(struct hda_codec *codec, int enable)
 	enable = !!enable;
 	if (beep->enabled != enable) {
 		beep->enabled = enable;
-		if (!enable)
+		if (enable)
+			turn_on_beep(beep);
+		else
 			turn_off_beep(beep);
 		return 1;
 	}
@@ -167,7 +177,8 @@ static int beep_dev_disconnect(struct snd_device *device)
 		input_unregister_device(beep->dev);
 	else
 		input_free_device(beep->dev);
-	turn_off_beep(beep);
+	if (beep->enabled)
+		turn_off_beep(beep);
 	return 0;
 }
 
diff --git a/sound/pci/hda/hda_beep.h b/sound/pci/hda/hda_beep.h
index a25358a4807a..db76e3ddba65 100644
--- a/sound/pci/hda/hda_beep.h
+++ b/sound/pci/hda/hda_beep.h
@@ -25,6 +25,7 @@ struct hda_beep {
 	unsigned int enabled:1;
 	unsigned int linear_tone:1;	/* linear tone for IDT/STAC codec */
 	unsigned int playing:1;
+	unsigned int keep_power_at_enable:1;	/* set by driver */
 	struct work_struct beep_work; /* scheduled task for beep event */
 	struct mutex mutex;
 	void (*power_hook)(struct hda_beep *beep, bool on);
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 7f340f18599c..a794a01a68ca 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -4311,6 +4311,8 @@ static int stac_parse_auto_config(struct hda_codec *codec)
 		if (codec->beep) {
 			/* IDT/STAC codecs have linear beep tone parameter */
 			codec->beep->linear_tone = spec->linear_tone_beep;
+			/* keep power up while beep is enabled */
+			codec->beep->keep_power_at_enable = 1;
 			/* if no beep switch is available, make its own one */
 			caps = query_amp_caps(codec, nid, HDA_OUTPUT);
 			if (!(caps & AC_AMPCAP_MUTE)) {
@@ -4444,28 +4446,6 @@ static int stac_suspend(struct hda_codec *codec)
 
 	return 0;
 }
-
-static int stac_check_power_status(struct hda_codec *codec, hda_nid_t nid)
-{
-#ifdef CONFIG_SND_HDA_INPUT_BEEP
-	struct sigmatel_spec *spec = codec->spec;
-#endif
-	int ret = snd_hda_gen_check_power_status(codec, nid);
-
-#ifdef CONFIG_SND_HDA_INPUT_BEEP
-	if (nid == spec->gen.beep_nid && codec->beep) {
-		if (codec->beep->enabled != spec->beep_power_on) {
-			spec->beep_power_on = codec->beep->enabled;
-			if (spec->beep_power_on)
-				snd_hda_power_up_pm(codec);
-			else
-				snd_hda_power_down_pm(codec);
-		}
-		ret |= spec->beep_power_on;
-	}
-#endif
-	return ret;
-}
 #else
 #define stac_suspend		NULL
 #endif /* CONFIG_PM */
@@ -4478,7 +4458,6 @@ static const struct hda_codec_ops stac_patch_ops = {
 	.unsol_event = snd_hda_jack_unsol_event,
 #ifdef CONFIG_PM
 	.suspend = stac_suspend,
-	.check_power_status = stac_check_power_status,
 #endif
 };
 
-- 
2.35.3

