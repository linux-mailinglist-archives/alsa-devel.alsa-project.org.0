Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD801975C6
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09651607;
	Mon, 30 Mar 2020 09:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09651607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553624;
	bh=T1SZulG5gqn2ZXS6PoxpE7k5CI473qhPyjGJtr3NkWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHNYIUxh1m7quePioUVXPLwSN+B0bGQDUD/z+wuCXutnm4STknS+zBDFP97uRi6Nw
	 DHNUU5pon7w+UoFsBBmJSyKFAEa5zOrcoZ4z+/HVpwCDtbnHnwU5f00RcokIy45FN+
	 7+7g7jQQoK1G5V3X19iCESbOfyzTmt1kpF6zROLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 844D3F80291;
	Mon, 30 Mar 2020 09:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E674F8029A; Mon, 30 Mar 2020 09:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03F10F8028F
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F10F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WNCYmI3o"
Received: by mail-qv1-xf44.google.com with SMTP id c28so8404443qvb.10
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDYAIctGkn55KBqR9qucSo56z5+CeH+A3ihWoQapPKY=;
 b=WNCYmI3oYH+agXhTebOSeL2CID0bR9t39xX6EfKnqeKOf+2VVfT7H6P9WSWARJHnx1
 Nwkm5x9hPuXJwB56AXTq5qQTTH/idixjQ9Es+EQVTJhdXYIEjfObcL1TQjfzGOLk+4ho
 2EmdN1asGeCy2R6PETUd1EDwF43yxKg3osvBpzWpFLRM2WBQXDojgFT3JpC5uYlTIqbw
 +N7C7bpz5j5z9CiWJBVXq6Y0MTKnsNGzBW/6f2sgyiui5T+TPNHSisG+AeF7da2QwkdT
 19YEwYPZIs/WbOToU9tkZHX3RKGznuTJV+Zyq4PGvRt93PlJ8+Wm3dJlDcB12YzPzw8p
 VnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDYAIctGkn55KBqR9qucSo56z5+CeH+A3ihWoQapPKY=;
 b=aCPvxwYd9E3qs4nIxhM8GED2x6wUP/dHTOwWfni+gp6i4BGMXLteQTMmjiVSuafjod
 aOKfp/6BAef46pC8s+dJ/gx74Qk+Y7HJeVSkkP72OJ+MHo/ETq60aY4Fn0bUl9ReTANy
 yHm4s8+F4qEujzxqjaAeQ5wtAQRX/Z+MG8El6nLN5aTgr3W4S8VGWyAAiBp4QEcSORJk
 1DeiXUcYLyg9EnOhq8NmB88pCEyLeNISCX1hkxc35iFTafG/VlAkyYVuochpUOpKg6kk
 4Pmw6MR5GUAyw7hrE47g5cjMCZj3O4sUv6tsh7+W9mGv6GMsP20kgj1pKYyXKN9cDbkU
 Fyfw==
X-Gm-Message-State: ANhLgQ0ySZa8i6mpNxEl5bbpUAGTfLjEgO0lWebApXR7uG2ySspd6gQc
 8oUGBtzPAbomHDoqF7wgtU16eQfiaJG8VA==
X-Google-Smtp-Source: ADFU+vspur6Fo6L5EFe9kdsDpikMX9TxcLq75up84/QmElUAH98QakXKSqYOdFKj8dsXaAKbaA2OrQ==
X-Received: by 2002:ad4:4847:: with SMTP id t7mr10498967qvy.237.1585553442116; 
 Mon, 30 Mar 2020 00:30:42 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id n63sm10078499qka.80.2020.03.30.00.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 00:30:41 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.or
Subject: [PATCH 3/3] ALSA: hda/realtek - Remove now-unnecessary XPS 13
 headphone noise fixups
Date: Mon, 30 Mar 2020 03:30:32 -0400
Message-Id: <028b0c410238090546cf80ef6075b3b9139986a7.1585553414.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1585553414.git.tommyhebb@gmail.com>
References: <cover.1585553414.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Sergey Bostandzhyan <jin@mediatomb.cc>, linux-doc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

patch_realtek.c has historically failed to properly configure the PC
Beep Hidden Register for the ALC256 codec (among others). Depending on
your kernel version, symptoms of this misconfiguration can range from
chassis noise, picked up by a poorly-shielded PCBEEP trace, getting
amplified and played on your internal speaker and/or headphones to loud
feedback, which responds to the "Headphone Mic Boost" ALSA control,
getting played through your headphones. For details of the problem, see
the patch in this series titled "ALSA: hda/realtek - Set principled PC
Beep configuration for ALC256", which fixes the configuration.

These symptoms have been most noticed on the Dell XPS 13 9350 and 9360,
popular laptops that use the ALC256. As a result, several model-specific
fixups have been introduced to try and fix the problem, the most
egregious of which locks the "Headphone Mic Boost" control as a hack to
minimize noise from a feedback loop that shouldn't have been there in
the first place.

Now that the underlying issue has been fixed, remove all these fixups.
Remaining fixups needed by the XPS 13 are all picked up by existing pin
quirks.

This change should, for the XPS 13 9350/9360

 - Significantly increase volume and audio quality on headphones
 - Eliminate headphone popping on suspend/resume
 - Allow "Headphone Mic Boost" to be set again, making the headphone
   jack fully usable as a microphone jack too.

