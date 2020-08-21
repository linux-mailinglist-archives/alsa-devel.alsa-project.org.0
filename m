Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA64C24DA9B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1FA168D;
	Fri, 21 Aug 2020 18:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1FA168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598026988;
	bh=T4C4QfGvKpcbuYZLQLF4H+rJkL3Y8Z5tdpSfYSOdYyc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWosw29Mkv1UM1o6H5/pVflsjcu1m+E9P/n4Dp5hQS6TL6BARKaXP6OhSddpsBGNm
	 8Ae5hGorZPjSbQPSemdhQD9vaTmib6j+lEqU3JUvZ2ZytsznK4xXP7Dq2PVPHioxaz
	 i3Wg0onhYUZ6664707DxuEyA3FLcQ4mDZC9aXoCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7939FF8033E;
	Fri, 21 Aug 2020 18:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A457F80337; Fri, 21 Aug 2020 18:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 584D3F80322
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 584D3F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vDLJQnFU"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56E0421741;
 Fri, 21 Aug 2020 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026550;
 bh=T4C4QfGvKpcbuYZLQLF4H+rJkL3Y8Z5tdpSfYSOdYyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vDLJQnFUnp8y5yhDfPFCFwTXDxvRHjl3nLNwMM+bxAZZnpVWF6Mo4AhnGISag0ZMx
 aFpERNscpxKLTUiHQA/vgMgIDvwoS7UJ7jhVjctoy0IdSfCAuTneLhZEDZ52hQkEEF
 H7mMeW/npbO8JBTfIaAUK/UZNyi+kgmuGX3I395E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 03/61] ALSA: hda/realtek: Fix pin default on Intel
 NUC 8 Rugged
Date: Fri, 21 Aug 2020 12:14:47 -0400
Message-Id: <20200821161545.347622-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161545.347622-1-sashal@kernel.org>
References: <20200821161545.347622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit e2d2fded6bdf3f7bb40718a208140dba8b4ec574 ]

The jack on Intel NUC 8 Rugged rear panel doesn't work.

The spec [1] states that the jack supports both headphone and
microphone, so override a Pin Complex which has both Amp-In and Amp-Out
to make the jack work.

Node 0x1b fits the requirement, and user confirmed the jack now works
with new pin config.

[1] https://www.intel.com/content/dam/support/us/en/documents/mini-pcs/NUC8CCH_TechProdSpec.pdf
BugLink: https://bugs.launchpad.net/bugs/1875199

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Link: https://lore.kernel.org/r/20200807080514.15293-1-kai.heng.feng@canonical.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 313eecfb91b44..ab0f19858f798 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6137,6 +6137,7 @@ enum {
 	ALC269_FIXUP_CZC_L101,
 	ALC269_FIXUP_LEMOTE_A1802,
 	ALC269_FIXUP_LEMOTE_A190X,
+	ALC256_FIXUP_INTEL_NUC8_RUGGED,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7458,6 +7459,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		},
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
+	[ALC256_FIXUP_INTEL_NUC8_RUGGED] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1b, 0x01a1913c }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7755,6 +7765,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
 	SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
+	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.25.1

