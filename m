Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6A3B361B
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 20:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07281658;
	Thu, 24 Jun 2021 20:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07281658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624560697;
	bh=FZsm4bSN+bsrutDPnrulJ0bo3aZ8k8BIdWCGMkK0pj8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ts+sLXYrBTooWrJQ6MuLVBb0WqaErwvjYMjI3hWY6erktH+LU2u2e4vb0Uj7alIRQ
	 e+JzW2azpHpKsWGo7/ySmFvC7PCNGKc8JXwXd4I03UQA06dMwN2S3faKv6t38xybBg
	 xWjrs8wJr9fQiBdf9nJtJVrb5Ogiolml8Gva4sCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE9CF80268;
	Thu, 24 Jun 2021 20:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B94DBF8025F; Thu, 24 Jun 2021 20:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp12.smtpout.orange.fr
 [80.12.242.134])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84034F800E1
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 20:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84034F800E1
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d23 with ME
 id M6pu2500121Fzsu036puNL; Thu, 24 Jun 2021 20:49:56 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 24 Jun 2021 20:49:56 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: clemens@ladisch.de, o-takashi@sakamocchi.jp, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ALSA: firewire-lib: Fix 'amdtp_domain_start()' when no
 AMDTP_OUT_STREAM stream is found
Date: Thu, 24 Jun 2021 20:49:36 +0200
Message-Id: <9c9a53a4905984a570ba5672cbab84f2027dedc1.1624560484.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The intent here is to return an error code if we don't find what we are
looking for in the 'list_for_each_entry()' loop.

's' is not NULL if the list is empty or if we scan the complete list.
Introduce a new 'found' variable to handle such cases.

Fixes: 60dd49298ec5 ("ALSA: firewire-lib: handle several AMDTP streams in callback handler of IRQ target")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
We could test with" if (list_entry_is_head(s, &d->streams, list))"
instead, but I find it much less readable.
---
 sound/firewire/amdtp-stream.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index aad9778d1c4d..9be2260e4ca2 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1943,6 +1943,7 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles,
 	unsigned int events_per_period = d->events_per_period;
 	unsigned int queue_size;
 	struct amdtp_stream *s;
+	bool found = false;
 	int err;
 
 	if (replay_seq) {
@@ -1955,10 +1956,12 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles,
 
 	// Select an IT context as IRQ target.
 	list_for_each_entry(s, &d->streams, list) {
-		if (s->direction == AMDTP_OUT_STREAM)
+		if (s->direction == AMDTP_OUT_STREAM) {
+			found = true;
 			break;
+		}
 	}
-	if (!s)
+	if (!found)
 		return -ENXIO;
 	d->irq_target = s;
 
-- 
2.30.2

