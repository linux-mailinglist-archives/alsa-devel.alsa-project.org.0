Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043188CA1D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B331697;
	Wed, 14 Aug 2019 06:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B331697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565755927;
	bh=0TAm2IkSo76d8RXIBQn7yCeJJ32vsd2FnR0x8SPxs6g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUwQ+GW3ZMWhdzA9NLO1eHSZODFHFJP3NyIlaGyQudJ6xOAmDO4kjSolGuk5rOCqT
	 olbNrwrdiWzolZ/QWYgqRzHKpKLW53ekdps9pW5GorL26xUV9WptS5psGFzKnCYYqY
	 dIpx4MWgEbOG1DyPAxBBJCcQ7wzi2zLeEIOS9Wd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5CCF805A9;
	Wed, 14 Aug 2019 06:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38229F8058C; Wed, 14 Aug 2019 06:09:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97F3F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97F3F8015B
Received: from [114.254.46.119] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hxkbL-0000CA-Bm; Wed, 14 Aug 2019 04:09:32 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 14 Aug 2019 12:09:08 +0800
Message-Id: <20190814040908.9758-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814040908.9758-1-hui.wang@canonical.com>
References: <20190814040908.9758-1-hui.wang@canonical.com>
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/2] ALSA: hda - Add a generic reboot_notify
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

Make codec enter D3 before rebooting or poweroff can fix the noise
issue on some laptops. And in theory it is harmless for all codecs
to enter D3 before rebooting or poweroff, let us add a generic
reboot_notify, then realtek and conexant drivers can call this
function.

Cc: stable@vger.kernel.org
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_generic.c    | 19 +++++++++++++++++++
 sound/pci/hda/hda_generic.h    |  1 +
 sound/pci/hda/patch_conexant.c |  6 +-----
 sound/pci/hda/patch_realtek.c  | 11 +----------
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 8f2beb1f3ae4..5bf24fb819d2 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -6051,6 +6051,24 @@ void snd_hda_gen_free(struct hda_codec *codec)
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_free);
 
+/**
+ * snd_hda_gen_reboot_notify - Make codec enter D3 before rebooting
+ * @codec: the HDA codec
+ *
+ * This can be put as patch_ops reboot_notify function.
+ */
+void snd_hda_gen_reboot_notify(struct hda_codec *codec)
+{
+	/* Make the codec enter D3 to avoid spurious noises from the internal
+	 * speaker during (and after) reboot
+	 */
+	snd_hda_codec_set_power_to_all(codec, codec->core.afg, AC_PWRST_D3);
+	snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_POWER_STATE, AC_PWRST_D3);
+	msleep(10);
+}
+EXPORT_SYMBOL_GPL(snd_hda_gen_reboot_notify);
+
 #ifdef CONFIG_PM
 /**
  * snd_hda_gen_check_power_status - check the loopback power save state
@@ -6078,6 +6096,7 @@ static const struct hda_codec_ops generic_patch_ops = {
 	.init = snd_hda_gen_init,
 	.free = snd_hda_gen_free,
 	.unsol_event = snd_hda_jack_unsol_event,
+	.reboot_notify = snd_hda_gen_reboot_notify,
 #ifdef CONFIG_PM
 	.check_power_status = snd_hda_gen_check_power_status,
 #endif
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 35a670a71c42..5f199dcb0d18 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -332,6 +332,7 @@ int snd_hda_gen_parse_auto_config(struct hda_codec *codec,
 				  struct auto_pin_cfg *cfg);
 int snd_hda_gen_build_controls(struct hda_codec *codec);
 int snd_hda_gen_build_pcms(struct hda_codec *codec);
+void snd_hda_gen_reboot_notify(struct hda_codec *codec);
 
 /* standard jack event callbacks */
 void snd_hda_gen_hp_automute(struct hda_codec *codec,
diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 93a303676aea..14298ef45b21 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -166,11 +166,7 @@ static void cx_auto_reboot_notify(struct hda_codec *codec)
 	/* Turn the problematic codec into D3 to avoid spurious noises
 	   from the internal speaker during (and after) reboot */
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
-
-	snd_hda_codec_set_power_to_all(codec, codec->core.afg, AC_PWRST_D3);
-	snd_hda_codec_write(codec, codec->core.afg, 0,
-			    AC_VERB_SET_POWER_STATE, AC_PWRST_D3);
-	msleep(10);
+	snd_hda_gen_reboot_notify(codec);
 }
 
 static void cx_auto_free(struct hda_codec *codec)
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cb7baa65b298..a1439c9a635a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -869,15 +869,6 @@ static void alc_reboot_notify(struct hda_codec *codec)
 		alc_shutup(codec);
 }
 
-/* power down codec to D3 at reboot/shutdown; set as reboot_notify ops */
-static void alc_d3_at_reboot(struct hda_codec *codec)
-{
-	snd_hda_codec_set_power_to_all(codec, codec->core.afg, AC_PWRST_D3);
-	snd_hda_codec_write(codec, codec->core.afg, 0,
-			    AC_VERB_SET_POWER_STATE, AC_PWRST_D3);
-	msleep(10);
-}
-
 #define alc_free	snd_hda_gen_free
 
 #ifdef CONFIG_PM
@@ -5218,7 +5209,7 @@ static void alc_fixup_tpt440_dock(struct hda_codec *codec,
 	struct alc_spec *spec = codec->spec;
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		spec->reboot_notify = alc_d3_at_reboot; /* reduce noise */
+		spec->reboot_notify = snd_hda_gen_reboot_notify; /* reduce noise */
 		spec->parse_flags = HDA_PINCFG_NO_HP_FIXUP;
 		codec->power_save_node = 0; /* avoid click noises */
 		snd_hda_apply_pincfgs(codec, pincfgs);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
