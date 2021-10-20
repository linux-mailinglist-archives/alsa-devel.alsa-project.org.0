Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 074504350AA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F6816A4;
	Wed, 20 Oct 2021 18:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F6816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634748701;
	bh=z1IKlQDzitv/8g0NEKBGzfCOUMfHybg09AnspGbdOME=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SmJDfOoPzwhoT6Q3uOezM8TAGCshAwPnWlePm3HAx7HlKFm5xy0DIP8pmb/NEBiJl
	 It2lijXuE9BTlpbDl+J40l9394iyrcUObCfoB9PVPJEP1veFHrSyJ3IkW//JDNrLdN
	 RZvCsBlTyJs68CAMf+n0b9ilFTZ5oN286JR/q/hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3D78F8050F;
	Wed, 20 Oct 2021 18:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3F08F80229; Wed, 20 Oct 2021 15:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D23DCF80155
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 15:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D23DCF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KQugN/1b"
Received: by mail-wm1-x32f.google.com with SMTP id
 j129-20020a1c2387000000b00322f53b9bbfso1592838wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jNaRc1LfQTJ5XsgrKgds8CW0+sIIrnx24JRi3PJWCsw=;
 b=KQugN/1bB3y+s9vO4aEYeD73JSGDzHjCFPhfaAEkjZvpqh3+GPahrR3gHAK5NFsd/3
 2yYgvOuEbsbafzhxpBNrDOhiICNqrvUwbbsdWGsFIA4LmZ1TbS6caaaOmtj9DRakDbce
 ISRIopI041DlI9Cvz4QHdMJSirP8eOtASMBwmmBIgniddWW81fz3rTlhR3UCGIoyze6w
 9XOler2fVHbqoaJQxQ15aPLx1jiGeSUaQ6hr3X/wrJSIb/eC0FmhKmgNX3SoNkQMgBsK
 i2X8r2BO3Qj5k9PkZtuVhFTa81Jr1LSADV3X7ON+iqiW2kI36DXip9SYxrH2hHFAfoQJ
 zWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jNaRc1LfQTJ5XsgrKgds8CW0+sIIrnx24JRi3PJWCsw=;
 b=t3RgOaGXZPyZVPbrIcDUV6fX/VvHjs2oUmt5XSDw6KhV3nxJHsci9k5nzGV+4x/V+6
 nK5sWNDoxokS7yapmvcrs2JDvvxUjT3sE22aONEJYFDxxr+hPFfN8TXJVm9DdcvQhog+
 ZugYeDcL5ZYbNYeDm0IkOHleclmKKc6r8f3n+5eKFsTXXShXL+iyYDW6H3lOGr8EEtXP
 TZOqFLS8eiY6DmpuzID+UMXGZZV+/0wXz5rvLKSHFOnD+PhKknRu5NmiyrhNJzOdzf9T
 pM4rhoOF0qJZT+hk8iQXe6jlJgrXTmiALrH1gxrHLVaoqOM7baptG2qQej/eu4hPXPfS
 K5JQ==
X-Gm-Message-State: AOAM532Y6//PX6KZi5mNW+Chyaf3pCTRxkjDvp2AjPUOJqUK1eu3Bxfl
 klZIic5uQqGedUlKW3Rlc70=
X-Google-Smtp-Source: ABdhPJxhf1WVsxyvu33UBwerIm+xYtq7wWb7p5NXus1pXL4gdfaucFbbN4HM6vqwHNkrekFIIdku/A==
X-Received: by 2002:a5d:69cc:: with SMTP id s12mr4813554wrw.108.1634735595375; 
 Wed, 20 Oct 2021 06:13:15 -0700 (PDT)
Received: from localhost.localdomain (host-92-18-70-200.as13285.net.
 [92.18.70.200])
 by smtp.gmail.com with ESMTPSA id t12sm2346709wmq.44.2021.10.20.06.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:13:15 -0700 (PDT)
From: Johnathon Clark <john.clark@cantab.net>
To: 
Subject: [PATCH] ALSA: hda/realtek: Fix mic mute LED for the HP Spectre x360 14
Date: Wed, 20 Oct 2021 14:12:51 +0100
Message-Id: <20211020131253.35894-1-john.clark@cantab.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Oct 2021 18:48:06 +0200
Cc: Chris Chiu <chris.chiu@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 open list <linux-kernel@vger.kernel.org>, Elia Devito <eliadevito@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, PeiSen Hou <pshou@realtek.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 john.clark@cantab.net
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

On the 'HP Spectre x360 Convertible 14-ea0xx' the microphone mute led is
controlled by GPIO 0x04. The speaker mute LED does not seem to be
exposed by GPIO and is there not set.

Signed-off-by: Johnathon Clark <john.clark@cantab.net>
---
 sound/pci/hda/patch_realtek.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 965b096f416f..79c6fb39864d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4355,6 +4355,17 @@ static void alc287_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x10, 0);
 }
 
+static void alc245_fixup_hp_gpio_led(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->micmute_led_polarity = 1;
+	}
+	alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
+}
+
 /* turn on/off mic-mute LED per capture hook via VREF change */
 static int vref_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -6709,6 +6720,7 @@ enum {
 	ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
 	ALC287_FIXUP_HP_GPIO_LED,
 	ALC256_FIXUP_HP_HEADSET_MIC,
+	ALC245_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
 	ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 	ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
@@ -7333,6 +7345,8 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC245_FIXUP_HP_X360_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_x360_amp,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_HP_GPIO_LED
 	},
 	[ALC288_FIXUP_DELL_HEADSET_MODE] = {
 		.type = HDA_FIXUP_FUNC,
@@ -8432,6 +8446,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc256_fixup_tongfang_reset_persistent_settings,
 	},
+	[ALC245_FIXUP_HP_GPIO_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_gpio_led,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
-- 
2.33.1

