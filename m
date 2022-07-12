Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D625715A2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 11:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E58C15F9;
	Tue, 12 Jul 2022 11:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E58C15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657617828;
	bh=wt8PlbSSqcvN2nUJ9DWbGsOUNZi5fZCMXpWG4/qV0E4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=quUtDnqfBWoWnvoJPasV+ClZ4+g1xCVGQAEDCl900zJBanHFbmPbTTetC7yOlzWlB
	 0lej52YsU8HBfXlXQRy8yTBRw4YIndOQ7Q9zO4B2mTq3YQdQSq6dbY8C9oJVvkrOKf
	 CGs0UjFOMUtLHczw4QG+gf/YYwHwN9uXGCLpMit4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A95F8012B;
	Tue, 12 Jul 2022 11:22:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26809F80246; Tue, 12 Jul 2022 11:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC493F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 11:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC493F800BD
X-QQ-mid: bizesmtp74t1657617750t4cfa3j2
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 12 Jul 2022 17:22:24 +0800 (CST)
X-QQ-SSF: 01400000002000G0T000B00A0000000
X-QQ-FEAT: qcKkmz/zJhwYbhm6z/jbv+ZOB0ZPkBzHen22zjOC1GLUIhHa+QzESjf6aWwhi
 v9ApeefPkrTrZ4zqcr4yvLTt95R11GBL5+4SoXPHpDHXKLxA+Yz/TABROkrVwrOIsBQB3vi
 nXj0OAU0Sqqfj7FV4+nbsa9ybILwCfSnzfnwOINsEbj7HMEmJdDL+MPyRwH/CJAayPkhZjm
 INPSIvuHbK4k4DB1agTRXnXxcoehXKC3Hn6zGmeGaPX9Om06VciR6XsmOcaYhVYfdB4Xh+B
 1tHQW4y+gIZa3a7nSswOIIqOB3WX7R5F+4WCCj7Yw2QTxx3MykimqQ4YX4CeM1tRs0y9xle
 qWEuJUY2e9tekQXZl8fuhWiKLv6UYyg/gnVE+8GRPbdnwzwmzasQL3kmz1mdS74Yxm1w+9g
 PG81aU7KjBo=
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, tcrawford@system76.com,
 kai.heng.feng@canonical.com, tanureal@opensource.cirrus.com,
 cam@neo-zeon.de, kailang@realtek.com, sbinding@opensource.cirrus.com,
 andy.chi@canonical.com, yong.wu@mediatek.com
Subject: [PATCH] ALSA: hda/realtek - Fix headset mic problem for a HP machine
 with alc671
Date: Tue, 12 Jul 2022 17:22:22 +0800
Message-Id: <20220712092222.21738-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
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

On a HP 288 Pro G6, the front mic could not be detected.In order to
get it working, the pin configuration needs to be set correctly, and
the ALC671_FIXUP_HP_HEADSET_MIC2 fixup needs to be applied.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ecc737342fcc..34139c26795f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11219,6 +11219,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x1632, "HP RP5800", ALC662_FIXUP_HP_RP5800),
 	SND_PCI_QUIRK(0x103c, 0x8719, "HP", ALC897_FIXUP_HP_HSMIC_VERB),
 	SND_PCI_QUIRK(0x103c, 0x873e, "HP", ALC671_FIXUP_HP_HEADSET_MIC2),
+	SND_PCI_QUIRK(0x103c, 0x877e, "HP 288 Pro G6", ALC671_FIXUP_HP_HEADSET_MIC2),
 	SND_PCI_QUIRK(0x103c, 0x885f, "HP 288 Pro G8", ALC671_FIXUP_HP_HEADSET_MIC2),
 	SND_PCI_QUIRK(0x1043, 0x1080, "Asus UX501VW", ALC668_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x1043, 0x11cd, "Asus N550", ALC662_FIXUP_ASUS_Nx50),
-- 
2.20.1



