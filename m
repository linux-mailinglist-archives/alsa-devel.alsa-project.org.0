Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DDF3B8F9F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 11:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 569A3169A;
	Thu,  1 Jul 2021 11:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 569A3169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625130979;
	bh=lrxWBpJfBtJYLptobOR8icGi57hOtUP5jmu59iAnpkg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f2xEPPZ9nAYSFXaR9HG3uJNSi5IIsr8ryVUML7CSUkLOiy25TMWL3rikOMvI2cQi9
	 jJFDn3INaXXXmS8wZj5yc/sVXWQZd94JRJq1V5+CWPHFcuzkYUkJxO40ObTcyQkpk5
	 uPmZTZzy0YREjjZXfZ69E6kxo2qCU4HrVUEdoCtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF84CF804B0;
	Thu,  1 Jul 2021 11:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A42D3F804AE; Thu,  1 Jul 2021 11:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F9C2F800E3
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 11:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F9C2F800E3
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <andy.chi@canonical.com>) id 1lysmK-00074F-6o
 for alsa-devel@alsa-project.org; Thu, 01 Jul 2021 09:14:36 +0000
Received: by mail-pg1-f198.google.com with SMTP id
 l124-20020a633e820000b02902283854c3ccso798144pga.15
 for <alsa-devel@alsa-project.org>; Thu, 01 Jul 2021 02:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPTN30ZO1AZ2z4aTyWnCz44BtVf74Dz6y2exPPRRYvk=;
 b=S4wueo6LV/Wo0ADl1T5eVuImLUP+ndKQTAKNZKr9C8P0qS/RPvA5dsBdpXQ5TUWuAa
 csbX3vH+FDx6Njkcyi/Hp2mtDetrBl6XIymXYXdvh6JgTqDr9G4JNp4yCfI2rWT93B0a
 dGQE8qK16bviZ2vnuQwevFDhjBWSMTP+6St4ZNBSrL66fYF3oz7IBYNyl2DCQOWQ+AjR
 d5/3YWeZHNFrbDuIUub/jiRKzuuyBs70QpVEa4dFEWF/BE+q/qkVYGvEujKEyNL0+DcU
 KdZ5PXKqXH2JO6g90csPZhE8+qgljVX77ESUPyKi8REp42pM5roUlsjy0xr9l7+MEvf9
 tW8A==
X-Gm-Message-State: AOAM532vt0X5DelyJKF+6mwF3N0UXu6ExvkgnljEJpRbQLXa3PyPzhXV
 1ISVyEWMNlzWlt1rE6RgWED+cw67kJ1SM7O9hAJueRex0INhSkNHkhM/TWudxHJbRgIMT6Cb+m6
 0qK4a4+iHU/gWogMrR46n2jjHLikMadKeGBulbA7y
X-Received: by 2002:a17:902:760c:b029:129:2dde:f8c9 with SMTP id
 k12-20020a170902760cb02901292ddef8c9mr3176918pll.41.1625130874934; 
 Thu, 01 Jul 2021 02:14:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDXGfAk5uAuYrbBFUdY4xpCYOLzlyf1KZ2iTm/g8dW8upHdP5SCvvii2IzXt3bTlRvzhG33A==
X-Received: by 2002:a17:902:760c:b029:129:2dde:f8c9 with SMTP id
 k12-20020a170902760cb02901292ddef8c9mr3176876pll.41.1625130874499; 
 Thu, 01 Jul 2021 02:14:34 -0700 (PDT)
Received: from localhost.localdomain (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id c14sm18133190pfj.205.2021.07.01.02.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:14:34 -0700 (PDT)
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH v2 1/3] ALSA: hda/realtek: fix mute/micmute LEDs for HP
 ProBook 450 G8
Date: Thu,  1 Jul 2021 17:14:13 +0800
Message-Id: <20210701091417.9696-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
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

The HP ProBook 450 G8 using ALC236 codec which using 0x02 to
control mute LED and 0x01 to control micmute LED.
Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 308a58a83f33..6c423172a1f4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8363,6 +8363,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.25.1

