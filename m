Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B47572E36
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 08:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9E0616DC;
	Wed, 13 Jul 2022 08:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9E0616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657694099;
	bh=AnJCLy26fTpT0DRqQzWEzBJAQW0gy3CqRybpOsmBeF8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jd7lt+uFEbPzAhpZPi7oBTYa1d9zeD0abpGhaL9qOTa9EQfII+uFEbByGBiN3lske
	 KX5K9YnAmwM56cuRZ9i9fczgdBARJ6wydv6hf1XccUjuIKjYUH0Ho7mU7efuqWpVer
	 bVlv4rwxliwqHfvc/aYXTRtsICDRpPtW/rFE0ZHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F7D0F80254;
	Wed, 13 Jul 2022 08:33:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3799F80249; Wed, 13 Jul 2022 08:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEB10F8012B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 08:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEB10F8012B
X-QQ-mid: bizesmtp78t1657694019td8n9a41
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 13 Jul 2022 14:33:33 +0800 (CST)
X-QQ-SSF: 01400000002000G0T000B00A0000000
X-QQ-FEAT: UJd4nZbM1CcbWDiDvZVuAeNKZ7bGg0B+n4f0wn07NL2C/jEB4OOopWmu3Seqb
 ftMldvW00rffAuBGrbia6pDbhkPrwqkcbr1DSdl259b8Cd5id0VV6IiVkznXoWtHGgfBhqz
 R1+rvvs3cYyMwtVcxy9o59q35h1p5/8pojDzJkb+AjTm0YnPjuAiKGIGHcd1ZVcP1CqrULg
 DPY46ZbBhlRs7aHa3Td6lLbIevSiTSbDI32TQurgg+QeZbgyhpLIH3+kmhgIGqhcStC4rep
 /sWhZrK6afXr+/pee+cuYwui8JPD66S5aPgozP0wsMDx14mLcYXGcughcC05/IIDlPdvoww
 ht04ERtSCelSwpWPccu4luz53YYN8vk0AUqsikeCD3pl2VuQz9zieS2M19Ke2WWB3pRfBQL
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, tcrawford@system76.com,
 wse@tuxedocomputers.com, kai.heng.feng@canonical.com,
 tanureal@opensource.cirrus.com, cam@neo-zeon.de, kailang@realtek.com,
 sbinding@opensource.cirrus.com, andy.chi@canonical.com,
 yong.wu@mediatek.com
Subject: [PATCH] ALSA: hda/realtek - Fix headset mic problem for a HP machine
 with alc221
Date: Wed, 13 Jul 2022 14:33:32 +0800
Message-Id: <20220713063332.30095-1-tangmeng@uniontech.com>
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

On a HP 288 Pro G2 MT (X9W02AV), the front mic could not be detected.
In order to get it working, the pin configuration needs to be set
correctly, and the ALC221_FIXUP_HP_288PRO_MIC_NO_PRESENCE fixup needs
to be applied.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 34139c26795f..91cd58849ee8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6901,6 +6901,7 @@ enum {
 	ALC298_FIXUP_LENOVO_SPK_VOLUME,
 	ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER,
 	ALC269_FIXUP_ATIV_BOOK_8,
+	ALC221_FIXUP_HP_288PRO_MIC_NO_PRESENCE,
 	ALC221_FIXUP_HP_MIC_NO_PRESENCE,
 	ALC256_FIXUP_ASUS_HEADSET_MODE,
 	ALC256_FIXUP_ASUS_MIC,
@@ -7837,6 +7838,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_NO_SHUTUP
 	},
+	[ALC221_FIXUP_HP_288PRO_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
+			{ 0x1a, 0x01813030 }, /* use as headphone mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 	[ALC221_FIXUP_HP_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9012,6 +9023,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x2335, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2336, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2337, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x2b5e, "HP 288 Pro G2 MT", ALC221_FIXUP_HP_288PRO_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x802e, "HP Z240 SFF", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x802f, "HP Z240", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x8077, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
-- 
2.20.1



