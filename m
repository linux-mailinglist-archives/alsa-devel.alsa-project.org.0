Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14C13088D
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:07:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DDC17DE;
	Sun,  5 Jan 2020 16:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DDC17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236876;
	bh=CnRJa1r3hUwFX9elICPonBG+NA2yhCoP0+rYZMMwobw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Chvblw8YmnBoWTMyQLIZEIffAPUL4ZHLYqCko/sbF113IIj7ajvz3yaYURpFG+AWV
	 4+ZxUKDC0YhGn4xv6oFnHMTGheF756TB0So1Dm8aDyN+1qKBQ56vLspk8UbBP7YQbP
	 7xwuN/9u5Yu9ty8Bzq9mRhPcrbM44b/XhqN4mKKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F31BF803EB;
	Sun,  5 Jan 2020 15:50:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10492F80368; Sun,  5 Jan 2020 15:49:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28365F80140
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28365F80140
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14D2DB254
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:44 +0100
Message-Id: <20200105144823.29547-30-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 29/68] ALSA: cs46xx: More constifications
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

Apply const prefix to each possible place: the static tables for
registers and op codes, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx_lib.c       | 2 +-
 sound/pci/cs46xx/dsp_spos.c         | 4 ++--
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index cbac9f1edc51..e46efae1e192 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -3745,7 +3745,7 @@ static struct cs_card_type cards[] = {
  * APM support
  */
 #ifdef CONFIG_PM_SLEEP
-static unsigned int saved_regs[] = {
+static const unsigned int saved_regs[] = {
 	BA0_ACOSV,
 	/*BA0_ASER_FADDR,*/
 	BA0_ASER_MASTER,
diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index 887790ac33c6..05f3f6dc918d 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -27,7 +27,7 @@
 static int cs46xx_dsp_async_init (struct snd_cs46xx *chip,
 				  struct dsp_scb_descriptor * fg_entry);
 
-static enum wide_opcode wide_opcodes[] = { 
+static const enum wide_opcode wide_opcodes[] = {
 	WIDE_FOR_BEGIN_LOOP,
 	WIDE_FOR_BEGIN_LOOP2,
 	WIDE_COND_GOTO_ADDR,
@@ -1038,7 +1038,7 @@ int cs46xx_dsp_scb_and_task_init (struct snd_cs46xx *chip)
 	
 	int fifo_addr, fifo_span, valid_slots;
 
-	static struct dsp_spos_control_block sposcb = {
+	static const struct dsp_spos_control_block sposcb = {
 		/* 0 */ HFG_TREE_SCB,HFG_STACK,
 		/* 1 */ SPOSCB_ADDR,BG_TREE_SCB_ADDR,
 		/* 2 */ DSP_SPOS_DC,0,
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 715ead59613d..2c5c9d4c1d94 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -1145,7 +1145,7 @@ find_next_free_scb (struct snd_cs46xx * chip, struct dsp_scb_descriptor * from)
 	return scb;
 }
 
-static u32 pcm_reader_buffer_addr[DSP_MAX_PCM_CHANNELS] = {
+static const u32 pcm_reader_buffer_addr[DSP_MAX_PCM_CHANNELS] = {
 	0x0600, /* 1 */
 	0x1500, /* 2 */
 	0x1580, /* 3 */
@@ -1180,7 +1180,7 @@ static u32 pcm_reader_buffer_addr[DSP_MAX_PCM_CHANNELS] = {
 	0x2400, /* 32 */
 };
 
-static u32 src_output_buffer_addr[DSP_MAX_SRC_NR] = {
+static const u32 src_output_buffer_addr[DSP_MAX_SRC_NR] = {
 	0x2B80,
 	0x2BA0,
 	0x2BC0,
@@ -1197,7 +1197,7 @@ static u32 src_output_buffer_addr[DSP_MAX_SRC_NR] = {
 	0x2E20
 };
 
-static u32 src_delay_buffer_addr[DSP_MAX_SRC_NR] = {
+static const u32 src_delay_buffer_addr[DSP_MAX_SRC_NR] = {
 	0x2480,
 	0x2500,
 	0x2580,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
