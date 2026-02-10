Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP7rNypdqGmZtgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:18 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC33204368
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84553602A2;
	Wed,  4 Mar 2026 17:26:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84553602A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772641577;
	bh=+JHjufB3LEg/r3kx5N0o14L2zrHU9TKE8m4ej17mLC8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Pe4MzXQsAhYUWuueQXlNP6C1qSPH8nIAvEckLqSgvOJpIEFTa/NeJSlK6JiJM/y6c
	 IBf59AGI8wmdlXqRjYanUPFZlbYjUK/R0VkC+swYyGFqsZEqnzVpUTZFCtobEW/86+
	 Qt+zR26iu4zysfTHIXoIUjsZpDVaLMGVmn18PTDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7DA7F80659; Wed,  4 Mar 2026 17:25:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1107CF8065A;
	Wed,  4 Mar 2026 17:25:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85447F801F7; Tue, 10 Feb 2026 16:53:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A60AF800F3
	for <alsa-devel@alsa-project.org>; Tue, 10 Feb 2026 16:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A60AF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UkPmbr3d
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-7948e902fadso51460417b3.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Feb 2026 07:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770738769; x=1771343569;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsdoeDEVnIgEyOgR/pPJak/Bop4P70sJ/00MCCs+jug=;
        b=UkPmbr3ddKzAqCumoRcufTfl+3WEcibIoV1RNiCktHoU3xzPiwVHhF2o1fHChhn6PD
         N9M2kfl3X9jok5tkmB28QVI8USaWDnYSDY4m/f/KnuaXz3RIG8PAMKDLB6aNW/G62DbP
         hDj8uGh3DT5TY7DnTS1TTid8PCA0r7c2jMDLrwsPjwDJT/lN0dPxIwYvKtRxF9YQr55M
         Bf0qbJY0gd7THhOkl0765JfiljsHSN7uLKomjUGMI1DdZnLSZx8OPmlM2AmhOnGp1CZE
         3q80gILM4h+wimgMkXUQpH19u0ghmAt7CyySvogrAebG40wJtVyXqbFs78so98szLQn2
         Yw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770738769; x=1771343569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsdoeDEVnIgEyOgR/pPJak/Bop4P70sJ/00MCCs+jug=;
        b=MC+pq5dv7DgAIq8w8V9OLA6ani5V2JbyAYvmVTO8Brr+iE786D9TZpS2GLj5z9D7rq
         SIiyj7lBCL2WnH9QvEsyXhieYRprV+UYCNn2x3BKTeeOeuNlyc2byn+S0WaoEYEzSaPj
         WeLzqbkR8idfcTfCgVVCTrWJ1NkAkW6B2YynuY2P0EnowrkcbJBdoNNWQc1W0pYXs2RW
         QIXyHk5IrWEEB6pnDo002pJBCrSqthhb6rb8iLIKjKCy2yqhFTXsPBjq/9F2W8cQE9lq
         5825ewsIBBknr2bHwHgGyevTKKbEujH2jv0fT2EZ+CyNuKXYyi20zA2rIe+5wZ8hGl8j
         7YQw==
X-Gm-Message-State: AOJu0YzpkeAYN/7eh0pe03GyrggwPDCFvci0fZKo05ed1zMWaD9eu5eP
	zx1PC072HeC/NnEGbTSMtI6QDLsg5VWeeWsWIWla4qDLdaCgmz3zCqOu
X-Gm-Gg: AZuq6aK5HPZ9MEao2YIqOl6mtnJOg/pZBz+0B/UAZ7t+VYDth3yF+uCc5G0gw7zg8XK
	PG9QnwXnqrH0mKtp9xF7qHbdXa14yL6iYCcS2F0dTGJEyMQn92pqyBEUlgZaK+tDy03LrQKoXa1
	POwuZleK3M86QCZHbv4gdb75JvwIcghI9mP6bpO4/WVsHeBnit7WgrUt/JaPHszu6Y5eo36Gp2X
	c/8R4fcKjkg1CECgynCibaVNJDY8qtpLWON5/KyDM7S8wobuUA1kP6V3H+G1RYeV+YzarFBen4K
	SW2uICNc/ZYAP2yU1naCMAXSAr4qyhSUJVKdDuzwF+0p5W9me7NBIDsDgWImF1aaVv393+qux6I
	Y72duYoCNcoxFZPBhySKipWc0HWCfWwt9SiO5Is63QtcwW9vKeNlJHLnwmNp6TUgMIxY1dyjG7N
	aRfeB43qTZ7pz9VvmeA5HRfYT7oowoDdjZgPQPKH500Ys83bu6MEQAW+L2
X-Received: by 2002:a05:690c:60c1:b0:795:294c:fd2c with SMTP id
 00721157ae682-7952ab3faf5mr115261447b3.43.1770738769451;
        Tue, 10 Feb 2026 07:52:49 -0800 (PST)
Received: from fedora ([2802:8010:26eb:6900:67c8:420d:6b48:1a65])
        by smtp.gmail.com with ESMTPSA id
 00721157ae682-796506f1dddsm42994797b3.25.2026.02.10.07.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:52:48 -0800 (PST)
From: Gustavo Salvini <guspatagonico@gmail.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	Vijendar.Mukunda@amd.com,
	tiwai@suse.com,
	stable@vger.kernel.org,
	Gustavo Salvini <guspatagonico@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X
 M6501RR
Date: Tue, 10 Feb 2026 12:51:56 -0300
Message-ID: <20260210155156.29079-1-guspatagonico@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: guspatagonico@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JPUU34YOTLBOCLHTEUQM4NSJVVTPQUDN
X-Message-ID-Hash: JPUU34YOTLBOCLHTEUQM4NSJVVTPQUDN
X-Mailman-Approved-At: Wed, 04 Mar 2026 16:24:48 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPUU34YOTLBOCLHTEUQM4NSJVVTPQUDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 5BC33204368
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	DATE_IN_PAST(1.00)[528];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,vger.kernel.org,amd.com,suse.com,gmail.com];
	FORGED_SENDER(0.00)[guspatagonico@gmail.com,alsa-devel-bounces@alsa-project.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:alsa-devel@alsa-project.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,m:Vijendar.Mukunda@amd.com,m:tiwai@suse.com,m:stable@vger.kernel.org,m:guspatagonico@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guspatagonico@gmail.com,alsa-devel-bounces@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ASUS Vivobook Pro 15X (M6501RR) with AMD Ryzen 9 6900HX has an
internal DMIC that is not detected without a DMI quirk entry, as the
BIOS does not set the AcpDmicConnected ACPI _DSD property.

Adding the DMI entry enables the ACP6x DMIC machine driver to probe
successfully.

Cc: stable@vger.kernel.org

Signed-off-by: Gustavo Salvini <guspatagonico@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 67f2fee19398..f1a63475100d 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -696,7 +696,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XyloD5_RBU"),
 		}
 	},
-
+	{
+			.driver_data = &acp6x_card,
+			.matches = {
+				DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+				DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
+			}
+		},
 	{}
 };
 
-- 
2.53.0

