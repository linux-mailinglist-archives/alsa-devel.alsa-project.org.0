Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C4802F8D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 11:05:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D50950;
	Mon,  4 Dec 2023 11:05:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D50950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701684340;
	bh=m7edb4lupQjDpnTb4bRcxZuC1/LcRWfYGplI/Jf0n8A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ER1XxRQ4Ydb438Rtb+KqbviNKb2/5zDNJkIK9pw6KBfELu7xEDTswSE4gT5FCq/nb
	 Eno5zAogMVoDwUlJpuDqZ9kwEnCKus3bQI8V69bLB3Tupv9Un35h5Abj57BFAAkkBP
	 u808P6xYKYwqhnJuMT8MFYxhMNWXTaqDipuMXspE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE94FF80570; Mon,  4 Dec 2023 11:05:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F9DF8055A;
	Mon,  4 Dec 2023 11:05:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A2E8F8024E; Mon,  4 Dec 2023 11:05:03 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B2E7FF800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 11:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E7FF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=MjbGdsQd
Received: from binli-P1G5.. (unknown [103.229.218.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 18D8E3F280;
	Mon,  4 Dec 2023 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701684295;
	bh=gRcgEI7RGIHJ0Yu30p47NQQFOUT4LXqjIPSeJERS6Us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=MjbGdsQdTZ3KeSHpFebs8fd9kAje64p2cWi3rQi2nKRAP46orKfWLvhZlhm2f0Yxq
	 kzEWArjAc8cM/hn64olhf8MGcBKJKFL5clG4lh8fpCYyxgqpiLuBUi3zudVjraJgO7
	 rSKBZFMdyuBQmjD6Y09u+6WdXPVgCb3Y2MwC6Q+fSO1ZedfjQLmgdeVMBM9Jz79RQP
	 JwsF/CpCt8GxwKQbKiLPdgHiMrgbYdWhYpGTNzE1m/wvYrp/oKtwT7z3UjzpLsFCmF
	 dKx3cTxuv5PBkjiCGMK2Iig7plXQ0d/0rR8f1hbrZdHbxZPUX36pSoBM99qSW3BTA7
	 VG0VYCnDjbJtw==
From: Bin Li <bin.li@canonical.com>
To: tiwai@suse.com
Cc: kailang@realtek.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	aaron.ma@canonical.com,
	libin.charles@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Enable headset on Lenovo M90 Gen5
Date: Mon,  4 Dec 2023 18:04:50 +0800
Message-Id: <20231204100450.642783-1-bin.li@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VMENBURAMGQJXA6MROYNOP45ABQSCICH
X-Message-ID-Hash: VMENBURAMGQJXA6MROYNOP45ABQSCICH
X-MailFrom: bin.li@canonical.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMENBURAMGQJXA6MROYNOP45ABQSCICH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lenovo M90 Gen5 is equipped with ALC897, and it needs
ALC897_FIXUP_HEADSET_MIC_PIN quirk to make its headset mic work.

Signed-off-by: Bin Li <bin.li@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..08ed008a63a4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -12196,6 +12196,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x32f7, "Lenovo ThinkCentre M90", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3321, "Lenovo ThinkCentre M70 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x331b, "Lenovo ThinkCentre M90 Gen4", ALC897_FIXUP_HEADSET_MIC_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3364, "Lenovo ThinkCentre M90 Gen5", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3742, "Lenovo TianYi510Pro-14IOB", ALC897_FIXUP_HEADSET_MIC_PIN2),
 	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo Ideapad Y550P", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Ideapad Y550", ALC662_FIXUP_IDEAPAD),
-- 
2.40.1

