Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2515494C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:34:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B79916A6;
	Thu,  6 Feb 2020 17:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B79916A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006850;
	bh=XkW5Rj0g4gHaxy5qDUZRE47TjhDgwKZsswran6hO/gI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNJ3d9teZLKR9gykbuVJuVq7kXhOKZMDnNwnWqn7MdSWrKdrN2PpQu74S6Wc0ZFAN
	 0Mu3KgW9WnIQUZnf+JTxJgCaFs1cGrzgHzUbRhdcdORzWKL3LLB9kqCp/xLz5YgnJD
	 wtog33iW/oUF+y/GeuR+HDRH1HQIf04Vie08gslc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDEC2F80276;
	Thu,  6 Feb 2020 17:32:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06256F80277; Thu,  6 Feb 2020 17:32:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D01BF80162
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D01BF80162
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32E13AFAA
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:31:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:31:52 +0100
Message-Id: <20200206163152.6073-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163152.6073-1-tiwai@suse.de>
References: <20200206163152.6073-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/3] ALSA: emu8000: Fix the cast to __user
	pointer
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

Fixes the sparse warnings.  The cast to __user pointer needs __force:
  sound/isa/sb/emu8000_pcm.c:528:9: warning: cast removes address space '<asn:1>' of expression

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index e377ac93f37f..8e8257c574b0 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -435,7 +435,7 @@ enum {
 #define LOOP_WRITE(rec, offset, _buf, count, mode)		\
 	do {							\
 		struct snd_emu8000 *emu = (rec)->emu;		\
-		unsigned short *buf = (unsigned short *)(_buf); \
+		unsigned short *buf = (__force unsigned short *)(_buf); \
 		snd_emu8000_write_wait(emu, 1);			\
 		EMU8000_SMALW_WRITE(emu, offset);		\
 		while (count > 0) {				\
@@ -492,7 +492,7 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 #define LOOP_WRITE(rec, pos, _buf, count, mode)				\
 	do {								\
 		struct snd_emu8000 *emu = rec->emu;			\
-		unsigned short *buf = (unsigned short *)(_buf);		\
+		unsigned short *buf = (__force unsigned short *)(_buf);	\
 		snd_emu8000_write_wait(emu, 1);				\
 		EMU8000_SMALW_WRITE(emu, pos + rec->loop_start[0]);	\
 		if (rec->voices > 1)					\
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
