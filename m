Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54329742C99
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 21:02:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF7D846;
	Thu, 29 Jun 2023 21:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF7D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688065366;
	bh=lXAIcOYJ04rYnjX1H6sNHonDK/FOgyHGfIdz8ibt4dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nJ3FzIKkng3fvlSgGQ74DmClOiqvQEoWdI45z91LhTsFVQFb2KC0GY/2i7rnVJY+t
	 pFbLRuLOBwgWaKkMy1UqN9J1Yv2Zc5Mz9mesl9sP9MQA/0GQ2BvrqcUFHlShqk+DdZ
	 lqW6k+Jtcsnrx7x67wfZihA1gAPcvnWytfwLRqGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 569D8F80557; Thu, 29 Jun 2023 21:01:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E76F8055B;
	Thu, 29 Jun 2023 21:01:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4376FF8055C; Thu, 29 Jun 2023 21:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C83CFF80544
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 21:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C83CFF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ocJLR3R+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DACA16162C;
	Thu, 29 Jun 2023 19:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3723FC433C9;
	Thu, 29 Jun 2023 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688065290;
	bh=lXAIcOYJ04rYnjX1H6sNHonDK/FOgyHGfIdz8ibt4dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ocJLR3R+Y4Kp0qBlAFzijJ2IZ/wkt64BKMCH6Q0iaqxUN6MURIWtTBqDNSDwQAwSM
	 xuQvNoIfnDPHhPOOYU/ofa/ZG52yrBb7+wxP+ymg1tcGw3D8aiqJ5n8xFQLXyMimlD
	 XIF94QTSjhj9HFl6U07zI7IhDaHbHLQ6mX1i5ST3MOa+260thqslvnFt1TfmEv8EDj
	 MYDC8Emylb7+gIp/Dz+Uk8sXenxdEKfjdUBDlVZLC0pWtNVMYojMp09Slrc0ry7NFk
	 L2JgpwHOnFlilZRyJQY2JMnL1MYmy9wkmj7CynM53GCLUqXhvwOPr8+a7H1SZ/5ENt
	 WR9XW3H1aqzzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tcrawford@system76.com,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 16/17] ALSA: hda/realtek: Add quirk for ASUS ROG
 GV601V
Date: Thu, 29 Jun 2023 15:00:45 -0400
Message-Id: <20230629190049.907558-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629190049.907558-1-sashal@kernel.org>
References: <20230629190049.907558-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WJJDH46EEAPK7VNHQROX43EXWTZ6B6FF
X-Message-ID-Hash: WJJDH46EEAPK7VNHQROX43EXWTZ6B6FF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJJDH46EEAPK7VNHQROX43EXWTZ6B6FF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 82edd1bd7f98567928871e2a2a317724d35f0085 ]

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GV601V series.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Link: https://lore.kernel.org/r/20230621085715.5382-1-luke@ljones.dev
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3889701bdb1c9..0547f60a400e7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9527,6 +9527,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.39.2

