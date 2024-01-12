Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFC82EB80
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 10:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117CB203;
	Tue, 16 Jan 2024 10:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117CB203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705397371;
	bh=pH7EFpO4Hsr8Z989lCT3NDlGF3y5dW2FMDPt7uruCZ8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RiJQmH89hb6mUpLev/LLSg/40icRLr4d9BKdtExlUOFWCH6KdfKQFdJBqzINCjyUo
	 N8iPUCTJcvZcc/TuIT8wvztdMqi+uV/2qe/kOEX1DexJ2jdZI9601/jwugRxoGyH+z
	 9z84SDqFQQ27QXKkoCgzl9HTx8Z98f1hLFSWGASI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70245F80600; Tue, 16 Jan 2024 10:28:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BC7F805EC;
	Tue, 16 Jan 2024 10:28:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD72CF80254; Fri, 12 Jan 2024 17:35:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89CA5F8003A
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 17:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CA5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=llQIOK9l
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33765009941so5299571f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705077316; x=1705682116;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LlIMTu749xK+G2nXubgKLsCYahSVNlgmIkXmTS0PwKs=;
        b=llQIOK9l3MyNSQdYeuZ8R0LrmtYylsBdiNEwmZIiU2HRiOqR+x41yBQxkpm7pudeHo
         nzTbmxe8nLkuofRDH9pXoHuVrWoXq0QtweoBrSjbJ3vU554oYdYObqnHa7J2b5Xrb5cZ
         8XqOQGbAOeiQjYMM8MZrF31Bl3xgRyWafk5KpUdX0Cmb1gx7AUZsX1uGN29R4oAIcg2B
         ZljPZtnatzJV/uF3w8MPs1SuPg4aaJmw7xKBRp0ixyWPDG84zMO9+I4epLkSLumXfPhU
         b/5QqwPelEJq1yrwbnwFeq5MViLOtV0QHs59XFVj/jj3lNvl0H/m1xBaUhRP2m3ihu0R
         yqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077316; x=1705682116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlIMTu749xK+G2nXubgKLsCYahSVNlgmIkXmTS0PwKs=;
        b=YX4XHDRCzNWqqAPoQIyeAEI+F4j+1MQLAKJtkDZPpS/ESLfjp/Dpqdic053EESWfQN
         GLxri1t8uZ9vMfizVFGZYh91EYR8NbQy2nhxqqnVischWaJ8c7gJicyIILMQI671NXqB
         h+ZARKPThMlHbXzwZcBArjdLosrQVYfe+Aedj4S1748PByRuLNd6eZXMB+Z0RQFyopET
         1KoelAwmsTeGg15YEXtSMucI8egLtUCF8mGcRWujAZVkylTOEisbJqTkFs3zM2u2t1w7
         V6rsLowxeRmwSnbL8d38+wU8PBZBo9rE6oT3t2qowFt72ABjaglmZL6fyCOx1M4J5+CP
         Suyw==
X-Gm-Message-State: AOJu0YzACA9FRNH/2gnQUWF+yTU7NNrUQd+MPXYpts3tQB7yvis3heP7
	eHuejiKMZnlr/P0qtVR5sG8=
X-Google-Smtp-Source: 
 AGHT+IHIaYT4sw8rtu3Wb5cOS37Igtd1/bCisVWU7eVb4vG7lRY3sMPZwc5lgYivI8nUeoVlHEFP9g==
X-Received: by 2002:a05:6000:11d1:b0:333:2fd2:5d1a with SMTP id
 i17-20020a05600011d100b003332fd25d1amr1025646wrx.76.1705077315961;
        Fri, 12 Jan 2024 08:35:15 -0800 (PST)
Received: from kenzo-linux-laptop.bicolor-pike.ts.net
 (154.red-88-26-51.staticip.rima-tde.net. [88.26.51.154])
        by smtp.gmail.com with ESMTPSA id
 h18-20020adf9cd2000000b00336a1f6ce7csm4298766wre.19.2024.01.12.08.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:35:15 -0800 (PST)
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
Subject: [PATCH] ALSA: hda: cs35l41: Support additional ASUS Zenbook UX3402VA
Date: Fri, 12 Jan 2024 17:32:15 +0100
Message-ID: <20240112163239.59743-1-kenzo.sgomez@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kenzo.sgomez@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CRJFCY4HTYN3RRBETS3NCC6L3C2QUGNA
X-Message-ID-Hash: CRJFCY4HTYN3RRBETS3NCC6L3C2QUGNA
X-Mailman-Approved-At: Tue, 16 Jan 2024 09:26:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRJFCY4HTYN3RRBETS3NCC6L3C2QUGNA/>
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
index c1afb721b4c6..adfb31a6bf1e 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -67,6 +67,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431D1F", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431DA2", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "10431E02", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "104316A3", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
 	{ "10431EE2", I2C, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "10431F12", I2C, 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", SPI, 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
@@ -371,6 +372,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431D1F", generic_dsd_config },
 	{ "CSC3551", "10431DA2", generic_dsd_config },
 	{ "CSC3551", "10431E02", generic_dsd_config },
+	{ "CSC3551", "104316A3", generic_dsd_config },
 	{ "CSC3551", "10431EE2", generic_dsd_config },
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
-- 
2.43.0

