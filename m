Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617839B3F
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 07:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5461165F;
	Sat,  8 Jun 2019 07:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5461165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559970543;
	bh=0If6S2xQt+XUanWhHduxpTJRBSFScYBkRG+RdqJBzjE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U8dbG3BIOCkuk9Rx7JzXFVPbPIqU3zjC54QsUn7APk7VRuX6eSFO+7NMxtaxAk/C9
	 TLc1xt0YLpTIUmUFzH6/mXqhL2OOpFfjH7rvbKwOjoDaF1aGCxjoH53TE3FwGPatag
	 kwvrdP66y0/K780oaQfSuFiouWQ5sdd8rDMt5TkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 409DBF896F7;
	Sat,  8 Jun 2019 07:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E26A2F896F7; Sat,  8 Jun 2019 07:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EE5DF80709
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 07:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EE5DF80709
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 22:07:08 -0700
X-ExtLoop1: 1
Received: from bareed-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.254.97.61])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2019 22:07:07 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  7 Jun 2019 22:07:06 -0700
Message-Id: <20190608050706.14837-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: guillaume.tucker@collabora.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH] ASoC: core: Fix deadlock in
	snd_soc_instantiate_card()
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

Move the client_mutex lock to snd_soc_unbind_card() before
removing link components. This prevents the deadlock
in the error path in snd_soc_instantiate_card().

Fixes: 34ac3c3eb8 (ASoC: core: lock client_mutex while removing
link components)
Reported-by: kernelci.org bot <bot@kernelci.org>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f0fa289c90d8..23538868ed76 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1018,14 +1018,12 @@ static void soc_remove_link_components(struct snd_soc_card *card,
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
 
-	mutex_lock(&client_mutex);
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
 		if (component->driver->remove_order == order)
 			soc_remove_component(component);
 	}
-	mutex_unlock(&client_mutex);
 }
 
 static void soc_remove_dai_links(struct snd_soc_card *card)
@@ -2749,12 +2747,14 @@ static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 		snd_soc_dapm_shutdown(card);
 		snd_soc_flush_all_delayed_work(card);
 
+		mutex_lock(&client_mutex);
 		/* remove all components used by DAI links on this card */
 		for_each_comp_order(order) {
 			for_each_card_rtds(card, rtd) {
 				soc_remove_link_components(card, rtd, order);
 			}
 		}
+		mutex_unlock(&client_mutex);
 
 		soc_cleanup_card_resources(card);
 		if (!unregister)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
