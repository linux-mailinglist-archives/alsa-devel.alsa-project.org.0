Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D96715494A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D20D16A9;
	Thu,  6 Feb 2020 17:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D20D16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006819;
	bh=w4iZZ0bNeX/6iicr+wtYhWX+rPeV3fKux3RaNK7iviE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eO1uVu6x2cPg5jwlC52WERI3CMiOGXaJfza4zoVCngPE9Tk/t3Jtqo0qngxYDZGDd
	 SRK8y/Cqo/mUT5lN9wkuTlegDjKH8o/6gpmzkJn1niFFQ/oHCYT0F+slyYwTPwHxrP
	 SDP1nzEVCNkxW+0Cl2s+ibXnbCby2eVDHBk1n/Xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 904A7F80212;
	Thu,  6 Feb 2020 17:31:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 801A5F800AB; Thu,  6 Feb 2020 17:31:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706FDF800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706FDF800AB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 241D5AF32
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:31:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:31:51 +0100
Message-Id: <20200206163152.6073-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163152.6073-1-tiwai@suse.de>
References: <20200206163152.6073-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/3] ALSA: emu10k1: Fix endianness annotations
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

The internal page tables are little endian, hence they should be
__le32 type.  This fixes the relevant sparse warning:
  sound/pci/emu10k1/emu10k1_main.c:2013:51: warning: incorrect type in assignment (different base types)
  sound/pci/emu10k1/emu10k1_main.c:2013:51:    expected unsigned int [usertype]
  sound/pci/emu10k1/emu10k1_main.c:2013:51:    got restricted __le32 [usertype]

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index a89a7e603ca8..6ff581733a19 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1789,6 +1789,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	int idx, err;
 	int is_audigy;
 	size_t page_table_size;
+	__le32 *pgtbl;
 	unsigned int silent_page;
 	const struct snd_emu_chip_details *c;
 	static const struct snd_device_ops ops = {
@@ -2009,8 +2010,9 @@ int snd_emu10k1_create(struct snd_card *card,
 	/* Clear silent pages and set up pointers */
 	memset(emu->silent_page.area, 0, emu->silent_page.bytes);
 	silent_page = emu->silent_page.addr << emu->address_mode;
+	pgtbl = (__le32 *)emu->ptb_pages.area;
 	for (idx = 0; idx < (emu->address_mode ? MAXPAGES1 : MAXPAGES0); idx++)
-		((u32 *)emu->ptb_pages.area)[idx] = cpu_to_le32(silent_page | idx);
+		pgtbl[idx] = cpu_to_le32(silent_page | idx);
 
 	/* set up voice indices */
 	for (idx = 0; idx < NUM_G; idx++) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
