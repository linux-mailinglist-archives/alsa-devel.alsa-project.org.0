Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A293054A8E8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A6401893;
	Tue, 14 Jun 2022 07:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A6401893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655185787;
	bh=0mFydC24IPu05bc4JA6eFbs97bCOMy8VsByFecpxpT8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dLzc2teKCEaFRsDqi1BnXuDR1jh4RJVWK3t3Icn9RJRHsVUWjq+Yk8tS/IjCDBvMk
	 cHkEfkwF0yDW/OQn85lEgHGii7jZRIfJDAtG0q6OmZu5mx5OzyylzTwBST+YtSP5GA
	 WO1ykl4lf4mWXBttwNm2rDvv3b/Dhd9ZAy9Y6S28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE7E5F80137;
	Tue, 14 Jun 2022 07:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DF6CF80139; Tue, 14 Jun 2022 07:48:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2893F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 07:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2893F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qmbe2opv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4nnxsp1M"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6BC021B8C;
 Tue, 14 Jun 2022 05:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655185714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FtYnp2QLc9h60rsEj9KXDBY/6nz7EthOAKLpItjtt30=;
 b=qmbe2opvXbo4dajcTGC2K6b7h2tiQMjhjbA4xt8z0KTomj79vid8YOhmaZfScRZX6DQp7h
 6b2bl1XmpOWsqRIdlEP+dSxOyQHIaPrRdf988d0J/+blxtIMcEuZns1CrkdHfqtBjHFaS7
 6fPijVufklq7Ns6iXSSFgeMuMfG8fiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655185714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FtYnp2QLc9h60rsEj9KXDBY/6nz7EthOAKLpItjtt30=;
 b=4nnxsp1MWet9CB3agGAuS0LsXvlR63X9+9whAHEeBuhTujwyXzCqHhN76mnSNZf9EqM35B
 9yTXLuLnVUZgWKCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8883013524;
 Tue, 14 Jun 2022 05:48:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sCmTIDIhqGL0XAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 14 Jun 2022 05:48:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Apply fixup for Lenovo Yoga Duet 7 properly
Date: Tue, 14 Jun 2022 07:48:31 +0200
Message-Id: <20220614054831.14648-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, nikitashvets@flyium.com
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

It turned out that Lenovo shipped two completely different products
with the very same PCI SSID, where both require different quirks;
namely, Lenovo C940 has already the fixup for its speaker
(ALC298_FIXUP_LENOVO_SPK_VOLUME) with the PCI SSID 17aa:3818, while
Yoga Duet 7 has also the very same PCI SSID but requires a different
quirk, ALC287_FIXUP_YOGA7_14TIL_SPEAKERS.

Fortunately, both are with different codecs (C940 with ALC298 and Duet
7 with ALC287), hence we can apply different fixes by checking the
codec ID.  This patch implements that special fixup function.

For easier handling, the internal function for applying a specific
fixup entry is exported as __snd_hda_apply_fixup(), so that it can be
called from the codec driver.  The rest is simply calling it with a
different fixup ID depending on the codec ID.

Reported-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: nikitashvets@flyium.com
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/5ca147d1-3a2d-60c6-c491-8aa844183222@redhat.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_auto_parser.c |  7 ++++---
 sound/pci/hda/hda_local.h       |  1 +
 sound/pci/hda/patch_realtek.c   | 24 +++++++++++++++++++++++-
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index cd1db943b7e0..7c6b1fe8dfcc 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -819,7 +819,7 @@ static void set_pin_targets(struct hda_codec *codec,
 		snd_hda_set_pin_ctl_cache(codec, cfg->nid, cfg->val);
 }
 
-static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
+void __snd_hda_apply_fixup(struct hda_codec *codec, int id, int action, int depth)
 {
 	const char *modelname = codec->fixup_name;
 
@@ -829,7 +829,7 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
 		if (++depth > 10)
 			break;
 		if (fix->chained_before)
-			apply_fixup(codec, fix->chain_id, action, depth + 1);
+			__snd_hda_apply_fixup(codec, fix->chain_id, action, depth + 1);
 
 		switch (fix->type) {
 		case HDA_FIXUP_PINS:
@@ -870,6 +870,7 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
 		id = fix->chain_id;
 	}
 }
+EXPORT_SYMBOL_GPL(__snd_hda_apply_fixup);
 
 /**
  * snd_hda_apply_fixup - Apply the fixup chain with the given action
@@ -879,7 +880,7 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
 void snd_hda_apply_fixup(struct hda_codec *codec, int action)
 {
 	if (codec->fixup_list)
-		apply_fixup(codec, codec->fixup_id, action, 0);
+		__snd_hda_apply_fixup(codec, codec->fixup_id, action, 0);
 }
 EXPORT_SYMBOL_GPL(snd_hda_apply_fixup);
 
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index aca592651870..682dca2057db 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -348,6 +348,7 @@ void snd_hda_apply_verbs(struct hda_codec *codec);
 void snd_hda_apply_pincfgs(struct hda_codec *codec,
 			   const struct hda_pintbl *cfg);
 void snd_hda_apply_fixup(struct hda_codec *codec, int action);
+void __snd_hda_apply_fixup(struct hda_codec *codec, int id, int action, int depth);
 void snd_hda_pick_fixup(struct hda_codec *codec,
 			const struct hda_model_fixup *models,
 			const struct snd_pci_quirk *quirk,
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9b6ee775ee3f..b937f63d0d09 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7004,6 +7004,7 @@ enum {
 	ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS,
 	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
+	ALC298_FIXUP_LENOVO_C940_DUET7,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -7022,6 +7023,23 @@ enum {
 	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
 };
 
+/* A special fixup for Lenovo C940 and Yoga Duet 7;
+ * both have the very same PCI SSID, and we need to apply different fixups
+ * depending on the codec ID
+ */
+static void alc298_fixup_lenovo_c940_duet7(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	int id;
+
+	if (codec->core.vendor_id == 0x10ec0298)
+		id = ALC298_FIXUP_LENOVO_SPK_VOLUME; /* C940 */
+	else
+		id = ALC287_FIXUP_YOGA7_14ITL_SPEAKERS; /* Duet 7 */
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
@@ -8721,6 +8739,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE,
 	},
+	[ALC298_FIXUP_LENOVO_C940_DUET7] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc298_fixup_lenovo_c940_duet7,
+	},
 	[ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9274,7 +9296,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
+	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
-- 
2.35.3

