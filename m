Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9C791792
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B5E201;
	Mon,  4 Sep 2023 14:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B5E201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831852;
	bh=bYmI/d5gchNZGoYLiUYNtoIlYUDp9EgG9zy/mmO09IE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vQJCQkiuJ385KAPyIeiiS0mvtYOyGequCihTA4Faf2hICQAtayH6DerRxiB8O0ruY
	 7O1XVeybq1h9hEAm60Uf73yoW6x+bsvUs5yjF+iQVXZEgKdUkm2bzK/cNrUDtVp3Fw
	 AhpAVBQ4z465RW6pVXkIGQK6OmLPL2sCdcdlq1PQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC9AF805AB; Mon,  4 Sep 2023 14:49:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 070F1F80588;
	Mon,  4 Sep 2023 14:49:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FD4CF8032D; Sat,  2 Sep 2023 17:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D0CAF80074
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 17:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0CAF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=gxEahK4W
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c1e780aa95so76965ad.3
        for <alsa-devel@alsa-project.org>;
 Sat, 02 Sep 2023 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693667308; x=1694272108;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oihOd2gBCa1RX2c3YMiv0m+sHANy7GfRsmex7Iu3Xq4=;
        b=gxEahK4WYYpab+ieJVRn4z3ABOY2NpQNaZmDFfJA5Q1k3e11HydcmweToPR/a2rMLZ
         DTKBHkkg/ruX+ImMJgHRZEzERnJQ2OhQSds6m5Y7y7Mb/45dN7RNxo+ECHjm4tJzmGgd
         ZfFn0/lbUR++aL1TUOS4xYKg4/7HoQFXpsld3gm4iQhISJkgipk/qTkdqoemLJ0VoG5Z
         X4IevCuFnkOOQWhA7Jd6Imot7RajAcgrE4tTlhsJ3XH3OmB/rQlcMnKHYzLfLjVmyWjC
         MdvDmiwof1gx4Mp0urYH8MzDCe/ZaIHdwIFVw9wu/zIJdEHqHmeMTDu/XtvpTVEEt8xD
         +a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693667308; x=1694272108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oihOd2gBCa1RX2c3YMiv0m+sHANy7GfRsmex7Iu3Xq4=;
        b=JYz/5OzqKLlynHxV7lPOGi3KZ3KLgzpeM9/twAXSMmQKP0ry0mGud7VFG0iwOelEwh
         8S/ntuUFIq32M042NtLrPri2tVzQZ/gPADJUwr3IWcbhpAz+WsJ9PvniOVDsJQWIT3Aa
         YDluv1sgQ7V3a1fJzaCH0n9HfuUw9cJcGx4rD4eB0WSxZoYAN8sDyehv9M67ejwEPBhp
         V0H1B1j/cXIj42V+/TPIhwDahF042dm/R+IEAbazDYipqbE1HWJFaCSUgQliaM7FtdXj
         LRw5zE7ztGvtxTZxW1mj3nV3DTGT+OyMnPGmzcOw+UmWM9YxozrcFZiy0wHX0mmnMv6Q
         q4lw==
X-Gm-Message-State: AOJu0Yx0OU6b2WGhE6bOcWEblOdp6CqZv7+TyesWk46aLyL5VARr6/bJ
	I+FyrlavWyqloJ50VOOub18=
X-Google-Smtp-Source: 
 AGHT+IERQ00WE8oz6cvfQd3k8l6X70FT5h5iZzzmJDyy+VwqH7eZ3w1ho05x2raTeACzPZsJP84nng==
X-Received: by 2002:a17:902:da86:b0:1c0:c7ae:a8a2 with SMTP id
 j6-20020a170902da8600b001c0c7aea8a2mr701251plx.35.1693667307788;
        Sat, 02 Sep 2023 08:08:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:201:a40d:5ac2:6bab:c627:af57:9218])
        by smtp.gmail.com with ESMTPSA id
 j2-20020a170902da8200b001b53c8659fesm4755896plx.30.2023.09.02.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 08:08:27 -0700 (PDT)
From: Shubh <shubhisroking@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shubh <shubhisroking@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI entries to support Victus by HP Gaming
 Laptop 15-fb0xxx (8A3E)
Date: Sat,  2 Sep 2023 20:38:07 +0530
Message-ID: <20230902150807.133523-1-shubhisroking@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: shubhisroking@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 52Q6HFXH5CWID3XDW4KWFB77V7UZLYR2
X-Message-ID-Hash: 52Q6HFXH5CWID3XDW4KWFB77V7UZLYR2
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:48:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52Q6HFXH5CWID3XDW4KWFB77V7UZLYR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This model requires an additional detection quirk to
enable the internal microphone.

Signed-off-by: Shubh <shubhisroking@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index b304b3562..f7ee792bd 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -325,6 +325,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A3E"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.42.0

