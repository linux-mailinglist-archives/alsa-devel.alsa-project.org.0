Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC8B701E75
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 19:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D199E83A;
	Sun, 14 May 2023 19:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D199E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684084072;
	bh=5Hp+6f5juogVnMNXKRg9wSHPtKKbRdab2j0U//lcrKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cXxzIez6JXkYqm1CvEDY+xg63laY0ekbyP+ddWWd+2vG9blOKNctJ5b4YEu9Tg51R
	 AYNDaMzgnhQDyreVA4svqLwbKmibJXi3X3jdh/SuHMpWWUB7auGwbGjo7BfPNFPjRU
	 86OHEDqiLTfHTQXEb+Kdb4JFmbvrTr/DBaVVUu2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABACEF80578; Sun, 14 May 2023 19:05:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F31EF80589;
	Sun, 14 May 2023 19:05:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE5FF80272; Sun, 14 May 2023 19:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CACFF80431
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 19:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CACFF80431
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 66CFD2424B;
	Sun, 14 May 2023 13:03:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyF7z-In6-00; Sun, 14 May 2023 19:03:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 4/4] ALSA: emu10k1: optimize mask calculation in
 snd_emu10k1_ptr_read()
Date: Sun, 14 May 2023 19:03:23 +0200
Message-Id: <20230514170323.3408798-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230514170323.3408798-1-oswald.buddenhagen@gmx.de>
References: <20230514170323.3408798-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TQLQ4SIIAHCRYPPXETGQ5NOUFHVFWKPK
X-Message-ID-Hash: TQLQ4SIIAHCRYPPXETGQ5NOUFHVFWKPK
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQLQ4SIIAHCRYPPXETGQ5NOUFHVFWKPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unlike in snd_emu10k1_ptr_write(), we don't need to keep the value's
bits in place, so we can save one shift.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 2d6bbb77c961..59b0f4d08c6b 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -50,9 +50,9 @@ unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, un
 		
 		size = (reg >> 24) & 0x3f;
 		offset = (reg >> 16) & 0x1f;
-		mask = ((1 << size) - 1) << offset;
+		mask = (1 << size) - 1;
 		
-		return (val & mask) >> offset;
+		return (val >> offset) & mask;
 	} else {
 		return val;
 	}
-- 
2.40.0.152.g15d061e6df

