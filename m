Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D71D7070
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 07:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A632F16C3;
	Mon, 18 May 2020 07:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A632F16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589780589;
	bh=uOhbFmc/YqvDOw5CirwRogganMJB3uWHdsvDOVTiafo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RgbNcIwigDQgSRatw+KI64MHHvXSJuJjcgk4uePHMIgKg9hQBm40sLKRk+fprxj26
	 8geHM1vh+BQF7JzXYH3tuHCPCa48LU4StPa4JaAZ1NC7U/ZmitfOIANQTG1Ta7OGbb
	 AYJ8YEmieHKMRsU08Wiv6/5iYISZFXSnaM+Q7hRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 371B9F8026F;
	Mon, 18 May 2020 07:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59CCDF80216; Mon, 18 May 2020 07:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A44BF801D8;
 Mon, 18 May 2020 07:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A44BF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IeJwIO+2"
Received: by mail-wr1-x441.google.com with SMTP id s8so10209932wrt.9;
 Sun, 17 May 2020 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUHyhh6MJuOq2jR9036y/hLL4Ej0HV3joFyYzx/cxo4=;
 b=IeJwIO+2G5Ycxw3ocwT3vCOhV+gDLcAUFQtq7g0kbVRUDAkLaBSH6FETH99/QqMHRW
 y+DYPgwkuViiHW5Ez8P+a8mwehTgKACMSmUedAJfG9D4UXCJXVt+o0/fiWGLSZ07mG6l
 ZBRs3RXbtwY8Cy7XAcLj1pgs27TEn22NmG+QAlcWjzUkR3MjAqoftAKknh0YNzPQUQPH
 VRLjPqKqVhVP27ubw+mVTstBwobfSqXUrxGKdjOaRMA2uI2FcRhs9XMbWYfCtiB7bVEB
 CrGAlCjFQ/ZNY0YpddSwwIT9exk6QeXb63mG3LqNhQDu1Ewf45sCx42L02vAshikeP0x
 qyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUHyhh6MJuOq2jR9036y/hLL4Ej0HV3joFyYzx/cxo4=;
 b=Bf878jZ1RdunmGXHuWDNY5l08Ac9q+zpsslnxr8GiTCCWYXDui/LOlUPFSAzmscSca
 mzxXv88PTXoxhAm0Q4F+of7ehaRzd8hh1RGWMffEYOg0qaBvyRuU3UqueTljFDea/f0H
 jMuRPKL6RwNWRJkrg3zEl5R3PQp6f5OXfj4niNTMOE4SbkacBlFO8PIL8uOREjeLb0zW
 s60dOr7FEAPSz/E1MjRS+sL0La32aeLSE1yRhEJZR9CE1sS9BYnpWHxgNKNGMcg8Afuc
 VRF75geE34XxlJk4MhxNmIVR9nviDd8pvI0xZYB+oyPrukMPEe/mHyChvEdCWIEiW7Pg
 0KrQ==
X-Gm-Message-State: AOAM531Q4y+r6LAT0l0yf9nqJiU2+T/zZY4y3PjWAX52KAi9u1oXJbGT
 Cu50qaP6r7TVVz5BCdTrKKP/pcXigag=
X-Google-Smtp-Source: ABdhPJzBrQMwY1/Ws5eGRxhrvXX9+vORDuCq6nY8qwiugbRjyTWPFS5eh8J0ERXIw2REI5mbJBnL2g==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr17121635wrv.209.1589780431096; 
 Sun, 17 May 2020 22:40:31 -0700 (PDT)
Received: from cosmos.lan (84-114-134-91.cable.dynamic.surfer.at.
 [84.114.134.91])
 by smtp.gmail.com with ESMTPSA id q14sm15410069wrc.66.2020.05.17.22.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 22:40:30 -0700 (PDT)
From: Christian Lachner <gladiac@gmail.com>
To: patch@alsa-project.org
Subject: [PATCH 1/1] ALSA: hda/realtek - Fix silent output on Gigabyte X570
 Aorus Xtreme
Date: Mon, 18 May 2020 07:38:44 +0200
Message-Id: <20200518053844.42743-2-gladiac@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518053844.42743-1-gladiac@gmail.com>
References: <20200518053844.42743-1-gladiac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

The Gigabyte X570 Aorus Xtreme motherboard with ALC1220 codec
requires a similar workaround for Clevo laptops to enforce the
DAC/mixer connection path. Set up a quirk entry for that.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205275
Signed-off-by: Christian Lachner <gladiac@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dc2302171a71..23315b69ac38 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2457,6 +2457,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H", ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1275, "MSI-GL63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1276, "MSI-GL73", ALC1220_FIXUP_CLEVO_P950),
-- 
2.26.2

