Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B60919B8
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Aug 2019 23:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73871668;
	Sun, 18 Aug 2019 23:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73871668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566163523;
	bh=jB9hT+eFL5gcVdRGxv4dOtN+i6jBqpWDLJgkk68oUVQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGEL6JKjcX1pVH1UYbfQdXB2esWRK9QW+iKO2+GbqPC+yUIFQ/RNxpWKy0GFHyf/r
	 iQnonEU4u1h7g4Ernpq4YUWL8Tro+AC6mzhIODwjwbhwDkaue7TpmjG3JkC9+X45JX
	 luUg0bOSeIYSTBIoYYUaJTBPgc5Pa+sx0h9aKR+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D165BF800B6;
	Sun, 18 Aug 2019 23:23:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E87FF8036C; Sun, 18 Aug 2019 23:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC2FBF800B6
 for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2019 23:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC2FBF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="byYEEmzD"
Received: by mail-qt1-x841.google.com with SMTP id i4so11983975qtj.8
 for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2019 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mz+r+0rxVrkE+cC1sFesYgyZlVu/7do9pfo1KsfLSH0=;
 b=byYEEmzDNVhXVto5XGIrSACS7bvp8ZAVXj2SamFYT6zHmaqNucKXxMMtioINRG8UqO
 oInGspEDIcsrn5x1mmO++Yc5/d6Yb24MdrRX+rRYS9f2slWSGPe77zMMeA/EIOO6tZ38
 Imjl3NDmUs6zLlzPSPTWWPBwCdrh56wcKjeRp1KdkmeLblSyAYiO9GpUtFDWaJAN3ibX
 1FhXHvgOdMhwlBGcYhPV4Fcwvb1wPvjVpmMQq7L8SrOdzSXj/dVnL0RNT5TCRbxdn7OG
 vsKKVYxPfaYI94RQoCylGoDTNZeXp1YcdCyN2I8tf+rnZdMV8PHorcfaKNBfTugc5ody
 M3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mz+r+0rxVrkE+cC1sFesYgyZlVu/7do9pfo1KsfLSH0=;
 b=FuYq8TCTi+NT/o6SqsoAjuY+cPIZZabPrcs1KtBTjKN/NOw1sI06n49jCMcHtiBvAS
 SRkqraIH9jFBKTrVXQYDvscXkUgvU0sQ+JVwVJzdrOpYLLZeFjs5T5Oriy7JMHY1Lrns
 px0KNkXzABpQp6Z4FwPUgtf5wMRDBZBqKnb2F6YPgQGQdnFNtj96LdEvuEIX9Ab+1Pib
 eOwGvaZnRRP1VfStokx9nhc34JRcPrfkyxTJznc6dgdbzNaZmE8wCTUqosHteKrXrzfN
 7dLTF1FPLd4bDcZyapNHul/h9GDF7fcjVnzvUsz3IVg3Ln1Mvww12FjGGjXrqol3UoLK
 dArw==
X-Gm-Message-State: APjAAAVFHaE9EmG5wTPfeeqNqftMxXi/ZOP0J9X68jRfb/5RZZKTU1mh
 LsDXtqRVl5pKb7543h2+dZt238nGxUc=
X-Google-Smtp-Source: APXvYqz/IrrQ5wYbPEbK0u81OqStEmNtb6eO4/x3rGa+7EuTptAICP/cf3XqIXUK8J6idM+NA3nrAg==
X-Received: by 2002:ac8:397c:: with SMTP id t57mr18440482qtb.21.1566163405694; 
 Sun, 18 Aug 2019 14:23:25 -0700 (PDT)
Received: from billcipher.cpe.telecentro.net.ar ([181.47.97.137])
 by smtp.gmail.com with ESMTPSA id c11sm5740115qtq.41.2019.08.18.14.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 14:23:25 -0700 (PDT)
From: jeronimo@borque.com.ar
To: alsa-devel@alsa-project.org
Date: Sun, 18 Aug 2019 18:23:02 -0300
Message-Id: <20190818212302.27430-1-jeronimo@borque.com.ar>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <s5himqx8tzj.wl-tiwai@suse.de>
References: <s5himqx8tzj.wl-tiwai@suse.de>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Jeronimo Borque <jeronimo@borque.com.ar>,
 Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH v2] ALSA: hda - Fixes inverted Conexant GPIO
	mic mute led
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jeronimo Borque <jeronimo@borque.com.ar>

"enabled" parameter historically referred to the device input or
output, not to the led indicator. After the changes added with the led
helper functions the mic mute led logic refers to the led and not to
the mic input which caused led indicator to be negated.
Fixing logic in cxt_update_gpio_led and updated
cxt_fixup_gpio_mute_hook
Also updated debug messages to ease further debugging if necessary.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Jeronimo Borque <jeronimo@borque.com.ar>
---
 sound/pci/hda/patch_conexant.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 14298ef45b21..d1c93dfa158b 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -611,18 +611,20 @@ static void cxt_fixup_hp_gate_mic_jack(struct hda_codec *codec,
 
 /* update LED status via GPIO */
 static void cxt_update_gpio_led(struct hda_codec *codec, unsigned int mask,
-				bool enabled)
+				bool led_on)
 {
 	struct conexant_spec *spec = codec->spec;
 	unsigned int oldval = spec->gpio_led;
 
 	if (spec->mute_led_polarity)
-		enabled = !enabled;
+		led_on = !led_on;
 
-	if (enabled)
-		spec->gpio_led &= ~mask;
-	else
+	if (led_on)
 		spec->gpio_led |= mask;
+	else
+		spec->gpio_led &= ~mask;
+	codec_dbg(codec, "mask:%d enabled:%d gpio_led:%d\n
+			mask, led_on, spec->gpio_led);
 	if (spec->gpio_led != oldval)
 		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
 				    spec->gpio_led);
@@ -633,8 +635,8 @@ static void cxt_fixup_gpio_mute_hook(void *private_data, int enabled)
 {
 	struct hda_codec *codec = private_data;
 	struct conexant_spec *spec = codec->spec;
-
-	cxt_update_gpio_led(codec, spec->gpio_mute_led_mask, enabled);
+	/* muted -> LED on */
+	cxt_update_gpio_led(codec, spec->gpio_mute_led_mask, !enabled);
 }
 
 /* turn on/off mic-mute LED via GPIO per capture hook */
@@ -656,7 +658,6 @@ static void cxt_fixup_mute_led_gpio(struct hda_codec *codec,
 		{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x03 },
 		{}
 	};
-	codec_info(codec, "action: %d gpio_led: %d\n", action, spec->gpio_led);
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->gen.vmaster_mute.hook = cxt_fixup_gpio_mute_hook;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
