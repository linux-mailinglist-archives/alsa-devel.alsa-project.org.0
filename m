Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B9B12F582
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:33:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECDFF1742;
	Fri,  3 Jan 2020 09:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECDFF1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040388;
	bh=8rhis4c+JZfUHt05q5FUw1A5r+5uYcOcNV01q3XqUZU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VyRC2IBlRLKiQSQXolmJ0mjzbIKSJAlnvr5b8+8OzoeAregll7Ti1hGM1kdg/mif0
	 qabjaAZW8klwyPD/dZ8eCVCs5ap44yrs5qTuhWVYdHQUNphAgPHXWFdhgorsT/wuJk
	 KR+iWtvjbahyynnThyd/kAAA/rsOY1IqR3CMggOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC924F8038D;
	Fri,  3 Jan 2020 09:18:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17BE8F80345; Fri,  3 Jan 2020 09:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8CC6F8028C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CC6F8028C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94A2DB26A
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:37 +0100
Message-Id: <20200103081714.9560-22-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 21/58] ALSA: Constify snd_timer_hardware
	definitions
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

Most of snd_timer_hardware definitions do simply copying to another
struct as-is.  Mark them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_lib.c  | 4 ++--
 sound/isa/gus/gus_timer.c      | 4 ++--
 sound/isa/wss/wss_lib.c        | 2 +-
 sound/pci/emu10k1/timer.c      | 2 +-
 sound/pci/ymfpci/ymfpci_main.c | 2 +-
 sound/sparc/cs4231.c           | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
index 6134e5ffea0b..9259522483c8 100644
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -214,7 +214,7 @@ static int snd_opl3_timer2_stop(struct snd_timer * timer)
 
  */
 
-static struct snd_timer_hardware snd_opl3_timer1 =
+static const struct snd_timer_hardware snd_opl3_timer1 =
 {
 	.flags =	SNDRV_TIMER_HW_STOP,
 	.resolution =	80000,
@@ -223,7 +223,7 @@ static struct snd_timer_hardware snd_opl3_timer1 =
 	.stop =		snd_opl3_timer1_stop,
 };
 
-static struct snd_timer_hardware snd_opl3_timer2 =
+static const struct snd_timer_hardware snd_opl3_timer2 =
 {
 	.flags =	SNDRV_TIMER_HW_STOP,
 	.resolution =	320000,
diff --git a/sound/isa/gus/gus_timer.c b/sound/isa/gus/gus_timer.c
index 4e9664e434fe..047ddbc6192f 100644
--- a/sound/isa/gus/gus_timer.c
+++ b/sound/isa/gus/gus_timer.c
@@ -108,7 +108,7 @@ static void snd_gf1_interrupt_timer2(struct snd_gus_card * gus)
 
  */
 
-static struct snd_timer_hardware snd_gf1_timer1 =
+static const struct snd_timer_hardware snd_gf1_timer1 =
 {
 	.flags =	SNDRV_TIMER_HW_STOP,
 	.resolution =	80000,
@@ -117,7 +117,7 @@ static struct snd_timer_hardware snd_gf1_timer1 =
 	.stop =		snd_gf1_timer1_stop,
 };
 
-static struct snd_timer_hardware snd_gf1_timer2 =
+static const struct snd_timer_hardware snd_gf1_timer2 =
 {
 	.flags =	SNDRV_TIMER_HW_STOP,
 	.resolution =	320000,
diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index b51b50154e8a..0d019b238399 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -961,7 +961,7 @@ static int snd_wss_timer_close(struct snd_timer *timer)
 	return 0;
 }
 
-static struct snd_timer_hardware snd_wss_timer_table =
+static const struct snd_timer_hardware snd_wss_timer_table =
 {
 	.flags =	SNDRV_TIMER_HW_AUTO,
 	.resolution =	9945,
diff --git a/sound/pci/emu10k1/timer.c b/sound/pci/emu10k1/timer.c
index 9ef3b999dcd6..c2803000aace 100644
--- a/sound/pci/emu10k1/timer.c
+++ b/sound/pci/emu10k1/timer.c
@@ -52,7 +52,7 @@ static int snd_emu10k1_timer_precise_resolution(struct snd_timer *timer,
 	return 0;
 }
 
-static struct snd_timer_hardware snd_emu10k1_timer_hw = {
+static const struct snd_timer_hardware snd_emu10k1_timer_hw = {
 	.flags = SNDRV_TIMER_HW_AUTO,
 	.resolution = 20833, /* 1 sample @ 48KHZ = 20.833...us */
 	.ticks = 1024,
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 2e20cd9d8cfc..1d9295bb00a9 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -1908,7 +1908,7 @@ static int snd_ymfpci_timer_precise_resolution(struct snd_timer *timer,
 	return 0;
 }
 
-static struct snd_timer_hardware snd_ymfpci_timer_hw = {
+static const struct snd_timer_hardware snd_ymfpci_timer_hw = {
 	.flags = SNDRV_TIMER_HW_AUTO,
 	.resolution = 10417, /* 1 / 96 kHz = 10.41666...us */
 	.ticks = 0x10000,
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 476ffaa413d9..b0e5b4a83a26 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -869,7 +869,7 @@ static int snd_cs4231_timer_close(struct snd_timer *timer)
 	return 0;
 }
 
-static struct snd_timer_hardware snd_cs4231_timer_table = {
+static const struct snd_timer_hardware snd_cs4231_timer_table = {
 	.flags		=	SNDRV_TIMER_HW_AUTO,
 	.resolution	=	9945,
 	.ticks		=	65535,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
