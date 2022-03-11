Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE34D7B28
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:03:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDAF7174A;
	Mon, 14 Mar 2022 08:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDAF7174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241388;
	bh=0FktFK8M82bdYNyc58we4Ys1Yb62yDCA5wxXoQmsiFs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a3M4z+XMULr+AsSYzp6BPhn39ekx1qXa55wHu5dwN0YXq1hcHRHw03hCGurNECtZ1
	 aJIG1gPDTflrjOLe9dQ3Y2VUrvw3tUlbPeMm4zaVoetMOicaYmBIBIfOPbpizM7bY7
	 hidNYki5xmg/v3n9QYiG09VvqdHE5/SM9nMZBqpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD759F8054A;
	Mon, 14 Mar 2022 07:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5D9CF80227; Fri, 11 Mar 2022 10:38:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg506.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55715F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 10:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55715F8012C
X-QQ-mid: bizesmtp81t1646991522tb6643rv
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 11 Mar 2022 17:38:40 +0800 (CST)
X-QQ-SSF: 01400000002000B0D000B00A0000000
X-QQ-FEAT: ke64Y+R1JM0aRKmhfsATp+SpcW+C3sJEpa+9URKRwGCpAxHHze9JKVhTICDV/
 MyElnTQUgPve11JsBaJGkjfPYeVWoy+ZRt7Nnf2A3MMbAcx22x6uBIt4y1vPAnTf1f8XhoT
 jmqzadsc4qYt3XKgojg60+exdq9BNk6jK4cZuyDEpkZhBh/HwGMDQYt+cpwSgsajSRH1TCA
 2KeoSMZBqTXR2iJeIeHCN44lmmAzn/GhOAUXfMnTnyM0HanrwUQ308aWzZrCKwY28vEOmrf
 lC6qOxJ8bhJnAD92B3hWs3/co136Cdlo0fuzGeSura+CPHNP5qH2mrb/2Qt6KyndQYRmzar
 9XYNqXNMeO6rttvxJc=
X-QQ-GoodBg: 2
From: huangwenhui <huangwenhuia@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek - Fix headset mic problem for a HP machine
 with alc671
Date: Fri, 11 Mar 2022 17:38:36 +0800
Message-Id: <20220311093836.20754-1-huangwenhuia@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: alsa-devel@alsa-project.org, kailang@realtek.com,
 tanureal@opensource.cirrus.com, jeremy.szu@canonical.com,
 linux-kernel@vger.kernel.org, wse@tuxedocomputers.com,
 huangwenhui <huangwenhuia@uniontech.com>, hui.wang@canonical.com,
 sami@loone.fi, cam@neo-zeon.de
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

On a HP 288 Pro G8, the front mic could not be detected.In order to
get it working, the pin configuration needs to be set correctly, and
the ALC671_FIXUP_HP_HEADSET_MIC2 fixup needs to be applied.

Signed-off-by: huangwenhui <huangwenhuia@uniontech.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3a42457984e9..e9c9b1d1bf0d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11067,6 +11067,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x069f, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1632, "HP RP5800", ALC662_FIXUP_HP_RP5800),
 	SND_PCI_QUIRK(0x103c, 0x873e, "HP", ALC671_FIXUP_HP_HEADSET_MIC2),
+	SND_PCI_QUIRK(0x103c, 0x885f, "HP 288 Pro G8", ALC671_FIXUP_HP_HEADSET_MIC2),
 	SND_PCI_QUIRK(0x1043, 0x1080, "Asus UX501VW", ALC668_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x1043, 0x11cd, "Asus N550", ALC662_FIXUP_ASUS_Nx50),
 	SND_PCI_QUIRK(0x1043, 0x129d, "Asus N750", ALC662_FIXUP_ASUS_Nx50),
-- 
2.20.1



