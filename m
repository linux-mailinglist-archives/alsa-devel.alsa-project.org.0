Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384B7B3F15
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2EBEBD;
	Sat, 30 Sep 2023 10:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2EBEBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061645;
	bh=y2sJY3/SaFnNRsHn6CtlDgc3Kv2ue5Nb8oto/pWys50=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K6zvjES68fhlQY18MudH3ouyEdTWEDcGV27oH/VzI5VNq2FL2HKgrj3XKznsTxr1k
	 5GhOJ5Z93s1774HQbyblcmOF1x8u1xnEG9n4PaWlx07fdPq1oeEntjHJL6jQom/A7h
	 77XfnuxeupYwZEm9/PTdsGJcWplZyn6qoft0NjIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3E5BF8047D; Sat, 30 Sep 2023 10:11:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E17FF801D5;
	Sat, 30 Sep 2023 10:11:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F71F801D5; Thu, 28 Sep 2023 00:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B57BBF800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57BBF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gkFu0qTh
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32157c8e4c7so12006317f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695854302; x=1696459102;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RqKnQ384vFzLQtfAR/lBEgRDbU9k5LVLEF+EOb6OZQ=;
        b=gkFu0qTh7N4eDM6njdg76vQGnkLa91bAukGRe1PSPBmZKOCwRF2zJMzWTnTsiJAW8h
         X3cChdMEqN1rjf6x9B7cF/VPovyLRHrRccLNdbM0efB3d6rnvBe4cWcnhjIjUvmZ4roZ
         KeCWgS9CvrO06Mn/hDn7Kz9awoizWw0scv2heBTfaWWJNtC93rGVWBAcqgmS/6APZMKq
         dzV4exVAOiBKDolglEgHN8Krnk84WD9ZwLz/iPdpN+Oqr3p6dFLPPZj9MMwyl50q/Fmb
         WaulcJv7BRQpV7XRcr/76h1qtq/7ExvxF3VY/UfkaDiNin/3o7hJ6BxCy/L4AfchD2NJ
         RaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854302; x=1696459102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RqKnQ384vFzLQtfAR/lBEgRDbU9k5LVLEF+EOb6OZQ=;
        b=NKHDLq3IwviMieixqA/xhZoqf1Wd7V0B9BcfphgKct6AFG/bh6NI54dJeuAfhoyDn6
         IGMQwQC3Aq5XMj6ER4ihYJ2uwru7oP6ERog9Y3iF3lwYRg7KrCZVBmhFXQ09EiuByGwP
         eLOKU+6zoHuWuCayzvMP5M7b6uXmbJAQmvhEiB8+9bN+m3pdu6AVQ24bJCm24svWj4ep
         MuNPChA6hCK+JpplmcL9Mb/J0zARPkeZfSQ89HaGvcKyDy9wGykCgBQlvaAllTgmAMuC
         y2n1mtaC/zOR14GtBkI8w47B9gvV8y7P+L6J6wKUtqLRjbwwdQDdBAIKJJxbOGpBqDW3
         fjGA==
X-Gm-Message-State: AOJu0YzZABt+/ogmpEHoVklRnEPF7fNi2WKv53SQkNcWVwovXOxt69DQ
	v5xa7I5f34smifaC2/eWPC0=
X-Google-Smtp-Source: 
 AGHT+IEtPyqOdvggdme1F7Zk7QQYP32qu1nZmurf+Vdr4qpg/HWLBeF4/Hp888VsCYml8AiGnn90Rw==
X-Received: by 2002:adf:e749:0:b0:320:bb1:5a73 with SMTP id
 c9-20020adfe749000000b003200bb15a73mr2917396wrn.22.1695854301359;
        Wed, 27 Sep 2023 15:38:21 -0700 (PDT)
Received: from yoga.fem.tu-ilmenau.de ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4642000000b00317e77106dbsm18013776wrs.48.2023.09.27.15.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:38:21 -0700 (PDT)
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
Subject: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Date: Thu, 28 Sep 2023 00:36:07 +0200
Message-ID: <20230927223758.18870-1-sven.frotscher@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: sven.frotscher@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XRJSSOMCUJVPIW2WEMANNDPMVTDAXBQP
X-Message-ID-Hash: XRJSSOMCUJVPIW2WEMANNDPMVTDAXBQP
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRJSSOMCUJVPIW2WEMANNDPMVTDAXBQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
v3->v4 changes:
* re-add blank line between commit message title and body
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

