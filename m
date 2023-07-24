Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D197A75E7E9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADA784A;
	Mon, 24 Jul 2023 03:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADA784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162596;
	bh=Q8XHT6Z9pSImRFpAsGhr16MXDJJ4RL/IlXl8gptBKaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mku9pDktTuaCybPl1vNUPIKzrnSjvANcmWrXrZXcjq3d5thpjxp9FJ5kqZXxYroXU
	 wppDsavMZWyqt+JcdBAOcBbhJzfXPIt67LHAQ9QkAveiWaqNQNLIPAtQXBMrxlkAbW
	 9LbLPNk6MhH3eGpHPSeT7kP0qdczqe2vHLsmlnmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B482F805E8; Mon, 24 Jul 2023 03:33:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A00F805E3;
	Mon, 24 Jul 2023 03:33:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A58AF805C0; Mon, 24 Jul 2023 03:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D0DDF805C0
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D0DDF805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RwV8ou2v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84AC460FFD;
	Mon, 24 Jul 2023 01:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B858C433CB;
	Mon, 24 Jul 2023 01:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162401;
	bh=Q8XHT6Z9pSImRFpAsGhr16MXDJJ4RL/IlXl8gptBKaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RwV8ou2vVY7F5fNhnGTT+Uq9xv5THG+ymQ/Xf2Di+R/IW8FvQMbD1HPHD2+1/e8c2
	 S5xsoCQ4T2/Jbq/fR9W8CyGmB7PQIaIQFXsqItM8UPI6puQ9bTBITr3m16Wy4E/vJf
	 liBOxqyChSI1oSc7LTeF0wBjxOGpa28uHvbroqrXU1LHTcaEiq1sI6lUXiqR+JKhno
	 NrWpjkZeknXngRPuEzP97DzWGbnK1nZdjcKobmGROeHJHnNtKv+TL9tSDZOmwbiD8+
	 p7jIpBUoJb81I7qBpA928js7Ztpgm1DZEKNyq84PgzBDhMmTrvxjf7LxtPAEhD6nme
	 fBAL1uUwHcJIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 32/34] ALSA: hda/realtek: Add quirk for ASUS ROG
 GA402X
Date: Sun, 23 Jul 2023 21:32:35 -0400
Message-Id: <20230724013238.2329166-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013238.2329166-1-sashal@kernel.org>
References: <20230724013238.2329166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FQTASL2ZXJBE3UUU7WYXNGX7B6S7GRHD
X-Message-ID-Hash: FQTASL2ZXJBE3UUU7WYXNGX7B6S7GRHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQTASL2ZXJBE3UUU7WYXNGX7B6S7GRHD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 9abc77fb144fe916fd2f592dc4b8c7bade02e58a ]

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GA402X series which uses an I2C connected Cirrus amp.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Link: https://lore.kernel.org/r/20230704044619.19343-3-luke@ljones.dev
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5cb843d56cd16..cad413b4e26e0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9544,6 +9544,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650P", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1463, "Asus GA402X", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
-- 
2.39.2

