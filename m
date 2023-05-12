Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1570028E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 10:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3267B1D7;
	Fri, 12 May 2023 10:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3267B1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683880573;
	bh=GmuHJUkNGNN5xpj8W6Y/DwZ9aMocAotrRCrDsbxHGvw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ad5W9KvRT1kdnxDQftKv9OP1s6fy8b8Jqebrnurgti2CFBw9G3QMEdt4GHuja4jLy
	 z76BkGLJy8muDFmAv4VngcL9hylOY/jzPPc/XkG7geuIM5alUkZNh+uz/raS77Q5ku
	 MDiQdSPRvk3OWXGjbjM7G1OHQMV6z63hmrdXrH+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9156BF8053B; Fri, 12 May 2023 10:35:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F11F2F8032D;
	Fri, 12 May 2023 10:35:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D73B3F8032D; Fri, 12 May 2023 10:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C71BF80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 10:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C71BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=XgmKbCfr
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 28FE34124F;
	Fri, 12 May 2023 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683880506;
	bh=lJQxGTCChL8jXShZ1mLzmFjS0MxpED2G4Ao6MmnOj4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=XgmKbCfrdg2x996gWCGMTKLi7oFMHqO/IriX8Uu7tHjmguH8DYiE7/Tir9ahaAcmp
	 SoJJtDcWSlNInp8EOhf+q6Hp1hMcV90/Dz+8k04/koSmKLsjomcUfjAOXZPqUZ6+lo
	 dfCKN7DSLzlO8oF4aVMuAmni1QwgQzQOpFqHF+zTiq7M9ILbkZatrPuWJbzuNF46qN
	 /mB+yodvsQVAmr0yOqvaIJkCZLYCU6ZxvIowCgRK0zBxUgOcfcri5aNVoZ+yZj1xx/
	 /1rQ6uyRYK2qh3NBAZDGiCsvkAE5qw7Cvr2mKcXef4GX7QcQZpyw2Wa0Kh03lfrA7S
	 h7tGBoLxQIaDg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Andy Chi <andy.chi@canonical.com>,
	Tim Crawford <tcrawford@system76.com>,
	Meng Tang <tangmeng@uniontech.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Philipp Jungkamp <p.jungkamp@gmx.net>,
	=?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
	Yuchi Yang <yangyuchi66@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix mute and micmute LEDs for yet another
 HP laptop
Date: Fri, 12 May 2023 16:34:16 +0800
Message-Id: <20230512083417.157127-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S3X4FDIXXKZEBRZGBRPSFH6AJ7X73VUA
X-Message-ID-Hash: S3X4FDIXXKZEBRZGBRPSFH6AJ7X73VUA
X-MailFrom: kai.heng.feng@canonical.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3X4FDIXXKZEBRZGBRPSFH6AJ7X73VUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There's yet another laptop that needs the fixup to enable mute and
micmute LEDs. So do it accordingly.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 172ffc2c332b..2e3f87e9b4ee 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9480,6 +9480,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b8f, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
-- 
2.34.1

