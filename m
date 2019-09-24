Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FBBC749
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 13:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A838E1694;
	Tue, 24 Sep 2019 13:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A838E1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569326061;
	bh=EqWC/ZpllGH3eBxhYvGg7JuajHW/4kvYGyezy6I4KnU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dh3engV5SL2xlqzxIH/1M7crX2n0CKRk5wxETKrUkssQMQmXtHk/tLUeWJ4OBgk3M
	 qSnALhaflJ21D1tG6zJXYozg3wSLwJSnJnSvf1OZR2w7jHCNcV7Y7m9JPTObfMJ5RF
	 Tj84dHA2Vt/H35Gbh9EQ1mjjiciS3ocaNr1t4RWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34936F802BD;
	Tue, 24 Sep 2019 13:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D400F8045F; Tue, 24 Sep 2019 13:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00166F802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 13:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00166F802BD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE5BCAECB
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 11:52:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 24 Sep 2019 13:52:28 +0200
Message-Id: <20190924115228.24008-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH alsa-lib] pcm: chmap: Fix memory leak at
	snd_pcm_set_chmap()
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

snd_pcm_set_chmap() leaks the memory returned from snd_pcm_get_chmap()
without releasing.  Add the missing free() call as well as a slight
code refactoring.

Reported-by: Conrad Jones
BugLink: https://github.com/alsa-project/alsa-lib/pull/11
Fixes: d20e24e5d161 ("chmap: Always succeed setting the map to what it already is")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 178d43875f00..d6bf31ac7ae3 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -8099,8 +8099,13 @@ snd_pcm_chmap_t *snd_pcm_get_chmap(snd_pcm_t *pcm)
  */
 int snd_pcm_set_chmap(snd_pcm_t *pcm, const snd_pcm_chmap_t *map)
 {
-	const snd_pcm_chmap_t *oldmap = snd_pcm_get_chmap(pcm);
-	if (oldmap && chmap_equal(oldmap, map))
+	const snd_pcm_chmap_t *oldmap;
+	int nochange;
+
+	oldmap = snd_pcm_get_chmap(pcm);
+	nochange = (oldmap && chmap_equal(oldmap, map));
+	free((void *)oldmap);
+	if (nochange)
 		return 0;
 
 	if (!pcm->ops->set_chmap)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
