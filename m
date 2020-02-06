Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13E154975
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F1916A4;
	Thu,  6 Feb 2020 17:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F1916A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581007387;
	bh=/taFXuM7BZ64nZyzNFbuQpm9099HvLI1cEsnwCY1Tls=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enqTlXTgmqUEeWHhE3j//CaohRBAqN+LQsmnNDwEgpnNZfjqWkxvJySM48dfQEZ66
	 RBdTxvF8KAkpn4K6nvDVMnMUdyZv7Ru73oAIecapmOgYuP8hW/22V0fW1FLZNMFKS5
	 J74dmp0YYDvWF0tNGeRVv8DNkue0I+bIQ9MbrbTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF340F8027C;
	Thu,  6 Feb 2020 17:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1160CF80278; Thu,  6 Feb 2020 17:39:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C05F801DB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C05F801DB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 254C3AFAA
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 16:39:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:39:41 +0100
Message-Id: <20200206163945.6797-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206163945.6797-1-tiwai@suse.de>
References: <20200206163945.6797-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 4/8] ALSA: dummy: Use standard macros for
	fixing PCM format cast
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

Simplify the code with the new macros for PCM format type iterations.
This fixes the sparse warnings nicely:
  sound/drivers/dummy.c:906:25: warning: restricted snd_pcm_format_t degrades to integer
  sound/drivers/dummy.c:908:25: warning: incorrect type in argument 1 (different base types)
  sound/drivers/dummy.c:908:25:    expected restricted snd_pcm_format_t [usertype] format
  sound/drivers/dummy.c:908:25:    got int [assigned] i

No functional changes, just sparse warning fixes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 02ac3f4e0c02..b5486de08b97 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -901,10 +901,10 @@ static int snd_card_dummy_new_mixer(struct snd_dummy *dummy)
 static void print_formats(struct snd_dummy *dummy,
 			  struct snd_info_buffer *buffer)
 {
-	int i;
+	snd_pcm_format_t i;
 
-	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-		if (dummy->pcm_hw.formats & (1ULL << i))
+	pcm_for_each_format(i) {
+		if (dummy->pcm_hw.formats & pcm_format_to_bits(i))
 			snd_iprintf(buffer, " %s", snd_pcm_format_name(i));
 	}
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
