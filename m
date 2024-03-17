Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8587DCBC
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0FC42BA4;
	Sun, 17 Mar 2024 10:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0FC42BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666347;
	bh=aCT0vUa9iGG4jg2bvIm4ZCdWt/b43G+VBuROresZ9VA=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GGTy/ERDZ6kNAMt2MnYGdH5VNApqRrzjT4ISpjOiNT+Eg6cxA7k6cYFnZwxUdloEu
	 elJLoFMdI+6/+0bfLVcr5Vc4or2fZpdRG62Gp8xH6EsfYABsOe4fv53xXPM1cRXjqL
	 PZkFrlOyK1Nppk3s+vF5Xvvf0wufGhfNmCmPtz9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF96BF806DE; Sun, 17 Mar 2024 10:03:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A36F8072C;
	Sun, 17 Mar 2024 10:03:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BEB8F804E7; Sun, 17 Mar 2024 03:05:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E770F80088
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 03:04:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E770F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=yaO3Pawi
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1dddbe47ac1so23068185ad.1
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Mar 2024 19:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20230601.gappssmtp.com; s=20230601; t=1710641090;
 x=1711245890; darn=alsa-project.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWtXa4epYbJQbXxdWpC2jiOsOGSFUbjYRhlCuBfpHew=;
        b=yaO3PawinpvPQlI7lrbVZKF3wr9S1MwX8Hbf6cCsG175SqxuIaGZ8vXwvmF35wGBZt
         +cRphUC+8/YrC0Uvupuan7dHaxxWN2t20aqWoI9tg4vcYaTTpWgozlA2H3WJeMfQVWAZ
         A+sZxioU0QOCmrZvSPwqHrf+hqN3rf7jviq4LGnoZ2+Ic814+AqGBdPuD4OVgvr5+NdS
         2B2s4eAL8hboQnsnjRIjSr0qEy3QZviYqOil7zYNKEz7rQKNUbZWEwfyTEWAtq6jmG3I
         cdgndWdXzTiIJaMqAGKcmoXiPq1XWn8L2mbwBUxJZId2SwteHIc15i3VZ8Vt016sR4Gy
         2zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710641090; x=1711245890;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWtXa4epYbJQbXxdWpC2jiOsOGSFUbjYRhlCuBfpHew=;
        b=G6efobLibREQMmiZcTv1WKFOl14qRXsSiBTogmlePEsOZtSZsSYHDeZHoXyCfQHwGV
         7hDAFS+cNW3//Tq/VqGACBOvZwCHZ3tEOj/PlMM7z0HtlBq+CnA6WjpQBA7/gTCFkh8o
         VnSKspud4JRFVrbAxXhChP9LZJblBf7Cax7MutpbXUBobXMjAQgDGo+aV9cHKMovl2++
         /oWmZ8cK6eDS3rMGVS6QXpt61g6xSuW2zTHuJT4S6jjSL5vwg7TjPrOFZhfTasVoT7d/
         ArjlJNmZyUI07rmUl7yjXLt5/JpS5PWUCXNSOqRvgFqDhtbXH+gvQgETFIZbVAu3HrvF
         EjGQ==
X-Gm-Message-State: AOJu0YxeQkzX4uqj9Z/mUcmfIZ5zfiNt3Spzv4fv4eGt8Sy+PpIsxft+
	Q8+yXaQOcmFjvFxPhtdO3tip3lVJMShGN8QRUKSBzCa8iSBSviPjYHKSReNjoA==
X-Google-Smtp-Source: 
 AGHT+IGJfXs2YCoHgkgwujxBkyiSGmRp8KbhcbDvqGktBTuf7mgurovld+JrdIomojDkTkRDlF31Vw==
X-Received: by 2002:a17:902:da8d:b0:1e0:16e0:b28e with SMTP id
 j13-20020a170902da8d00b001e016e0b28emr210988plx.34.1710641090085;
        Sat, 16 Mar 2024 19:04:50 -0700 (PDT)
Received: from [192.168.3.16] (mx-ll-183.89.30-58.dynamic.3bb.co.th.
 [183.89.30.58])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a170902d68b00b001defd3e64d5sm2881143ply.263.2024.03.16.19.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 19:04:49 -0700 (PDT)
Message-ID: <570989e3-299f-4617-adde-b6b8d1e06277@cpp.in>
Date: Sun, 17 Mar 2024 05:04:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anthony I Gilea <i@cpp.in>
Subject: [PATCH] ALSA: hda: cs35l41: Support HP Spectre x360 14 eu0000
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: i@cpp.in
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FJGPXKRU7VQM2TSVRVSSGEHK4LI4SSB2
X-Message-ID-Hash: FJGPXKRU7VQM2TSVRVSSGEHK4LI4SSB2
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:47 +0000
X-Mailman-Version: 3.3.9
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

The new HP Spectre x360 has _DSD for CS35L41 amps in ACPI but
reset-gpios and spk-id-gpios are merged into single Package of size 4 so
_DSD parser fails to parse it.

Overwrite broken _DSD with the correct configuration.

Signed-off-by: Anthony I Gilea <i@cpp.in>
---
  sound/pci/hda/cs35l41_hda_property.c | 2 ++
  1 file changed, 2 insertions(+)

diff --ruNp a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c

--- a/sound/pci/hda/cs35l41_hda_property.c	2024-03-10 23:38:09.000000000 +0300
+++ b/sound/pci/hda/cs35l41_hda_property.c	2024-03-14 18:22:01.887566917 +0300
@@ -64,6 +64,7 @@ static const struct cs35l41_config cs35l
  	{ "103C8BE5", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
  	{ "103C8BE6", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
  	{ "103C8B3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8C15", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -405,6 +406,7 @@ static const struct cs35l41_prop_model c
  	{ "CSC3551", "103C8BE5", generic_dsd_config },
  	{ "CSC3551", "103C8BE6", generic_dsd_config },
  	{ "CSC3551", "103C8B3A", generic_dsd_config },
+	{ "CSC3551", "103C8C15", generic_dsd_config },
  	{ "CSC3551", "104312AF", generic_dsd_config },
  	{ "CSC3551", "10431433", generic_dsd_config },
  	{ "CSC3551", "10431463", generic_dsd_config },
