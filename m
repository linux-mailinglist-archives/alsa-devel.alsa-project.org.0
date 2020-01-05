Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC2130887
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C362817C7;
	Sun,  5 Jan 2020 16:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C362817C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236674;
	bh=pEiuNXc+TR5UAYfjt1BofyQ6PJeMLyRte7P7IsFOf40=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6tIKY2ejhIs+HL+ktywjnCVjTWQQ8MHwlSQLZ1dT53+D68iulk9HNcyTyXIlTRqg
	 eGDdYRRMbTjR0mohI9jt69CRWK+R0Q5218Hf43HcNn8OjHdh1ZkZxS1mz3RMlckCfN
	 dT8Zfh/1SsGtf9iJ0b67MuLjDvr/jeV+9ykQU69Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC684F802DF;
	Sun,  5 Jan 2020 15:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23F37F80348; Sun,  5 Jan 2020 15:49:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07F2EF8027C
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F2EF8027C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05E08B24A
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:43 +0100
Message-Id: <20200105144823.29547-29-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 28/68] ALSA: korg1212: More constifications
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

Apply const prefix to each possible place: the string array, the
static tables for clock selectors, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 685a60551c71..21ab9cc50c71 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -415,7 +415,7 @@ static const struct pci_device_id snd_korg1212_ids[] = {
 
 MODULE_DEVICE_TABLE(pci, snd_korg1212_ids);
 
-static char *stateName[] = {
+static const char * const stateName[] = {
 	"Non-existent",
 	"Uninitialized",
 	"DSP download in process",
@@ -455,7 +455,7 @@ static const char * const channelName[] = {
 	"SPDIF-R",
 };
 
-static u16 ClockSourceSelector[] = {
+static const u16 ClockSourceSelector[] = {
 	0x8000,   // selects source as ADAT at 44.1 kHz
 	0x0000,   // selects source as ADAT at 48 kHz
 	0x8001,   // selects source as S/PDIF at 44.1 kHz
@@ -813,12 +813,12 @@ static inline int snd_korg1212_use_is_exclusive(struct snd_korg1212 *korg1212)
 
 static int snd_korg1212_SetRate(struct snd_korg1212 *korg1212, int rate)
 {
-        static enum ClockSourceIndex s44[] = {
+	static const enum ClockSourceIndex s44[] = {
 		K1212_CLKIDX_AdatAt44_1K,
 		K1212_CLKIDX_WordAt44_1K,
 		K1212_CLKIDX_LocalAt44_1K
 	};
-        static enum ClockSourceIndex s48[] = {
+	static const enum ClockSourceIndex s48[] = {
 		K1212_CLKIDX_AdatAt48K,
 		K1212_CLKIDX_WordAt48K,
 		K1212_CLKIDX_LocalAt48K
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
