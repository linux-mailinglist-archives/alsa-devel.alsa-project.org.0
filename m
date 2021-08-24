Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3313F5654
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 05:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6593515F2;
	Tue, 24 Aug 2021 05:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6593515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629774069;
	bh=EatZb8DvglANOUSuRDJTM7s0PL8jCsi4FOmiTgW2oWE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kx7QTo7KM2lnnbIXfusy/z1MSrvjFNAZHjUeFpWjBSTy94dM7/7JBEcAvfcUHbDVG
	 5uwJbqaID8GXdOOxE2/9bHneSw9xN0hpbzFNNNZMiIWC2RPr+/XiSoTLH6AIxiLqRb
	 Si26msZbO55Jb+LFNK3bycv54MoAZ3lLijdTYEq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B128F80506;
	Tue, 24 Aug 2021 04:58:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D35B5F804FB; Tue, 24 Aug 2021 04:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E54F804E5
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 04:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E54F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uHiEaP/g"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC9EC61248;
 Tue, 24 Aug 2021 02:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629773899;
 bh=EatZb8DvglANOUSuRDJTM7s0PL8jCsi4FOmiTgW2oWE=;
 h=From:To:Cc:Subject:Date:From;
 b=uHiEaP/gqo+aiN9o1clJ+jEgulLqIg4MabJoNkgFA+PT9dW5Knq1Z2R0+GwtDkdFe
 X4uJKJHjW8yTztKJOC3lXGAAOZSpEYCM9UY+YIR4EbdccmNLFySEE7vwmtKUlaWlom
 EA67nqyjDD+Q8S52e7NiBdJpNX+yBNu2jFcTzvbHPsm4qigMR/6IeqKOfsuOv/mTxq
 GsDYDl5BaD29qU3ypiKBTxgtPwxZx3/ST3hmv59OLN/ei2cJIqWgvxTTJoZx5oWP4j
 +MmMtI437o7y5PfRk4X/dspFeG9cykHFp/JEvYQFM/AHlEX18pTN1RBZyg9zyLC5Ez
 lhRpREfxVWtLg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	kristin@tombom.co.uk
Subject: FAILED: Patch "ALSA: hda/realtek: Enable 4-speaker output for Dell
 XPS 15 9510 laptop" failed to apply to 4.19-stable tree
Date: Mon, 23 Aug 2021 22:58:17 -0400
Message-Id: <20210824025817.659050-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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

The patch below does not apply to the 4.19-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From da94692001ea45ffa1f5e9f17ecdef7aecd90c27 Mon Sep 17 00:00:00 2001
From: Kristin Paget <kristin@tombom.co.uk>
Date: Sat, 14 Aug 2021 15:46:05 -0700
Subject: [PATCH] ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15
 9510 laptop

The 2021-model XPS 15 appears to use the same 4-speakers-on-ALC289 audio
setup as the Precision models, so requires the same quirk to enable woofer
output. Tested on my own 9510.

Signed-off-by: Kristin Paget <kristin@tombom.co.uk>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/e1fc95c5-c10a-1f98-a5c2-dd6e336157e1@tombom.co.uk
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a065260d0d20..96f32eaa24df 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8332,6 +8332,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a2e, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a30, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a58, "Dell", ALC255_FIXUP_DELL_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1028, 0x0a61, "Dell XPS 15 9510", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.30.2




