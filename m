Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86267532E1D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 18:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2375E1715;
	Tue, 24 May 2022 18:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2375E1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653408075;
	bh=SnMXS8KshPQ2ZE1w7Fbsl9Bsv4BSvelq1coS+At5urA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1ISE95aCVGFw8K3M5TfrUfmz7U+vSj9sGVyisZlgrVYenVnFdxJ9oWzftjFfFPIp
	 A37HAkrdQJ5vFgOa4UBbj/O+IqCQJkpwCnt+VPdh1lO8hWT/pFLJjwtcmcxPsn7OYF
	 k17e7Dgp4B+NhnTFfomxtCBBuK4dSwZCe2WAXNQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E6BF80516;
	Tue, 24 May 2022 17:59:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D4D8F804FD; Tue, 24 May 2022 17:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E323F80116
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 17:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E323F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XxrVf4Gs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AE57B819DC;
 Tue, 24 May 2022 15:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37660C34118;
 Tue, 24 May 2022 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653407977;
 bh=SnMXS8KshPQ2ZE1w7Fbsl9Bsv4BSvelq1coS+At5urA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XxrVf4GsYz2qO8yktRR9fZKfW1/wA6JtOp2NKy88SWb8VcY5qeV5tJRvPZqE4P0FF
 DTkEz1ppqxQM6DJRjE2k842ZO50HJ15VL9HJ/DRmt70RcTvuAPa8aE+9KQyXi7DsCc
 od/ORH/9kLEFLdCjitprb+wkLDLDRFmyRLppb9JRpSlbdfnuVQMJTE+t+GIuF7RyKC
 7SuYaHTvFtfiiSO+iDDC3hpIzHpVsylacRPor1/1mxInyOcJkAmY3v9snlnr6NDj6a
 LW2phMRHViXOFNzE0E2ESLQVoPaRIH1rScoOUoFxnU7jgrBFYFSYZY3Tdw58RRk8Jc
 r3375DAbR4iQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 02/12] ALSA: hda/realtek: Add quirk for Dell
 Latitude 7520
Date: Tue, 24 May 2022 11:59:16 -0400
Message-Id: <20220524155929.826793-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524155929.826793-1-sashal@kernel.org>
References: <20220524155929.826793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kailang@realtek.com, tanureal@opensource.cirrus.com, jeremy.szu@canonical.com,
 Takashi Iwai <tiwai@suse.de>, Gabriele Mazzotta <gabriele.mzt@gmail.com>,
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

From: Gabriele Mazzotta <gabriele.mzt@gmail.com>

[ Upstream commit 1efcdd9c1f34f5a6590bc9ac5471e562fb011386 ]

The driver is currently using ALC269_FIXUP_DELL4_MIC_NO_PRESENCE for
the Latitude 7520, but this fixup chain has some issues:

 - The internal mic is really loud and the recorded audio is distorted
   at "standard" audio levels.

 - There are pop noises at system startup and when plugging/unplugging
   headphone jacks.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215885
Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Link: https://lore.kernel.org/r/20220501124237.4667-1-gabriele.mzt@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 51c54cf0f312..8425eadf6873 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6775,6 +6775,41 @@ static void alc256_fixup_mic_no_presence_and_resume(struct hda_codec *codec,
 	}
 }
 
+static void alc_fixup_dell4_mic_no_presence_quiet(struct hda_codec *codec,
+						  const struct hda_fixup *fix,
+						  int action)
+{
+	struct alc_spec *spec = codec->spec;
+	struct hda_input_mux *imux = &spec->gen.input_mux;
+	int i;
+
+	alc269_fixup_limit_int_mic_boost(codec, fix, action);
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		/**
+		 * Set the vref of pin 0x19 (Headset Mic) and pin 0x1b (Headphone Mic)
+		 * to Hi-Z to avoid pop noises at startup and when plugging and
+		 * unplugging headphones.
+		 */
+		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
+		snd_hda_codec_set_pin_target(codec, 0x1b, PIN_VREFHIZ);
+		break;
+	case HDA_FIXUP_ACT_PROBE:
+		/**
+		 * Make the internal mic (0x12) the default input source to
+		 * prevent pop noises on cold boot.
+		 */
+		for (i = 0; i < imux->num_items; i++) {
+			if (spec->gen.imux_pins[i] == 0x12) {
+				spec->gen.cur_mux[0] = i;
+				break;
+			}
+		}
+		break;
+	}
+}
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -6816,6 +6851,7 @@ enum {
 	ALC269_FIXUP_DELL2_MIC_NO_PRESENCE,
 	ALC269_FIXUP_DELL3_MIC_NO_PRESENCE,
 	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
+	ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET,
 	ALC269_FIXUP_HEADSET_MODE,
 	ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC,
 	ALC269_FIXUP_ASPIRE_HEADSET_MIC,
@@ -8772,6 +8808,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
 	},
+	[ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_dell4_mic_no_presence_quiet,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8862,6 +8904,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x09bf, "Dell Precision", ALC233_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a2e, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a30, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1028, 0x0a38, "Dell Latitude 7520", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE_QUIET),
 	SND_PCI_QUIRK(0x1028, 0x0a58, "Dell", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a61, "Dell XPS 15 9510", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0a62, "Dell Precision 5560", ALC289_FIXUP_DUAL_SPK),
-- 
2.35.1

