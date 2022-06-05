Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF2453DC98
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 17:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B3418F1;
	Sun,  5 Jun 2022 17:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B3418F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654443426;
	bh=/72zYNy5PgNbUZnHZ36o40QndPGnaDktvV+scq+qQKI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sMHZbjStRWAkLX2SD97ZbqFLddNnwLhe9A0bjR7hIzrma0BlyFX/KT3+AkN8VLVXZ
	 +V9ujM6N3QDPTtO/4gc8c+kJEfuiOgQgyatgzKYhf5iFE/CFixhV+4Z8WBdb4ddCRq
	 WPRG6qL2zhiowQGl7n1pfoDtqHAF34S9Bnz4N6pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A554EF80116;
	Sun,  5 Jun 2022 17:36:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE0BF80162; Sun,  5 Jun 2022 17:36:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2BA2F80116
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 17:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BA2F80116
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nxsI6-00029D-DU; Sun, 05 Jun 2022 17:35:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nxsI4-006dDs-UQ; Sun, 05 Jun 2022 17:35:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nxsI2-00ENJG-Sj; Sun, 05 Jun 2022 17:35:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: simple-card-utils: Make asoc_simple_clean_reference()
 return void
Date: Sun,  5 Jun 2022 17:35:37 +0200
Message-Id: <20220605153537.26591-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300; h=from:subject;
 bh=/72zYNy5PgNbUZnHZ36o40QndPGnaDktvV+scq+qQKI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBinM1F3ZWk00re0sO+Qbi19zTBfn/zH1o64+o+HZHr
 hh0SaveJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpzNRQAKCRDB/BR4rcrsCcPwB/
 9GYq85fANBJpCzWmp5Scx4fCwt52zL5yP2b5XrOKYrPk6klMg0mkmFhqnFVshsFD/BCvDsdhV8fYU1
 zAy87vuQsgQnJTtqdJ7nZO3WAhrG7fxLXOYGlzOWztg4t6kGQ/13vvxnvlfWILgq6fvlI4V5yXe7bZ
 JxD+5pfDAgLb+x1anym/lFSWDHSrO3L7896F7K0BreDAzHOMDxS6B1i1fz8OK4d2xx5iEmG7vUgzFn
 UuJMM9velQ+/vD8K6KZkkCMVfWaGWP1xJOZbpKDDYi/uHeUHvqYSS+1PjHND4fXugzPiiyviXNBiNv
 uQMvtmhPZrvBzJBFXBDs98fBVei9On
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de
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

asoc_simple_clean_reference() returns zero unconditionally. Letting it
return void instead makes it easier to see in the caller that there is no
error to handle.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/sound/simple_card_utils.h     | 2 +-
 sound/soc/generic/simple-card-utils.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 8faa649f712b..fe2337fde1f4 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -173,7 +173,7 @@ void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platfo
 void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links);
 
-int asoc_simple_clean_reference(struct snd_soc_card *card);
+void asoc_simple_clean_reference(struct snd_soc_card *card);
 
 void asoc_simple_convert_fixup(struct asoc_simple_data *data,
 				      struct snd_pcm_hw_params *params);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index da0c27828ce6..a542dec92ad5 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -609,7 +609,7 @@ void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_cpu);
 
-int asoc_simple_clean_reference(struct snd_soc_card *card)
+void asoc_simple_clean_reference(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_dai_link_component *cpu;
@@ -622,7 +622,6 @@ int asoc_simple_clean_reference(struct snd_soc_card *card)
 		for_each_link_codecs(dai_link, j, codec)
 			of_node_put(codec->of_node);
 	}
-	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_clean_reference);
 
@@ -878,7 +877,9 @@ int asoc_simple_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
-	return asoc_simple_clean_reference(card);
+	asoc_simple_clean_reference(card);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_remove);
 

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

