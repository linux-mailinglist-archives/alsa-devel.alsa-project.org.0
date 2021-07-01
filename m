Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E63B8FA3
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 11:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38C716B3;
	Thu,  1 Jul 2021 11:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38C716B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625131030;
	bh=gKU3IVwYlUpQUqnAmSJfLf9ACVX13XLuFM5RjPHQu5c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfC7gdZeYuun0s9WSBbHjtgbIxSWeHrouSg5CWnnGQJO3+N3izADJs/NiepI725TX
	 JLrRoTXAPRdW33gdyTKf7Q438NqLToxqIYEMm1cgZWX9adOo9HnOVqnW/gccBZnyDY
	 d+cXjL/OLyfnh+m4kROHmhhH5m0Gs9PEaCXi0m+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 674A0F804DA;
	Thu,  1 Jul 2021 11:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2735AF804CA; Thu,  1 Jul 2021 11:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1438F800E3
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 11:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1438F800E3
Received: from mail-pj1-f69.google.com ([209.85.216.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1lysmV-00076O-Ul
 for alsa-devel@alsa-project.org; Thu, 01 Jul 2021 09:14:48 +0000
Received: by mail-pj1-f69.google.com with SMTP id
 16-20020a17090a19d0b029016fc64ff1a2so3025308pjj.1
 for <alsa-devel@alsa-project.org>; Thu, 01 Jul 2021 02:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=thOYF/kB9x653HZTqKgDY2UQjnQQ7jDfvkUX/K+iT50=;
 b=rSqJtG9fK+/rPsXDADgwQJqLudPht86KVFmCA8RF/6+KsgVhERk420K+yORzbKmSM2
 fXC61qOrU6IljwlXO9C1N6j5Lgh4NBpXkwUWUvvykblGDJWy6OauF+J+waJZdYWtL3bP
 0eneetet8ko+HfxqMa3Vhrz+RkvQQ4CbfCPH8Mt6WqyWPsgrxrXMZ7Ba4tmHHjKEQ17T
 sRjBVz9YXW1Ze5ZqX8tanmMnqQ6eJVr/BAxSfQz9SAjeKen5xb3fVrQNN1x2uDNUsYHT
 fJaZ/eqaeX7rkBEDevmT6/EeXvOW3WdP66/gKOtpKVQp1ivuEzsD9Dn0RRcwJTS2tCsl
 u1yw==
X-Gm-Message-State: AOAM5335AIyUzc0HJl+DqLQO6Kw//y7JH289BWzIdwmqm7seECWPqmbX
 eegSOcml9tk1ckVzMXlKJpXqg6Adc0FLxE1aYps+Kz2j3f/Jii5BLSXEZhroMWECRMjI8Oosp6v
 OrRXisdw90lhZSTvNuUjILxB5FD+SziLtGTDlvUfz
X-Received: by 2002:a62:aa18:0:b029:312:28be:4783 with SMTP id
 e24-20020a62aa180000b029031228be4783mr2887261pff.28.1625130886695; 
 Thu, 01 Jul 2021 02:14:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ3TmTny8WhyKTbAgqeIgvERKNfRFu0t0IJKVmV1iqpjj5R9HueAgkvwx/RI4KMUANW2BVZg==
X-Received: by 2002:a62:aa18:0:b029:312:28be:4783 with SMTP id
 e24-20020a62aa180000b029031228be4783mr2887232pff.28.1625130886498; 
 Thu, 01 Jul 2021 02:14:46 -0700 (PDT)
Received: from localhost.localdomain (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id c14sm18133190pfj.205.2021.07.01.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:14:46 -0700 (PDT)
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH v2 3/3] ALSA: hda/realtek: fix mute/micmute LEDs for HP
 ProBook 630 G8
Date: Thu,  1 Jul 2021 17:14:15 +0800
Message-Id: <20210701091417.9696-3-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701091417.9696-1-andy.chi@canonical.com>
References: <20210701091417.9696-1-andy.chi@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Kailang Yang <kailang@realtek.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 open list <linux-kernel@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, andy.chi@canonical.com,
 Sami Loone <sami@loone.fi>
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

The HP ProBook 630 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 949c8e5ac54a..79e066b39f5e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8364,6 +8364,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.25.1

