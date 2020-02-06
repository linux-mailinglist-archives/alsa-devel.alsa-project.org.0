Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FC154951
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EEA3169C;
	Thu,  6 Feb 2020 17:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EEA3169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006887;
	bh=u22f0o32pitLmhwGL0QBHPOJKRfx434YO7/6d7eW9AI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sl/0eaQz1HczjtUXtjBZFpCiAmMbJlbSDUuXucH34+dKaTMsFolnLSC8lscqsV3w7
	 EJ6I6ii9wi3ePSpCXBJIXUp80jqdaNOcYwgwDxckFZfESxXDOk+3kIhDAwhlLjgQAs
	 BHz7lvNIomSn1NHZ/K7aAIGLNEOcDQ2ciWpaI3jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D41F8027B;
	Thu,  6 Feb 2020 17:32:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1650F80279; Thu,  6 Feb 2020 17:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E882DF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E882DF80059
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 220F5AF00
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:31:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:31:50 +0100
Message-Id: <20200206163152.6073-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163152.6073-1-tiwai@suse.de>
References: <20200206163152.6073-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/3] ALSA: via82xx: Fix endianness annotations
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

The internal page tables are in little endian, hence they should be
__le32 type.  This fixes the relevant sparse warnings:
  sound/pci/via82xx.c:454:60: warning: incorrect type in assignment (different base types)
  sound/pci/via82xx.c:454:60:    expected unsigned int [usertype]
  sound/pci/via82xx.c:454:60:    got restricted __le32 [usertype]
  ....

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 6 ++++--
 sound/pci/via82xx_modem.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 799789c8eea9..8b03e2dc503f 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -414,6 +414,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 {
 	unsigned int i, idx, ofs, rest;
 	struct via82xx *chip = snd_pcm_substream_chip(substream);
+	__le32 *pgtbl;
 
 	if (dev->table.area == NULL) {
 		/* the start of each lists must be aligned to 8 bytes,
@@ -435,6 +436,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 	/* fill the entries */
 	idx = 0;
 	ofs = 0;
+	pgtbl = (__le32 *)dev->table.area;
 	for (i = 0; i < periods; i++) {
 		rest = fragsize;
 		/* fill descriptors for a period.
@@ -451,7 +453,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 				return -EINVAL;
 			}
 			addr = snd_pcm_sgbuf_get_addr(substream, ofs);
-			((u32 *)dev->table.area)[idx << 1] = cpu_to_le32(addr);
+			pgtbl[idx << 1] = cpu_to_le32(addr);
 			r = snd_pcm_sgbuf_get_chunk_size(substream, ofs, rest);
 			rest -= r;
 			if (! rest) {
@@ -466,7 +468,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 				"tbl %d: at %d  size %d (rest %d)\n",
 				idx, ofs, r, rest);
 			*/
-			((u32 *)dev->table.area)[(idx<<1) + 1] = cpu_to_le32(r | flag);
+			pgtbl[(idx<<1) + 1] = cpu_to_le32(r | flag);
 			dev->idx_table[idx].offset = ofs;
 			dev->idx_table[idx].size = r;
 			ofs += r;
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 84e589803e2e..607b7100db1c 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -267,6 +267,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 {
 	unsigned int i, idx, ofs, rest;
 	struct via82xx_modem *chip = snd_pcm_substream_chip(substream);
+	__le32 *pgtbl;
 
 	if (dev->table.area == NULL) {
 		/* the start of each lists must be aligned to 8 bytes,
@@ -288,6 +289,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 	/* fill the entries */
 	idx = 0;
 	ofs = 0;
+	pgtbl = (__le32 *)dev->table.area;
 	for (i = 0; i < periods; i++) {
 		rest = fragsize;
 		/* fill descriptors for a period.
@@ -304,7 +306,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 				return -EINVAL;
 			}
 			addr = snd_pcm_sgbuf_get_addr(substream, ofs);
-			((u32 *)dev->table.area)[idx << 1] = cpu_to_le32(addr);
+			pgtbl[idx << 1] = cpu_to_le32(addr);
 			r = PAGE_SIZE - (ofs % PAGE_SIZE);
 			if (rest < r)
 				r = rest;
@@ -321,7 +323,7 @@ static int build_via_table(struct viadev *dev, struct snd_pcm_substream *substre
 				"tbl %d: at %d  size %d (rest %d)\n",
 				idx, ofs, r, rest);
 			*/
-			((u32 *)dev->table.area)[(idx<<1) + 1] = cpu_to_le32(r | flag);
+			pgtbl[(idx<<1) + 1] = cpu_to_le32(r | flag);
 			dev->idx_table[idx].offset = ofs;
 			dev->idx_table[idx].size = r;
 			ofs += r;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
