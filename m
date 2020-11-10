Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDCF2AD386
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 11:21:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 925F6174A;
	Tue, 10 Nov 2020 11:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 925F6174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605003699;
	bh=Gu2fdUE4Tlb8JVWoNHG3J9CyQRK6Q2hY/1go2QG+N2M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NaksDjVh9kRtZ7y+uTVpBdIX67WIbmxX/ZxedVyuPo6cqyaVQPYGpeI1COoXJ3MIa
	 imNYhG2SyEili96XS9glQgT/BBpN4DplXj0Da3ItXlI9NrkzpdRElNxnaHqCg4YDpF
	 wqEroZFKE774XOuFOXreKeG3rSiie0xjjXNx6ags=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C121F8051D;
	Tue, 10 Nov 2020 11:15:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A48F801D5; Tue, 10 Nov 2020 07:18:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB852F80059
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 07:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB852F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SbXU6V+1"
Received: by mail-pg1-x544.google.com with SMTP id i26so9271728pgl.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ccUarTYp6bUjAfShVkr+xLVHhptW5cuMEyNTixMpJuY=;
 b=SbXU6V+16z1iwH4UtdwUHiRG/7uWh5yyAbymm3bCo7PQ2IdiomfpnwueWB1+QwT1li
 ZbDFISb/BiPX+J/2JpSJ78KtlhwdyOapfpUOpjAdJ5m1eTyKZKU+Kpm3me3KJr51RAp+
 JIMm9fJE+oCIcD2uoCvcdT+S7F0Cc2I+xxkKr8YGpIDIHbrQ7141rJZEYO4CZgTSBbhK
 NA823OjWgwKQSgU3xnU3jc7vd89AxYPBQTwdzzlY0NS9xAgPe8wBKVs8SCxsFaz/Nk/w
 ihHiwRbtHb/UiUIH5LYVd0VmYLSG57GfvAyWTttq6g2crkjL6wT+l+g4tZwSsBFGs31F
 20hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ccUarTYp6bUjAfShVkr+xLVHhptW5cuMEyNTixMpJuY=;
 b=T6L3in/wj9EbYREmmlAOlvum9CBldmkGl/3cJfFuFnMP2kL5wHVUY9adLf9wcY81HD
 /HvbZvD5vGxOkclxjtux8qvD5owlKZnG07h4lO9jRCYKxn6scq1/saMm9c/Q8Cg5wysW
 SCbUOfXNXS68BivgVEcqsz0GEaPvJvBcUTp9D2nJcYDN30L20D31W6YcfgU2M1pN/FII
 NiUxkENW2DeRy6gQ1I3RLYxEAPQ9/RAKQTTJb/wSl3HgMI30cIR/4URNLHZkdHLXd8Dq
 BS7ByX8/zGjJIzudSH+QSakVx6hGyJkwSVPPO1aGGVzZGWQVf8dYNeCWTFkIyL5nbvkK
 LOKw==
X-Gm-Message-State: AOAM532B8l0+7kNYFlc7ciuFiBFu086s1msqc9Jd2lufT6pwGhK8vLzf
 PjE4ITUQgvY4BBXpe5Cb7KM=
X-Google-Smtp-Source: ABdhPJyEGK0PaB/3/W8nZHe1MfN+X3vhEkH+DUfJMHVEGBW7QiQZHtb8W5P9wSS7U6r+f+sdjFNrYQ==
X-Received: by 2002:a17:90a:ec04:: with SMTP id
 l4mr3352700pjy.131.1604989084764; 
 Mon, 09 Nov 2020 22:18:04 -0800 (PST)
Received: from dmans-PC.localdomain (122-151-241-1.sta.wbroadband.net.au.
 [122.151.241.1]) by smtp.googlemail.com with ESMTPSA id
 w63sm13273224pfc.120.2020.11.09.22.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 22:18:04 -0800 (PST)
From: Daniel <dmanlfc@gmail.com>
To: 
Subject: [PATCH] ALSA: usb-audio : Add support for the Pioneer DJ DDJ-RR
 controller.
Date: Tue, 10 Nov 2020 16:17:40 +1000
Message-Id: <20201110061742.78033-1-dmanlfc@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:14:56 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 dmanlfc@gmail.com, Gregor Pintar <grpintar@gmail.com>,
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

---
 sound/usb/quirks-table.h | 56 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 3c1697f6b60c..a39233cb4d72 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3530,7 +3530,61 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
-
+{
+	/*
+	 * PIONEER DJ DDJ-RR
+     * PCM is 6 channels out & 4 channels in @ 44.1 fixed
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x000d),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]) {
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 6, //Master, Headphones & Booth
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4, //2x RCA inputs (CH1 & CH2)
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						 USB_ENDPOINT_SYNC_ASYNC|
+						 USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
 {
 	/*
 	 * Pioneer DJ DJM-900NXS2
-- 
2.29.2

