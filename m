Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EEE2521DA
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558D416C7;
	Tue, 25 Aug 2020 22:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558D416C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386822;
	bh=s/FhMw8fZS+NfmEuUM8T3cM8Gf8iDHbTYDhNAPMyAbI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXiV9ELYWe1gG9lLAyZJbO+vecFkyc8x94JBYjpaF5ON4OQ5ZbxZjGFcFs2iUupNr
	 O3OnASBVdroSxtUwL4Mx0bX9AUoYnFfy3OW0NxXvXgkXQkM6gQGYh8MBOQFyJ00UR3
	 0ooXeiG1qFisuLCUvK9HZ1suhaHJBDfCsn4oBHVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 421C0F8034F;
	Tue, 25 Aug 2020 22:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3479EF80328; Tue, 25 Aug 2020 22:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71F4CF80315
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71F4CF80315
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D+0/zxem"
Received: by mail-qk1-x743.google.com with SMTP id o64so6192474qkb.10
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ChaZ6nTOfS1bT+oUOP3MAm7zV3qo3G8NzOJnN+5Pbk=;
 b=D+0/zxemxo3Q1nuJ9+BA/yGCJgdp18sOmApPYRWiWAWNcWYrG1/TpkoNvchhrUEeJc
 UU2KYmnVK+tWybo7WNRZjn/pQSLgHOe9Of0XcCfe8nxWK8hWcTFBoB7dnbccu11g6wi3
 WYNBygX7RslYzlCqr4Y1gFxg3ezzArQaaF3pFQFAbuoSoCXa5aJQA+VE9F3Y0+JOoXSm
 uPh9fYKcHTFikvU3Wf1J2kluuL9noyMBHTDTa/putZAWT4OERdkrt8raM286+d+5aO/b
 i4QbuT2W9ehv2uWtFH9TjaBzh/t+G+Vk1Ko6YPO2kflHevfAJl4TNmwcIszCuWyHCaod
 TO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ChaZ6nTOfS1bT+oUOP3MAm7zV3qo3G8NzOJnN+5Pbk=;
 b=KERdhCOq2sQfWL88x8rHbZ86xNfx5BuSFbZpV2s8Gew0jSoHPmcv5zAiFdTLD4YjXH
 3vlh0fSkmUrpcGgmk6s4UwTQaYqLGxuN13gC81jHDRDDBCbxExUmmw+CaPUE+T6kBNT5
 tvCotmxMHlg51/pbKD54V0LJZtGH1lAsHJWgMaBkMVu7mmpmbtHNUU7+ISwuQMlJnxe1
 v8o/AXXgOC8xUyqFZ6ifNFIVvn3xeBqtFhlnZlUAWbQnEAYdTHmjbcdt7g/0JuQAg29t
 5GZpC7RvHDdgaGOXyU5EW7OJEVeGszxXCMS4yJsl0MuhnnHZnNO/mxUJRc1pvrjKobE7
 ZzMA==
X-Gm-Message-State: AOAM531PvSARPkvqd9y64RdBTQdU2OzfkQT5Hgj3WdOfSbzpvGow2yB5
 KTykJiXWYFg88wEDY4SIOB0=
X-Google-Smtp-Source: ABdhPJyjJnhptKpMtj2ytC2kmkr1cC8F9H6XkYVFQrC5Z0kC6fQtJnaHoBxx0QpjP3ZCxJcE4KUZBw==
X-Received: by 2002:a37:6516:: with SMTP id z22mr11135550qkb.164.1598386284822; 
 Tue, 25 Aug 2020 13:11:24 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:24 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 13/20] ALSA: hda/ca0132 - Add ca0132_mmio_init data for
 SoundBlaster AE-7.
Date: Tue, 25 Aug 2020 16:10:32 -0400
Message-Id: <20200825201040.30339-14-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Modify the AE-5 ca0132_mmio_init function to add AE-7 specific writes.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index bd5d4f0bd6f5..10aaa4806946 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8748,8 +8748,26 @@ static void ca0132_mmio_init_ae5(struct hda_codec *codec)
 	data = ca0113_mmio_init_data_ae5;
 	count = ARRAY_SIZE(ca0113_mmio_init_data_ae5);
 
-	for (i = 0; i < count; i++)
+	if (ca0132_quirk(spec) == QUIRK_AE7) {
+		writel(0x00000680, spec->mem_base + 0x1c);
+		writel(0x00880680, spec->mem_base + 0x1c);
+	}
+
+	for (i = 0; i < count; i++) {
+		/*
+		 * AE-7 shares all writes with the AE-5, except that it writes
+		 * a different value to 0x20c.
+		 */
+		if (i == 21 && ca0132_quirk(spec) == QUIRK_AE7) {
+			writel(0x00800001, spec->mem_base + addr[i]);
+			continue;
+		}
+
 		writel(data[i], spec->mem_base + addr[i]);
+	}
+
+	if (ca0132_quirk(spec) == QUIRK_AE5)
+		writel(0x00880680, spec->mem_base + 0x1c);
 }
 
 static void ca0132_mmio_init(struct hda_codec *codec)
-- 
2.20.1

