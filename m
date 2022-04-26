Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8913510805
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BD9017DE;
	Tue, 26 Apr 2022 21:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BD9017DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650999772;
	bh=DjznMDAhNEc5QHd2KrCHEg4wQdCk7DPbt7gwniVkN/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qeRPV7HD7GJunx8klSOd8cxxeJVJpJKNuo5KlovW5T+RrdWI0wkt01arDgVqW+/0C
	 0gFGv5ZKJXHAxF2qVzHYFNwz+Ir4Nr92JQtPmXYLdLPTcsK50k7noFsUdruk6yebhx
	 lFKTr5RhJPC9ODDeyOwPz9NmB7RlsEFNSliqwYjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47889F800AE;
	Tue, 26 Apr 2022 21:01:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45BDFF800AE; Tue, 26 Apr 2022 21:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3895F800AE
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3895F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GdDtxLvW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 278FEB821FC;
 Tue, 26 Apr 2022 19:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C062CC385A4;
 Tue, 26 Apr 2022 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650999706;
 bh=DjznMDAhNEc5QHd2KrCHEg4wQdCk7DPbt7gwniVkN/s=;
 h=From:To:Cc:Subject:Date:From;
 b=GdDtxLvWCm2p9L+TKMn3QHxUTstwKOmYho8DE1xmbozSIq3P8aKZBR0RkuT1Unn1y
 ZtEt0J7ecXbZs10FxKF+B+OX8fqaBvQtqxG3lPqpjnGZBz+jNjrdBU5OK27FJNQSZB
 bU+cQ7+QzcRdlrgziV0BdVVQnPDeiboB88F1tr4pGNBxXquoyUQ4KyWlqu6dG4ThBo
 Oy1vOMECzgJIMe3cRka3eNF9Ezkk1KYBac8iRMFw37A3SExIarfjxYYMv0ZvSYnGSt
 Bq6RTJRPpOc9BMByQndT0MJM/yTsoLjaFG8JebqZnKy1WJMG82NJLoBAA7lnj2TF58
 AFA5Oq2YIemnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 01/22] ASoC: soc-pcm: use GFP_KERNEL when the
 code is sleepable
Date: Tue, 26 Apr 2022 15:01:24 -0400
Message-Id: <20220426190145.2351135-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit fb6d679fee95d272c0a94912c4e534146823ee89 ]

At the kzalloc() call in dpcm_be_connect(), there is no spin lock involved.
It's merely protected by card->pcm_mutex, instead.  The spinlock is applied
at the later call with snd_soc_pcm_stream_lock_irq() only for the list
manipulations.  (See it's *_irq(), not *_irqsave(); that means the context
being sleepable at that point.)  So, we can use GFP_KERNEL safely there.

This patch revert commit d8a9c6e1f676 ("ASoC: soc-pcm: use GFP_ATOMIC for
dpcm structure") which is no longer needed since commit b7898396f4bb
("ASoC: soc-pcm: Fix and cleanup DPCM locking").

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/e740f1930843060e025e3c0f17ec1393cfdafb26.1648757961.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9a954680d492..11c9853e9e80 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1214,7 +1214,7 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		be_substream->pcm->nonatomic = 1;
 	}
 
-	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_ATOMIC);
+	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_KERNEL);
 	if (!dpcm)
 		return -ENOMEM;
 
-- 
2.35.1

