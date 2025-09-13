Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19573C474E6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA146024F;
	Mon, 10 Nov 2025 15:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA146024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785951;
	bh=Dv6zSAtrCBxyeEhzC3hUq7L5HZfD7vtK/TqCTcWjyn4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=coSHsCyY+zITayzvYO3rY9bngP4NcrBnQ652h9qVa58VEDIehQOtiK0T8edCL2of0
	 tDGu6fia115BBTKWBihbxfhcxiADBqi0lLu/s+KoeW8GtYpw9Orf7V+/peh5mIBmpX
	 bjW8Iyu3c4ApjBrEZIfQCVsREfxWahh6HRwxvPzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1EA3F8962C; Mon, 10 Nov 2025 15:41:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BECB1F8067E;
	Mon, 10 Nov 2025 15:41:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60622F80301; Sun, 14 Sep 2025 00:38:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B4ED8F80075
	for <alsa-devel@alsa-project.org>; Sun, 14 Sep 2025 00:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4ED8F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inboxia.org header.i=@inboxia.org header.a=rsa-sha256
 header.s=dkim header.b=QQ4pj+V6
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B6A961669AB;
	Sat, 13 Sep 2025 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inboxia.org; s=dkim;
	t=1757803115; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=OKpsQgiTJ2njmnvAgQ8cOrHhf1ic2qR7pqpfcC3YiGg=;
	b=QQ4pj+V6+nSW+ZoiQeJC0EeL1hnhswnclTB6UCrTSSpZ9Txd6SXPxDHRqGlis2c2Ws+gry
	bdfrh3ee4lPOmqBbFUm8pitab4J6UDitwxuL6NYmQKYsilMMBDTPJwER8LsvJiGNSvKR03
	d/36UM5GhRAU29cU85TZfq+E2vwSnklGyWhLETjRS6NvqfKoDWBWNhttb1hTjHm9W1skMG
	cdrv9VzN6fEnouZB6AFguj3H3BaZK95u7Q73pj/orwGdTqn3JbB1Se+Qzo/e0/IV74QKgD
	iqCRkEV1oLRxrRhuA0tZ1CsHEqoKABWWJ+Arcp2nnalIieicyEPxp5ajaaL4dw==
From: Bou-Saan Che <yungmeat@inboxia.org>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Bou-Saan Che <yungmeat@inboxia.org>
Subject: [PATCH 2/2] ALSA: hda/realtek: Support Lenovo Thinkbook 13x Gen 5
Date: Sun, 14 Sep 2025 01:38:25 +0300
Message-ID: <20250913223825.9264-1-yungmeat@inboxia.org>
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
Message-ID-Hash: 4KWTR3RV6CILD4B7DNLK3U2DDOQ5JMMK
X-Message-ID-Hash: 4KWTR3RV6CILD4B7DNLK3U2DDOQ5JMMK
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KWTR3RV6CILD4B7DNLK3U2DDOQ5JMMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The laptop does not contain valid _DSD for these amps, so requires
entries into the CS35L41 configuration table to function correctly.

Signed-off-by: Bou-Saan Che <yungmeat@inboxia.org>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2627e2f49316..36dc0389c9bd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11368,6 +11368,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x392b, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
-- 
2.51.0

