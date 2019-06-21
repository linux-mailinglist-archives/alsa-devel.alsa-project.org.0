Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73414E738
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 13:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F451662;
	Fri, 21 Jun 2019 13:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F451662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561116990;
	bh=QodDNJvWOq63QcDD4veTdE7J++i7YPenkRxBaAwMB8k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TL3yCiYcBHu+yYcY0QjH2Og3Yugd+eY1GOsAGnBFycp6iVtN2zrblE8KMYbaE6T7d
	 fkyQTYnrsc2/EUvEE7MzrXGL76KuUeLi5apylohjScAUB9AM581bdRcao1t3GHpqgh
	 ejpVlE6g8EIJxF5nsX0msgKB3pWeDThyo2BI3hF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F7AF896F9;
	Fri, 21 Jun 2019 13:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19832F896B8; Fri, 21 Jun 2019 13:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C1AF89682
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 13:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C1AF89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jr2yPJFj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3FBFeMMQbHDljCo0ysZt4E1/LLDovdIwQ1oyGOMfxow=; b=jr2yPJFjv8wsFKWBZQ1VqKv4b
 r6VdXmrj7q6VoPktD+/CgPd2w9HVxnPFyH+OF06FZhZd5chqZWLEMbj0z5JTVRYz2/my8YoYBuP2r
 tX6/gLSEEuiECdfOxv+JGyJJwUA7bMmSzRKEZ8W36anj5eZJH8dRl3EfO9QX2mbXY95xU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1heHnq-0002PW-H8; Fri, 21 Jun 2019 11:33:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4305A440046; Fri, 21 Jun 2019 12:33:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 21 Jun 2019 12:33:56 +0100
Message-Id: <20190621113357.8264-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] ASoC: core: Adapt for debugfs API change
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

Back in ff9fb72bc07705c (debugfs: return error values, not NULL) the
debugfs APIs were changed to return error pointers rather than NULL
pointers on error, breaking the error checking in ASoC. Update the
code to use IS_ERR() and log the codes that are returned as part of
the error messages.

Fixes: ff9fb72bc07705c (debugfs: return error values, not NULL)
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c510da2d4af6..6d5c09493f4b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -165,9 +165,10 @@ static void soc_init_component_debugfs(struct snd_soc_component *component)
 				component->card->debugfs_card_root);
 	}
 
-	if (!component->debugfs_root) {
+	if (IS_ERR(component->debugfs_root)) {
 		dev_warn(component->dev,
-			"ASoC: Failed to create component debugfs directory\n");
+			"ASoC: Failed to create component debugfs directory: %ld\n",
+			PTR_ERR(component->debugfs_root));
 		return;
 	}
 
@@ -219,18 +220,21 @@ static void soc_init_card_debugfs(struct snd_soc_card *card)
 
 	card->debugfs_card_root = debugfs_create_dir(card->name,
 						     snd_soc_debugfs_root);
-	if (!card->debugfs_card_root) {
+	if (IS_ERR(card->debugfs_card_root)) {
 		dev_warn(card->dev,
-			 "ASoC: Failed to create card debugfs directory\n");
+			 "ASoC: Failed to create card debugfs directory: %ld\n",
+			 PTR_ERR(card->debugfs_card_root));
+		card->debugfs_card_root = NULL;
 		return;
 	}
 
 	card->debugfs_pop_time = debugfs_create_u32("dapm_pop_time", 0644,
 						    card->debugfs_card_root,
 						    &card->pop_time);
-	if (!card->debugfs_pop_time)
+	if (IS_ERR(card->debugfs_pop_time))
 		dev_warn(card->dev,
-			 "ASoC: Failed to create pop time debugfs file\n");
+			 "ASoC: Failed to create pop time debugfs file: %ld\n",
+			 PTR_ERR(card->debugfs_pop_time));
 }
 
 static void soc_cleanup_card_debugfs(struct snd_soc_card *card)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
