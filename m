Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35796732DF7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3184593A;
	Fri, 16 Jun 2023 12:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3184593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911330;
	bh=i57qNS+2sh3gzyzCZQ7Cbft8IG32I1yrZjtydsa4q1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BY3mCo/8+pqfJC/2WeiRHm2NTIxOlBc3lqXsyHRRpZvTw36ArvYfwTG8vK6dqKJ+E
	 gqKlV1B5mYUanjMQtEkuuBMMW8zvrU61bsocMIaaWhct4oJ3p6lzz+MJtAf+9ECq/O
	 pjiV48X1k+nWYyAkfcoXchPYl1fIb2GpIx4//ycA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21E8BF805AF; Fri, 16 Jun 2023 12:26:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44E0CF805AF;
	Fri, 16 Jun 2023 12:26:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D09CF805C8; Fri, 16 Jun 2023 12:26:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B3814F805AF
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3814F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iCCgv3kY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DC386360F;
	Fri, 16 Jun 2023 10:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEB1C433CB;
	Fri, 16 Jun 2023 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911160;
	bh=i57qNS+2sh3gzyzCZQ7Cbft8IG32I1yrZjtydsa4q1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCCgv3kYEJf39hl8E96eDx8QibtjpugFFWUQ+kZf/aHNlByRdq1FfXanX+4JCQvwq
	 T+kHrF19D4r0kLO+fMvQpMhxc0OYU71KwaOg4GcvB8VaCmFEwBAg1ddYKm7Ub/TSh9
	 PtFOjEoVl7RuOAjw/DDH/2m+V3gksIBdoYAWB9yQ2DhjesNspSMqgCbBUQIMEvO4XV
	 PjWgN1IzaQeGlKaCDLj4bhm7VMbb96z5heZYVe6T0L2ptG0yH6tZ6ig4X6wIo2GfYK
	 yMBPRwB0L+fXWTKuNGczZg38/Tc29JPbzdmRq1mr4QXek5wgc2CbTcxAmw6X41f3nB
	 jejUb90UILlWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Sayed@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
	perex@perex.cz, tiwai@suse.com, sbinding@opensource.cirrus.com,
	tcrawford@system76.com, andy.chi@canonical.com, luke@ljones.dev,
	tangmeng@uniontech.com, p.jungkamp@gmx.net, kasper93@gmail.com,
	yangyuchi66@gmail.com, yangyingliang@huawei.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 18/30] ALSA: hda/realtek: Add "Intel Reference
 board" and "NUC 13" SSID in the ALC256
Date: Fri, 16 Jun 2023 06:25:06 -0400
Message-Id: <20230616102521.673087-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2MWWLI4CVPSWT55W4YJPSTBPVLLJIQM
X-Message-ID-Hash: B2MWWLI4CVPSWT55W4YJPSTBPVLLJIQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2MWWLI4CVPSWT55W4YJPSTBPVLLJIQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>

[ Upstream commit 1a93f10c5b12bd766a537b24a50fca5373467303 ]

Add "Intel Reference boad" and "Intel NUC 13" SSID in the alc256.
  Enable jack headset volume buttons

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Sayed, Karimuddin <karimuddin.sayed@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230602193812.66768-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7b5f194513c7b..42bd8ae5892b6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9588,6 +9588,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x124c, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x1252, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC225_FIXUP_HEADSET_JACK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
@@ -9807,6 +9808,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
+	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC225_FIXUP_HEADSET_JACK),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
-- 
2.39.2