Fixes: 8c69729b4439 ("ALSA: hda - Fix headphone noise after Dell XPS 13 resume back from S3")
Fixes: 423cd785619a ("ALSA: hda - Fix headphone noise on Dell XPS 13 9360")
Fixes: e4c9fd10eb21 ("ALSA: hda - Apply headphone noise quirk for another Dell XPS 13 variant")
Fixes: 1099f48457d0 ("ALSA: hda/realtek: Reduce the Headphone static noise on XPS 9350/9360")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 Documentation/sound/hd-audio/models.rst |  2 --
 sound/pci/hda/patch_realtek.c           | 34 -------------------------
 2 files changed, 36 deletions(-)

diff --git a/Documentation/sound/hd-audio/models.rst b/Documentation/sound/hd-audio/models.rst
index 11298f0ce44d..0ea967d34583 100644
--- a/Documentation/sound/hd-audio/models.rst
+++ b/Documentation/sound/hd-audio/models.rst
@@ -216,8 +216,6 @@ alc298-dell-aio
     ALC298 fixups on Dell AIO machines
 alc275-dell-xps
     ALC275 fixups on Dell XPS models
-alc256-dell-xps13
-    ALC256 fixups on Dell XPS13
 lenovo-spk-noise
     Workaround for speaker noise on Lenovo machines
 lenovo-hotkey
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 024dd61a788b..a57581ddcc0c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5378,17 +5378,6 @@ static void alc271_hp_gate_mic_jack(struct hda_codec *codec,
 	}
 }
 
-static void alc256_fixup_dell_xps_13_headphone_noise2(struct hda_codec *codec,
-						      const struct hda_fixup *fix,
-						      int action)
-{
-	if (action != HDA_FIXUP_ACT_PRE_PROBE)
-		return;
-
-	snd_hda_codec_amp_stereo(codec, 0x1a, HDA_INPUT, 0, HDA_AMP_VOLMASK, 1);
-	snd_hda_override_wcaps(codec, 0x1a, get_wcaps(codec, 0x1a) & ~AC_WCAP_IN_AMP);
-}
-
 static void alc269_fixup_limit_int_mic_boost(struct hda_codec *codec,
 					     const struct hda_fixup *fix,
 					     int action)
@@ -5866,8 +5855,6 @@ enum {
 	ALC298_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC298_FIXUP_DELL_AIO_MIC_NO_PRESENCE,
 	ALC275_FIXUP_DELL_XPS,
-	ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE,
-	ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2,
 	ALC293_FIXUP_LENOVO_SPK_NOISE,
 	ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY,
 	ALC255_FIXUP_DELL_SPK_NOISE,
@@ -6607,23 +6594,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{}
 		}
 	},
-	[ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE] = {
-		.type = HDA_FIXUP_VERBS,
-		.v.verbs = (const struct hda_verb[]) {
-			/* Disable pass-through path for FRONT 14h */
-			{0x20, AC_VERB_SET_COEF_INDEX, 0x36},
-			{0x20, AC_VERB_SET_PROC_COEF, 0x1737},
-			{}
-		},
-		.chained = true,
-		.chain_id = ALC255_FIXUP_DELL1_MIC_NO_PRESENCE
-	},
-	[ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc256_fixup_dell_xps_13_headphone_noise2,
-		.chained = true,
-		.chain_id = ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE
-	},
 	[ALC293_FIXUP_LENOVO_SPK_NOISE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_disable_aamix,
@@ -7117,17 +7087,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x06de, "Dell", ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK),
 	SND_PCI_QUIRK(0x1028, 0x06df, "Dell", ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK),
 	SND_PCI_QUIRK(0x1028, 0x06e0, "Dell", ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK),
-	SND_PCI_QUIRK(0x1028, 0x0704, "Dell XPS 13 9350", ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2),
 	SND_PCI_QUIRK(0x1028, 0x0706, "Dell Inspiron 7559", ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER),
 	SND_PCI_QUIRK(0x1028, 0x0725, "Dell Inspiron 3162", ALC255_FIXUP_DELL_SPK_NOISE),
 	SND_PCI_QUIRK(0x1028, 0x0738, "Dell Precision 5820", ALC269_FIXUP_NO_SHUTUP),
-	SND_PCI_QUIRK(0x1028, 0x075b, "Dell XPS 13 9360", ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2),
 	SND_PCI_QUIRK(0x1028, 0x075c, "Dell XPS 27 7760", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x1028, 0x075d, "Dell AIO", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x1028, 0x07b0, "Dell Precision 7520", ALC295_FIXUP_DISABLE_DAC3),
 	SND_PCI_QUIRK(0x1028, 0x0798, "Dell Inspiron 17 7000 Gaming", ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER),
 	SND_PCI_QUIRK(0x1028, 0x080c, "Dell WYSE", ALC225_FIXUP_DELL_WYSE_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1028, 0x082a, "Dell XPS 13 9360", ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2),
 	SND_PCI_QUIRK(0x1028, 0x084b, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
 	SND_PCI_QUIRK(0x1028, 0x084e, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
 	SND_PCI_QUIRK(0x1028, 0x0871, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
@@ -7480,7 +7447,6 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_DELL1_MIC_NO_PRESENCE, .name = "alc298-dell1"},
 	{.id = ALC298_FIXUP_DELL_AIO_MIC_NO_PRESENCE, .name = "alc298-dell-aio"},
 	{.id = ALC275_FIXUP_DELL_XPS, .name = "alc275-dell-xps"},
-	{.id = ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE, .name = "alc256-dell-xps13"},
 	{.id = ALC293_FIXUP_LENOVO_SPK_NOISE, .name = "lenovo-spk-noise"},
 	{.id = ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY, .name = "lenovo-hotkey"},
 	{.id = ALC255_FIXUP_DELL_SPK_NOISE, .name = "dell-spk-noise"},
-- 
2.25.2

