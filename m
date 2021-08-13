Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3533EB269
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 10:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B9D818D2;
	Fri, 13 Aug 2021 10:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B9D818D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628842515;
	bh=aWC30nq6Er6OdKy4XaKcx8M9+gvmU//ddbEEXBz+2sU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bmCxR2cnm2xuZ8BW/GFwIlYqfKfi6c3KTt6QdrKfzHGFxta458DWdBUv3hICMI23U
	 mvB4t5p5eyGCIw78h3AKt3sj1CugdMV9jA7hpTNLRuf+/QRhuGA6hg4O+GskxjGpFq
	 rEqP3p4CIjeuoxMIpTkYl1UvuP8jSxerOp8yucRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F344F804E5;
	Fri, 13 Aug 2021 10:12:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD403F802D2; Fri, 13 Aug 2021 10:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B537F802D2
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B537F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HEBijw9y"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="kSOu0HNe"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D741622288;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628842353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbxqOtTsgrC8b+w0RtyRHNpkZXH11btK90z3YXULBdM=;
 b=HEBijw9yqpeqxk9GiXH0BogNsUYDMyXFb1rQZyNaNdarA8Er0zmqmDuqXJXlEOh6ShKMVw
 5A7X8OwRs287NFCSCctEYwtkp2GLWqd8sdMPSMeRw0DzscwRRuukJNxzTPYUO0bLHPXMf+
 yQKnqr9/lpajlMJbw3GIG/nOeGJx2Kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628842353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbxqOtTsgrC8b+w0RtyRHNpkZXH11btK90z3YXULBdM=;
 b=kSOu0HNeWBXxQXpVA/NsM+QHWIYdU11QOoriPm6bGhVZ+qNM6raZ01ojxDr1tajF3XJCE+
 //46UiMseTjwbeDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C4D67A3B84;
 Fri, 13 Aug 2021 08:12:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: hda: Nuke unused reboot_notify callback
Date: Fri, 13 Aug 2021 10:12:30 +0200
Message-Id: <20210813081230.4268-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210813081230.4268-1-tiwai@suse.de>
References: <20210813081230.4268-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: youling257@gmail.com, Imre Deak <imre.deak@intel.com>
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

As reboot_notify callback is no longer used by the codec core, let's
get rid of the unused code.  Conexant codec needs a slight code change
as it used to call the reboot_notify at the codec removal, too.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214045
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h      |  1 -
 sound/pci/hda/hda_generic.c    | 19 -------------------
 sound/pci/hda/hda_generic.h    |  1 -
 sound/pci/hda/patch_analog.c   |  1 -
 sound/pci/hda/patch_ca0132.c   |  6 ------
 sound/pci/hda/patch_conexant.c |  9 +--------
 sound/pci/hda/patch_realtek.c  | 13 -------------
 sound/pci/hda/patch_sigmatel.c |  1 -
 8 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 2e8d51937acd..01570dbda503 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -114,7 +114,6 @@ struct hda_codec_ops {
 	int (*resume)(struct hda_codec *codec);
 	int (*check_power_status)(struct hda_codec *codec, hda_nid_t nid);
 #endif
-	void (*reboot_notify)(struct hda_codec *codec);
 	void (*stream_pm)(struct hda_codec *codec, hda_nid_t nid, bool on);
 };
 
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index e97d00585e8e..f46d4e7f499c 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -6000,24 +6000,6 @@ void snd_hda_gen_free(struct hda_codec *codec)
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_free);
 
-/**
- * snd_hda_gen_reboot_notify - Make codec enter D3 before rebooting
- * @codec: the HDA codec
- *
- * This can be put as patch_ops reboot_notify function.
- */
-void snd_hda_gen_reboot_notify(struct hda_codec *codec)
-{
-	/* Make the codec enter D3 to avoid spurious noises from the internal
-	 * speaker during (and after) reboot
-	 */
-	snd_hda_codec_set_power_to_all(codec, codec->core.afg, AC_PWRST_D3);
-	snd_hda_codec_write(codec, codec->core.afg, 0,
-			    AC_VERB_SET_POWER_STATE, AC_PWRST_D3);
-	msleep(10);
-}
-EXPORT_SYMBOL_GPL(snd_hda_gen_reboot_notify);
-
 #ifdef CONFIG_PM
 /**
  * snd_hda_gen_check_power_status - check the loopback power save state
@@ -6045,7 +6027,6 @@ static const struct hda_codec_ops generic_patch_ops = {
 	.init = snd_hda_gen_init,
 	.free = snd_hda_gen_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-	.reboot_notify = snd_hda_gen_reboot_notify,
 #ifdef CONFIG_PM
 	.check_power_status = snd_hda_gen_check_power_status,
 #endif
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index d4dd1b8a2e7e..c43bd0f0338e 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -324,7 +324,6 @@ int snd_hda_gen_parse_auto_config(struct hda_codec *codec,
 				  struct auto_pin_cfg *cfg);
 int snd_hda_gen_build_controls(struct hda_codec *codec);
 int snd_hda_gen_build_pcms(struct hda_codec *codec);
-void snd_hda_gen_reboot_notify(struct hda_codec *codec);
 
 /* standard jack event callbacks */
 void snd_hda_gen_hp_automute(struct hda_codec *codec,
diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
index 2132b2acec4d..a356e1662929 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/pci/hda/patch_analog.c
@@ -168,7 +168,6 @@ static const struct hda_codec_ops ad198x_auto_patch_ops = {
 	.check_power_status = snd_hda_gen_check_power_status,
 	.suspend = ad198x_suspend,
 #endif
-	.reboot_notify = ad198x_shutup,
 };
 
 
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 50ca72ee586e..208933792787 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -9682,11 +9682,6 @@ static void dbpro_free(struct hda_codec *codec)
 	kfree(codec->spec);
 }
 
