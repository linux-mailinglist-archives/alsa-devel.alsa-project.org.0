Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7A875E7F4
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F727E84;
	Mon, 24 Jul 2023 03:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F727E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162616;
	bh=0Z0JrbJN2SlFF88D41IRE+dI2kuoDTLrSuWBhIDPHJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFZwpwS6qWDps0gZKNfSg+a7djY8Hc9mNXby2NpZkmpErjQJwVWMoTQGUIPVMVu2m
	 wHvX3FI5Iin82DolEVoqaMAg88ql1B3KCReo+OBmRYHxwUaa7vvkv+IJxc66m3ScJr
	 cgS1PXyxLbmPmKCRkM544RFLIi0SaUFLdJ3swWZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1DACF805F7; Mon, 24 Jul 2023 03:33:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 361CBF805EF;
	Mon, 24 Jul 2023 03:33:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31F41F805D3; Mon, 24 Jul 2023 03:33:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 38061F80310
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38061F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B2KJD7H5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2949B61001;
	Mon, 24 Jul 2023 01:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27B9C433CB;
	Mon, 24 Jul 2023 01:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162404;
	bh=0Z0JrbJN2SlFF88D41IRE+dI2kuoDTLrSuWBhIDPHJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2KJD7H57xoHvcn6m2KwjL+9HO0Gxme64Cn1yMMfpr8KdBubyIaKhZ8nLAt6VUstQ
	 i+cLXwi7hD1cEzU8TWOZsMU+rfUUeJ1lPI+muQqWW8EqN57bEJyvudOMtcB/PF47Fh
	 Glx/UGf7yMFhfC2HDM9lDRfd6gtats5vR7rO4QT7dT100Vt/DFSkxV23HH+F4qPOJ2
	 YjwasjBQplyuo97JhfvHUvMKzkgvjuClseYpac2YoH6X/MeiC/s1TDbWqmlZ8i43PW
	 b8pqfvCFaQcut7cW6svOVnHqvw/b686NSpFV4AI8lBkGkx3ZQJvabyd6dmHRw584Ct
	 QOTkg3AZ4cx+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 34/34] ALSA: hda/realtek: Add quirk for ASUS ROG
 GZ301V
Date: Sun, 23 Jul 2023 21:32:37 -0400
Message-Id: <20230724013238.2329166-34-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013238.2329166-1-sashal@kernel.org>
References: <20230724013238.2329166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SUEZITH4SNFKZHE4W3MN42W4JUCSZDQ3
X-Message-ID-Hash: SUEZITH4SNFKZHE4W3MN42W4JUCSZDQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUEZITH4SNFKZHE4W3MN42W4JUCSZDQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 5251605f4d297a0eb5d3b7f39f9dcee9e4d0115a ]

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GZ301V series which uses an SPI connected Cirrus amp.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Link: https://lore.kernel.org/r/20230706223323.30871-2-luke@ljones.dev
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cad413b4e26e0..7a5ce1db75cf3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9548,6 +9548,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
+	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
-- 
2.39.2

