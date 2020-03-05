Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D831E17A60E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:09:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524371671;
	Thu,  5 Mar 2020 14:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524371671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583413744;
	bh=QtadTGNeD3JYpv4iBdDHvMrBhrRjKlUcRH+KvkHxONw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BefjajOlMEGiOL+65EQIdxxsvEj0X5pwcT5xKpvNgygReLICoMZXgfpduyj6bzGuF
	 HTr+4WNTgzUJ2QEmFvCd0htZLqMBxKJKBKa+g1Jomivz6WpbwRSjfQGhqwBVCedX5i
	 U0FhvWQvZaXMBNGn6X9UjM1wn6gZJdGQ6AuRZNjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A18E6F80279;
	Thu,  5 Mar 2020 14:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32C1CF80245; Thu,  5 Mar 2020 14:06:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC82F80245
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC82F80245
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="287659380"
Received: from virbhadx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.184.168])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2020 05:06:27 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/3] ASoC: soc-core: introduce exit() callback for dailinks
Date: Thu,  5 Mar 2020 07:06:14 -0600
Message-Id: <20200305130616.28658-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Some machine drivers allocate or request resources during the init()
phase, which need to be released at some point, e.g. when rebooting or
unloading modules.

In an initial pass, we added a .remove() callback for the platform
driver, but that's not symmetrical at all and would be difficult to
handle if there are more than one dailink implementing an .init().

We looked also into using .remove_dai_link() callback, but that would
also be imlanced.

The suggested solution is to use a dual exit() phase for dailinks to
release all resources.

The exit() is invoked in soc_free_pcm_runtime(), which is not
completely symmetric with the init() invoked in soc_init_pcm_runtime()
- not soc_add_pcm_runtime(), but that's the best solution so far.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc.h  | 3 +++
 sound/soc/soc-core.c | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 81e5d17be935..2beebe89ebbc 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -794,6 +794,9 @@ struct snd_soc_dai_link {
 	/* codec/machine specific init - e.g. add machine controls */
 	int (*init)(struct snd_soc_pcm_runtime *rtd);
 
+	/* codec/machine specific exit - dual of init() */
+	void (*exit)(struct snd_soc_pcm_runtime *rtd);
+
 	/* optional hw_params re-writing for BE and FE sync */
 	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f2cfbf182f49..09a0976d6a62 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -937,8 +937,14 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+
 	lockdep_assert_held(&client_mutex);
 
+	/* release machine specific resources */
+	if (dai_link->exit)
+		dai_link->exit(rtd);
+
 	/*
 	 * Notify the machine driver for extra destruction
 	 */
@@ -1069,7 +1075,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	/* set default power off timeout */
 	rtd->pmdown_time = pmdown_time;
 
-	/* do machine specific initialization */
+	/* do machine specific allocations and initialization */
 	if (dai_link->init) {
 		ret = dai_link->init(rtd);
 		if (ret < 0) {
-- 
2.20.1

