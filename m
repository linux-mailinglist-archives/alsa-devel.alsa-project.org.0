Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32323B219
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 03:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491441669;
	Tue,  4 Aug 2020 03:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491441669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596503294;
	bh=C/XBcpyNF1E0MYQVld91RJC/TbxbhkuL7xJpImb3nmk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G11HuwbVPbDj7IkxdvPTwaVoKG97o/LTR9FcTU7tH5Llg5WvomYd52Nt0C0zo7UeM
	 KBTEOKjKlMRxFmLRHS4WIvQs/B071SkizPSYu1rhwAWp723aQQAY6l4vAlcpQRlPch
	 V7ZGIjaQmRK/Q+3RQWbnywXZj6yYi1uab5xkq0HM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64537F80234;
	Tue,  4 Aug 2020 03:06:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61735F80218; Tue,  4 Aug 2020 03:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42302F800BD
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 03:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42302F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="B7ADbOo1"
Received: by mail-pl1-x644.google.com with SMTP id bh1so8842270plb.12
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 18:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WyQib5JnCkO3G4kZ4dWWmODd+1EWwSzgsZOGifKj0nU=;
 b=B7ADbOo1bykP+Tgoc0b0qt8Qh+MArSa+ZQh1xPoTNa/KozOSlYw1+Ix3YAcuB+FyBo
 TGS5QIcLIwBB9anYpbsieX2yiZcGljt6DY+cUtnY/rsJrIeIeltzE+dTYl/L/UBXO2zT
 qEvvkHCD/hGjqeYcitZIpR0+7P7A782Cd4JNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WyQib5JnCkO3G4kZ4dWWmODd+1EWwSzgsZOGifKj0nU=;
 b=JYkkYOLeJt5oyMb2hAcOV1pxis0xdFUO19aOE1Su361STOokeNIARH2TG+zdwj9wbt
 LVkCp75fEHBXwXYBqUGeId61xAafRHqSlPB7i8tD/7LHYyAa9NZ55lTtL/z1Ix2xy1Tn
 RGXftNZAm2PGm0BCjN8OWBaN4wb2D6fiaQoMjKqmJOWXvrT2OSvxKj/qNTgXVDUsfr1f
 ZX87xsDxO2hS1CsiO2CqPj/QkZCrj3RTDchotDBRCnFF3aQwdPqp10z0F9QNZu6uKJGX
 NIyNxmQGKxLzNarTLLBfOP7UbNd51uCWPYwT0eooZkidx5SQNTw4/3PINeWSd6Rp8QQm
 czjg==
X-Gm-Message-State: AOAM531SVMfZoOX56Z5HptQPe5TcE8m6Vu6CJFwCFFDTkcoteq/OVh8c
 cGI07e8u92paLB7Thz/nWX771y9WLA==
X-Google-Smtp-Source: ABdhPJzbORyavoYlP6LqOtgRanHbqvBesGpev+QsipMKlIvizz3kUhearC5PFyWqwT3Hw0QvyidQXg==
X-Received: by 2002:a17:90a:c208:: with SMTP id
 e8mr1872108pjt.73.1596503181203; 
 Mon, 03 Aug 2020 18:06:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7220:84ff:fe09:2f18])
 by smtp.gmail.com with ESMTPSA id p127sm20422606pfb.17.2020.08.03.18.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 18:06:20 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] snd: usb: add startech usb audio dock name
Date: Mon,  3 Aug 2020 18:06:16 -0700
Message-Id: <20200804010616.3399256-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Oakley <andrew@adoakley.name>, Ard van Breemen <ard@kwaak.net>,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Alexander Tsoy <alexander@tsoy.me>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 Gregor Pintar <grpintar@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Dmitry Panchenko <dmitry@d-systems.ee>
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

The dock sold from startech (PID: ICUSBAUDIO7D) has no friendly name
and shows up currently as "USB Sound Device" in ALSA.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/usb/quirks-table.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 9092cc0aa8072..fef06836115c1 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3252,11 +3252,15 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 	}
 },
 
+/*
+ * The original product_name is "USB Sound Device", however this name
+ * is also used by the CM106 based cards, so make it unique.
+ */
+{
+	USB_DEVICE(0x0d8c, 0x0102),
+	QUIRK_RENAME_DEVICE(NULL, "ICUSBAUDIO7D")
+},
 {
-	/*
-	 * The original product_name is "USB Sound Device", however this name
-	 * is also used by the CM106 based cards, so make it unique.
-	 */
 	USB_DEVICE(0x0d8c, 0x0103),
 	QUIRK_RENAME_DEVICE(NULL, "Audio Advantage MicroII")
 },
-- 
2.28.0.163.g6104cc2f0b6-goog

