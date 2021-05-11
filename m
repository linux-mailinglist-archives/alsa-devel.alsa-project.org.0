Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4EB37A725
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 14:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D49717C0;
	Tue, 11 May 2021 14:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D49717C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620737605;
	bh=repLIb2OVydqXuT1AwYdJsrB7hRd7eM7lHMZ+tL84zA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MLl48rhAUGKvpOQb4iL6VNOhRxGTgTS2v/Kqs85/bEpUsVqMaIpxbYOLY3McbABAc
	 9Za9s4NNJVw23biMGkdaRTtBpgIYGTStXc6Bl5Xmlr/mZyM1RMePVZaDwoA2zvh6U4
	 PlX3KfX0X1e3zxZWR3BXvRezsTR15x5AeRWLWL+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F65F8016B;
	Tue, 11 May 2021 14:51:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBABF80163; Tue, 11 May 2021 14:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05D10F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 14:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D10F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TfrLT7I8"
Received: by mail-ej1-x632.google.com with SMTP id w3so29600635ejc.4
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Vz3NVjeSduBFGcr7e4KNuJw+YQxjHIZNkFnnUo3vhA=;
 b=TfrLT7I8hBPUsbCgT5nmLrSnP1r7AhcYkJEB3XXNnc8qRQW9Q8HnoPYQGyuiQK2TbQ
 EbaJARNMC1mqSnRB/2XcZ5olBFCG8P97ocjZbFGdBWyqpV0ql08dGRPgcdB31t61zodP
 +L0p8pjCMHASUzN9j3WA9u3dEiiOc+15mKk4V8EnEV/Nny9eK78nOR9odhelbo2Cnukf
 0kKKLqlTKlMG00Azf2556mgpDOnXYS0RH8RYThM6giyQLFwpeFuJeWmV3u5RvksJkKbc
 G8ruV+xoxRHwSwGUK4yEsoo2+XEKFPsUYoM0se+KJEOFMxf1iG5DFmaU/AJSkRFLnMkC
 Xi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Vz3NVjeSduBFGcr7e4KNuJw+YQxjHIZNkFnnUo3vhA=;
 b=SWc0zsjDcha1hKJmuPyrMByGFnOC7eI3JO0G2e8CcVdVPV5mki9/4Qzzh9gsexsLjL
 6ib11Ob4KNYE3v7glmJkrC4DxEa0uwbSKZokC8qZovY4qAC+afLiLQPSKSV0Id8i29B1
 xQOH7/uxndY2dQ251uSdo6wbzGGo8gyyc3rwvE9F7lnL6AU5Ch2OM5fMjqI6mpvOv+Al
 nQl9Emb6MrcYPseJxSZBjXd+3vTP/OM5/7dbZBrusv6cjzL6Im1c1peKwfTYz4Agi6B2
 /z7zTEy6DRNbEHEzPHe0Nkcz5DHTd6IB684wnOetDo3gh0cO9YIB6Tj2qH1kZ/NCwcIj
 SALw==
X-Gm-Message-State: AOAM533v/vXV/xkwIryJXNI1gKKpoamvo117JttPdDJ5f51Yx6RHg0Em
 PmyBFrQgJJ0l6DqWga+MBTG0QNHT+KApQEoO
X-Google-Smtp-Source: ABdhPJyXRhNHpJwPFimIfNRvAdJwYclnTh5DYMJmV8PxCXAGY/nYbXtvLNcUy0Zh6uqXOd1GETbfTg==
X-Received: by 2002:a17:906:f56:: with SMTP id
 h22mr31470771ejj.366.1620737512992; 
 Tue, 11 May 2021 05:51:52 -0700 (PDT)
Received: from spectre.. (host-79-47-116-73.retail.telecomitalia.it.
 [79.47.116.73])
 by smtp.gmail.com with ESMTPSA id h4sm13093391edv.97.2021.05.11.05.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 05:51:52 -0700 (PDT)
From: Elia Devito <eliadevito@gmail.com>
To: 
Subject: [PATCH v2] ALSA: hda/realtek: Add fixup for HP Spectre x360 15-df0xxx
Date: Tue, 11 May 2021 14:46:49 +0200
Message-Id: <20210511124651.4802-1-eliadevito@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <s5ho8dhd4b3.wl-tiwai@suse.de>
References: <s5ho8dhd4b3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>
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

Fixup to enable all 4 speaker on HP Spectre x360 15-df0xxx and probably
on similar models.

0x14 pin config override is required to enable all speakers and
alc285-speaker2-to-dac1 fixup to enable volume adjustment.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=189331
Signed-off-by: Elia Devito <eliadevito@gmail.com>
---
v2: Put the quirk entry in the PCI SSID order

 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b4b71609dff1..3e269de84079 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6542,6 +6542,7 @@ enum {
 	ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST,
 	ALC295_FIXUP_ASUS_DACS,
 	ALC295_FIXUP_HP_OMEN,
+	ALC285_FIXUP_HP_SPECTRE_X360,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8099,6 +8100,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HP_LINE1_MIC1_LED,
 	},
+	[ALC285_FIXUP_HP_SPECTRE_X360] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170110 }, /* enable top speaker */
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8259,6 +8269,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_HP_SPECTRE_X360),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8724, "HP EliteBook 850 G7", ALC285_FIXUP_HP_GPIO_LED),
@@ -8665,6 +8676,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
 	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
+	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.31.1

