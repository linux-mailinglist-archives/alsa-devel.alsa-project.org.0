Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB71308AC
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A124C1821;
	Sun,  5 Jan 2020 16:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A124C1821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237707;
	bh=X/WtwWP4dkbCcqL8DrKlL2IqU7uWOorp5TTXKN22BQU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mND87wcAVXF4QTJ84y5NI1CAYWpTgfOuYbasGWbKysFV+Y3HNZWAkqf9GJpIKufHZ
	 R+d4ignJiZNHX1S8zSq4xY1D7afTPRwYhKyTBdY+cBCcMs8SyWnoC1T55vCHRtfXWS
	 W02IJQnh5oUhoBg5PtNpjJoPCg3bxmK6h7y1xMqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8620FF804E6;
	Sun,  5 Jan 2020 15:50:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 204A1F803AD; Sun,  5 Jan 2020 15:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3822CF802DB
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3822CF802DB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8CCBAD5F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:02 +0100
Message-Id: <20200105144823.29547-48-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 47/68] ALSA: es1688: More constifications
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

Apply const prefix to the static resource tables and init tables.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es1688/es1688.c     | 6 +++---
 sound/isa/es1688/es1688_lib.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index 9be89377171b..ff3a05ad99c0 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -84,9 +84,9 @@ static int snd_es1688_legacy_create(struct snd_card *card,
 				    struct device *dev, unsigned int n)
 {
 	struct snd_es1688 *chip = card->private_data;
-	static long possible_ports[] = {0x220, 0x240, 0x260};
-	static int possible_irqs[] = {5, 9, 10, 7, -1};
-	static int possible_dmas[] = {1, 3, 0, -1};
+	static const long possible_ports[] = {0x220, 0x240, 0x260};
+	static const int possible_irqs[] = {5, 9, 10, 7, -1};
+	static const int possible_dmas[] = {1, 3, 0, -1};
 
 	int i, error;
 
diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 1568d0bfd1a8..1816e55c6edf 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -180,7 +180,7 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 
 static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 {
-	static int irqs[16] = {-1, -1, 0, -1, -1, 1, -1, 2, -1, 0, 3, -1, -1, -1, -1, -1};
+	static const int irqs[16] = {-1, -1, 0, -1, -1, 1, -1, 2, -1, 0, 3, -1, -1, -1, -1, -1};
 	unsigned long flags;
 	int cfg, irq_bits, dma, dma_bits, tmp, tmp1;
 
@@ -946,7 +946,7 @@ ES1688_SINGLE("Capture Switch", 0, ES1688_REC_DEV, 4, 1, 1),
 
 #define ES1688_INIT_TABLE_SIZE (sizeof(snd_es1688_init_table)/2)
 
-static unsigned char snd_es1688_init_table[][2] = {
+static const unsigned char snd_es1688_init_table[][2] = {
 	{ ES1688_MASTER_DEV, 0 },
 	{ ES1688_PCM_DEV, 0 },
 	{ ES1688_LINE_DEV, 0 },
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
