Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 074313B6F69
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 10:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E298168F;
	Tue, 29 Jun 2021 10:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E298168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624955496;
	bh=eWI2YWSYg3pseFcSRjVe3s8vkP7X+JqpXSJ0ezKK+IU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WrJ7a4OQnqTGHZHBzPAYfuypArOFUuRFmnSnETnZiuIvfG0zKfs1vj7iFW1YFzp2r
	 uYr0BUWXQs2dojtdkvI9A2HXTmKMFlm8hG/tnKvsguAvQ7TirnttEKg8I8PYS5FQq+
	 9ig7/QICjkDV1Uz6EeDsVMyi/mwgX+nk+g6RQvtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B1A3F804CA;
	Tue, 29 Jun 2021 10:29:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F5DDF802D2; Tue, 29 Jun 2021 10:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07AE3F80156
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 10:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07AE3F80156
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1ly97M-0000Ia-Uw
 for alsa-devel@alsa-project.org; Tue, 29 Jun 2021 08:29:17 +0000
Received: by mail-pg1-f197.google.com with SMTP id
 o9-20020a6561490000b0290226fc371410so12678701pgv.8
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 01:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zT+AAyuwYYGwcA7gJxKF1kV6Ix+q/p+7TtOQey3g0sY=;
 b=kJyfLxvdm101gSlw7bvW8uICRL/kyV2Ms8pNTA9ONwTEzts8hJC+a8E3zwS8j17zhV
 M2QgqonhMB5IYqMeAMMQ4pNAnsihNM353utcBnhE8IIY5PvrTP48N/NIfbRqRhkxjfCX
 1FbmHxJovSP2X3ePc5yalrNdutjUXBYDTo1nBJ3EGQZV3m/EdrZpvoolr8xd1ctEJlET
 4GOAXjugAGa1kCNsXCsEIxNO302R5arzjbTGEKgVLOOHBXsfDWkIF32ftwMHE7w8KcoM
 e/vQWcQVk6Bc/I94jxJJibITVAHo6Ykmy8iA7KNPzBNRheqicvIbbZpEZsMEsHG10Lp3
 EUlQ==
X-Gm-Message-State: AOAM530SvO+yCfyY0p0LrxF9A/F+cy3ulzXhxfJ6ZZk8SWm891fi8zG2
 pdZ51kBoM/Fnu55DfcqEZFMfJC7vIPW0yedMa97sNJ1Q4JeoOiQ0JyGCHFFEX0f4EkhWKGqK7Nw
 /BeAdj026/AP7KrapPH/Lrk902NFpyV267fjHdw8+
X-Received: by 2002:a17:90a:6602:: with SMTP id
 l2mr1096605pjj.103.1624955355717; 
 Tue, 29 Jun 2021 01:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYKEDhGe+xAvSsUjWW8jMLc/HpzQELmLPbu/30Sr5x7ckwsp151qQs4Wn4g+L5Rw7f6AYP7A==
X-Received: by 2002:a17:90a:6602:: with SMTP id
 l2mr1096589pjj.103.1624955355485; 
 Tue, 29 Jun 2021 01:29:15 -0700 (PDT)
Received: from localhost.localdomain (36-224-198-238.dynamic-ip.hinet.net.
 [36.224.198.238])
 by smtp.gmail.com with ESMTPSA id 28sm17526830pgq.39.2021.06.29.01.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 01:29:14 -0700 (PDT)
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH 1/3] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook
 450 G8
Date: Tue, 29 Jun 2021 16:28:57 +0800
Message-Id: <20210629082902.408881-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
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

The HP ProBook 450 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ab5113cccffa..9c3bb1a2b849 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8336,6 +8336,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.25.1

