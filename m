Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A56532E26
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 18:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16041728;
	Tue, 24 May 2022 18:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16041728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653408085;
	bh=jN+1HIsiA3bRhuPvFKVuv5fZquiqYbHfsKIPAUjrDbU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=me3jdiguKhfornBtZyf+Is4npnQsGGNsTGBz71i+8HXrWo8aOwSOHosfE1Dc/pgWR
	 aTAG1SyS6xSUQu9GOlR9jA5PZa1GGXZt8Q/53a5vLGPfinPjgXNIdcj0qG2muLe3zr
	 f1GNXYyVSfrZyXPITufaNA4AsuFqP3zY7rwFolfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0DF3F804CC;
	Tue, 24 May 2022 17:59:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F5E9F8051B; Tue, 24 May 2022 17:59:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6387DF804D1
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 17:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6387DF804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ManMZzIA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BAD31B81A2E;
 Tue, 24 May 2022 15:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B21DC34113;
 Tue, 24 May 2022 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653407981;
 bh=jN+1HIsiA3bRhuPvFKVuv5fZquiqYbHfsKIPAUjrDbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ManMZzIA6Ikh7C3injz4DLATRPTGi8MAIMz0K+5JW+lnlbOXf5QnY3wHnJTZjkLBX
 8mmsJnX1RV1jjaWAkx0ACmFOg3WPIZH1I5MiD01ELbjgamt7yOQBelHFH62IN2iB9y
 sYwF93E3V+kGR3Ayyc3XXW5iPAXZoQy+h1s557iifPx6YQ7fZOYWW9F4mx2CU60vXs
 dQ2DhO9XkhOsfVlKxOFil1mx7qas7o2x6tRePGOxe/t4nGMy+MtyJ68gkdsBWLYpxJ
 bH9/6wSWeNq3nP0M8qqS3efLCaKKLoMwOtCcVzZi1HBp7S2Q8KoqOoMPNX/TsN27UY
 e+5hmydhDVvZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 03/12] ALSA: hda/realtek: Add quirk for the
 Framework Laptop
Date: Tue, 24 May 2022 11:59:17 -0400
Message-Id: <20220524155929.826793-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524155929.826793-1-sashal@kernel.org>
References: <20220524155929.826793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kailang@realtek.com, tanureal@opensource.cirrus.com, jeremy.szu@canonical.com,
 Takashi Iwai <tiwai@suse.de>, "Dustin L. Howett" <dustin@howett.net>,
 tiwai@suse.com, wse@tuxedocomputers.com, kai.heng.feng@canonical.com,
 andy.chi@canonical.com, cam@neo-zeon.de, yong.wu@mediatek.com
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

From: "Dustin L. Howett" <dustin@howett.net>

[ Upstream commit 309d7363ca3d9fcdb92ff2d958be14d7e8707f68 ]

Some board revisions of the Framework Laptop have an ALC295 with a
disconnected or faulty headset mic presence detect.

The "dell-headset-multi" fixup addresses this issue, but also enables an
inoperative "Headphone Mic" input device whenever a headset is
connected.

Adding a new quirk chain specific to the Framework Laptop resolves this
issue. The one introduced here is based on the System76 "no headphone
mic" quirk chain.

The VID:PID f111:0001 have been allocated to Framework Computer for this
board revision.

Revision history:
- v2: Moved to a custom quirk chain to suppress the "Headphone Mic"
  pincfg.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
Link: https://lore.kernel.org/r/20220511010759.3554-1-dustin@howett.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8425eadf6873..18af98d18b6e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7038,6 +7038,7 @@ enum {
 	ALC287_FIXUP_LEGION_16ACHG6,
 	ALC287_FIXUP_CS35L41_I2C_2,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
+	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8814,6 +8815,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 	},
+	[ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x02a1112c }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9286,6 +9296,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
+	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.35.1

