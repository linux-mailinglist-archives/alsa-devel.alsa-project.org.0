Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B6B4A2E43
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 12:34:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F99C1760;
	Sat, 29 Jan 2022 12:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F99C1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643456098;
	bh=w+AKfiXGxsB1dMrfmQe7wTUy9LH9Wu5g7QCGVY7U7Zs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jsNPVDhQut1gUSdkJMsKrcuU5TbNQdEJAY9MBAXLWYTQ3uqeLvD0ZyUIxvhpqVfv4
	 unHb0XlcD41rNKxw4sbZqIYWY8wFd4mc2HYERp9UEivT9LLOpWD/M0hce2apSutMhN
	 2wak+TbvVt19M8qQHUEA0+/xM70MVS74ufQSpHhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE5DFF801F7;
	Sat, 29 Jan 2022 12:33:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6788F801F7; Sat, 29 Jan 2022 12:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73909F8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73909F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P1NiM06r"
Received: by mail-ed1-x533.google.com with SMTP id p7so15631592edc.12
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERA8aqBvYsjnUMCz9U3prbef6jppsXR/APdHoQnIWjI=;
 b=P1NiM06ryBLQy3PdF+YpGkhXnOuNMR3s8H1hQSsvru5rizLJ7ry7FqvJ3vWk9DV9nS
 PlUjGs9ofhwEoHiosLGbGNy3yqtrTNemNzSrlcuq9mt7vj0cFJuT+bXrsw70rs3peRTz
 RUXFPvgVugBgBKomRdW0C24/qgG3t/DCG2JA4uNZ1xWGPVPPKombPk4PuthWsbQe8FcT
 94xi0DwL5gX2/1SRrZxIH0H3tQlwg4aDnOxImjglbQnb+bTgdbpbKiBs9svG8hQ+mjbh
 Y0EyFlOXzXc09r9aXVE0k4Euwp9B3BlAvENQLzEmnOmAgM/ARgyYHmhRTZq2PUOz+7XQ
 pDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERA8aqBvYsjnUMCz9U3prbef6jppsXR/APdHoQnIWjI=;
 b=PlfCVEl3pADCH8H3EIZ5QTC6PpETZrlnMoRaefxoHQoX4nORhiE+0kphJwJeRtzdra
 LU5eZaycMZYx6CPd1E9+XgSE9S1FKO3OryrG1LvC/WhcyCbJKGhSe5FXk/sFe9gms7tJ
 LkpN0tPrd6teQPb0stI9UAv3aPaOCDNCHH+McVahpu75hcTwZ16JwsiypxCGbv2CYwps
 a8U1fH0Oi5cJNwYIxwpswrWeok2WoD5oBPOmrtqW65QF4OuctpMogDWHjltww0kuG4ky
 b267ofqkhV4RAqnE6FPBtFRmm2fz1K5TQdvnteRG7BAnRyl2FTYUBklJ0krvVee34Obf
 UZWw==
X-Gm-Message-State: AOAM533hmTF8iN9HE9O25NxWB6f1d1/fZo3Y3ZwK99rbfUD1anIhazeI
 tfQQk5hng0BhmmlytWamGxQ=
X-Google-Smtp-Source: ABdhPJzLP+bbtbCvN3Io1A8R1+++zl+5dkNH9PZbnUUObW7WZv04fmuU2WXnQGXu/SJSsU31RnO0JQ==
X-Received: by 2002:a05:6402:5147:: with SMTP id
 n7mr12261744edd.2.1643455991590; 
 Sat, 29 Jan 2022 03:33:11 -0800 (PST)
Received: from cosmos.lan (178.113.77.92.wireless.dyn.drei.com.
 [178.113.77.92])
 by smtp.gmail.com with ESMTPSA id g6sm8885062ejz.170.2022.01.29.03.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 03:33:11 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 1/3] hda/realtek: Add missing fixup-model entry for Gigabyte
 X570 ALC1220 quirks
Date: Sat, 29 Jan 2022 12:32:41 +0100
Message-Id: <20220129113243.93068-2-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220129113243.93068-1-gladiac@gmail.com>
References: <20220129113243.93068-1-gladiac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The initial commit of the new Gigabyte X570 ALC1220 quirks lacked the
fixup-model entry in alc882_fixup_models[]. It seemed not to cause any ill
effects but for completeness sake this commit makes up for that.

Signed-off-by: Christian Lachner <gladiac@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..48af182f87e4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2626,6 +2626,7 @@ static const struct hda_model_fixup alc882_fixup_models[] = {
 	{.id = ALC882_FIXUP_NO_PRIMARY_HP, .name = "no-primary-hp"},
 	{.id = ALC887_FIXUP_ASUS_BASS, .name = "asus-bass"},
 	{.id = ALC1220_FIXUP_GB_DUAL_CODECS, .name = "dual-codecs"},
+	{.id = ALC1220_FIXUP_GB_X570, .name = "gb-x570"},
 	{.id = ALC1220_FIXUP_CLEVO_P950, .name = "clevo-p950"},
 	{}
 };
-- 
2.34.1

