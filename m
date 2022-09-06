Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A67B5AE062
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 08:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F0A86E;
	Tue,  6 Sep 2022 08:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F0A86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662447470;
	bh=rTbgDLUW5svtouyF6ysylWeJyU1L5z6HZRF3rprV9do=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kP7zJK5c4xp6bsSt3cdWOCrsro1z3w525lFv94JxSoRtqv60INsG5U/8bC8DuR0z5
	 c8Si8CL/zvam4RId4tvq/JktuOxJCJngw9V4bLzFpxQ4sTapL7OEDTb/Vm5BnjTwwq
	 /O3NqoYz9hrCWQ9Y68Ny4ODVcrMTCYoe/S4qRVsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE831F80525;
	Tue,  6 Sep 2022 08:56:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77081F80165; Tue,  6 Sep 2022 04:49:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B50F80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 04:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B50F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eHWA0U6Y"
Received: by mail-pf1-x42a.google.com with SMTP id c198so162669pfc.13
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 19:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UNRvzJO8nAFZ62W1EZVe+NRgH05HLt0SmYnvhAPPALk=;
 b=eHWA0U6Y4SC4cXrKT9J5bz8O2M9yTHcjciiVc1ES7Gud9MRg1OpToHBVQAntM0cGy9
 JSEEG5g1XXpDeO3GyI4iuvl7xkO5TzToGkS6dVuXnYptMlyVZ3iTuJ64TgxkKDDvFRlc
 py5pmJnmay75im9wiJkOvoS1gROQmw9vn1Bac0beaUHgB7yX5MRXVH9K8ScN7LP+0RqQ
 3XEbfnehca8tsN7lCVW+CRNrKO4LBnqbpjpwu0JyPbv9sH54BDxF3Dbj3qmO7k1wBruI
 OQPkzmAl4Ig2ECqZQIHqTIxFew2H2/onAZHEByGyqDfe7WZW5mu5g9Wtc6Gajk0FDjAe
 OAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UNRvzJO8nAFZ62W1EZVe+NRgH05HLt0SmYnvhAPPALk=;
 b=PTYPgCYEvkEQVGB1svhHRIuiREBxe2UKi2+GtKoNsUuHOIIrPgDtKvMK7M/ghLkcmT
 OVHM6k7LGJfF7ybVASlLtXcMJ5rXBywLOX+1MN1arciRSuIW8fK2+V0xVuzMw/VG3Osn
 blfeO5JOnVlX5hN3HpC9VJGSWoFoEzcu08u02hCOz+3gl6TmlmprVpTpFGlENyanoJ8M
 gdtIhTTuEaU7/DerFQXUEWzvIs2vJFlfIk7Rmotv2NJGkH1821gSZs3ni663ggKwLNKx
 u096W86zkBibLr7nboFVnrsIRKUACzWNhfxXDs/cHS63nPGN6JkHi2CntCXABnME8cM6
 SE9w==
X-Gm-Message-State: ACgBeo1w0RKAqCzR39181yL8axaZ9BHdBz08YwDJrrmB46yHydcIzjnV
 ypGCfLNbrDadNVT7XDt5s3k=
X-Google-Smtp-Source: AA6agR4OaxJjCM3VlAXf9/6S+5hZzE090wdT3NvQb+ZSxSzdxuT1cPiLkdr8PbaGpXzu6wbngfZljw==
X-Received: by 2002:a63:5a63:0:b0:42f:e143:80d4 with SMTP id
 k35-20020a635a63000000b0042fe14380d4mr28216748pgm.456.1662432573729; 
 Mon, 05 Sep 2022 19:49:33 -0700 (PDT)
Received: from localhost ([111.206.214.45])
 by smtp.gmail.com with UTF8SMTPSA id
 b14-20020a1709027e0e00b00174f61a7d09sm8325483plm.247.2022.09.05.19.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 19:49:33 -0700 (PDT)
From: Dongxiang Ke <kdx.glider@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Fix an out-of-bounds bug in
 __snd_usb_parse_audio_interface()
Date: Tue,  6 Sep 2022 10:49:28 +0800
Message-Id: <20220906024928.10951-1-kdx.glider@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Sep 2022 08:56:18 +0200
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 Dongxiang Ke <kdx.glider@gmail.com>
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

There may be a bad USB audio device with a USB ID of (0x04fa, 0x4201) and
the number of it's interfaces less than 4, an out-of-bounds read bug occurs
when parsing the interface descriptor for this device.

Fix this by checking the number of interfaces.

Signed-off-by: Dongxiang Ke <kdx.glider@gmail.com>
---
 sound/usb/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index ceb93d798182..40ce8a1cb318 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1105,7 +1105,7 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 	 * Dallas DS4201 workaround: It presents 5 altsettings, but the last
 	 * one misses syncpipe, and does not produce any sound.
 	 */
-	if (chip->usb_id == USB_ID(0x04fa, 0x4201))
+	if (chip->usb_id == USB_ID(0x04fa, 0x4201) && num >= 4)
 		num = 4;
 
 	for (i = 0; i < num; i++) {
-- 
2.30.2

