Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC097156810
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Feb 2020 23:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C57D16B2;
	Sat,  8 Feb 2020 23:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C57D16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581201396;
	bh=mn8kuripCl10teeJ8FgfcTl6bRQ8ypB2JVyJH9O4luM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bYZU0HJJr8rrcQWHqQBXfjFDIhzJrG3wt35zE0HteyguGADJyWjsm6YTfrr3xXdPs
	 0tEfS8d6bRq15OQNyKEw/YdlpYt6qVzevaKGTH/msr3WZ56jePt8svegjIyW/E8b79
	 fqHXjeHD94BGlexgJnbhnqb2ptwW8fpncHIdJHl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A38F801DB;
	Sat,  8 Feb 2020 23:34:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4401EF80162; Sat,  8 Feb 2020 23:34:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ED9BF8012F
 for <alsa-devel@alsa-project.org>; Sat,  8 Feb 2020 23:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ED9BF8012F
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1j0YgV-0001jM-Q3; Sat, 08 Feb 2020 22:34:43 +0000
From: Colin King <colin.king@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Date: Sat,  8 Feb 2020 22:34:43 +0000
Message-Id: <20200208223443.38047-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: ali5451: remove redundant variable
	capture_flag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Colin Ian King <colin.king@canonical.com>

Variable capture_flag is only ever assigned values, it is never read
and hence it is redundant. Remove it.

Addresses-Coverity ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/ali5451/ali5451.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 4f524a9dbbca..4462375d2d82 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1070,7 +1070,7 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 {
 	struct snd_ali *codec = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *s;
-	unsigned int what, whati, capture_flag;
+	unsigned int what, whati;
 	struct snd_ali_voice *pvoice, *evoice;
 	unsigned int val;
 	int do_start;
@@ -1088,7 +1088,7 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	what = whati = capture_flag = 0;
+	what = whati = 0;
 	snd_pcm_group_for_each_entry(s, substream) {
 		if ((struct snd_ali *) snd_pcm_substream_chip(s) == codec) {
 			pvoice = s->runtime->private_data;
@@ -1110,8 +1110,6 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 					evoice->running = 0;
 			}
 			snd_pcm_trigger_done(s, substream);
-			if (pvoice->mode)
-				capture_flag = 1;
 		}
 	}
 	spin_lock(&codec->reg_lock);
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
