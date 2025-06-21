Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90527AEB8CF
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35736026F;
	Fri, 27 Jun 2025 15:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35736026F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030684;
	bh=ON7DH6xoSIFxZmkM6N6EvNOMSutTfTLjnZiqAp6jygs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UlgEFmWBuKEt79aSPCs5AJcEYGlEZ3iRVYcQ8JI403U2xaNGO3ExAbKGARoUyUvq8
	 g/UKlNNpPvn7dHc4F+XBNbarlVgQttX9khRPdMHUZbFDzT2v7MBiGdROxveQfRqIVZ
	 2ELiz2ueUuxaowPALqls5RNJ2QYXUYGEVhBXVNIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA238F80678; Fri, 27 Jun 2025 15:23:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80069F8065C;
	Fri, 27 Jun 2025 15:23:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 940F6F804FF; Sun, 22 Jun 2025 00:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6CA7F80087
	for <alsa-devel@alsa-project.org>; Sun, 22 Jun 2025 00:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6CA7F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RQGovyKS
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so19584235e9.1
        for <alsa-devel@alsa-project.org>;
 Sat, 21 Jun 2025 15:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750545133; x=1751149933;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAoxW/e+ggRYMDlt9WgSDd264vOhbbl8QTdPx9pQhnA=;
        b=RQGovyKSG5vq0NeOOhr9Hjy/idb8yMK3x9KK2NKCfb0SCO7/W/5u0A3NKPcqJICa0Q
         Ob3JHaPVvV/8wHbUhr4vHZGw+Uy3PUzbjejgH/J3k6A5CYuZyKVk/z/SwCcY1TSGlIsS
         B74AL/gljDp7IUsYlcjVa5HipZO514+oGeiBPOdtXmnwNXW4nXbM5H/rfbMLHY8+xvkr
         JXCfa6vsUEqk/v/QW7ZjEG1r5xOqnhgMxgUHbBXxd6zcRD72UAeJlL1DuWrdVy+FaRZN
         nOZsJA1uAQf03WM5aFO2tBTk9vN++OO3FHPtXxZrLZq+oWhzAyWkq7iyWxJUQNSBeKEZ
         +mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750545133; x=1751149933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAoxW/e+ggRYMDlt9WgSDd264vOhbbl8QTdPx9pQhnA=;
        b=rBlvd1z7FBykRQAd1PMRD/a2oa8MNkc9K6CrlEmlGSibH/dqQZbUbbaocKvaQbjaWG
         KhOLXqk5UyKgy6TVjCGWEvhK6H/U8tihlGWPdjN705n4wQhW+FOIEoorSgu+KmjiN3Zj
         GBk/37q4fysbC0fiSv9sAvwPQH2hHYv8c929AHbE9coH2F5HMIkPYwrtxwhmJlsY/rW/
         rqY7hJvlhtIkPj/rFppTeR8CJ+PLdDoHrI/3pM07iyNZrX18GqWSUlAiZSpMr0U4n9EY
         EHWojXPEewIw2gk27OceBGZhU//om7jih5ysw/WyJXyy4y7pvvKeGtjpuVhuoY28vmg+
         U6wg==
X-Gm-Message-State: AOJu0YxYr/qtswt5/F43RcSG/kF1RuAQ++WPIG3MfnSfLdw+woierVZC
	A1B449sA96vT2FvjxRJ2DYt2x2pPoFu8OaRxt1xVcKT/k93v+agHA/eT
X-Gm-Gg: ASbGncvRu96i4UZ0h2s6C8AvnvxMm14zNyFCCn2/yU7C0mpEqfeRCe3MiAn971i98vp
	UenvcL14Uzze/0Uy06o+PfewIm7YG7PEEg4hgia3hA1Bo7b5aihMi807w9C1MH3h4fseviWwUeo
	RfHmONjFpS3JwLF/DJ6po1+2CfRq4cF8JVJ1cVviVg0cSx0LaNNvLIhgH/ahZXrOSnnPY0ab6Ee
	3tYZCEuuZ0S3PIMIVFdQc8iJF5XoaWM1qY7LSlnZ/GWNt79Uk7mpuIdnT4aaIsLiOlTSA4OLRZ1
	i7QYnq3bDOnSCZTcyr2Vv+HY2XnpyTAEcq9z63103TpmsQDgscEqO9TfEvjWPKex88W3SK2B9X9
	xl06hq1WO2jNzLQfYyte3ibEhX2AHD23ZKlOmvmGPHC5tD5QfRs0wpcCGOUrjwh/wT9Xr
X-Google-Smtp-Source: 
 AGHT+IEyYiFS1aymjKhEFgjm3HvGDg7MoeLT4KRKQRjXrxRwA9Uc+FvhStlDTDFXtpW2mUn8PGLY7Q==
X-Received: by 2002:a05:600c:a30f:b0:453:691d:900 with SMTP id
 5b1f17b1804b1-453691d0bbemr38490845e9.2.1750545133311;
        Sat, 21 Jun 2025 15:32:13 -0700 (PDT)
Received: from Honeytree.fritz.box
 (p200300ff2f00f50106daab39821fba35.dip0.t-ipconnect.de.
 [2003:ff:2f00:f501:6da:ab39:821f:ba35])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d1189977sm5541206f8f.82.2025.06.21.15.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 15:32:12 -0700 (PDT)
From: Oliver Schramm <oliver.schramm97@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Oliver Schramm <oliver.schramm97@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15
Date: Sun, 22 Jun 2025 00:30:01 +0200
Message-ID: <20250621223000.11817-2-oliver.schramm97@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: oliver.schramm97@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TXOWGJRHS47HSQSX6AQZOGVTZTXUW7AV
X-Message-ID-Hash: TXOWGJRHS47HSQSX6AQZOGVTZTXUW7AV
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXOWGJRHS47HSQSX6AQZOGVTZTXUW7AV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's smaller brother has already received the patch to enable the microphone,
now add it too to the DMI quirk table.

Cc: stable@vger.kernel.org
Signed-off-by: Oliver Schramm <oliver.schramm97@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 98022e5fd428..c9e1b777b70e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -360,6 +360,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83J2"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83J3"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.49.0

