Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5021495E5
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 14:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F851689;
	Sat, 25 Jan 2020 14:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F851689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579958677;
	bh=u/nvzpPFj1++WwLWxy+z8uD1b+aloXR6dtvwBL3QkUk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R9xEgNBJxLR8EscK/KhiZaYIedxPA0Z4z/1w8HtprZiGyENpEOvEQEoRtwM+n3fFv
	 ASINxumj7BZHsoPGTeu9bRQQ/aRMu1F6TEzdXGlqyNnglY7zmWEHwJbVk4O/q3530u
	 X3GMC2WA/U4EpeWuuxXdR1B5D8uGmXsM4/lNYTwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F76F801F9;
	Sat, 25 Jan 2020 14:22:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5277F801EC; Sat, 25 Jan 2020 14:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AF6AF800BA
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 14:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF6AF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P2uuPajM"
Received: by mail-wr1-x444.google.com with SMTP id d16so5366945wre.10
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 05:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+v3EjwkxIpFHYP7as2D5uDbL38tR/iLAg6fqBxgy7z8=;
 b=P2uuPajM/PD2Od4vLhv6YWJ1yomZCUUrHGt20AVWxfC2oYHCVJD8b44/rdk4kIYG1u
 VwqcLFFwm17F3clX2N/4DeF2Pp+/xng0VwUdMJohlnfqssR+3uoPF53mTucy3RmmdFhX
 RAjFEkevWaKC/l8hE9jfLHwEhBK81i7ZjA6hzMeZXt14cz+665NtwBIbnr8hKwpIOZSB
 2b0D4Azjg/s8LWRpK1x8mnywhOPOAqMPRqxOZTPNMF1cfDtTfYG0SMVkNMs7sfb7Qx3U
 naHbu+ZmqqSweNsFDY3cAN4WxmhbsY44DAGyRN48vTmrvmPIYXUmOC94/n3cub2PJV6Q
 xS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+v3EjwkxIpFHYP7as2D5uDbL38tR/iLAg6fqBxgy7z8=;
 b=S8nwViALe0GxBvFQwr36n4b+C4Kwzn22F/MU8g0jmgS8KtUutDwAg0WLv0AtWYiiuo
 oXsGQKC4FS3jgJ6fVwuYlrVDyU5249UmIZCu2Rl+zpskU5MOoQVUf5oVDzmlkPy3AP96
 6iDXnN0aAt26NGiTo4JxQqYA9cSqHfvIaogYhUnuf6RiHHLBvt7LkIn4MOn+0ED9X3DF
 rUzaxhm7FTNmd39REvEet8HLXRVv6D9m5o6w1HIrZQB0qvXLMakzv0TNg34triNXXORP
 4CDBamvM2b0pg74rixcZvJwfXqGzxgegUX6a1tYlrkeBklfrRk+6Rl6iaIVCYxjiJyaI
 9+8w==
X-Gm-Message-State: APjAAAWCAyBj3Noe5Y0fmKcVnvyDfRikWOfEzL97NDGI5ZkSQ9p9SAEz
 jYhyF5mpnd9XYxjT6OvWhjTnMCte
X-Google-Smtp-Source: APXvYqx3IO2v19Kk2dLUehRpcVjHwneB0mjo4F5zCZI/1Y9FTeb8jda7rAlcr247F44Q+86o9pvXQg==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr10057740wrf.385.1579958567103; 
 Sat, 25 Jan 2020 05:22:47 -0800 (PST)
Received: from localhost.localdomain ([89.101.231.219])
 by smtp.gmail.com with ESMTPSA id g9sm11747603wro.67.2020.01.25.05.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 05:22:46 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sat, 25 Jan 2020 13:22:27 +0000
Message-Id: <20200125132226.31277-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Carlo Calica <carlo@calica.com>,
 Nicola Lunghi <nick83ola@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: add quirks for Line6 Helix fw
	2.82
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

Line6 Helix fw 2.82 still needs a quirk to set the audio rate to 48khz but
in respect to older firmware has changed the USB ID of the device.

Add it to the quirk list for line6 helix family of devices.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 sound/usb/format.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index d79db71305f6..e2b98f181d05 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -296,6 +296,7 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0E41, 0x4242): /* Line6 Helix Rack */
 	case USB_ID(0x0E41, 0x4244): /* Line6 Helix LT */
 	case USB_ID(0x0E41, 0x4246): /* Line6 HX-Stomp */
+	case USB_ID(0x0E41, 0x4248): /* Line6 Helix >= fw 2.82 */
 		/* supported rates: 48Khz */
 		kfree(fp->rate_table);
 		fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
