Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0565291AD3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 03:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9A21677;
	Mon, 19 Aug 2019 03:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9A21677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566178912;
	bh=+QEqPEFmmw85lVWuQYedU5GT6V35vwqBY2dW5WcUjw4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCBg1aUPW6ogHolAuov+5324e/cYxNdBQpMbLbC1OKOIFpnf8hE6AVXv3BOnVVVYG
	 EVmkmBILkuJVvC1NbwYZRF6+iP+Oa1Wz49jOIljQkVzPXUY2nA0NelhwwNnuR66+Qg
	 6f3a3Y/IDoBdipIUCuD75v9y1wvmVAS7xLim6tes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B229BF8036E;
	Mon, 19 Aug 2019 03:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1D76F8036C; Mon, 19 Aug 2019 03:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21AF4F801D9
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 03:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AF4F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fKRzg4Fc"
Received: by mail-qk1-x741.google.com with SMTP id s14so204466qkm.4
 for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2019 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuY40PgJHFSNLJEz2fHr/O2wmvu8tPHvNc5Ge8NI7Dk=;
 b=fKRzg4Fc/esU3O7YFnIk6T8Ql66tUaCTXybwcWbUQDASWO7q6ymVJeyioHhqTmQKMF
 Tdy0TlPLkZvw65xrTDoUgfhu6RpbV0G94y39BndniUwj/2iF2suxQUroELT6jLL/TkaU
 hc/SRP6Lq8E7rNCTcWxLNYacXnCwWAwWUzwFozy/6pCZJ9nYzBYqaP+bRS3utS6hAn9t
 9V/ZhMzylykC0H0E9KPIqMMtYhB3ALS6r/2xKJTNyF7ZR9dYRmWXgGSJmQ0+hfQ3tR93
 GMbHLNoNQ2JAA+jTrorqiqmdPEX3axKnyCwB34dDvEAVKBRt/cjWzTCpYPqvQKNeiExR
 98Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CuY40PgJHFSNLJEz2fHr/O2wmvu8tPHvNc5Ge8NI7Dk=;
 b=BC+ajyDOoA7G06lRVx6z0xW8BZR8JFdCBWmiFuN683izroYnvzCgb10Cyw5+Qt+SRI
 41oIfRx1mhJRBYkyLi6EkIkmUbgYy1lFjp/1m8WUOgaOj6NO+kqmIZrfMn+KhTMJFm/1
 MD9jBUeRi2SYptcdoOctt81Beo+k4wjcbvQL6NdfStAO6MfEZpC8B8wpUYUaWwTkLEsJ
 nxoDnTs3GxlUFU9BNLKGetEhCG5lwtfmCVWbWzD+FwBX8NtHEaew9u5R87O5EgMQb7If
 AjcLa27YAXY+cUG2V+OfGUN83J0yeFTHaoM7fxNRSaMfBV3aIfFGaUTdxrYMMipU64Xo
 Ryyw==
X-Gm-Message-State: APjAAAVNnJBXo5a6CwaCE2pt6SVeylfd5CzqQWA6v99rYt7OLgyojduQ
 zIaDVFr0Uu6iKRU7rXFtEBBSS8Qme+M=
X-Google-Smtp-Source: APXvYqwJ1V6yRlF36dql345ejkkNdlRd6kmdKB0SDjg1I7rttSefdRJbTBk4VU+XCFPIDMBq93rDJg==
X-Received: by 2002:a37:a04b:: with SMTP id j72mr18425124qke.277.1566178800008; 
 Sun, 18 Aug 2019 18:40:00 -0700 (PDT)
Received: from billcipher.cpe.telecentro.net.ar ([181.47.97.137])
 by smtp.gmail.com with ESMTPSA id p186sm6727270qkc.65.2019.08.18.18.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 18:39:58 -0700 (PDT)
From: jeronimo@borque.com.ar
To: alsa-devel@alsa-project.org
Date: Sun, 18 Aug 2019 22:35:38 -0300
Message-Id: <20190819013538.9493-1-jeronimo@borque.com.ar>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAHNnQdJMQes-3Goug-W0003M2fKn9wfbS173wAPCyVfedsj7Bg@mail.gmail.com>
References: <CAHNnQdJMQes-3Goug-W0003M2fKn9wfbS173wAPCyVfedsj7Bg@mail.gmail.com>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Jeronimo Borque <jeronimo@borque.com.ar>,
 Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH v3] ALSA: hda - Fixes inverted Conexant GPIO
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
index 14298ef45b21..968d3caab6ac 100644
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
+	codec_dbg(codec, "mask:%d enabled:%d gpio_led:%d\n",
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
