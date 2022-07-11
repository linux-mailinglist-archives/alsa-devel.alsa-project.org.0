Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3681256FDEA
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 12:02:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30F51CF;
	Mon, 11 Jul 2022 12:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30F51CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657533735;
	bh=P7nBe5d99OH0kc/KtQ1SNK3xInO7G2BhrfMH04lhiJg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BCS26DPRaa5nCxGRrI7urcAG/4V1eG+/DB4OdqmjgR5wLEfVhoMhWWIzuyxljQ7Nr
	 KaCSc/ldKP1554ifSj1cuO2dEQcn2q3R5kxgd5r8VBPjBNKuQXJgqx5GvvrBTXw5k0
	 KZztrOrWYUv28jmqefVdQjcOOaelS7lvxNRmEd6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AAC6F80152;
	Mon, 11 Jul 2022 12:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8334F80256; Mon, 11 Jul 2022 12:01:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg516.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4DBAF80163
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 12:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4DBAF80163
X-QQ-mid: bizesmtp90t1657533647tvco1blo
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 11 Jul 2022 18:00:42 +0800 (CST)
X-QQ-SSF: 01400000002000G0T000B00A0000000
X-QQ-FEAT: swyrzWPvyR2Uu3lbSHNBUQj+FIenmLTanjTjxlOammbysUvhsUnCrkb+4NP8u
 z+Idjgqytr5udTEpd73w/5qL3vqPNdrhaSIFQ527IXit4QoOAzS9rFPpfCxQUVexUlkiQ72
 1j2A6+0ptmHTKcksbzNA94oykS2SzMpgblKPnkBibRSq5DLjvZL94xNPD68MdCPhPsbkuIn
 k/t/fMbaM2UWrIxizF49jFVrLuyg2+JDRgsnyvjXFtJW2w66YFnDJmjzobj8Ne47GVK7TLp
 fx1cQv6tGnTLJorj/C4392XfDXfeV+GQFu3/7CNZ4Yaf2dYIkOzurDYK0RH7KHe12QzDHSd
 neqMAr6+smpIIZKa08RZVNrdoQNjWhO806i0Z+oUjiWSUfrLN3C4mXe4PxequfNZnelAK7i
 1zB4p3vSZos=
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, bo.liu@senarytech.com,
 huangwenhuia@uniontech.com, tangmeng@uniontech.com
Subject: [PATCH] ALSA: hda/conexant: Apply quirk for another HP ProDesk 600 G3
 model
Date: Mon, 11 Jul 2022 18:00:41 +0800
Message-Id: <20220711100041.22422-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

There is another HP ProDesk 600 G3 model with the PCI SSID 103c:82b4
that requires the same quirk for controlling the mute LED.  Add the
corresponding entry to the quirk table.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/pci/hda/patch_conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 3e541a4c0423..e90da8020881 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -944,6 +944,7 @@ static const struct snd_pci_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x103c, 0x82b4, "HP ProDesk 600 G3", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x836e, "HP ProBook 455 G5", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x837f, "HP ProBook 470 G5", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x83b2, "HP EliteBook 840 G5", CXT_FIXUP_HP_DOCK),
-- 
2.20.1



