Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E64DD090
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 23:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B90E418BF;
	Thu, 17 Mar 2022 23:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B90E418BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647555225;
	bh=I2rOlZBp/Y8YpX+WD2ONJtu7x0j9d3GByjrH/JwyxQU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PjYEf7TOtTT5s7am+WsqMxmtW44R6xPH4vcDKXo43DWWEvKv2OT8zwvZlYtJCg7DP
	 BssDq2PlQGm/rSoWuKMmnDT8mNzOufFjEZf45gASftzt3oCyTzDTpytl4P1BlyFdxk
	 1lxdGvdER34wqpkxya6zWOjAhaZX9c176MyYnqlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13675F8014C;
	Thu, 17 Mar 2022 23:12:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D83F9F8013F; Thu, 17 Mar 2022 23:12:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7620F80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 23:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7620F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="JScbuvNg"
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7191141922; 
 Thu, 17 Mar 2022 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647555144;
 bh=GSGY9xvV7/cHW9kKHfcQPWbJ+8pjDmIgHHQ0jRgjQco=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=JScbuvNgfJZNPo1B66r4RAkRLKVBcNqKt8K4fDEm256jiBV082ldnIN/HDpvk2GIV
 N7O3WsfUQcAVJ7jJwWA975ldgqNiVzKcAeErTDsZEstxTSlhct9YAH/PW/daDLrqMo
 vGkcqHXLdcCo47/L+tqPFYIWinaIGxEVLmYN/vbIi8i3qikGyAyLo9wkLWZdFaWSia
 6F9xztHCbQJexrIDqWJhWeoFV/7V0a1ThciivQDsLCRI+F0psxRvpyJdfLygp+iUSq
 Rs5V+lutFWF8KMwavhUCsR9zO6WIVAOayqVUwomxFsleeIRQ8IbCU9rLtoxmNa1WZ9
 lErm8GMbgnLKg==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Fix LED on Zbook Studio G9
Date: Fri, 18 Mar 2022 06:11:33 +0800
Message-Id: <20220317221134.566358-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Kailang Yang <kailang@realtek.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Commit 07bcab93946c ("ALSA: hda/realtek: Add support for HP Laptops")
breaks mute and micmute LEDs because it changed the LED quirk from
ALC285_FIXUP_HP_GPIO_LED to ALC245_FIXUP_HP_GPIO_LED, so change it back
here.

Also reorder the chain of quirks to ensure LED quirk is the last one
being applied.

Fixes: 07bcab93946c ("ALSA: hda/realtek: Add support for HP Laptops")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4650ef9110d62..1d14be4ee31d8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8773,9 +8773,9 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc245_fixup_hp_gpio_led,
+		.v.func = cs35l41_fixup_spi_four,
 		.chained = true,
-		.chain_id = ALC245_FIXUP_CS35L41_SPI_4,
+		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
 	},
 	[ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED] = {
 		.type = HDA_FIXUP_VERBS,
-- 
2.34.1

