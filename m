Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE577C405
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70860741;
	Tue, 15 Aug 2023 01:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70860741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692056644;
	bh=lp8rCRjGCO/LOKLNJ4DrPihtkVYfEYrRPMDlUYsgkxw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mRo7tfXfkQNz+z05dATADAOwSPEBy2fchd4qH1p3O83puqyEet0q9R1SYP0eO8fZd
	 LvVtdua2CQVw81xJWQ7tlyuA51n+w0rbbLvROAK16yaesPaUBGAJjcpKIwH/An7L6v
	 IwnH0h2gEOBOW8rrRxyFsq+eXnN+cP7n6oiv6SXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED9CDF80552; Tue, 15 Aug 2023 01:43:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4515CF801EB;
	Tue, 15 Aug 2023 01:43:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F22F80254; Tue, 15 Aug 2023 01:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0943DF80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0943DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CNjZTcHZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692056581; x=1723592581;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lp8rCRjGCO/LOKLNJ4DrPihtkVYfEYrRPMDlUYsgkxw=;
  b=CNjZTcHZBH5DI4Z7zQTPL6R/rpnYSStFBYuhbjizshCNtW2QYGAJZlxH
   x1uWSihrT0SSue25M0DRrIZuyekbNKxXuwesZyMX4RmBeMM62LSvKTAjg
   KI1jv3L7zcif/wBR8V0yLLIvkLjvFAGbbE/dGaTLJFYIjkJsWpBRoJIUv
   fA39mdDgtQhXAXLi7CNgz3/oVa04eONcZ7yqkUoFf1eLxu1bZ85NsXV3o
   J1dDXua8oT5XPB7QJOlgXXYa6kcjUPnAOyK3zPGtFm16vqGkB6oSprBNa
   Y9l3UixO156L3qBlUvN5Pl9DOnIG0aB1Ye2v63jZer0gcVS4w8mFNLPKZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351750782"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="351750782"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710511253"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="710511253"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:42:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: remove duplicate code due to merge
Date: Mon, 14 Aug 2023 18:42:35 -0500
Message-Id: <20230814234235.87268-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WAAZDUKICTPCBQMKISEY2FWWRCUXGNRR
X-Message-ID-Hash: WAAZDUKICTPCBQMKISEY2FWWRCUXGNRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAAZDUKICTPCBQMKISEY2FWWRCUXGNRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 81113108491e ("ASoC: Merge up fixes") added the same code
twice, remove the extra call.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b43663822613..633f6040d712 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1734,9 +1734,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
 
-	/* update pipeline memory usage */
-	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
-
 	/* copy IPC data */
 	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
 	if (gtw_cfg_config_length)
-- 
2.39.2

