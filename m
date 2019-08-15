Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC58E277
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 03:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB54165D;
	Thu, 15 Aug 2019 03:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB54165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565833273;
	bh=CCsIWLS0ro79akA2mzaoOHx2YOBnFnHHH2JC5eJyoOc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lm+Uc26cG4wRdPlnka/atldlaW742iCMT7AMH4L0HCzElQwcSvUj6lAF085LtDZm6
	 hA/6rkcC81z6x4NKMypB4VqUVSeEVay1P0BYzuud2/DEJq7ZZI+heP8MgmXWvG3zIz
	 3txSTh0oSlrOjOgDb1GeCMqzvIFL1BMuBUnrklXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 528ABF80274;
	Thu, 15 Aug 2019 03:39:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60153F80274; Thu, 15 Aug 2019 03:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34755F801DF
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 03:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34755F801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="toTz6YY7"
Received: by mail-qt1-x844.google.com with SMTP id q4so881231qtp.1
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 18:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wA/x2dxQiMMNel8N2gzBx4H/5a7KjXK2r7iTD3skvIw=;
 b=toTz6YY7YDeI15z/wT+hpufnCF9jKWZay51h+4g/DZRU5ZAP0mTqwepTHwZzinBlDD
 BoWWIqqkD812x+Njm+uHnERbySfDWLB0Y75klSeWrUn8Yj1Y5t3vNBAkQRZHkLMxGLw7
 vGtzqKbKK7jjFZwx4uPgP9KA3g1m9w6jDLIUEXilbDMcftq42yZ3w8RkKp2mNkkDDauf
 iUi0ecCXbADeB7w3ORk0t0hcHXHTz3n6nkjl5lSHrKEdL/FX3S1NleL39hXpobupyj9j
 oddKc/SEqFYZM+Fg4ote8hI5lZUsG9SJW0hE+ER61uMwN5U9XzX8h+0LOqb2q0AU0tpx
 zwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wA/x2dxQiMMNel8N2gzBx4H/5a7KjXK2r7iTD3skvIw=;
 b=qTrbeZ/BqGjmiiCOs9z/uTWz2g3d3hPO1yWrRGz9hyB6NvOppszV9YgkUIZ3QFBOpi
 harnhVbYJwGgOom9oeCBYMekd0iC89l8MBwsaFJTicpfuBFgRWvF7M2HasQm9gfRvtYz
 1pJovmXvnhS+CiIoad/PtKB8OgpwieDd62K7vuTk7d+xqFnd39/FZWc4DV4qNCNlcJPW
 6ydvbkTOJHqgBeX7H+Uu72I2GFxw86lVZSNcOhgFIJuJnl//iWWbL0/WV7YFbk8SzA6n
 SMEBsyYW8hXePgnRqcxmIFp5nk0QxqqB3brwHar14T+NtBkxlOTqwBChe91hyPV/LkRZ
 Oyug==
X-Gm-Message-State: APjAAAWON1sqEFfVjFU7cDwlzYJ04cWly2AuD10DHpPuS9fbJndKG8zF
 y3tFmjAq48Zg/kGV2q5UAf2U73pJ00Pn/w==
X-Google-Smtp-Source: APXvYqx52FBhH4l6T6zyAIzkFO4zXYA90kTDapp+duzMBf0SMefRrLcIAxFLtYcVHb4TUd/DdVqYUg==
X-Received: by 2002:aed:2d67:: with SMTP id h94mr1954587qtd.154.1565833162053; 
 Wed, 14 Aug 2019 18:39:22 -0700 (PDT)
Received: from billcipher.cpe.telecentro.net.ar ([181.47.97.137])
 by smtp.gmail.com with ESMTPSA id m194sm725575qke.123.2019.08.14.18.39.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 18:39:21 -0700 (PDT)
From: jeronimo@borque.com.ar
To: alsa-devel@alsa-project.org
Date: Wed, 14 Aug 2019 22:38:24 -0300
Message-Id: <20190815013824.13373-1-jeronimo@borque.com.ar>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Jeronimo Borque <jeronimo@borque.com.ar>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: hda - Fixes inverted Conexant GPIO mic
	mute led
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
output, not to the led indicator. After the changes added with the
led helper functions the mic mute led logic refers to the led and not
to the mic input which caused led indicator to be negated (Mic mute
led was on when the input enabled) Fixing it in the call to
cxt_update_gpio_led at the cxt_gpio_micmute_update hook.
Maybe more changes are required to be consistent everywhere.

Signed-off-by: Jeronimo Borque <jeronimo@borque.com.ar>
---
 sound/pci/hda/patch_conexant.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index f299f137eaea..8edf0d1290b5 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -636,6 +636,10 @@ static void cxt_update_gpio_led(struct hda_codec *codec, unsigned int mask,
 		spec->gpio_led &= ~mask;
 	else
 		spec->gpio_led |= mask;
+
+	codec_dbg(codec, "mask:%d enabled:%d gpio_led:%d\n",
+			    mask, enabled, spec->gpio_led);
+
 	if (spec->gpio_led != oldval)
 		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
 				    spec->gpio_led);
@@ -656,7 +660,7 @@ static void cxt_gpio_micmute_update(struct hda_codec *codec)
 	struct conexant_spec *spec = codec->spec;
 
 	cxt_update_gpio_led(codec, spec->gpio_mic_led_mask,
-			    spec->gen.micmute_led.led_value);
+			    !spec->gen.micmute_led.led_value);
 }
 
 
@@ -669,7 +673,6 @@ static void cxt_fixup_mute_led_gpio(struct hda_codec *codec,
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
