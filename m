Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C784B19C
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 10:52:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30671844;
	Tue,  6 Feb 2024 10:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30671844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213125;
	bh=P5inWfry6T1Czl6TsnTuVIoqd+ZhftxFosxgazH4yR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YY8TLYuCqUIjocxjWJlLyhKk8gm/2r8BmC8W1qPmxf2e5Pv5U8fn2PLWQARrcLb7t
	 aGPjLCxZZredew8iS7JpBz0HsfVAcj0XR1tl1VrUG4MY+z46gTYZ84HD77YYrAACSO
	 qf314n2bm74QHbJ/meL1fk0tnKMJ3Ulbm5Pqbwe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01949F80578; Tue,  6 Feb 2024 10:51:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 322D4F80578;
	Tue,  6 Feb 2024 10:51:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 772F1F8028D; Sat, 27 Jan 2024 17:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56572F800C1
	for <alsa-devel@alsa-project.org>; Sat, 27 Jan 2024 17:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56572F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TYCqvlW8
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e76109cdeso25972285e9.0
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jan 2024 08:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706374058; x=1706978858;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq5nWV4gc+boSoV96VgLy7nj/n+DgQjkGxXgMwyJKWg=;
        b=TYCqvlW8wk2mh+gGqHVhXxQ+0HzZSPK03gbXV1QVsVQi5JwQQ+U7Frb/R8cgFFAotK
         PhikFiZPAsr8FFXK+/9BTE0HPqXpS8aX2QD5SJV47lVzjlmEbX7IpplSoRGbakFvzmvZ
         7JIoikkY5U1w5u4j/xpvgyf8SCYdYcz96bUBKrGrb/8WZoIWB+/VkFmcJquU5n81EQRB
         4FTj8nfg4ttnqaNhAwXdbIk17sXLONyuVg4CB2WtggmcEFQ+SyLJ3GyTsu88ABtYERBm
         aPndUurOTBZmSrKfwKGLxcqAPWqIfMALEOWHwmQmbZZZnOTElDfEUquGCzv4pnQTqSG3
         gpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706374058; x=1706978858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq5nWV4gc+boSoV96VgLy7nj/n+DgQjkGxXgMwyJKWg=;
        b=LCY68gKWkiajMOEfZi4fD01jPDq7v8sJLCpF1MwQMwyX9haeH71R31jBsch+OkLkJT
         fJXQVPGGFGYZLqdDsCchcqtDrIonelT9chPRx6yOZFiWzHWXfZZwHLi3h+I8o0y2vkl0
         m1sGDSavuIaXFKKSweqYmRNPVWXuxH296S9hzFOYzqOjVLdWf2ytiujbl1ZNpg6gFdt0
         qK2DfNVzKn3orjDjEc1juDMdv5srXqzBOBjOwzAPQQVc6eczHCG3z3CrQ0A4ICKk3WgR
         kDfgFxaoaVYjqqmbPRZZpqSFREsgKVbzcLuFXReoBbjEKdi4Xcl5h1mkN5AFU+AQgzRy
         co3A==
X-Gm-Message-State: AOJu0YyUG4bT82XFw4JJMdGgGW/DsBM9bTUeEzDiGHtDpCnHPr9yLLp4
	/W5Koq937pC14ZHUj4Fd+r+W9feM9kJqDFs8KiJuAXKgKY8OjAHU
X-Google-Smtp-Source: 
 AGHT+IG4fFkwwlanBWpqJW1F0dTLbqKbMH0i4rK9ABL48tuKQ/mudc3Aug7IIsmMoMMeS0psJTUOlQ==
X-Received: by 2002:a05:600c:4ec8:b0:40e:ace6:4fc2 with SMTP id
 g8-20020a05600c4ec800b0040eace64fc2mr1439967wmq.24.1706374058012;
        Sat, 27 Jan 2024 08:47:38 -0800 (PST)
Received: from kenzo-linux-laptop.bicolor-pike.ts.net
 (154.red-88-26-51.staticip.rima-tde.net. [88.26.51.154])
        by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b0040eee435571sm1895013wmq.45.2024.01.27.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:47:37 -0800 (PST)
From: Kenzo Gomez <kenzo.sgomez@gmail.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	kenzo.sgomez@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	tiwai@suse.com
Subject: [PATCH v3] ALSA: hda: cs35l41: Support additional ASUS Zenbook
 UX3402VA
Date: Sat, 27 Jan 2024 17:46:21 +0100
Message-ID: <20240127164621.26431-1-kenzo.sgomez@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <874jfdwsfg.wl-tiwai@suse.de>
References: <874jfdwsfg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kenzo.sgomez@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OSTFULLHZKW2XE7CWZUSP7Y4JIV6XGDF
X-Message-ID-Hash: OSTFULLHZKW2XE7CWZUSP7Y4JIV6XGDF
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:51:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSTFULLHZKW2XE7CWZUSP7Y4JIV6XGDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new model entry into configuration table.

Signed-off-by: Kenzo Gomez <kenzo.sgomez@gmail.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 35277ce890a4..59504852adc6 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -76,6 +76,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431533", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431573", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431663", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 1000, 4500, 24 },
+	{ "104316A3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "104316D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "104316F3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "104317F3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -410,6 +411,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431533", generic_dsd_config },
 	{ "CSC3551", "10431573", generic_dsd_config },
 	{ "CSC3551", "10431663", generic_dsd_config },
+	{ "CSC3551", "104316A3", generic_dsd_config },
 	{ "CSC3551", "104316D3", generic_dsd_config },
 	{ "CSC3551", "104316F3", generic_dsd_config },
 	{ "CSC3551", "104317F3", generic_dsd_config },
-- 
2.43.0

