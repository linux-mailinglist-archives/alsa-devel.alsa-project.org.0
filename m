Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3447BB377
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D7110E;
	Fri,  6 Oct 2023 10:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D7110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582081;
	bh=EhXajnmYx6a8+QlAu8D0OJBtQMFoHUgLH48OKYq38d0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D8wWuxFdjL5MZmLvflbJsYVsqXrg/LKaqeeMhkY2myqZGLcSPt7odxEKEvEZjx4Rw
	 1OTn5KYtMq4M29v9ow1B7Qzt1Z3WYd9n9/4CRkRJoWl0LjenNCskXpiQjbPWd4rZtB
	 pJYJxxhCac+XiQ689DPo/GyjyDWTO5COuXwDlvz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34170F80578; Fri,  6 Oct 2023 10:46:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A11F80578;
	Fri,  6 Oct 2023 10:46:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC2C2F80130; Fri,  6 Oct 2023 10:45:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 135ABF80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 135ABF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZpTuQ4ni
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696581938; x=1728117938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EhXajnmYx6a8+QlAu8D0OJBtQMFoHUgLH48OKYq38d0=;
  b=ZpTuQ4nibBNxth+ygu+6dCdjn662Zmf8IVXuEhQbkD7RZv5QzsyvOqJD
   fdWJhkd3UKtVkfc/CJsS4loRNxuAtGh3CsoYlxCh6/WjHCXEj0jBtoO2x
   BQ2rg/T7nO2GVIt7FhrQw/bUyvCRVIjrXTTuejn8KUcEKf+vQgsOpelZ+
   pP1qZn3r8wPkR+ceSdw5NcIkyuPrLPJm0q4Plx90pFiPsIQPiQO06IS4l
   3ny6J1IoWPfIi3yexKTI4Gj1kvaLw6/ZNLUAddPuUNr6nUAmDD3RZ42Vg
   ZrATPguIWw2Yb8ahsFDAzknj25Ku+kXvbkfhIpObXukN12jGUMoo2/Fqe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5263825"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="5263825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868266286"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="868266286"
Received: from mesalamy-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.42.190])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:44:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 1/2] ASoC: SOF: IPC4: get pipeline priority from topology
Date: Fri,  6 Oct 2023 11:44:53 +0300
Message-ID: <20231006084454.19170-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
References: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 73WXU4TW4EANDVYZJ67I26JGUNZRWNW7
X-Message-ID-Hash: 73WXU4TW4EANDVYZJ67I26JGUNZRWNW7
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/73WXU4TW4EANDVYZJ67I26JGUNZRWNW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Driver set pipeline priority according to priority setting in topology.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index af90c14ad57a..b24a64377f68 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -44,6 +44,8 @@ static const struct sof_topology_token ipc4_sched_tokens[] = {
 		offsetof(struct sof_ipc4_pipeline, use_chain_dma)},
 	{SOF_TKN_SCHED_CORE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, core_id)},
+	{SOF_TKN_SCHED_PRIORITY, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pipeline, priority)},
 };
 
 static const struct sof_topology_token pipeline_tokens[] = {
@@ -683,9 +685,6 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
-	/* TODO: Get priority from topology */
-	pipeline->priority = 0;
-
 	dev_dbg(scomp->dev, "pipeline '%s': id %d, pri %d, core_id %u, lp mode %d\n",
 		swidget->widget->name, swidget->pipeline_id,
 		pipeline->priority, pipeline->core_id, pipeline->lp_mode);
-- 
2.42.0

