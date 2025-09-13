Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E7C474EC
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:46:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2522C6027F;
	Mon, 10 Nov 2025 15:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2522C6027F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785966;
	bh=Ov+iY87a4T6MxIJwaQ7aBlIVZMr67tRxz1XZAtFSe4M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uTOZrcQkJRqVN1Dt/wGw9Ab1lP3OqcOP6k3txliSkeu5tuZUukPlT5hVeoH0Bm9W9
	 T5wY4vuLme9TKtEVHhtenftFUeriINrTkjcvUUVaTBh2r95iBntM7tp0HrcQuLmxM0
	 CJotQmMsMjGt5va0axE2v7zNPvsvi46NThqHfZe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 444BEF8968D; Mon, 10 Nov 2025 15:41:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D89E6F896B2;
	Mon, 10 Nov 2025 15:41:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F2F2F80301; Sun, 14 Sep 2025 00:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_PASS,T_SPF_HELO_PERMERROR shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.inboxia.org (mail.inboxia.org [95.217.72.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEFF9F80075
	for <alsa-devel@alsa-project.org>; Sun, 14 Sep 2025 00:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEFF9F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inboxia.org header.i=@inboxia.org header.a=rsa-sha256
 header.s=dkim header.b=GYKBAfj/
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EFBC061664F9;
	Sat, 13 Sep 2025 22:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inboxia.org; s=dkim;
	t=1757804069; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TtJUKcztkL0EXNkAHTxW0ZztC2IDBAoAmsySOvYQcCM=;
	b=GYKBAfj/cuYNdOfAd2KE2KB15xNMyyGmU2z5XDnucJBJovXnmsnE9SAcJeomoxotLEleE7
	t/WcqP8x8mcz9msjycpccuvbvysLFXku/bo9dsEt6uwNCp6FqBDOlJi4jEXKIx+QxxfdNE
	96nQji/yem74FztXEtQWHnfpKX/VoZ8A05XbgWN4IuaOT3svBt0TVxi9e4obIrNhyNDkvD
	R5W1aU2KbzBqKM7hpRmF2wyqBw7obLoFk+1skqyyQYelbUsywthxGQWeXfq2jJc9+BQq8R
	2fXrXv8DJ2rf0C13rjwZ9fVqaakeybqQv9/x8No7WffXykhmkkbwK3vJaHp3sA==
From: Bou-Saan Che <yungmeat@inboxia.org>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Bou-Saan Che <yungmeat@inboxia.org>
Subject: [PATCH] ALSA: hda/realtek: Fix volume adjustment issue on Lenovo
 Thinkbook 13x Gen 4
Date: Sun, 14 Sep 2025 01:53:44 +0300
Message-ID: <20250913225344.12822-1-yungmeat@inboxia.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: yungmeat@inboxia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZSIJFGGSNP77IJHJKHSKPIJ2V7RDBAM7
X-Message-ID-Hash: ZSIJFGGSNP77IJHJKHSKPIJ2V7RDBAM7
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSIJFGGSNP77IJHJKHSKPIJ2V7RDBAM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes the volume adjustment issue on this laptop by applying
the necessary quirk configuration for the Realtek ALC287 codec.

The issue was caused by incorrect configuration in the driver,
which prevented proper volume control on certain systems.

Signed-off-by: Bou-Saan Che <yungmeat@inboxia.org>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2627e2f49316..1981e3374b3e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11346,8 +11346,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38bf, "Yoga S980-14.5 proX LX Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38c3, "Y980 DUAL", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38c7, "Thinkbook 13x Gen 4", ALC287_FIXUP_CS35L41_I2C_4),
-	SND_PCI_QUIRK(0x17aa, 0x38c8, "Thinkbook 13x Gen 4", ALC287_FIXUP_CS35L41_I2C_4),
+	SND_PCI_QUIRK(0x17aa, 0x38c7, "Thinkbook 13x Gen 4", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38c8, "Thinkbook 13x Gen 4", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38cb, "Y790 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38d2, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
-- 
2.51.0

