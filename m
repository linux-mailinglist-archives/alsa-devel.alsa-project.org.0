Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89454A1791E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 09:15:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02715603D1;
	Tue, 21 Jan 2025 09:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02715603D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737447309;
	bh=ciwMBV6u6k7Qm8v+ixFk2C777YyYozV0z57KArA6OwE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DWHruSNgZYCH2GnAep6vQGde+5YnQ/o5bCaEnoCzocw4S6zRG5btSmE85fNop3bSn
	 2FgbgrSiRW1vYgE7PU9pSDbav5Md1iiLxa4f3EMbaK+8J383RyiK0nSC1MaIu90/aM
	 uaqDOVn4H4xPVpgJ+LQ1o1e6lIkdcm44QwEuvgN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19745F80636; Tue, 21 Jan 2025 09:14:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D49F80632;
	Tue, 21 Jan 2025 09:14:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45FA3F80482; Mon, 20 Jan 2025 19:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from flow-b5-smtp.messagingengine.com
 (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFFC1F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 19:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFFC1F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fastmail.to header.i=@fastmail.to header.a=rsa-sha256
 header.s=fm2 header.b=oTbBcZA/;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ELp6Cjw0
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 3F3C31D40BC2;
	Mon, 20 Jan 2025 13:16:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 20 Jan 2025 13:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.to; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1737396976; x=1737400576; bh=htPdMNaVScEhUE5bwzly6
	sUrHVWrjD5QQQalSeNYZgk=; b=oTbBcZA/G/jrbANUrl1tWX94YjFBqnBw8Ptil
	hLH+62WtNsJX/yCd0qMr5gtXbT6j0LZ5y1eE+lzvWZ05bpZIK/EPXCQebhO5jI3K
	o5yZ3IL2n0b2NZh18TOhb2Qq+Ug16/19mld6JzKKaMOlvPcjJl07AWBTo5UNjhMR
	i8Q/8IdxBfCuLeD7TcoLKPxJkdjN6aM7ineyShXvSNhEfNLnmDCJK7WDVfofRt07
	ogg8m2XyAqjI7YVjf8sWDsXy+YGzjOp4Vn4bLINDaHLJc05ynPYHd2sKg+jrXZl0
	DQ4XnJZrDHzd20clm92VMSezFpA+9zRF5mHXs127CnjgwAD6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1737396976; x=1737400576; bh=htPdMNaVScEhUE5bwzly6sUrHVWrjD5QQQa
	lSeNYZgk=; b=ELp6Cjw0EZTWNkq2DSE/HPCsVklKnkniZ0h9NuOeTSGYmeBys/j
	nbxB6BS6lnepPrxqDbzPWcSYkPcNVK6UAgNutzA76lLfCAdw4o63bc1rNn2HEDlL
	lsUQ0Wctrti4IHz0WKcChvWEBCAxeDTVXe/BnLcdPVVJI0Fp/cd+wKTr4YnwHf3C
	PvS6x4ficW6mOT4NzyanYwNvcnwKfl9fs6KfX4mj75JC2geTx/LtLdRjuFwPLm7w
	xpac6jjjYWo3Gjx7kLCneY7PJtRaO0NejvhvZzppgL+bgeR0/B3+/c6FfJyVolAW
	civ2PY8iuq07L8NZviRHUyQ4geVDDay8eTw==
X-ME-Sender: <xms:75KOZ2vM17qxzK0ugQNncsOj-UvaB1nsmLpDRpfyYq6aw-R5h7vytA>
    <xme:75KOZ7dHJPRkNZzONtEQPcI5kfAgVqaYP9hVMncVRYsEdXF7NfiBQYWX89j7AzfCz
    R-EDUuvNG2JiyB4V6k>
X-ME-Received: 
 <xmr:75KOZxxL9VFn9WSu3Pt4CPwd8sinklR7SHdTqfdin8b_QFo_Wdba0A_6jteQqt0m-kQ13xRZ7pEF7cbvH0rqTeO4yoc6yx7HARNwFvIztmptMlQM_Me1naq-VMQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeefuddrudeiledguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepufgvsggrshhtihgrnhcuhghivghs
    vgdqhggrghhnvghruceoshgvsgesfhgrshhtmhgrihhlrdhtoheqnecuggftrfgrthhtvg
    hrnhepfeegtdfggeevffehheduvdevkefhhedvfeefgfehvdeuffegvdelffefffehjeet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgvsg
    esfhgrshhtmhgrihhlrdhtohdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheprghlsh
    grqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvg
    gssehfrghsthhmrghilhdrthho
X-ME-Proxy: <xmx:75KOZxOPnxHnWEG-cYfRC_1DjSoPvG09H2DhrLXjfeBjBCgMLWcs9Q>
    <xmx:75KOZ2_BQnfFBMAnaoZQOj7AGbCV-rCWUvFQNd4vPlO1CXLOXBqihQ>
    <xmx:75KOZ5WycNbLcn2fJfiVtOy5Fxw-7YsK4GBD3H53eJLMxhNsGCk7oA>
    <xmx:75KOZ_d4Z9jNDr9RXr93JNgQvMRQcNsxadsGZ-3x5y3FsBELRQwguA>
    <xmx:75KOZ8lJhPWUHiNnV3TPNMDEo11U_4XIN5teKd8ZqKhUWzMU2q9f-8Dr>
Feedback-ID: ic31e489e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jan 2025 13:16:13 -0500 (EST)
From: Sebastian Wiese-Wagner <seb@fastmail.to>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	seb@fastmail.to
Subject: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP Laptop 14s-fq1xxx
Date: Mon, 20 Jan 2025 19:12:40 +0100
Message-ID: <20250120181240.13106-1-seb@fastmail.to>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: seb@fastmail.to
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KNZDU4Y7GK3VJODIYI753IRLYDSRLNWB
X-Message-ID-Hash: KNZDU4Y7GK3VJODIYI753IRLYDSRLNWB
X-Mailman-Approved-At: Tue, 21 Jan 2025 08:13:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNZDU4Y7GK3VJODIYI753IRLYDSRLNWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This HP Laptop uses ALC236 codec with COEF 0x07 controlling the mute LED. Enable existing quirk for this device.

Signed-off-by: Sebastian Wiese-Wagner <seb@fastmail.to>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 46623cd615a4..d3c9ed963588 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10415,6 +10415,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x887a, "HP Laptop 15s-eq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x887c, "HP Laptop 14s-fq1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
-- 
2.48.1

