Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E47A5FF1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8E6E84;
	Tue, 19 Sep 2023 12:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8E6E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120358;
	bh=jSjrZPIxqBCPPykYn5idzXFgdMVgMGsndrwh31h84P4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i4P+uI84Arzqs2aos2NbDTJLysNLow1qHSw8p20IhMWEqHaKsTgCOZoMslBAvsmEM
	 VPnwxoSqCiuwMR8AN8tVTdaxIY/kVwsujv3fuS88EZXJsAxOfKgU5vydh6xjibSaAF
	 JDIo1dhb7G3vXypDUGpBPQJBfJbH7OcAmsvkCPFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3E54F805EE; Tue, 19 Sep 2023 12:42:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A245F805E7;
	Tue, 19 Sep 2023 12:42:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E02A4F805D6; Tue, 19 Sep 2023 12:42:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67CCFF805B3
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CCFF805B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oE/vvYwH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120167; x=1726656167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jSjrZPIxqBCPPykYn5idzXFgdMVgMGsndrwh31h84P4=;
  b=oE/vvYwH4C2Iu42Hy7VeLjs1g+KjhRd7fNZsKSpd3o9d9FWlyuKs4kP6
   FIJCmsrjTW1WgJPFD7houAzQU33ya1L/qcTEjlXfzRemK8cLLqvQJJZ2h
   D3y4+L/MwwAZ/Kyt5iY76Nt4kWyZRWSonfELMt+u5TKvcubZd3QY1SIkK
   51mCHl6u1lFc8b61DHf1vsqaWKw4p1CKX0MUIkFMcNaBxAWM+2OQWGQfP
   BiokQSYT2TFLMAi0V31DFuDOR2kb7tvooAWR8HE5JCPgEDuWVWhp/S2vO
   IJo+qGDVcHBcODvHfgIMhJ6RVKKs4Ow2Wa0trwp88L8qYw2D1jlrCV6t2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658520"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658520"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823306"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823306"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 9/9] ASoC: SOF: Drop unused IPC type defines
Date: Tue, 19 Sep 2023 13:42:26 +0300
Message-ID: <20230919104226.32239-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IDX57I47HIJS6AJ75OWEXF6GWIH5H5EM
X-Message-ID-Hash: IDX57I47HIJS6AJ75OWEXF6GWIH5H5EM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDX57I47HIJS6AJ75OWEXF6GWIH5H5EM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SOF stack now uses the generic names for the IPC type, the defines can
be dropped.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 31121c6df027..268d0ca0f69f 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -57,9 +57,6 @@ enum sof_ipc_type {
 	SOF_IPC_TYPE_COUNT
 };
 
-#define SOF_IPC		SOF_IPC_TYPE_3
-#define SOF_INTEL_IPC4	SOF_IPC_TYPE_4
-
 /*
  * SOF Platform data.
  */
-- 
2.42.0

