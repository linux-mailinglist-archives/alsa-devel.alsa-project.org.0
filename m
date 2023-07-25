Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E0760F4B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F69154D;
	Tue, 25 Jul 2023 11:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F69154D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277632;
	bh=ezHay7fmbHn7JzSwRgqksgU8fGQU4h9TGGWa5nUF7DI=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eVSNIF5D2KfPmeXfQpvf72ZFzpavOpwIx/L0OB64VyxV+kqRTkajPnEPMwVTGX/Fe
	 iUpi15sOPtk/Kb+8IrBZoKqR+mexi6CmJcwp7Mo1KgJiGHE61dN6itjYLf+b9M7uD1
	 LRPfy9BrPM6lCoYmvy+tPGlbQ1vOBl6OYA/JsMdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7061EF80563; Tue, 25 Jul 2023 11:31:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAAAEF80163;
	Tue, 25 Jul 2023 11:31:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB674F802E8; Tue, 25 Jul 2023 11:31:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B6C9F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B6C9F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=gKVuK2nl
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-c83284edf0eso5648693276.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 02:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690277459; x=1690882259;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ssxV/xV/7rnZbTq7Uh/n4BH2xb3hUa3L7svw7aUAE68=;
        b=gKVuK2nlksPa38HRLO5FLOJwkv+p2jDzABBqjaLRo11+385ve85cHu0isfOINzL55p
         +GYjh/J1Vq8biQMcPANQxKrboO4qnO6mb/du1CPgZjEA5U4Kr1Hojn7nPhQyXOwwpdjL
         1PqKDlPx75J+lguQnLtTYVCMk9we2LiacRUZOjcLJLiGVEMHTS8kJP99UOllQYXFcxEr
         xKP0ycY5AIpJj0U7NSPQhNOAvgS35hi8YtlQvnw78FAz/5xoqUnN3KOBAQ3pHJbE4dE/
         itWQIiIFAARTIxdCsBpiORWsN+zQt6N4QN0CZFLvtjA0Ro9rPxFf6hHFfj/KiLfXb4Z7
         +IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690277459; x=1690882259;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssxV/xV/7rnZbTq7Uh/n4BH2xb3hUa3L7svw7aUAE68=;
        b=ZyhCG67zz6yQcHtQzAd0bzZObAOaRg1xVMgRMWfkk+Rnhldl4M22u7HNWpDMySMCwp
         msKX5UtlwsCznJzq0ju9ew2thNHAmhplCz/QgQUaYRrpZSoUa9ByH6VJBcQHB8PxK1yZ
         RFm4NbGCRy8zE/vJzGy6i/gMKKssD05p4JkUNRKC8Dqk4md3mvOcSl3UVhbVVfVOT9x4
         x1slSdeDAdBTwsen1YxQbuVumTUtydxyQR0gzOa11VrORb3lJIKL08i7WD/RzXpv1E7a
         J6QfLHTZSBldbEBX/XvsfUc7hbo5WciZ40uY+kA8CmkjwYTzllDiI+Ur8a4sr5dUoZZC
         dVpQ==
X-Gm-Message-State: ABy/qLacaLAR+ATMq/avxvbo5Bi9JMH7Mf0VdZwk84Y/Pj7Thg1kA1lR
	QloGOvZmk5UuxH5vVkp7qz8W7Nm7zKba
X-Google-Smtp-Source: 
 APBJJlEtY7DCVNwWX8xJRKtlcbg4j6dgOj1Z0msKRQYwYC9hL8aVOpTkKFu9tvbdvQn3ETGRrVHG+i1LRuTURg==
X-Received: from lerobert.c.googlers.com
 ([fda3:e722:ac3:cc00:12:b22d:c0a8:2e6])
 (user=lerobert job=sendgmr) by 2002:a05:6902:1610:b0:d0c:77a8:1f6b with SMTP
 id bw16-20020a056902161000b00d0c77a81f6bmr48365ybb.10.1690277458611; Tue, 25
 Jul 2023 02:30:58 -0700 (PDT)
Date: Tue, 25 Jul 2023 09:30:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230725093005.3499455-1-lerobert@google.com>
Subject: [PATCH] ALSA: compress: add opus codec define
From: Robert Lee <lerobert@google.com>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Robert Lee <lerobert@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HGDLDIWGMNEQJRK4AUWDTFFSQGDDRDFS
X-Message-ID-Hash: HGDLDIWGMNEQJRK4AUWDTFFSQGDDRDFS
X-MailFrom: 
 3Upa_ZAgKCqkUNaXKNacPXXPUN.LXVJUbJ-MNeNUJUbJ-YaXSNLc.XaP@flex--lerobert.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGDLDIWGMNEQJRK4AUWDTFFSQGDDRDFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add to support decode Opus codec in Ogg container.

Signed-off-by: Robert Lee <lerobert@google.com>
---
 include/uapi/sound/compress_params.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bac5797bcb02 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -43,7 +43,8 @@
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
 #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
 #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
+#define SND_AUDIOCODEC_OPUS                  ((__u32) 0x00000011)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
-- 
2.41.0.487.g6d72f3e995-goog

