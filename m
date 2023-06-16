Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820F732E4D
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:31:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F0982A;
	Fri, 16 Jun 2023 12:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F0982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911460;
	bh=i57qNS+2sh3gzyzCZQ7Cbft8IG32I1yrZjtydsa4q1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FnRk8D/M+d2sOWcwf9dCYi6EQRldmiIMWnFp6EZV1hPSFZa7i1ibcEt9MvvxPpYbZ
	 ppfyOENqOLXr38rtLAdkxyUuarZWwZ9JnZL2Uw5l1qBqFDmncGd0C2VDROsbhnR3ka
	 t5TlcTlgSzY77wDB9bYKCaclUgakhpEGeo33KUbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8C9F8060F; Fri, 16 Jun 2023 12:27:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 681C3F80551;
	Fri, 16 Jun 2023 12:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24475F8057A; Fri, 16 Jun 2023 12:27:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 60561F80603
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60561F80603
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LdcqmpaJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E68F635B4;
	Fri, 16 Jun 2023 10:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5BCC433C8;
	Fri, 16 Jun 2023 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911220;
	bh=i57qNS+2sh3gzyzCZQ7Cbft8IG32I1yrZjtydsa4q1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LdcqmpaJeAd/CgE60f3NJg9pbHcCwFagCfrHpu9ZgXlyQpUK7HRnQIrdao5HymXO6
	 24qUbNc2N/GiLKBdMTP91NZYok7uK71hXhSduFqFTmEJDTH8DVscB2J8IbetFMpPPL
	 ZN16qfDHO1sk5TADeC+84kCMsannyNhThFtrg/5Qggjv8RJvyZ3RhdO94CRt22DGYO
	 dsE5beFmddyi8B90/6cFW/uMYqd7dpSML3sCMoAoZ+6eMJeRs1Nem8S7vM5IBMzhMz
	 zq/0TITKNK10p8tPWy2Va4db8h3OWJbwFQJhwvdh4vKrQGC/cgj6fc2VYyhT8hgIqk
	 7kpVFQR6LwEKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Sayed@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
	perex@perex.cz, tiwai@suse.com, sbinding@opensource.cirrus.com,
	tcrawford@system76.com, tangmeng@uniontech.com, luke@ljones.dev,
	andy.chi@canonical.com, p.jungkamp@gmx.net, kasper93@gmail.com,
	yangyuchi66@gmail.com, yangyingliang@huawei.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 16/26] ALSA: hda/realtek: Add "Intel Reference
 board" and "NUC 13" SSID in the ALC256
Date: Fri, 16 Jun 2023 06:26:13 -0400
Message-Id: <20230616102625.673454-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102625.673454-1-sashal@kernel.org>
References: <20230616102625.673454-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.34
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4AURSLYVUR6WHTSB6A57SMXEMIY3P4K4
X-Message-ID-Hash: 4AURSLYVUR6WHTSB6A57SMXEMIY3P4K4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AURSLYVUR6WHTSB6A57SMXEMIY3P4K4/>
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

