Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5747B3F14
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6531487;
	Sat, 30 Sep 2023 10:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6531487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061625;
	bh=AXmMW7Y6bGmHY1Oe9K770TY/rmwJRuPRaC5jCxGXbyw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GTYdUfbfl1jSkqVzBA9FzKuaBi6G9mWREA7rKMA7HItST+LQzqFBkEhnlQse0fyeB
	 0V/EI+FqlJUeYUAF85Arpy7puWYsfWNLwSc90dfCnh2z75u+g3437txKSNCGmEH6YR
	 om5CtgfS6iKzbIXLoJblcZ8/ZmVTF7t5CM9JmSe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97378F805F6; Sat, 30 Sep 2023 10:09:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B51BF805C4;
	Sat, 30 Sep 2023 10:09:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D2CF801D5; Thu, 28 Sep 2023 00:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B39B0F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39B0F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Uu8ny0eX
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso62481675e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695853939; x=1696458739;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9WCpJ9NzeLVvWIWMoXZNdOxnnzDXic6RaiR8cReCog=;
        b=Uu8ny0eXPDjmvquveIfPRMk51w8VEUTgUychgbpBQJ/QeUDn2ARD3ye/xMFZwbJY3a
         tkLRhHvGflRxNH5l5y0/ubSgdqDL6yt+OYJmFce+NldCpI8MFjKMpZRooAy/WWmzKkq2
         usYQSJzK0759YonaW+rHRW6+pvQ406f6vGEmqudQ34Nyso9slmYZTOFmrkzQfgwjGZsD
         uxZRUTujCTzGe3GUNNe5yG4OzE95mom/o4OgtUXAO6HllNk4z0SVGMBfHyf2UkWp3PiU
         9H/3FUN8e9VkgxCkqF6B+mKoZY8V/t8eUub0+jPWr/YEvUTTPfku24vsA4vbWQ9fknDL
         oHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695853939; x=1696458739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9WCpJ9NzeLVvWIWMoXZNdOxnnzDXic6RaiR8cReCog=;
        b=JPLhRxLpwfJS1k2XVU9A0wG8YTHdZpJ79KdWlTN6ONN7e4f7TQkbSt5qvU4iBcSA/L
         jucgEeazmkhi60HyubDhFkm2vv6ZAb/zWcEdn9kYcz78T2sJRjlHFLY8uZYuE7ujAl3X
         nUWWyOjHUHLCXaYvGFvUDpD1B3DyUz9pgSto0FkY2Y4rBrydLj9oW3rQds2mmMLMn6uA
         wJtSML31NqJOyfd11aLmG9jXrtJQ7wR6qWFHTSe9u5Vl40Jb2tOFOk8iyrDO6wEPhUq7
         5picPC4Z6E1cW8dB+MRGITYBl+Mo9nxBgi3HZeytUlIhiIQoapeC+k6nCU5U1wXWajgz
         8HXQ==
X-Gm-Message-State: AOJu0YwBxF11zPzu+JquCAmz0PCuY3NynagdGAr+OQrPKJBEQGvlrU+A
	Xf0Ng7db9qd3sZ1JRDA9W/M=
X-Google-Smtp-Source: 
 AGHT+IFj90YtQ231dKDr0LEfgiMpXwVWVmPmdjVad5uEus1rDhNZDLL8aaM/ziz9du6rV9rqF69JKg==
X-Received: by 2002:a05:600c:1c13:b0:401:c717:ec6d with SMTP id
 j19-20020a05600c1c1300b00401c717ec6dmr5932985wms.15.1695853939206;
        Wed, 27 Sep 2023 15:32:19 -0700 (PDT)
Received: from yoga.fem.tu-ilmenau.de ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 o11-20020a5d4a8b000000b0031ffb51f6f9sm18019304wrq.30.2023.09.27.15.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:32:18 -0700 (PDT)
From: Sven Frotscher <sven.frotscher@gmail.com>
To: broonie@kernel.org
Cc: git@augustwikerfors.se,
	alsa-devel@alsa-project.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	regressions@lists.linux.dev,
	Sven Frotscher <sven.frotscher@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Date: Wed, 27 Sep 2023 23:48:02 +0200
Message-ID: <20230927215058.16220-2-sven.frotscher@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CBMJDE6T3NRVOPW7NH25Z2EKL4I752JT
X-Message-ID-Hash: CBMJDE6T3NRVOPW7NH25Z2EKL4I752JT
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:09:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
requires an entry in the quirk list to enable the internal microphone.
The latter two received similar fixes in commit 1263cc0f414d
("ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG").

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")
Cc: stable@vger.kernel.org
Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
---
v2->v3 changes:
* add message title of referenced commit to commit message
* make whitespace consistent with surrounding code
* use a patch-friendly e-mail client
---
v1->v2 changes:
* add Fixes and Cc tags to commit message
* remove redundant LKML link from commit message
* fix mangled diff
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 94e9eb8e73f2..15a864dcd7bd 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -241,6 +241,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.42.0

