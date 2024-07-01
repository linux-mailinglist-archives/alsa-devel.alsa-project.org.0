Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402792BEBA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:48:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450A7DF8;
	Tue,  9 Jul 2024 17:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450A7DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540120;
	bh=5Gt/4k9mgPZdpTsbKXZnxv3TFYkof3L2QcKkHduCoH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmeUu8FUN+KhSOG+GEHXYvzMjs1tvsh/1a6nkROsNzb+4EyNdo6Ceip7PmAkQ8Lci
	 oh7ymcDM9vkJOWFm+NBalkU5PPy4j0fg6FtN1pZCETkCBIRZO6YauuS34ljSgJSY2V
	 QBme2WnAy9Oxm6nvw5cFtLnfPWYPis3bek6yLV+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ED1DF805F5; Tue,  9 Jul 2024 17:47:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B64A4F805F4;
	Tue,  9 Jul 2024 17:47:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90774F8042F; Mon,  1 Jul 2024 22:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC16AF8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 22:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC16AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PT+JvSuF
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so38618861fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719867341; x=1720472141;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fwJUmViPq6GaQ0BxwJByTYGz7zx3jNDcizMNQWq45E=;
        b=PT+JvSuFOjpB5E0YxESuCyUZhF023NjMNex1HZ31446cPP9cv/im46ozCQlZfHb406
         rA80GqwRyaVoxDNVPqxMKjfPvkEr6NRyo4f6UR3XELE7s/hvwdFEFhcmBk0ss1sApZe5
         sRyS9EbsBxY0W6or4yosI01WBposbiIFMsHQ9Z5hINOZY3LKIQVWQHdwFcQ9cQlJhaLC
         /2Afpojd4G/lbeOdSa4CDG0lNnG0k1ruoYVF3U/o9bT/2Rf+cc5gVZuKywzvZw9Tq+oy
         5kt6LjE4++N+CUKx3i8Cy1qp/UjaXpgHoD5adXsp55uEg7mtDAD1pdOFB8/bCuHsPxf5
         6S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719867341; x=1720472141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fwJUmViPq6GaQ0BxwJByTYGz7zx3jNDcizMNQWq45E=;
        b=BNEp58mvLJNyRP/XP96yANGp6ck8mn11MwK+CKmZGB/G2+Lkcfl+2b4oUJHPI0SDYW
         s54A4izkFh9g55UJ39q13VCqmOMuD6UOOGoKRdN0kaXJKMYE/7tBv2g0bBPn2InitaIT
         ZXa1dHCO0I1gIvriwdU/Esd8AcwR0sIXCclfh942tDyhJZuyhE8RYVsysWJCMtpM90lo
         L4bxtK2235rhW/64eJ6YmZd5FztHL3nkTmrOsXf6EjGA1CoZJfqEVqyprcC1ZGVEcIGJ
         7K85/BUWirJNUwlKIB0Km3EEo4guemC8Zu3KR1ObzhAgeRYcTLxcfD70QvUonGyE7p8R
         WmNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6N+mVaz1gUN9LXL3yz/DQ2+fRQNHyKgf/TfFOaCCSPGfscoNdo9kyDwhDNNTG1Ccm4VV8UIF8XAm196tcBpE/Oi6d/MOkIlrr4PY=
X-Gm-Message-State: AOJu0YzG1196xU3ky9JZcMfm8C3DMVLo1RtHuauku3Egeq7GEI3e6zzr
	BneqIgaTB97mD5tBEvxYruuL9IN6UnnVxKMg+g5sDimscDXJDwpI
X-Google-Smtp-Source: 
 AGHT+IFjmSYiJajwe0sxeFBUimrBjfc+BpFZ4m4LK5Ufh4BWXjwVQt7BXsByZg3/Ov5iDy2xodDlkw==
X-Received: by 2002:a2e:a989:0:b0:2ec:54ec:1741 with SMTP id
 38308e7fff4ca-2ee5e36d166mr55902221fa.18.1719867341165;
        Mon, 01 Jul 2024 13:55:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:c010:c300:105d:dc14:8157:17])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b626sm166345865e9.15.2024.07.01.13.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:55:40 -0700 (PDT)
From: MadEnvel <envelsavinds@gmail.com>
To: tiwai@suse.com,
	rf@opensource.cirrus.com
Cc: david.rhodes@cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	MadEnvel <envelsavinds@gmail.com>
Subject: [PATCH 1/1] Fix swapped left and right channels for Lenovo ThinBook
 13x Gen4 sound
Date: Mon,  1 Jul 2024 21:55:16 +0100
Message-ID: <20240701205516.22662-2-envelsavinds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701205516.22662-1-envelsavinds@gmail.com>
References: <20240701205516.22662-1-envelsavinds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: envelsavinds@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E7R7G65S65GZRNFDQYQEUR243TPMVSIV
X-Message-ID-Hash: E7R7G65S65GZRNFDQYQEUR243TPMVSIV
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:45:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7R7G65S65GZRNFDQYQEUR243TPMVSIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: MadEnvel <envelsavinds@gmail.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 51998d1c72ff..80c816922f78 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -128,8 +128,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
-	{ "17AA38C7", 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT }, 0, 2, -1, 1000, 4500, 24 },
-	{ "17AA38C8", 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT }, 0, 2, -1, 1000, 4500, 24 },
+	{ "17AA38C7", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
+	{ "17AA38C8", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
 	{ "17AA38F9", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA38FA", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{}
-- 
2.45.2

