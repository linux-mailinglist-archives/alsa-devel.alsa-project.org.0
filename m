Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D28390090
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 14:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52FBA1732;
	Tue, 25 May 2021 14:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52FBA1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621944284;
	bh=hOHaeb7zaT8n5sj5HwtMCGxbezkzBaol30xrHpX7/oc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J/VqLadBe1RjnYK/j0dic+VRlWGRUhrHpdwLlcennIxZaT5EAuf3RM/i2o1mMBOGt
	 YcFjfZpucvKL5VE+MFbGyVYnWAkyJnaid5MNNdxE9zuuAqwjisWNaWsF8FNWdAoU9J
	 nWPk1RtYYW8nJy68tJMAXpKTTt71ATG+c8KeNbrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF277F80113;
	Tue, 25 May 2021 14:03:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EDA9F801EB; Tue, 25 May 2021 14:03:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A10DF8011B
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 14:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A10DF8011B
IronPort-SDR: hWkX/BCnT4BB/H7yfHLrXJYUrh0cs/2QjVU1bgik8aL/vMmklI74ZpwCgmvS1Jw7gAhi53bxaK
 wrCuvUN4l7ow==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="202193148"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202193148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 05:02:18 -0700
IronPort-SDR: N16azn8n/JWm/bJvi6Mb36i28WIa9DDjCRa4doRIDdz21vXkDsrGA9IH9evQgNcp1X+Py/V8v6
 u8LQLfQYziug==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="476390184"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO
 peter-virtualbox.ger.corp.intel.com) ([10.252.39.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 05:02:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	hui.wang@canonical.com
Subject: [PATCH v3] ALSA: hda/realtek: Chain in pop reduction fixup for
 ThinkStation P340
Date: Mon, 24 May 2021 23:37:26 +0300
Message-Id: <20210524203726.2278-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

Lenovo ThinkStation P340 uses ALC623 codec (SSID 17aa:1048) and it produces
bug plock/pop noise over line out (green jack on the back) which can be
fixed by applying ALC269_FIXUP_NO_SHUTUP tot he machine.

Convert the existing entry for the same SSID to chain to apply this fixup
as well.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Takashi,

Changes since v2:
- rebased on sound.git for-linus branch

Changes since v1
- instead of deny_list use chained fixup to fix the plock/pop noise

Changes since RFC:
- Fixed up the PCI ID

ever since I have this workstation (three weeks) the plock/pop noise on playback
start bugged me. So far the only solution I have found is to disable the
power_save which I find acceptable on a desktop compared to the pops.

The alsa-info.sh output is can be found here:
http://alsa-project.org/db/?f=414b1b236fc73db386ad4f938bc3b304f6b30b05

Missing details from alsa-info output:
# lspci -nnk | grep -A2 Audio
00:1f.3 Audio device [0403]: Intel Corporation Comet Lake PCH cAVS [8086:06c8]
        DeviceName: Onboard - Sound
        Subsystem: Lenovo Device [17aa:1048]

CPU: i9-10900k

The machine have ALC623 codec and the jacks are correctly discovered and they
do what they supposed to be.
When I have the headset connected to the front and audio is routed there the
line out (green jack) from the back still prodices the plock/pop.

Is there a known quirk for similar issue or a better way to handle it?

[1] https://lore.kernel.org/alsa-devel/20210524152533.7479-1-peter.ujfalusi@linux.intel.com/

Thanks you,
Peter Ujfalusi

 sound/pci/hda/patch_realtek.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6571c3713732..90bf0d3a830a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6567,6 +6567,7 @@ enum {
 	ALC295_FIXUP_HP_OMEN,
 	ALC285_FIXUP_HP_SPECTRE_X360,
 	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
+	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8139,6 +8140,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC623_FIXUP_LENOVO_THINKSTATION_P340] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_no_shutup,
+		.chained = true,
+		.chain_id = ALC283_FIXUP_HEADSET_MIC,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8457,7 +8464,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0xc019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xc022, "Clevo NH77[DC][QW]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC233_FIXUP_LENOVO_MULTI_CODECS),
-	SND_PCI_QUIRK(0x17aa, 0x1048, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x1048, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
 	SND_PCI_QUIRK(0x17aa, 0x20f2, "Thinkpad SL410/510", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x215e, "Thinkpad L512", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x21b8, "Thinkpad Edge 14", ALC269_FIXUP_SKU_IGNORE),
@@ -8724,6 +8731,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
 	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
 	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
+	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.31.1

