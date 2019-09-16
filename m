Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65880B4A00
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 11:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC84A1671;
	Tue, 17 Sep 2019 11:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC84A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568711017;
	bh=PvEU4D5mwxxgteK4nOfA8ZruK61+SIVX4qWdtwTd8E8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KKWwxWIUgvApKci4PUFiSlebrHple9/TO66Q/69haqQo2wGYu9fVSeShIxx8mvkTj
	 ytK2aE7EividlN2FwskAYtMWZrD4JiRu98g5QH1BbiKssl6JD1piGojCqguY7nyZu3
	 uNeYPqrSOCPOr4NW8bwbLfMnEQBlno7BBAqyeFyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7032F8048E;
	Tue, 17 Sep 2019 11:01:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EC44F80361; Tue, 17 Sep 2019 11:01:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16FBBF80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 11:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16FBBF80146
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 02:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="201792212"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2019 02:01:37 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Tue, 17 Sep 2019 05:03:53 +0800
Message-Id: <20190916210353.6318-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, bard.liao@intel.com,
 pierre-louis.bossart@linux.intel.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH] ASoC: core: delete component->card_list in
	soc_remove_component only
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We add component->card_list in the end of soc_probe_component(). In
other words, component->card_list will not be added if there is an
error in the soc_probe_component() function. So we can't delete
component->card_list in the error handling of soc_probe_component().

Fixes: 22d1423187e5 ("ASoC: soc-core: add soc_cleanup_component()")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 35f48e9c5ead..aff4b4bf4d07 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -978,7 +978,6 @@ static void soc_cleanup_component(struct snd_soc_component *component)
 	/* For framework level robustness */
 	snd_soc_component_set_jack(component, NULL, NULL);
 
-	list_del(&component->card_list);
 	snd_soc_dapm_free(snd_soc_component_get_dapm(component));
 	soc_cleanup_component_debugfs(component);
 	component->card = NULL;
@@ -991,7 +990,7 @@ static void soc_remove_component(struct snd_soc_component *component)
 		return;
 
 	snd_soc_component_remove(component);
-
+	list_del(&component->card_list);
 	soc_cleanup_component(component);
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
