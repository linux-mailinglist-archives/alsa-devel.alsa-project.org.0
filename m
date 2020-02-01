Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302A14F737
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Feb 2020 09:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35EE168A;
	Sat,  1 Feb 2020 09:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35EE168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580544439;
	bh=wX/DGmzAuuOkUu+3EoFmKTHNt7WapDSqVyTq7HpD3ME=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSCpKOg/F//wNrejCGlUF6jnwgV3TBEJ8ZWl1L+53ExnOBjIx3U/5vAVhr8tUFQMB
	 Qmn0z3ELv6lHPeLCYAA+EeMDsvOq+TszQOSlsoZn/BOi+T+lg9zNAVg+/LNtdmuury
	 enQvMCQ8J/NlI1UMM9LU1/6e8qDG+TvarAqTwtc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C296DF801EB;
	Sat,  1 Feb 2020 09:05:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A2B8F801F8; Sat,  1 Feb 2020 09:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB11DF80082
 for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2020 09:05:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB11DF80082
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44BC0AE2A
 for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2020 08:05:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sat,  1 Feb 2020 09:05:30 +0100
Message-Id: <20200201080530.22390-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200201080530.22390-1-tiwai@suse.de>
References: <20200201080530.22390-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 3/3] ALSA: dummy: Fix PCM format loop in proc
	output
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

The loop termination for iterating over all formats should contain
SNDRV_PCM_FORMAT_LAST, not less than it.

Fixes: 9b151fec139d ("ALSA: dummy - Add debug proc file")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index da0bd8960b3c..02ac3f4e0c02 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -903,7 +903,7 @@ static void print_formats(struct snd_dummy *dummy,
 {
 	int i;
 
-	for (i = 0; i < SNDRV_PCM_FORMAT_LAST; i++) {
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
 		if (dummy->pcm_hw.formats & (1ULL << i))
 			snd_iprintf(buffer, " %s", snd_pcm_format_name(i));
 	}
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
