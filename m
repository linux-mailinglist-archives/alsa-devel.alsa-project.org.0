Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE2D154976
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58DBC16BE;
	Thu,  6 Feb 2020 17:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58DBC16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581007404;
	bh=xxcRQzuNggVxqf7dsVyYzG5YLpyqX6yH0FUoe39UXq0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWWsKBP/X2x3RxWSHqHNSxIW2QyAgcyvUsE8erKH0p+37Spu8ksz4h16NIvNfB6Fe
	 SYdm8cJr/iBODGG2tNdYWzoYe3IBXQiyr0NXgWIlNb/0MP77mu0Q+MZZjApdfwGTXe
	 oWRYlt8X3nVez5wzq7O2GHReqPo7qqQJLzBkInqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F688F8015B;
	Thu,  6 Feb 2020 17:40:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B03F80277; Thu,  6 Feb 2020 17:39:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76A4F80212
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76A4F80212
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17D02AEE7
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:39:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:39:40 +0100
Message-Id: <20200206163945.6797-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163945.6797-1-tiwai@suse.de>
References: <20200206163945.6797-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/8] ALSA: usb-audio: Use pcm_for_each_format()
	macro for PCM format iterations
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

The new macro can fix the sparse warnings gracefully:
  sound/usb/proc.c:73:31: warning: restricted snd_pcm_format_t degrades to integer
  sound/usb/proc.c:73:38: warning: restricted snd_pcm_format_t degrades to integer
  sound/usb/proc.c:73:61: warning: restricted snd_pcm_format_t degrades to integer

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index ffbf4bd9208c..4174ad11fca6 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -70,7 +70,7 @@ static void proc_dump_substream_formats(struct snd_usb_substream *subs, struct s
 		snd_iprintf(buffer, "  Interface %d\n", fp->iface);
 		snd_iprintf(buffer, "    Altset %d\n", fp->altsetting);
 		snd_iprintf(buffer, "    Format:");
-		for (fmt = 0; fmt <= SNDRV_PCM_FORMAT_LAST; ++fmt)
+		pcm_for_each_format(fmt)
 			if (fp->formats & pcm_format_to_bits(fmt))
 				snd_iprintf(buffer, " %s",
 					    snd_pcm_format_name(fmt));
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
