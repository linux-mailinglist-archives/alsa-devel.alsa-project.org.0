Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E1130896
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10B9D17F1;
	Sun,  5 Jan 2020 16:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10B9D17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237234;
	bh=KhFodNJKAI5/iD2zq2pvHuC8alTWlDOr6YCMK9liQRc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmlWscSkhVu1/UFaXMqOnvJ1J+0Ig7csy2CrYe4pVP9xg13CKreEm81lL94MU6RaA
	 odLgpBwGNILLTJ2eChzIszx4kxhm531/OKM7kzRIwHXMfI4YszbyeqtaIU5mBDqddG
	 RTqY1xlj5REPUBc9e2rsgjTPTi1WP1A9zWzVSJG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D9FF8046F;
	Sun,  5 Jan 2020 15:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F214F80370; Sun,  5 Jan 2020 15:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F6FF802A1
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F6FF802A1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63D97B2B4
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:51 +0100
Message-Id: <20200105144823.29547-37-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 36/68] ALSA: cmipci: More constifications
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

Apply const prefix to the static tables for rates, ports and
registers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 7f91742ed6f0..7363d61eaec2 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -586,7 +586,7 @@ static int snd_cmipci_clear_bit_b(struct cmipci *cm, unsigned int cmd, unsigned
  * calculate frequency
  */
 
-static unsigned int rates[] = { 5512, 11025, 22050, 44100, 8000, 16000, 32000, 48000 };
+static const unsigned int rates[] = { 5512, 11025, 22050, 44100, 8000, 16000, 32000, 48000 };
 
 static unsigned int snd_cmipci_rate_freq(unsigned int rate)
 {
@@ -2826,7 +2826,7 @@ static void query_chip(struct cmipci *cm)
 #ifdef SUPPORT_JOYSTICK
 static int snd_cmipci_create_gameport(struct cmipci *cm, int dev)
 {
-	static int ports[] = { 0x201, 0x200, 0 }; /* FIXME: majority is 0x201? */
+	static const int ports[] = { 0x201, 0x200, 0 }; /* FIXME: majority is 0x201? */
 	struct gameport *gp;
 	struct resource *r = NULL;
 	int i, io_port = 0;
@@ -3289,7 +3289,7 @@ static void snd_cmipci_remove(struct pci_dev *pci)
 /*
  * power management
  */
-static unsigned char saved_regs[] = {
+static const unsigned char saved_regs[] = {
 	CM_REG_FUNCTRL1, CM_REG_CHFORMAT, CM_REG_LEGACY_CTRL, CM_REG_MISC_CTRL,
 	CM_REG_MIXER0, CM_REG_MIXER1, CM_REG_MIXER2, CM_REG_MIXER3, CM_REG_PLL,
 	CM_REG_CH0_FRAME1, CM_REG_CH0_FRAME2,
@@ -3297,7 +3297,7 @@ static unsigned char saved_regs[] = {
 	CM_REG_INT_STATUS, CM_REG_INT_HLDCLR, CM_REG_FUNCTRL0,
 };
 
-static unsigned char saved_mixers[] = {
+static const unsigned char saved_mixers[] = {
 	SB_DSP4_MASTER_DEV, SB_DSP4_MASTER_DEV + 1,
 	SB_DSP4_PCM_DEV, SB_DSP4_PCM_DEV + 1,
 	SB_DSP4_SYNTH_DEV, SB_DSP4_SYNTH_DEV + 1,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
