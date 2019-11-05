Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF7F05B6
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 20:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E89A16DE;
	Tue,  5 Nov 2019 20:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E89A16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572981136;
	bh=V3O1eLsFVFIOZEmzGU7WOkxkeGBtmyRtAVzivxe2x44=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKPpT8IYOZG1wQwO+j0bR7wGfpq/UMhybFEG8GjlIxGytSz31YrIeADYOie6ItO02
	 vyychcI/uselmxKKkIDARookx1ztcZ7J2HaBVC/PmjyNdayUBPCh7Xt2uIAuiSub1s
	 seBQ0mKfTE0kDAitwY2N3yDsEMjcJoJcR2TlCZ+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8278F8060D;
	Tue,  5 Nov 2019 20:10:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93EF0F8015B; Tue,  5 Nov 2019 20:10:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7B46F8049B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 20:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B46F8049B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBDC3B418
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 19:10:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 20:10:07 +0100
Message-Id: <20191105191007.18150-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105191007.18150-1-tiwai@suse.de>
References: <20191105191007.18150-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/2] ALSA: pcm: Create proc files only for
	non-empty preallocations
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

It makes little sense to create prealloc proc files for streams that
have the zero max size, which is a typical case for vmalloc buffers.
Skip the proc file creations to save resources in such a case.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 19407f79b638..17ee361ce791 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -203,7 +203,8 @@ static void snd_pcm_lib_preallocate_pages1(struct snd_pcm_substream *substream,
 	if (substream->dma_buffer.bytes > 0)
 		substream->buffer_bytes_max = substream->dma_buffer.bytes;
 	substream->dma_max = max;
-	preallocate_info_init(substream);
+	if (max > 0)
+		preallocate_info_init(substream);
 }
 
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
