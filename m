Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A876A31B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406A66C0;
	Mon, 31 Jul 2023 23:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406A66C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839663;
	bh=fPhiiq55j/+ahMHT94Bc2s7ZfXhpAe04roSi7bxEURE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZfEMwjfOuCaEKXr90voTcKPsoWii2K2xzr2CxzYm9pNdSrZBtQ28sPr4oLCX69Oc
	 5vX6cvjUP+ek3x2Qm78Zb1p16W+AfTJWirtpQkX5JQN8FH4FdlIXEC73Nm74h9OG/Z
	 c6rEQ3X2/+759UOfy1ZvyTCTm+DnYdF4F/j82L0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FA65F805C9; Mon, 31 Jul 2023 23:38:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C251F805B6;
	Mon, 31 Jul 2023 23:38:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E17F8057E; Mon, 31 Jul 2023 23:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEC28F80535
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC28F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gtSo0xtR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839491; x=1722375491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fPhiiq55j/+ahMHT94Bc2s7ZfXhpAe04roSi7bxEURE=;
  b=gtSo0xtRXUy5chqwIdHdcg29L8iEsVNF6NVpIll8yscoGy2wnG+cWiMB
   qrFT02YXy3lVAOwf36pkqittQw5Rl6bnuMtKokpfFqg1LSC4Gj5GZhjKx
   mCSO/UABv5Zdv3HmVOJlOUmoo3QIj5pen04+MfhEWbhUqdYNTXaMn8JH+
   RDbrfPUSB5cu/l2SeoRplrtrKg8GeQdc1d0nwC70ZAF3e11kGno39mAZa
   AdTqadGu7nKDCcczr8P1nOv82zAj9uVnzWosSxJwF/uK1H92jADPVHQk2
   7OWfBzO6pnu8lz23lQ8qa+m+vJIOlY9FPLxxmSklobl3Hb9Z4Py0zgm9o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366604103"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="366604103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793880040"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="793880040"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Yaochun Hung <yc.hung@mediatek.com>
Subject: [PATCH 3/8] ASoC: SOF: topology: simplify code to prevent static
 analysis warnings
Date: Mon, 31 Jul 2023 16:37:43 -0500
Message-Id: <20230731213748.440285-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
References: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X37FX7AMPJVI25PBZ5OJ6E76G2IXV5SE
X-Message-ID-Hash: X37FX7AMPJVI25PBZ5OJ6E76G2IXV5SE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X37FX7AMPJVI25PBZ5OJ6E76G2IXV5SE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

make KCFLAGS='-fanalyzer' sound/soc/sof/intel/ reports a possible NULL
pointer dereference.

sound/soc/sof/topology.c:1136:21: error: dereference of NULL ‘w’
[CWE-476] [-Werror=analyzer-null-dereference]

 1136 |     strcmp(w->sname, rtd->dai_link->stream_name))

The code is rather confusing and can be simplified to make static
analysis happy. No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 698129dccc7d..3866dd3cba69 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1117,10 +1117,11 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 {
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
+	const char *sname = w->sname;
 	struct snd_soc_dai *cpu_dai;
 	int i, stream;
 
-	if (!w->sname)
+	if (!sname)
 		return;
 
 	if (w->id == snd_soc_dapm_dai_out)
@@ -1133,7 +1134,7 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 	list_for_each_entry(rtd, &card->rtd_list, list) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
-		    strcmp(w->sname, rtd->dai_link->stream_name))
+		    strcmp(sname, rtd->dai_link->stream_name))
 			continue;
 
 		for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-- 
2.39.2

