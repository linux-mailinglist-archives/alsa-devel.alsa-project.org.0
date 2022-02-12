Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7594B8432
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:26:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24F618DF;
	Wed, 16 Feb 2022 10:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24F618DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003595;
	bh=2Da5ayKzFZ3+gWWgIJC+3iufoyGtvqI1t2GHzGmZ5xM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k1DCVrft9hDKscHlZHUEVxEd8oKGrfZABrmcQl65qxMNiHbMmNllEw9qkbWN9Vliw
	 jz/lE3WZbsHspKy4LnYxk32QsI9jgtk0SQ5qm+kib9QM1o+RUsxKjhu2QMhgAebk+v
	 BdEEyl5EzoPWV9Kz4FlficPR08tshpQ3FIJh/vX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F9BF800D8;
	Wed, 16 Feb 2022 10:25:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4AA6F8014E; Sat, 12 Feb 2022 17:08:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09486F800B0
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 17:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09486F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h4s6bzXK"
Received: by mail-pl1-x62a.google.com with SMTP id y18so7052415plb.11
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 08:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSwK6RRjbzNVQwnKp+oBVZXI61a/08VcvKS7heKKV2g=;
 b=h4s6bzXK6jbFajR4totZLL3pGpcCvcfAE6ZFjnDxX32rMVRNiTHHrN3NVPPDdkDO99
 c8F5916Ew+HMqgaiykKrPCrkKHlS5OeDOet9tOcKJIGygAsXO+7TxhJ+V7aWGJBOpIpU
 /eSBLJdJ4Iv8HuGliSUFqbxkBsB/G+GcKLZBpKDti6gZHS+29Pcb7ih9M2quzjySoRkr
 m0bZyu3sedQ4MoeRtefZPOgKu4N2nsC6t+s/4kJqgBcJLC5RBZEbqZTRamoYVyqHWsrk
 rkGmbqOK2zxvssv5twJjuUAa0uR0oX+KOORP3PkveepcrfDUlYSGhpCzeP6KMUl7b+I+
 b3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSwK6RRjbzNVQwnKp+oBVZXI61a/08VcvKS7heKKV2g=;
 b=ClDdtAZmbNDSNSgj/PFi/inwsSLxGd7ZYzKQDjjQVmIny9z3bhJ0IG5LDjR/SLGFlb
 aNN2PTmFMtqZfrk3HRWwC7JSgLX3RFWJdak8taMHli5j2+72kIfFIUxj67mKWXH2vh0h
 PMpK8YeossAID6YTnLAj4F61VuocaIi3SI8Vr00/Tudox6SJD1wHJe0A7gX/+DkYO/eP
 5fsct03jHfLiQFI0DgY+mE+ZfXklMNxzx9fz5T/uU4WPr5umyLHytTkgJvu5T0cSsupF
 9C7oY+xlpzJxgrKwBCCx1uxBkxqeY2lqRWBuSEmklQc+zL3qGzc065HrkumkBDjS5QmT
 D/3w==
X-Gm-Message-State: AOAM533Wl9EM8tH4laBKRJtYsc5WUnp2bl8B8YHXrOGkoMTXmA5NmV2e
 bQDVGxn8TdTjdznA+LWduvs=
X-Google-Smtp-Source: ABdhPJxeUu1OamV4npdmAvvs1z4UWQFLFmo8u9WTAH2gEzB0pzwxk3PQzb64+K9XOfPAl42K1fMsgQ==
X-Received: by 2002:a17:90a:ac0f:: with SMTP id
 o15mr5838778pjq.140.1644682122847; 
 Sat, 12 Feb 2022 08:08:42 -0800 (PST)
Received: from localhost.localdomain ([212.107.28.166])
 by smtp.gmail.com with ESMTPSA id x23sm31170280pfh.216.2022.02.12.08.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 08:08:42 -0800 (PST)
From: Yu Huang <diwang90@gmail.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2019
Date: Sun, 13 Feb 2022 00:08:33 +0800
Message-Id: <20220212160835.165065-1-diwang90@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, diwang90@gmail.com,
 Cameron Berkenpas <cam@neo-zeon.de>, Sami Loone <sami@loone.fi>
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

Legion Y9000X 2019 has the same speaker with Y9000X 2020,
but with a different quirk address. Add one quirk entry
to make the speaker work on Y9000X 2019 too.

Signed-off-by: Yu Huang <diwang90@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8315bf7d4c38..9473fb76ff19 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9170,6 +9170,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
 	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
 	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.34.1

