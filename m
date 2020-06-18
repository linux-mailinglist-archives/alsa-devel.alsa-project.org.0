Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFDF1FDE61
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57CFB16DA;
	Thu, 18 Jun 2020 03:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57CFB16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592444122;
	bh=FumiIC4SV64ItlOjDACyymgUa5Er6vFZUmFMIWXeyP8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=icdRTISHDYlEOaNEGgYXa1PS6idorMsomutZ0+9RKIE0Ap5dU5zjJCeTNPueoyoqx
	 MEvOduvxYDXYIqiwn3083Skqu6uc+l8sFNfO9QUfFl4OOxiAQrLv/uvRpMB6tDxCwd
	 qWzQyLTBTCynZBKli2zlYu+fY9a4g2QuHm6SI0W4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B64F3F80444;
	Thu, 18 Jun 2020 03:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8882F80445; Thu, 18 Jun 2020 03:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08BE6F8032A
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08BE6F8032A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M6mpw8N0"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D481821D94;
 Thu, 18 Jun 2020 01:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443017;
 bh=FumiIC4SV64ItlOjDACyymgUa5Er6vFZUmFMIWXeyP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M6mpw8N0SODsKU+F/z/RO3zIz6660RU0X1J62Uxv7im9d/SaxyvlJLSAyKs7iyS12
 cB4RR7Bgm/Y4TKz2OBX2pXPnWgHi+ayH8iabhU4a6LGW61bjvxTsYGfj9Mlrb5l1Ib
 VKpJzi5Y1qOCjZedzh7KfVjrnIKeXA4QWXKQ52K0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 019/266] ALSA: hda/realtek - Introduce polarity
 for micmute LED GPIO
Date: Wed, 17 Jun 2020 21:12:24 -0400
Message-Id: <20200618011631.604574-19-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit dbd13179780555ecd3c992dea1222ca31920e892 ]

Currently mute LED and micmute LED share the same GPIO polarity.

So split the polarity for mute and micmute, in case they have different
polarities.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Link: https://lore.kernel.org/r/20200430083255.5093-1-kai.heng.feng@canonical.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index df5afac0b600..459a7d61326e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -81,6 +81,7 @@ struct alc_spec {
 
 	/* mute LED for HP laptops, see alc269_fixup_mic_mute_hook() */
 	int mute_led_polarity;
+	int micmute_led_polarity;
 	hda_nid_t mute_led_nid;
 	hda_nid_t cap_mute_led_nid;
 
@@ -4080,11 +4081,9 @@ static void alc269_fixup_hp_mute_led_mic3(struct hda_codec *codec,
 
 /* update LED status via GPIO */
 static void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
-				bool enabled)
+				int polarity, bool enabled)
 {
-	struct alc_spec *spec = codec->spec;
-
-	if (spec->mute_led_polarity)
+	if (polarity)
 		enabled = !enabled;
 	alc_update_gpio_data(codec, mask, !enabled); /* muted -> LED on */
 }
@@ -4095,7 +4094,8 @@ static void alc_fixup_gpio_mute_hook(void *private_data, int enabled)
 	struct hda_codec *codec = private_data;
 	struct alc_spec *spec = codec->spec;
 
-	alc_update_gpio_led(codec, spec->gpio_mute_led_mask, enabled);
+	alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
+			    spec->mute_led_polarity, enabled);
 }
 
 /* turn on/off mic-mute LED via GPIO per capture hook */
@@ -4104,6 +4104,7 @@ static void alc_gpio_micmute_update(struct hda_codec *codec)
 	struct alc_spec *spec = codec->spec;
 
 	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
+			    spec->micmute_led_polarity,
 			    spec->gen.micmute_led.led_value);
 }
 
@@ -5808,7 +5809,8 @@ static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
 
 	snd_hda_gen_hp_automute(codec, jack);
 	/* mute_led_polarity is set to 0, so we pass inverted value here */
-	alc_update_gpio_led(codec, 0x10, !spec->gen.hp_jack_present);
+	alc_update_gpio_led(codec, 0x10, spec->mute_led_polarity,
+			    !spec->gen.hp_jack_present);
 }
 
 /* Manage GPIOs for HP EliteBook Folio 9480m.
-- 
2.25.1

