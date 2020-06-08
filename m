Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DE1F2480
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 01:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC55E1661;
	Tue,  9 Jun 2020 01:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC55E1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591658524;
	bh=JDqyFxjKdcM1wY6hHTeFzWvesMjNPNf2pdW9sTpT0eo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rT4HbwZi9mci8quVo29qJGQqSB7ssXkkvG5VdcIMpucU34PEqdp2wvTe9DZPOVq+1
	 1AtjxsOBI7aKE9xmukyfgD00T/tvjR4ML1NyG/UfLo36BScT5I6jX2g20RslCVfj4N
	 NKeiYkUP+9NYpLSak1xt8uFJy6DzeynQAsDNYExQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92FCFF8032A;
	Tue,  9 Jun 2020 01:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E21F80306; Tue,  9 Jun 2020 01:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA44FF802EB
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 01:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA44FF802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iWN5uKWX"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B988121534;
 Mon,  8 Jun 2020 23:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658106;
 bh=JDqyFxjKdcM1wY6hHTeFzWvesMjNPNf2pdW9sTpT0eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iWN5uKWXmr553UlTyqLi0g6CLzPXhXu6vVMok72KrhZLepVFi/o+ytH52ZhdgsIj6
 0+mvprbPZWWqihB/lioGODEJry2PDonETyw23k67Mdn3YIfscVpnZ/mTPorKv0d+Li
 yrVeNh2LHf/VRRPvQwl6y7EWoDRXZGF+9rMv934s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 146/606] ALSA: hda/realtek - Add more fixup
 entries for Clevo machines
Date: Mon,  8 Jun 2020 19:04:31 -0400
Message-Id: <20200608231211.3363633-146-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, PeiSen Hou <pshou@realtek.com>,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

From: PeiSen Hou <pshou@realtek.com>

commit 259eb82475316672a5d682a94dc8bdd53cf8d8c3 upstream.

A few known Clevo machines (PC50, PC70, X170) with ALC1220 codec need
the existing quirk for pins for PB51 and co.

Signed-off-by: PeiSen Hou <pshou@realtek.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20200519065012.13119-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 23315b69ac38..041d2a32059b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2473,6 +2473,9 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x97e1, "Clevo P970[ER][CDFN]", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1558, 0x65d1, "Clevo PB51[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x50d3, "Clevo PC50[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x70d1, "Clevo PC70[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x7714, "Clevo X170", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo laptop", ALC882_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x161f, 0x2054, "Medion laptop", ALC883_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Y530", ALC882_FIXUP_LENOVO_Y530),
-- 
2.25.1

