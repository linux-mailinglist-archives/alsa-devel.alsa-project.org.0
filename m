Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE0F977E36
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3571E9D;
	Fri, 13 Sep 2024 13:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3571E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225847;
	bh=ZEvUEorOsia9rQcPYFPa22tCoLVCyg1slnig8NMKf50=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Op/dDFRXDlsS6bvCn7zG/7jUTMtLZo3PK0A8KeeIkIQBHDSu6WL7eUGyYvypOwAoF
	 11Zl8RT7SPGOqtsRVQY+CHjLl0r11HsmmrEIPRqRp6XGgN0ujdW1WG9JeFHbpSAz9k
	 6oG49q6OogrXNYk+O49M++JHgqIdftCegAp+7rw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5600F8060F; Fri, 13 Sep 2024 13:09:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CCAF8060F;
	Fri, 13 Sep 2024 13:09:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F52FF8016C; Fri,  6 Sep 2024 23:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 653ACF800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 23:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 653ACF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DsrHTyuA
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-49bcbf7bdb9so701679137.2
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Sep 2024 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725657297; x=1726262097;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9aVK4sfy3gpXBpKGUO42369WUFZ09m2WcyDCsX/ac=;
        b=DsrHTyuA2JYS2ZOkneD9bJtdgjrmyorsHl4yv/44bcXPr+uFStnl5Cnh9VTIWcOByd
         B5PE+1WfCcMYvoAHJhscD8N3WwYfD4qcwZXupMbza6ziFQFn+Eg0l44B6+ZBzcFptQUr
         e4E/YPdn3obdJX64oMSXXhRrgtxAbhcJ/WusA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725657297; x=1726262097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs9aVK4sfy3gpXBpKGUO42369WUFZ09m2WcyDCsX/ac=;
        b=XexLLwXMezpBrGTfQvk0Ia2X341VsaGpw2CFi7vM5lidZIVIsxTYqcerESS5jHPT4A
         ZDQkCJRarkkXxgLCPH/xjQqlYZ4p21bBJp8LmmZoznfI0SqZV6fXHBFG6XRl9BtJYNFy
         g/rlZAmRwAtrstAcaA5iYDxJds5mi16OVTgqi7MqooZC7DxcCa0f3fuM6EBz87tFx3e4
         fQ2ViiRJpDueW8JhawhZOwjD+QoybS0i4LgX92WRjecY9mQHeEKXbPvCJpc5PJVfMj76
         bpUMl8CJLFwLvNvF3RcOClCrgtFz4E2YxdoYXK1XSR4JfdJiEi6WDUUWvYPhXMM9NOtc
         XgEw==
X-Gm-Message-State: AOJu0Yxjh2e4NWSOTEDQ4CB9IOKhfZqgK9OmFTv26x2HYJeq7udlcN+b
	SLXtW2QFwNGSMK8sRzUVrLjCbEpSgvqnwvoNzYjXf/hVWtmP3kQcwoQnhlZsm3vFkoyWUaQiX0Y
	=
X-Google-Smtp-Source: 
 AGHT+IGu1gSdn+TAhuXyZYC0Jo1w5AWPPH8ZYSvd0b/4lADstyEw4lDaVQ72agnawfprbU0iJrsTYg==
X-Received: by 2002:a05:6102:38d0:b0:48f:dfb3:f26a with SMTP id
 ada2fe7eead31-49bde1c74f5mr4625071137.15.1725657296870;
        Fri, 06 Sep 2024 14:14:56 -0700 (PDT)
Received: from localhost (112.49.199.35.bc.googleusercontent.com.
 [35.199.49.112])
        by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7a99dc0f8b0sm63299985a.23.2024.09.06.14.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 14:14:56 -0700 (PDT)
From: Joshua Pius <joshuapius@chromium.org>
X-Google-Original-From: Joshua Pius <joshuapius@google.com>
To: alsa-devel@alsa-project.org
Cc: Joshua Pius <joshuapius@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Steven 'Steve' Kendall" <skend@chromium.org>,
	Karol Kosik <k.kosik@outlook.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add logitech Audio profile quirk
Date: Fri,  6 Sep 2024 21:14:38 +0000
Message-ID: <20240906211445.3924724-1-joshuapius@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joshuapius@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MQ3MOFZRXQKNYKZI37VKSGAIOFXLN4XS
X-Message-ID-Hash: MQ3MOFZRXQKNYKZI37VKSGAIOFXLN4XS
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:09:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQ3MOFZRXQKNYKZI37VKSGAIOFXLN4XS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Specify shortnames for the following Logitech Devices: Rally bar, Rally
bar mini, Tap, MeetUp and Huddle.

Signed-off-by: Joshua Pius <joshuapius@google.com>
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

