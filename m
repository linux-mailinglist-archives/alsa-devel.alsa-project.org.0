Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC7721799D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F4C16AD;
	Tue,  7 Jul 2020 22:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F4C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154513;
	bh=3QxLqaoylUilET6yUZ62pfkB7xU6rROy9y42Whr1xS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RS4fqQrr3ztCHb8oVw7jA5LxED2Q5P+9qiqXlKk8HQ0zkCPchCmJZoDrZJ5Fbo2sf
	 VsdkzwfWA7O811UVIsjh/34cG+KQMCjmED68xPzlhRRtEMLC9K15EW2w0bnucxjpj6
	 Qk/CZqc0o5rlO+TPnlplGSgpjuRz6k7/NOv9g8nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CDBFF802E0;
	Tue,  7 Jul 2020 22:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A50F802BE; Tue,  7 Jul 2020 22:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B61F8027C
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B61F8027C
IronPort-SDR: wk95Scda5XYsRUolrm3kwWvvb32RFi1U/rLtAIVz/UKC5Zpb7fxZ2dOA4uvimBSgwvY460F34H
 qkPLmr0Ryevw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147700578"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147700578"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:25 -0700
IronPort-SDR: 7OM/gR7QKwvp/d0zvtpKvhGGU2cVgdzgD8MT9f6Nm7ipMAo2SRN7qEndPlxdSRl4/icL6apdsB
 kVfOryakyQiw==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483640831"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: topology: add more logs when topology load fails.
Date: Tue,  7 Jul 2020 15:37:49 -0500
Message-Id: <20200707203749.113883-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
References: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>
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

Add more dev_err() logs to help trace topology load failures, since we
have multiple error causes (e.g. invalid header or header that could
not be loaded).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/soc-topology.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 4004fc882912..cee998671318 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1263,6 +1263,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 
 		ret = soc_tplg_add_route(tplg, routes[i]);
 		if (ret < 0) {
+			dev_err(tplg->dev, "ASoC: topology: add_route failed: %d\n", ret);
 			/*
 			 * this route was added to the list, it will
 			 * be freed in remove_route() so increment the
@@ -2743,15 +2744,21 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
 
 			/* make sure header is valid before loading */
 			ret = soc_valid_header(tplg, hdr);
-			if (ret < 0)
+			if (ret < 0) {
+				dev_err(tplg->dev,
+					"ASoC: topology: invalid header: %d\n", ret);
 				return ret;
-			else if (ret == 0)
+			} else if (ret == 0) {
 				break;
+			}
 
 			/* load the header object */
 			ret = soc_tplg_load_header(tplg, hdr);
-			if (ret < 0)
+			if (ret < 0) {
+				dev_err(tplg->dev,
+					"ASoC: topology: could not load header: %d\n", ret);
 				return ret;
+			}
 
 			/* goto next header */
 			tplg->hdr_pos += le32_to_cpu(hdr->payload_size) +
-- 
2.25.1

