Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC4130895
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF27F17EB;
	Sun,  5 Jan 2020 16:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF27F17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237189;
	bh=suRfIxX9pHtq+baQ1XODtzsJm02HljeJjJmNsj0cvIc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIzkFEo3e8dklD5A0UznvzgOuTbdqqTHSr/4JLrd/IklLoW/BlPrddln3LtTYiA/f
	 L2RxomwS3Ve61Wci/wDRectzTCEf3OquActgh1ryYFK/5I4P468aZVlv9orwQT+kUv
	 BMr3Sk3BKCG5AOAQXXWGDy/99oCIJ57M6ALJvN1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C0B6F8044A;
	Sun,  5 Jan 2020 15:50:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BAEEF80290; Sun,  5 Jan 2020 15:49:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 924EFF80290
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924EFF80290
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 046DFB249
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:42 +0100
Message-Id: <20200105144823.29547-28-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 27/68] ALSA: nm256: More constifications
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

Apply const prefix to the static tables coefs and init registers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c      | 4 ++--
 sound/pci/nm256/nm256_coef.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 25275a98e950..1726f2959ae8 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -299,7 +299,7 @@ snd_nm256_writel(struct nm256 *chip, int offset, u32 val)
 }
 
 static inline void
-snd_nm256_write_buffer(struct nm256 *chip, void *src, int offset, int size)
+snd_nm256_write_buffer(struct nm256 *chip, const void *src, int offset, int size)
 {
 	offset -= chip->buffer_start;
 #ifdef CONFIG_SND_DEBUG
@@ -1179,7 +1179,7 @@ struct initialValues {
 	unsigned short value;
 };
 
-static struct initialValues nm256_ac97_init_val[] =
+static const struct initialValues nm256_ac97_init_val[] =
 {
 	{ AC97_MASTER, 		0x8000 },
 	{ AC97_HEADPHONE,	0x8000 },
diff --git a/sound/pci/nm256/nm256_coef.c b/sound/pci/nm256/nm256_coef.c
index c757252119b1..f0599dbe8492 100644
--- a/sound/pci/nm256/nm256_coef.c
+++ b/sound/pci/nm256/nm256_coef.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #define NM_TOTAL_COEFF_COUNT 0x3158
 
-static char coefficients[NM_TOTAL_COEFF_COUNT * 4] = { 
+static const char coefficients[NM_TOTAL_COEFF_COUNT * 4] = {
 	0xFF, 0xFF, 0x2F, 0x00, 0x4B, 0xFF, 0xA5, 0x01, 0xEF, 0xFC, 0x21,
 	0x05, 0x87, 0xF7, 0x62, 0x11, 0xE9, 0x45, 0x5E, 0xF9, 0xB5, 0x01,
 	0xDE, 0xFF, 0xA4, 0xFF, 0x60, 0x00, 0xCA, 0xFF, 0x0D, 0x00, 0xFD,
@@ -4598,7 +4598,7 @@ static char coefficients[NM_TOTAL_COEFF_COUNT * 4] = {
 	0x01, 0x8D, 0xFF, 0x0F, 0x00 
 };
 
-static u16
+static const u16
 coefficient_sizes[8 * 2] = {
 	/* Playback */
 	0x00C0, 0x5000, 0x0060, 0x2800, 0x0040, 0x0060, 0x1400, 0x0000,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
