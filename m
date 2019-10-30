Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E14E99B9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 11:11:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976D32335;
	Wed, 30 Oct 2019 11:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976D32335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572430271;
	bh=7bWXpWaKCYxMXBY9PPUExxdUoH58/yC7kZa81IsHyT4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jqfY/mvGefWkLsP55TCxmokbgRM0ioNYkTMeLgN/zFeNeW0Kj4fffGUqvMmM48IXh
	 P7C6/z99QtQUb+KuWEoE04t4jLM94gHRZSiMQ9mAU7YXlIWj+B74/QEnGMFWGgg1dO
	 d3Pw3AqbGjJNbWZtREyNKPoOhwT0ggowBFjskcso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 258B4F80361;
	Wed, 30 Oct 2019 11:09:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62BD6F80361; Wed, 30 Oct 2019 11:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5942F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 11:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5942F802A1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 039D6B323;
 Wed, 30 Oct 2019 10:09:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 30 Oct 2019 11:09:21 +0100
Message-Id: <20191030100921.3826-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>
Subject: [alsa-devel] [PATCH] ALSA: firewire-motu: Correct a typo in the
	clock proc string
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Just fix a typo of "S/PDIF" in the clock name string.

Fixes: 4638ec6ede08 ("ALSA: firewire-motu: add proc node to show current statuc of clock and packet formats")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/motu/motu-proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/motu/motu-proc.c b/sound/firewire/motu/motu-proc.c
index b47ba818343f..187f6abd878c 100644
--- a/sound/firewire/motu/motu-proc.c
+++ b/sound/firewire/motu/motu-proc.c
@@ -16,7 +16,7 @@ static const char *const clock_names[] = {
 	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT] = "S/PDIF on optical interface",
 	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_A] = "S/PDIF on optical interface A",
 	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_B] = "S/PDIF on optical interface B",
-	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX] = "S/PCIF on coaxial interface",
+	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX] = "S/PDIF on coaxial interface",
 	[SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR] = "AESEBU on XLR interface",
 	[SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC] = "Word clock on BNC interface",
 	[SND_MOTU_CLOCK_SOURCE_SPH] = "Source packet header",
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
