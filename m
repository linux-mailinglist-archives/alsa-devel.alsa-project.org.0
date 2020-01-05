Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9A4130870
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD35B1759;
	Sun,  5 Jan 2020 15:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD35B1759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578235912;
	bh=NJxRqFbPzOci2bjybZhgAMDpbKqm0voqhD6vAjtmiLo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtF4IvZwfo5HmogTWN/wamtVoY/1rGGrDm6lydCxxom1JnU/MAIIAyUWM9eOYUYBH
	 ny0Fmr5E4vlvYw5gRXz838zeUIEDcltIJmEvoenBrwJ12o20atwU51A/KaAeDSb2hK
	 KOOeBJXyji495eK7sVQLkZhNBBTL87KmPw9wQ+jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A567F80315;
	Sun,  5 Jan 2020 15:48:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2960F80307; Sun,  5 Jan 2020 15:48:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD3CDF8014A
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3CDF8014A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9AB43AC3C
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:16 +0100
Message-Id: <20200105144823.29547-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 01/68] ALSA: Allow const arrays for legacy
	resource management helpers
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

Declare the arrays passed to the helper functions for legacy resources
(mostly for ISA drivers) as const, so that each caller can make its
static data as const for minor optimizations, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/initval.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/initval.h b/include/sound/initval.h
index 3ddae2b4177e..a1ff3b4865b4 100644
--- a/include/sound/initval.h
+++ b/include/sound/initval.h
@@ -37,7 +37,7 @@
 #define SNDRV_DEFAULT_PTR	SNDRV_DEFAULT_STR
 
 #ifdef SNDRV_LEGACY_FIND_FREE_IOPORT
-static long snd_legacy_find_free_ioport(long *port_table, long size)
+static long snd_legacy_find_free_ioport(const long *port_table, long size)
 {
 	while (*port_table != -1) {
 		if (request_region(*port_table, size, "ALSA test")) {
@@ -58,7 +58,7 @@ static irqreturn_t snd_legacy_empty_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int snd_legacy_find_free_irq(int *irq_table)
+static int snd_legacy_find_free_irq(const int *irq_table)
 {
 	while (*irq_table != -1) {
 		if (!request_irq(*irq_table, snd_legacy_empty_irq_handler,
@@ -74,7 +74,7 @@ static int snd_legacy_find_free_irq(int *irq_table)
 #endif
 
 #ifdef SNDRV_LEGACY_FIND_FREE_DMA
-static int snd_legacy_find_free_dma(int *dma_table)
+static int snd_legacy_find_free_dma(const int *dma_table)
 {
 	while (*dma_table != -1) {
 		if (!request_dma(*dma_table, "ALSA Test DMA")) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
