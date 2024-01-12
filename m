Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690882EB81
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 10:29:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51885B6A;
	Tue, 16 Jan 2024 10:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51885B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705397398;
	bh=04JEsDQW22lesAIYo1rAEFAQ9ikIudaQarvbUYchVRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vCKvc7ssmC+HLiE3YcO3m8zgEcYIOz8L9531EiKP23EuOYSZlpGbZvsEyuzt5g3RB
	 Io8wKhiGRifvOOMBlUxmvC+z4CH/fyOCDiUmBjbSnS3sxraDyx/FwO0M5vw6FGyaRW
	 xiwbCxUNXr+Cteh8VuIWFiWmSRX/lBxzrDw01CIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4617BF80604; Tue, 16 Jan 2024 10:28:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91EB2F805F5;
	Tue, 16 Jan 2024 10:28:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF43AF80254; Fri, 12 Jan 2024 19:24:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3358F80086
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 19:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3358F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aExV/T1n
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e62e6e3b0so15097905e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705083855; x=1705688655;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTWj3rihL8bSDfLhEga4c9xLiiLPW6jDT6R2juZX/CY=;
        b=aExV/T1nX5c810+TToDS5Mopn1kVpN9tz4ZjJt0sJVtKM+adYjwoU1Wcq7ympDSsWu
         jms1SnakvuT5XJAlwoIL8NC200NKdE7NPzI+SJ2tlo+a86CWf5J8IDbbgiNMUerMr+X2
         xVjhczzyf6UEPAauF94xjRFIUtGFgz/UXFkDfty35Ktwefuu4xaRefGxYfP0y855e+oq
         Ly216hWdo6t9H9BvCxDkdNVNxmunpMSWA94oFk9rrpr1Zai3eDAr0WUsGwwnx6iQfQ5f
         LNWQI1n11cNl9VVSeTmd+cq+uIkEigOFxXOlk+LZ6cOZ+CYZ90vCazrnfo+zweRtK4ap
         H16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705083855; x=1705688655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTWj3rihL8bSDfLhEga4c9xLiiLPW6jDT6R2juZX/CY=;
        b=m10nUpjdh1CC3roKvFoR3W0/tKLTCykB1JuVZJyZpb9yNVBV5gRtO6W5Gq/pcSIt3L
         RnaFu4tUK0jJco49EVeXH8kuGjaDlK+o9GXys2fzO8DIHMcYmVAFYvVc/Zu8IEjeq8pU
         ffDU8hj7GnOU9MW0pivOxhdYDF4EzSbqHs7fPnBXB7ZwCLhvWic0g7KnJ2fZ8c4DRLCK
         F1G43GZaQjVu6byrB6xjXi74daslcUAqS/LUFJTMv9g+y91+/VO4i1Bix/zk7lfzqmxm
         NjZzNK52riHvzQ6KetRcETIRthkAdfVD8eyEXsnO9x2vwJNajgHQXJtwMkz+Si730AKP
         2WLQ==
X-Gm-Message-State: AOJu0YyKVH/WygMLIhrYeugoTzywlXVRVQrhu5CW29LO9c5pC7tTYi9p
	d6SrLZT4E2dK7IfmofRoDPA=
X-Google-Smtp-Source: 
 AGHT+IG7YWD6hzcwCjnkvQXzbiGmgtZPEtPzRB21len23MAiK4rXbujptBECL5ruziLhYjMSAtv0ig==
X-Received: by 2002:a05:600c:4286:b0:40e:68da:dd2d with SMTP id
 v6-20020a05600c428600b0040e68dadd2dmr285867wmc.17.1705083854527;
        Fri, 12 Jan 2024 10:24:14 -0800 (PST)
Received: from kenzo-linux-laptop.bicolor-pike.ts.net
 (154.red-88-26-51.staticip.rima-tde.net. [88.26.51.154])
        by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b0040d91912f2csm6694521wmq.1.2024.01.12.10.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 10:24:14 -0800 (PST)
From: Kenzo Gomez <kenzo.sgomez@gmail.com>
To: sbinding@opensource.cirrus.com
Cc: Kenzo Gomez <kenzo.sgomez@gmail.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda: cs35l41: Support additional ASUS Zenbook
 UX3402VA
Date: Fri, 12 Jan 2024 19:20:34 +0100
Message-ID: <20240112182113.70650-1-kenzo.sgomez@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112163239.59743-1-kenzo.sgomez@gmail.com>
References: <20240112163239.59743-1-kenzo.sgomez@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kenzo.sgomez@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TWKIMN4JX5CEL3GLUV7SNZEZWTWIRW3T
X-Message-ID-Hash: TWKIMN4JX5CEL3GLUV7SNZEZWTWIRW3T
X-Mailman-Approved-At: Tue, 16 Jan 2024 09:26:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWKIMN4JX5CEL3GLUV7SNZEZWTWIRW3T/>
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
index c1afb721b4c6..9ec5773e580e 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -54,6 +54,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431533", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431573", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431663", SPI, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 1000, 4500, 24 },
+	{ "104316A3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "104316D3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "104316F3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "104317F3", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -358,6 +359,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431533", generic_dsd_config },
 	{ "CSC3551", "10431573", generic_dsd_config },
 	{ "CSC3551", "10431663", generic_dsd_config },
+	{ "CSC3551", "104316A3", generic_dsd_config },
 	{ "CSC3551", "104316D3", generic_dsd_config },
 	{ "CSC3551", "104316F3", generic_dsd_config },
 	{ "CSC3551", "104317F3", generic_dsd_config },
-- 
2.43.0

