Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E85849477
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 08:24:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4765D1FF;
	Mon,  5 Feb 2024 08:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4765D1FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707117876;
	bh=DzfNcrMGVVNe0g1Bzi+PKDFINCAPm/uODW1o2BkCO+Q=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sKhjuWULd2biULqRIwXjjDzp89p1soSgsLLTC7eQRd6E7jx3zuribSlDGzhJIRb4T
	 W3kC0TAqB3fRIvPugUr7HclJ+K7GPpozDzcCXUqa6OqUAK7DDgikbDZC/pcXOW/z6h
	 LjAlUjR+2d9c2xK+m+HjTxVrWwtiyaOLC2PhqG7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF630F8058C; Mon,  5 Feb 2024 08:24:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41CDAF8058C;
	Mon,  5 Feb 2024 08:24:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5389F801EB; Mon,  5 Feb 2024 08:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB965F8016E
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 08:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB965F8016E
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4157MxLkA3121160,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4157MxLkA3121160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 15:22:59 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.17; Mon, 5 Feb 2024 15:22:59 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 15:22:59 +0800
From: <shumingf@realtek.com>
To: <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, <kailang@realtek.com>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ALSA: hda/realtek: add IDs for Dell dual spk platform
Date: Mon, 5 Feb 2024 15:22:52 +0800
Message-ID: <20240205072252.3791500-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 5CUTA7UVGGUKVR7RNIIS56NZ4MLUVNPG
X-Message-ID-Hash: 5CUTA7UVGGUKVR7RNIIS56NZ4MLUVNPG
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CUTA7UVGGUKVR7RNIIS56NZ4MLUVNPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch adds another two IDs for the Dell dual speaker platform.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dde21bebed17..497c3e829b0f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9581,7 +9581,9 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1028, 0x0c0b, "Dell Oasis 14 RPL-P", ALC289_FIXUP_RTK_AMP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0c0d, "Dell Oasis", ALC289_FIXUP_RTK_AMP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0c0e, "Dell Oasis 16", ALC289_FIXUP_RTK_AMP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1b, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
-- 
2.34.1

