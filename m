Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3D65E7FB
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 10:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C6D0589E;
	Thu,  5 Jan 2023 10:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C6D0589E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672911493;
	bh=W605Ikt438qTQTS18Jo5VEY+2iBlMws5ZmRxygJhNxc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FczqHVJXqxrWDUX13OpOoNL5hmB+Ie1xLvHYyvaXxgnIm3KEDlLqkov8Vh4J0KIHT
	 +iTW0aNJ3tCsjQnzEyN9iuVI0mt8xToLE+eqQysftlelJbTQi8fpTqFOPAQizw2vYX
	 syJ1VrwhqaI9k+TaLA/F9ssVG1DptMPV6iMNuw9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FED8F8053A;
	Thu,  5 Jan 2023 10:37:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87458F80240; Wed,  4 Jan 2023 23:12:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBCB9F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 23:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBCB9F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Egcm8LR+
Received: by mail-wm1-x32c.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so1505456wml.0
 for <alsa-devel@alsa-project.org>; Wed, 04 Jan 2023 14:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qyxWpwZrLC0D/z1TOjudaUZ9Mh7byi3hhDukVq1HkVU=;
 b=Egcm8LR+wxVfNvHjtn0fZUQphH9szo/KzOeAEKN5vZ/g39b305WhxRlb0pHFFKPzVr
 UJFvVfPwsOLuwohy4yZ/WDy2xDbbCYOYD8czWjpBLcqoIi2wrJnGTqZDwp5auYZEe+K1
 DLMuDwIysgj74J7gb+D+0RRPrOeJgdKZxXMPAU+nMxNNLxdhVi6E/Ac1rXIGte9Azbe4
 pdw0yfHsS3FaDDfVyDab/JeMJBdf33ykmwc+dm01dei4LDCJH3uBnk8xpjUBsa9gxAeX
 0bwmsiwmIaxQJ0BTbCVDoaiqvlL/y9cjXET/FrPRLJKfEg1xs6lqvY4rt39plejEQEr2
 3aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qyxWpwZrLC0D/z1TOjudaUZ9Mh7byi3hhDukVq1HkVU=;
 b=S7ZJWnO7Ny2tmZKOdO0S9W1NcnyuSIxSCPi6i6OS2FDi2JyXYZZ+x94JMUJPMjz9Sy
 fkk6jBTRYNT2e6YHUz1ZORVgmFBUXb88TRYb8KjxG9Atpr7XfQOAM9fL68jD3OPf/4El
 +ygQR9bhEez0QWyUz4MfNyBBN2Il72YPxOQz4f8ZUexGB06ZPbiwxhLb2Dw+hjZkIUnZ
 FdPd7wqa3BISyATC4CN6PA6Dlq2YyehS8SuJxsUCUFnnkS1XWWKk7qEiIEGDWt5W1UkQ
 zpjbsN+XxApziZnDPBX2Az2CAnckl2OO65F17o1HPTGZ5/SqIN2p717oVxhP3sB9Id6g
 sCSA==
X-Gm-Message-State: AFqh2krkTI8BfWHD40TwqAb9dnH0D0gnKHsszbL49PGtvkoQO1qZUyju
 vCk521xomnd4q9jg6ZZ+TcQ=
X-Google-Smtp-Source: AMrXdXvVRHX6G5nROCXAc/gfZf1AAG7SnrFtp2cDaVixa07sqCFDBUnOm6sL2JLBRzHIv+N19hTwZQ==
X-Received: by 2002:a05:600c:a10:b0:3d2:2904:dfe9 with SMTP id
 z16-20020a05600c0a1000b003d22904dfe9mr38999565wmp.21.1672870369472; 
 Wed, 04 Jan 2023 14:12:49 -0800 (PST)
Received: from arch-laptop.. (host31-53-119-24.range31-53.btcentralplus.com.
 [31.53.119.24]) by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003d99da8d30asm57164wmh.46.2023.01.04.14.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 14:12:48 -0800 (PST)
From: Ben Carter <craterrender@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Divya Prakash <divya1.prakash@intel.com>,
 Ben Carter <craterrender@gmail.com>
Subject: [PATCH] sound: hda: increase timeouts to stop crash on resume with
 ALC3204 and others
Date: Wed,  4 Jan 2023 22:10:24 +0000
Message-Id: <20230104221024.23524-1-craterrender@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Jan 2023 10:37:01 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Upon waking after system suspend, ALSA often crashed with:
  snd_hda_intel 0000:00:1f.3: CORB reset timeout#2, CORBRP = 65535
  snd_hda_codec_hdmi hdaudioC1D2: Unable to sync register 0x2f8100. -5
  snd_hda_codec_realtek hdaudioC1D0: Unable to sync register 0x2b8000. -5
A temporary fix was established by reloading snd_hda_intel, but increasing
the rather strict timeout of 1ms to 100ms has remedied the issue on my
device. Although this is a much larger delay, most hardware took less than
1ms anyway and it's preferable to the whole audio system crashing.

Signed-off-by: Ben Carter <craterrender@gmail.com>
---
 sound/hda/hdac_controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 3c7af6558249..1ab573248452 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -16,7 +16,7 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
 {
 	int timeout;
 
-	for (timeout = 1000; timeout > 0; timeout--) {
+	for (timeout = 100000; timeout > 0; timeout--) {
 		if (snd_hdac_chip_readw(bus, CORBRP) & AZX_CORBRP_RST)
 			break;
 		udelay(1);
@@ -26,7 +26,7 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
 			snd_hdac_chip_readw(bus, CORBRP));
 
 	snd_hdac_chip_writew(bus, CORBRP, 0);
-	for (timeout = 1000; timeout > 0; timeout--) {
+	for (timeout = 100000; timeout > 0; timeout--) {
 		if (snd_hdac_chip_readw(bus, CORBRP) == 0)
 			break;
 		udelay(1);
-- 
2.39.0

