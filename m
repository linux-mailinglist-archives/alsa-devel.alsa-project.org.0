Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D713088E
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D767217B6;
	Sun,  5 Jan 2020 16:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D767217B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236916;
	bh=fdeZau37jo1GENhBcllq5tV/vAy7hUHfvE6mgil/pV0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQv6o/fn8R14Dl1x7PTxlLeFYnc2gt1K5i4BWqMduYug43cVNOrkRO76jp4sXOjE6
	 uDw9qbYY88uQwzsuOdzoqew/SgJNKhCsBAHDdbdIWEinr5gZ2yafHnRO9RCqVXEJF6
	 /oQ2DAy6wiq+r7z54Fn+jsmId6LJ+8I6jPwHamWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFC8F802F9;
	Sun,  5 Jan 2020 15:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9A9F8028D; Sun,  5 Jan 2020 15:49:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50D84F8028D
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50D84F8028D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DEE03B247
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:40 +0100
Message-Id: <20200105144823.29547-26-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 25/68] ALSA: ymfpci: More constifications
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
sample rates, parameters and registers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ymfpci/ymfpci_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 1cffd988b616..e07d70307d20 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -122,14 +122,14 @@ static u32 snd_ymfpci_calc_delta(u32 rate)
 	}
 }
 
-static u32 def_rate[8] = {
+static const u32 def_rate[8] = {
 	100, 2000, 8000, 11025, 16000, 22050, 32000, 48000
 };
 
 static u32 snd_ymfpci_calc_lpfK(u32 rate)
 {
 	u32 i;
-	static u32 val[8] = {
+	static const u32 val[8] = {
 		0x00570000, 0x06AA0000, 0x18B20000, 0x20930000,
 		0x2B9A0000, 0x35A10000, 0x3EAA0000, 0x40000000
 	};
@@ -145,7 +145,7 @@ static u32 snd_ymfpci_calc_lpfK(u32 rate)
 static u32 snd_ymfpci_calc_lpfQ(u32 rate)
 {
 	u32 i;
-	static u32 val[8] = {
+	static const u32 val[8] = {
 		0x35280000, 0x34A70000, 0x32020000, 0x31770000,
 		0x31390000, 0x31C90000, 0x33D00000, 0x40000000
 	};
@@ -2234,7 +2234,7 @@ static int snd_ymfpci_dev_free(struct snd_device *device)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int saved_regs_index[] = {
+static const int saved_regs_index[] = {
 	/* spdif */
 	YDSXGR_SPDIFOUTCTRL,
 	YDSXGR_SPDIFOUTSTATUS,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
