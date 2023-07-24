Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7E75E7CD
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA4783B;
	Mon, 24 Jul 2023 03:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA4783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162510;
	bh=UFT2m50D2Nn1qjPyWEjkEpJSXRADF/dHl5hqBmaJDxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aZz5ipOywX1rEKVushH7NJw8WuPnGovhVgHH3Dk/PAgOa+hpEciByR/53kwqSp4OG
	 VvInTybecuM8T6pIqd1ivCo+4SpEBw6ZS+TMcKFikIFGNSx/ZrD5Jt+9oCyNG3YFO6
	 +YCli9eiV64nuVQK7xt4Hhfst1Cx+/oBv/Ewzh7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6720F805AC; Mon, 24 Jul 2023 03:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB58F80589;
	Mon, 24 Jul 2023 03:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E36BF80589; Mon, 24 Jul 2023 03:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5FB4F802E8
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FB4F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c0vVgIrq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6742560FB6;
	Mon, 24 Jul 2023 01:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CD0C433C9;
	Mon, 24 Jul 2023 01:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162352;
	bh=UFT2m50D2Nn1qjPyWEjkEpJSXRADF/dHl5hqBmaJDxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c0vVgIrqy24DWk2Se41heUhUXl9rbsxWu6EJlj+K0oP0dvd85lPPV7b/UsuYW+dMz
	 ge4at6Nc8ynEYUuSlrHp9j7gXxL4DH2e016vObTk04EJxOfAgCGM6/JEIRkX6QxUZf
	 vbxoKCC5oxcvNagGx1YX9slbF0WDp4dTzC7bXZt70QrI3x3oX4HmcZBSTjcXJaX9li
	 FqxL8JuuzjU83GcKNXHMBENVnzx0X3m2jCCNE7VigiQHMubw4JkRqrhPs0oKwzGbbx
	 2K9x87lUgsnay1Edw1asBaPJsV7EX6wosxMSGOZmOPxobQtPzc4GFSe2aS4oFZVsRl
	 KWT1uDnXONd0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 38/40] ALSA: hda/realtek: Add quirk for ASUS ROG
 G614Jx
Date: Sun, 23 Jul 2023 21:31:38 -0400
Message-Id: <20230724013140.2327815-38-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013140.2327815-1-sashal@kernel.org>
References: <20230724013140.2327815-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P65ZPAMJIORX3ZML5WL2VC4JD5R2WRXG
X-Message-ID-Hash: P65ZPAMJIORX3ZML5WL2VC4JD5R2WRXG
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P65ZPAMJIORX3ZML5WL2VC4JD5R2WRXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 33d7c9c3bf70ed91191a2bedbbc03783b824b5de ]

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG G614J series which uses an SPI connected Cirrus amp.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Link: https://lore.kernel.org/r/20230704044619.19343-5-luke@ljones.dev
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e49390b714f61..7534772539316 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9583,6 +9583,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JYR/JZR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
-- 
2.39.2

