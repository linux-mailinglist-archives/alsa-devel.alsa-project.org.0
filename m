Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916BE36D682
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 13:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3336216D0;
	Wed, 28 Apr 2021 13:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3336216D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619609549;
	bh=EK0AzMXLMOj3dzOtiw4x3gr0PMfKfi9kRLMO7+0N8uU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coq7g0SWdDn+KtrAoZ8mn2XiKAMxNWsCwmwjcOyRnQvNp1hZCRTxYJZmxUCD1E3RD
	 WfFVMoQLvPC9kuU6dicfIqqbDeltveiizpW+CQVL7zdVOfhtjBgGtaNXH0WH66h6Mf
	 FtO97NoqWQfW5kWsEmG8HPSxgqY05ceAGUAC+0XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94917F804ED;
	Wed, 28 Apr 2021 13:27:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1CECF804BD; Wed, 28 Apr 2021 13:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0874F80425
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 13:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0874F80425
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E234AB173
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 11:27:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/13] ALSA: hda/realtek: Remove redundant entry for ALC861
 Haier/Uniwill devices
Date: Wed, 28 Apr 2021 13:27:03 +0200
Message-Id: <20210428112704.23967-13-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210428112704.23967-1-tiwai@suse.de>
References: <20210428112704.23967-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The quirk entry for Uniwill ECS M31EI is with the PCI SSID device 0,
which means matching with all.  That is, it's essentially equivalent
with SND_PCI_QUIRK_VENDOR(0x1584), which also matches with the
previous entry for Haier W18 applying the very same quirk.

Let's unify them with the single vendor-quirk entry.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cbed3c610170..bd7bfd7c9ee7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9290,8 +9290,7 @@ static const struct snd_pci_quirk alc861_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1393, "ASUS A6Rp", ALC861_FIXUP_ASUS_A6RP),
 	SND_PCI_QUIRK_VENDOR(0x1043, "ASUS laptop", ALC861_FIXUP_AMP_VREF_0F),
 	SND_PCI_QUIRK(0x1462, 0x7254, "HP DX2200", ALC861_FIXUP_NO_JACK_DETECT),
-	SND_PCI_QUIRK(0x1584, 0x2b01, "Haier W18", ALC861_FIXUP_AMP_VREF_0F),
-	SND_PCI_QUIRK(0x1584, 0x0000, "Uniwill ECS M31EI", ALC861_FIXUP_AMP_VREF_0F),
+	SND_PCI_QUIRK_VENDOR(0x1584, "Haier/Uniwill", ALC861_FIXUP_AMP_VREF_0F),
 	SND_PCI_QUIRK(0x1734, 0x10c7, "FSC Amilo Pi1505", ALC861_FIXUP_FSC_AMILO_PI1505),
 	{}
 };
-- 
2.26.2