-static void ca0132_reboot_notify(struct hda_codec *codec)
-{
-	codec->patch_ops.free(codec);
-}
-
 #ifdef CONFIG_PM
 static int ca0132_suspend(struct hda_codec *codec)
 {
@@ -9706,7 +9701,6 @@ static const struct hda_codec_ops ca0132_patch_ops = {
 #ifdef CONFIG_PM
 	.suspend = ca0132_suspend,
 #endif
-	.reboot_notify = ca0132_reboot_notify,
 };
 
 static const struct hda_codec_ops dbpro_patch_ops = {
diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 6d2bdef7f017..0515137a75b0 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -186,15 +186,9 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
 }
 
-static void cx_auto_reboot_notify(struct hda_codec *codec)
-{
-	cx_auto_shutdown(codec);
-	snd_hda_gen_reboot_notify(codec);
-}
-
 static void cx_auto_free(struct hda_codec *codec)
 {
-	cx_auto_reboot_notify(codec);
+	cx_auto_shutdown(codec);
 	snd_hda_gen_free(codec);
 }
 
@@ -210,7 +204,6 @@ static const struct hda_codec_ops cx_auto_patch_ops = {
 	.build_controls = snd_hda_gen_build_controls,
 	.build_pcms = snd_hda_gen_build_pcms,
 	.init = cx_auto_init,
-	.reboot_notify = cx_auto_reboot_notify,
 	.free = cx_auto_free,
 	.unsol_event = snd_hda_jack_unsol_event,
 #ifdef CONFIG_PM
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4043a2362f27..4f2296d062d5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -109,7 +109,6 @@ struct alc_spec {
 	void (*power_hook)(struct hda_codec *codec);
 #endif
 	void (*shutup)(struct hda_codec *codec);
-	void (*reboot_notify)(struct hda_codec *codec);
 
 	int init_amp;
 	int codec_variant;	/* flag for other variants */
@@ -897,16 +896,6 @@ static inline void alc_shutup(struct hda_codec *codec)
 		alc_shutup_pins(codec);
 }
 
-static void alc_reboot_notify(struct hda_codec *codec)
-{
-	struct alc_spec *spec = codec->spec;
-
-	if (spec && spec->reboot_notify)
-		spec->reboot_notify(codec);
-	else
-		alc_shutup(codec);
-}
-
 #define alc_free	snd_hda_gen_free
 
 #ifdef CONFIG_PM
@@ -952,7 +941,6 @@ static const struct hda_codec_ops alc_patch_ops = {
 	.suspend = alc_suspend,
 	.check_power_status = snd_hda_gen_check_power_status,
 #endif
-	.reboot_notify = alc_reboot_notify,
 };
 
 
@@ -5773,7 +5761,6 @@ static void alc_fixup_tpt440_dock(struct hda_codec *codec,
 	struct alc_spec *spec = codec->spec;
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		spec->reboot_notify = snd_hda_gen_reboot_notify; /* reduce noise */
 		spec->parse_flags = HDA_PINCFG_NO_HP_FIXUP;
 		codec->power_save_node = 0; /* avoid click noises */
 		snd_hda_apply_pincfgs(codec, pincfgs);
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 3bd592e126a3..3e00116db86e 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -4460,7 +4460,6 @@ static const struct hda_codec_ops stac_patch_ops = {
 #ifdef CONFIG_PM
 	.suspend = stac_suspend,
 #endif
-	.reboot_notify = stac_shutup,
 };
 
 static int alloc_stac_spec(struct hda_codec *codec)
-- 
2.26.2

