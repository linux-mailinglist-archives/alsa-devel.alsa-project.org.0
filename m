Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3D3B6F6A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 10:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8F283E;
	Tue, 29 Jun 2021 10:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8F283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624955532;
	bh=ZJFOz+DMEBEpfzL1W1rZhT7DbBAy/bn2830yHy2z6dE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oe1ZvluPmtDIR6n+s4FcLdtm08SQd2cHwKkJ+JZR6UGwUSeP8F2knjmQ/JBI+k8p9
	 TEkB6b10b125ukprPsjvml8mJc+0cx0bJ8W3RtJ998+c6pmiuryv3e2syKKZVJvmhG
	 Jsx8lsogrykD1zXO/Zr+vE6C+uPoMXTipnB8XK6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48360F80240;
	Tue, 29 Jun 2021 10:30:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23CBEF804D6; Tue, 29 Jun 2021 10:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF446F800EE
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 10:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF446F800EE
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1ly97R-0000Jo-Vl
 for alsa-devel@alsa-project.org; Tue, 29 Jun 2021 08:29:22 +0000
Received: by mail-pg1-f200.google.com with SMTP id
 p2-20020a63e6420000b02902271082c631so10846206pgj.5
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9fgFCKAEnFNvPWv2zgFK0h9Wc7b+MXEQqnNhBWeWpg=;
 b=aR7f5y6JKEViUnNo+5TQizFVaCYnvZFlQcuUKjFGp4n0exO61wDdk4zkTKg2aMHGMh
 qbVAmzNEH2YttRTKUehoxwzcQCwTdTYk4WXgjwglXdEtLrPIQVjubinJw5D1eMQenTpM
 Jq+cEWUgAJybF3s4NUZdXEKXrN7CvgOwNzLU2BDVfaJTfGoePxD+Gj9wcO/2T0ZPx1Sy
 T7HjYqQ5rsuIbpTEoKePqxJlccZrHTVImpK5POgsyr8Za3tBD7i/b4j8L7oOOlQBN79d
 HZlCZip8ZUqiWOvO2dwZbJUQ/t6IknkVsbFnqCphGTrNHJ+JvRCtjoB0n8JoHOGLoQDD
 P7tQ==
X-Gm-Message-State: AOAM532rK+oba4J61bD4Awik+jEm1zx+rln+e++uxQ58F9IUhZSVlEie
 2CUl4UJopjsjY70tXsw/m0qHWoBFd2jYiIizXFoPk5aeTStN2n6YfDbPko5BQz6xvfNdh835DaY
 W4ikdV8hvgpW7TZa1mnD4xpSrUjVaKMXTd1TVC8Ka
X-Received: by 2002:a17:90a:5885:: with SMTP id
 j5mr33035762pji.89.1624955360773; 
 Tue, 29 Jun 2021 01:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzszoUHT7VwstDKZhSSaQyW593EDxYrzS5Vzev/O5do4/MJXnQWrHt25Un4IUdkUWjsxRoDw==
X-Received: by 2002:a17:90a:5885:: with SMTP id
 j5mr33035735pji.89.1624955360549; 
 Tue, 29 Jun 2021 01:29:20 -0700 (PDT)
Received: from localhost.localdomain (36-224-198-238.dynamic-ip.hinet.net.
 [36.224.198.238])
 by smtp.gmail.com with ESMTPSA id 28sm17526830pgq.39.2021.06.29.01.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 01:29:20 -0700 (PDT)
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH 2/3] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 445 G8
Date: Tue, 29 Jun 2021 16:28:58 +0800
Message-Id: <20210629082902.408881-2-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629082902.408881-1-andy.chi@canonical.com>
References: <20210629082902.408881-1-andy.chi@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

The HP ProBook 445 G8 using ALC236 codec.
COEF index 0x34 bit 5 is used to control the playback mute LED, but the
microphone mute LED is controlled using pin VREF instead of a COEF index.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9c3bb1a2b849..25a32b718fbc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8344,6 +8344,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8862, "HP ProBook 445 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8863, "HP ProBook 445 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x886d, "HP ZBook Fury 17.3 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.25.1

