Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E465E4C5
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 05:43:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A24F01B;
	Thu,  5 Jan 2023 05:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A24F01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672893833;
	bh=YgUFcd87x8BlxCu0A4w3GII4GIObo9pYYeev1HobmhI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IVdZH9qyLNJslUPZPZD0ZvsndsrfE9XXY263GyJ+HpSILcPWH6x1gJrZY188oXRLE
	 YyuquvJyjs2KRvmMX8f0Ls6tjNw1pa1UfbHvOwze/c/NXrLYKieqQbx+CBhmK5p+Se
	 nzSj/DBlFKSwNv+lXVdlI4/0V8Sql1ZnPPCfvmU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD4DAF8022B;
	Thu,  5 Jan 2023 05:42:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B53F1F804AA; Thu,  5 Jan 2023 05:42:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DC6BF80238
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 05:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DC6BF80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=SPCZg9iC
Received: from localhost (36-226-179-107.dynamic-ip.hinet.net [36.226.179.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7F4C743586; 
 Thu,  5 Jan 2023 04:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1672893757;
 bh=tuX7FpbuFjmLFyhbHFuS7lFvYiGSSpdrXN3U+7iok5A=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=SPCZg9iCFDGxIP6lBzZS5J5+xaHIooUiz07XlAAaURlticpeCnSKFFneKLcvlTHer
 ZGt33Kpkv2mRJ/xQjjotseVkjGl/6Mh7s2qGiaUU32pxOGdtFdAy8N0FOCRXhfmfYg
 OWW5QINQN9YrJ1R2q6xOjUSeFwuFUeJQWqsniamfRL36fmbgh1JqekENLQj7u9yLE5
 yu3jR83/J9vMKfkbB3afaW+wVzvXn2XgCGZ+WAURG9nFuX8JJOxhrGU0eOtq0BzTkZ
 f0M5p7uV4XzG4UtAJVc3bYUyLqDXXoeOfyZS81Lwh19bDMMZDPN/VZ4NTuQ6jUw4Zf
 iAdKql2lZ5Gtg==
From: Jeremy Szu <jeremy.szu@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for a HP
 platform
Date: Thu,  5 Jan 2023 12:41:53 +0800
Message-Id: <20230105044154.8242-1-jeremy.szu@canonical.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Meng Tang <tangmeng@uniontech.com>,
 Philipp Jungkamp <p.jungkamp@gmx.net>, Yuchi Yang <yangyuchi66@gmail.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Tim Crawford <tcrawford@system76.com>,
 =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is a HP platform uses ALC236 codec which using GPIO2 to control
mute LED and GPIO1 to control micmute LED.
Thus, add a quirk to make them work.

Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index eda4914b8aeb..8362eb4642d8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9409,6 +9409,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b5d, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.38.1

