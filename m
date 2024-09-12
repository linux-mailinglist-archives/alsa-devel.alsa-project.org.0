Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20076977E60
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844B41629;
	Fri, 13 Sep 2024 13:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844B41629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226241;
	bh=NKleTICc0uMNXV+uSqzUKeNAhOpKOaLVEKAQqBNY/Ho=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D9702H8nCx+7R/xsLbziZuywWWiwhlNQRducwJNsSxLkBDgkIf8lfUEAA1Gtb+4xo
	 Uz5TOaTfEKUgDT3bgUc9FQODUj1N9ck2STSQ1yvhjojuZ0Ucq7zpa8qq3pOVxPOADH
	 hDlFwcN/6sEtZ2J9YHzSckOsLnfoeWuVLXBGt+oQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39CD5F80689; Fri, 13 Sep 2024 13:13:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96958F80C1B;
	Fri, 13 Sep 2024 13:13:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6383F801F5; Thu, 12 Sep 2024 17:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D946F80074
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 17:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D946F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dOeV19rD
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6c3551ce5c9so18731076d6.0
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Sep 2024 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726154801; x=1726759601;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7mKFNRTjjADvwf1aB253Jo1v/0MMVkR0nsmT+lRjwc=;
        b=dOeV19rDrnmPWVUCQRytZDYppeLPf04bMkr2ttamGr2LqbRtNmJk1EMVEOI0FHBMI4
         YGw2fO8yOSrgkF8g3L+9kSPO6g9QXAHAIe6cSY+7OUAJxdDjWV/qhgQ1VQNmqi0UVG2D
         RaejKsKbV6JtP0sgfxNPQpkXFkXTXyJ+e6JRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726154801; x=1726759601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7mKFNRTjjADvwf1aB253Jo1v/0MMVkR0nsmT+lRjwc=;
        b=HfTeF1nkxo+RLTLhuJCMgECjlFEuZDg/3B5DvfkaAfZN9SjM2/4Z1viD1ThSmj3lVD
         f9lDjHcnohB3qKzJG6UvIvcq/3fnVQ+8V/ZdrB5wACEwa9GvfOcCmpc+4XjyU+9UBIvL
         ROQ7RX8U5F7/fTRv1zNrYeHwNTPI14fCFxqODPaZjcuraXey/18IZ/+sMaZsAnsatZfc
         wKZXVejrWqzXMECjPIbsbZOjAMrHKLnYKC/wPlqTEOBSWLyF1iONyYOZPIkR7U9EsXkD
         XYKQQur35ze7oPSDOjnOIGjrWHuXc3wmlYiymvqJTxsQVNAshvmnUqPQc6zoxcK/rXED
         Lpcw==
X-Gm-Message-State: AOJu0YwYsiAJl7KCdZ7u44VhCBAky1qoH/R8pRgyhwm6k+5tPsNTm2AM
	5pThPBVkXZrLPXFrB4XHlmR2YB46lEo5qlhURtk1BZOAaK4l2c4LgwjuR47Wh82T9Z3A59NbPEI
	=
X-Google-Smtp-Source: 
 AGHT+IGchvvlGNJOgyNzd+nGz4P624xph6cEj7rU2+N8kSWMwUA5os9jZO8OZ32oNgHPjsbZb/wcFw==
X-Received: by 2002:a05:6214:5d05:b0:6c5:50c1:befc with SMTP id
 6a1803df08f44-6c573b21fd7mr45928266d6.20.1726154800674;
        Thu, 12 Sep 2024 08:26:40 -0700 (PDT)
Received: from localhost (112.49.199.35.bc.googleusercontent.com.
 [35.199.49.112])
        by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6c53474d749sm55476786d6.92.2024.09.12.08.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 08:26:39 -0700 (PDT)
From: Joshua Pius <joshuapius@chromium.org>
X-Google-Original-From: Joshua Pius <joshuapius@google.com>
To: alsa-devel@alsa-project.org
Cc: Joshua Pius <joshuapius@google.com>,
	Joshua Pius <joshuapius@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Karol Kosik <k.kosik@outlook.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
Date: Thu, 12 Sep 2024 15:26:28 +0000
Message-ID: <20240912152635.1859737-1-joshuapius@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joshuapius@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6TZH4RBKQXJH35JAY5CEQRQDOKIQ2WXI
X-Message-ID-Hash: 6TZH4RBKQXJH35JAY5CEQRQDOKIQ2WXI
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:13:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TZH4RBKQXJH35JAY5CEQRQDOKIQ2WXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Specify shortnames for the following Logitech Devices: Rally bar, Rally
bar mini, Tap, MeetUp and Huddle.

Signed-off-by: Joshua Pius <joshuapius@chromium.org>
---
 sound/usb/card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 778de9244f1e..9c411b82a218 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -384,6 +384,12 @@ static const struct usb_audio_device_name usb_audio_names[] = {
 	/* Creative/Toshiba Multimedia Center SB-0500 */
 	DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
 
+	/* Logitech Audio Devices */
+	DEVICE_NAME(0x046d, 0x0867, "Logitech, Inc.", "Logi-MeetUp"),
+	DEVICE_NAME(0x046d, 0x0874, "Logitech, Inc.", "Logi-Tap-Audio"),
+	DEVICE_NAME(0x046d, 0x087c, "Logitech, Inc.", "Logi-Huddle"),
+	DEVICE_NAME(0x046d, 0x0898, "Logitech, Inc.", "Logi-RB-Audio"),
+	DEVICE_NAME(0x046d, 0x08d2, "Logitech, Inc.", "Logi-RBM-Audio"),
 	DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"),
 
 	DEVICE_NAME(0x05e1, 0x0408, "Syntek", "STK1160"),
-- 
2.46.0.598.g6f2099f65c-goog

