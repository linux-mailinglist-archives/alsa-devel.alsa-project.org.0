Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A93F564B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 05:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B832D15F2;
	Tue, 24 Aug 2021 04:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B832D15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629774002;
	bh=488II47UZumJWOtyj4EvUcbvyJ7tQiCamOi78w36Fwc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f3v3805XeuqeeLoq63nQYfgyGnGp7//Lb07DIciSlT+U4ab2Yp3y9QxxVNquBZkQc
	 hcs3D39aYXIxAw6LlTMC0c6AY11f6NpxBEKcdGAGzhNEqxmr6AQFW1t1e1TYojCguL
	 2dBRfWnPoZaCT+XpkJtpXiAQVsGAZ7U468a1HQq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD2AF804E1;
	Tue, 24 Aug 2021 04:58:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F24F804B4; Tue, 24 Aug 2021 04:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29EFBF80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 04:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29EFBF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GyBIp9ke"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D7A761181;
 Tue, 24 Aug 2021 02:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629773881;
 bh=488II47UZumJWOtyj4EvUcbvyJ7tQiCamOi78w36Fwc=;
 h=From:To:Cc:Subject:Date:From;
 b=GyBIp9keWfIg+0Ogr66MaefH31DfMefY0jUJ16YZRokaQHEA3YTLrAq1TkLf5QEpj
 htDNvP94LuDRFVswNST/nP2KzAEsFaewGPlzV5RTIiAXrmQBURQU/1UMaD5ve7eWR8
 Dy6fVR4ZG4lMd4oBTxMv/pz2tipmOwNiGUfp+P3FrUq+07umxKl2uRIGTS0e6cpVu3
 tCJF4Lvkn1lVXNeu4ZpjqQu8A4n+lbZF7aHsGBSIQF00SpUet3BpwyJVR6v6PxSAyJ
 wuZqSQbtqMpKweBUjl+BYA5UAhy1Q6ie78y9w2gj2TFDwuksmXhhQbOE652LZo1bI4
 dcloxD+R8FZ1w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	kristin@tombom.co.uk
Subject: FAILED: Patch "ALSA: hda/realtek: Enable 4-speaker output for Dell
 XPS 15 9510 laptop" failed to apply to 5.4-stable tree
Date: Mon, 23 Aug 2021 22:57:59 -0400
Message-Id: <20210824025800.658538-1-sashal@kernel.org>
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

The patch below does not apply to the 5.4-stable tree.
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




