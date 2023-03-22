Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952B6C4F87
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 16:35:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E1A7E99;
	Wed, 22 Mar 2023 16:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E1A7E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679499327;
	bh=mhDPLCXiWwyQ7liE3k4hthgkZBaW2DfXC0wvn7367zM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nZOxQLeyFhmsLQAVSzR2hxKlwSt+R6/M1n1uQO2QzayKcBgIi15lVFDUSJV9e8ngf
	 RNgsx6KlsAnJTkU4n8v9/EkHqbQ18R7OQnRJN4sfNmpq1L8rnjlZBrxyNuTjDVUcJL
	 DmI4lo6Z3ZucDdAMRJCj/TrB1/m1NcK37bPwsLOg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D270F8024E;
	Wed, 22 Mar 2023 16:34:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C0A9F8027B; Wed, 22 Mar 2023 16:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 865F7F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:34:27 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B07C811CF;
	Wed, 22 Mar 2023 16:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B07C811CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1679499266; bh=mAapAaud0Uf41ah5JIg8B1goYGWd8TYnMMUgfkcJRYs=;
	h=From:To:Cc:Subject:Date:From;
	b=wgJWgQt8n2yBdeuZqr/U048iQcwqqcVIUQIwZB8u/p47pu6YQYk72Qxhg9vns+Eos
	 xwINimSLP5QAGMDkrgiMbxF2+S/bu1vO9t4GKZOtFvs9FYs0gDuuHco/9AvRvFl9sj
	 KznzgTAlgYiviQESviNoF2HnSKvykQzmY1cwFxaA=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 22 Mar 2023 16:34:23 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/realtek: Fix support for Dell Precision 3260
Date: Wed, 22 Mar 2023 16:34:04 +0100
Message-Id: <20230322153404.386473-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ABVTKSKE3KBC3CAIHUI5V7P2DILPJWRT
X-Message-ID-Hash: ABVTKSKE3KBC3CAIHUI5V7P2DILPJWRT
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABVTKSKE3KBC3CAIHUI5V7P2DILPJWRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unfortunately, in commit 5911d78fabbb a wrong codec patch was selected.
The model=alc283-dac-wcaps is equivalent to ALC283_FIXUP_CHROME_BOOK not
ALC295_FIXUP_CHROME_BOOK.

Fixes: 5911d78fabbb ("ALSA: hda/realtek: Improve support for Dell Precision 3260")
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f09a1d7c1b18..3a304010bc9f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9260,7 +9260,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a62, "Dell Precision 5560", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1028, 0x0ac9, "Dell Precision 3260", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x1028, 0x0ac9, "Dell Precision 3260", ALC283_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
-- 
2.39.2

