Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77947A5FE2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105DCE93;
	Tue, 19 Sep 2023 12:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105DCE93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120253;
	bh=RvGN1U6vh4JM61XiCwgK3b00NVuKWgqnx8p8AkfguFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WS49f2h+ZoIbfU6b2zf4SWFrtvjVYdo9JgD+XyGyXK57AamOf6cJfA3p9v8213TuD
	 DiTqvIDboePXOuOd5NV9pxedf3vmUO29nYbIzZsc+EXZLL7k3NKUEpG/irFTUFiyHt
	 Djfadw2fTieV8Bi3L1smzt1P3yqVn11/yOgUku9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ACDDF80579; Tue, 19 Sep 2023 12:42:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4FBDF8057A;
	Tue, 19 Sep 2023 12:42:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BBC4F8025A; Tue, 19 Sep 2023 12:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FF4DF80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF4DF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hrkPuShB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120148; x=1726656148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RvGN1U6vh4JM61XiCwgK3b00NVuKWgqnx8p8AkfguFg=;
  b=hrkPuShBr6fGxAKT2d/UveNqrexCNTAR69CwvP5FB4oBYGdvg0XdQ2NV
   X3NqsyWVr/nADbzJ9enwS2T/T05NBwDnOfzNfz9G8ZZZfvRRmszVTEXWJ
   kBQDcpL/bRPVG8ns+3AAXjAzxW0Hmji0qRkjzj3nD/n8lsyuUjdS/txBK
   3tw1byGLvF4YtA8f6KK/kV+PMq99Tky3w0BOM6VzCdPssVQ1Xy0uZQTJy
   BUFzPYfw40yxybWB/miDBuQIvKGp+8OLfncsJcgPTL8LLaAOzFsolwxkp
   K73amhEp+ubpKyevoa7HlFDgfeFYmOeXx9je95xXKOqAwB/GkbgwPocqa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658450"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823199"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823199"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 2/9] ASoC: SOF: sof-pci-dev: Update the ipc_type module
 parameter description
Date: Tue, 19 Sep 2023 13:42:19 +0300
Message-ID: <20230919104226.32239-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4DPKDI5ILY5SK4MJQURUHZAVSHTLSVKB
X-Message-ID-Hash: 4DPKDI5ILY5SK4MJQURUHZAVSHTLSVKB
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clarify the description of the ipc_type module parameter and drop the Intel
CAVS in favor of IPC4.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 146d25983b08..1d706490588e 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -46,7 +46,7 @@ MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
 static int sof_pci_ipc_type = -1;
 module_param_named(ipc_type, sof_pci_ipc_type, int, 0444);
-MODULE_PARM_DESC(ipc_type, "SOF IPC type (0): SOF, (1) Intel CAVS");
+MODULE_PARM_DESC(ipc_type, "Force SOF IPC type. 0 - IPC3, 1 - IPC4");
 
 static const char *sof_dmi_override_tplg_name;
 static bool sof_dmi_use_community_key;
-- 
2.42.0

