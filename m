Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F146130FE8A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA701674;
	Thu,  4 Feb 2021 21:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA701674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471179;
	bh=f0wtyfjjdUfY899RGxdBU+wvVZX0pTmn5Xbm1kBDJsM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjZPsQ9AXNxNYVGfkoegovvaserolY70zNq8GJKqzjV+aoPxhPGyp2Cqx9YTJvw6z
	 VQwyG+pLkXwkHjE7usg/UuQA/9N+oooMDUYRxB5bUCO9SR7O8KG4q4Q2rIpcND1a1p
	 RQ1SOslWcYkD0StGWuds2R4h9nlxlL+OdTuUKlko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C9E4F804F1;
	Thu,  4 Feb 2021 21:34:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B88D7F80264; Thu,  4 Feb 2021 21:33:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01C3F80254
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01C3F80254
IronPort-SDR: M/IjO8aWfchQX6Ad1zyXkWhcqalaSeLAHQvBZJDyZ43HJJuLzlZ/j05K3Pw96m6ZO2ml0TbULi
 +TEp8iLK8wnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181472537"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="181472537"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:53 -0800
IronPort-SDR: BIU8uz0QgQze18w6okiD5IJcZpPJWqPHsj7lZH6lCg54HwWHAVHfKPBnUiSX15SGmatX0XyLq4
 yvpqZaShr0uA==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="483700353"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/14] ASoC: SOF: Intel: SoundWire: refine ACPI match
Date: Thu,  4 Feb 2021 14:33:09 -0600
Message-Id: <20210204203312.27112-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

We have existing platforms where the wrong machine is selected. We
need to make sure the number of devices reported on a link matches
what we expect for a link descriptor. This helps avoid using the
TGL-RVP configuration for an HP platform or vice-versa, depending on
the order in which they are inserted in the table.

Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
---
 sound/soc/sof/intel/hda.c | 59 +++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 447163494b05..db868376039a 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1071,32 +1071,63 @@ static bool link_slaves_found(struct snd_sof_dev *sdev,
 	struct sdw_intel_slave_id *ids = sdw->ids;
 	int num_slaves = sdw->num_slaves;
 	unsigned int part_id, link_id, unique_id, mfg_id;
-	int i, j;
+	int i, j, k;
 
 	for (i = 0; i < link->num_adr; i++) {
 		u64 adr = link->adr_d[i].adr;
+		int reported_part_count = 0;
 
 		mfg_id = SDW_MFG_ID(adr);
 		part_id = SDW_PART_ID(adr);
 		link_id = SDW_DISCO_LINK_ID(adr);
+
+		for (j = 0; j < num_slaves; j++) {
+			/* find out how many identical parts were reported on that link */
+			if (ids[j].link_id == link_id &&
+			    ids[j].id.part_id == part_id &&
+			    ids[j].id.mfg_id == mfg_id)
+				reported_part_count++;
+		}
+
 		for (j = 0; j < num_slaves; j++) {
+			int expected_part_count = 0;
+
 			if (ids[j].link_id != link_id ||
 			    ids[j].id.part_id != part_id ||
 			    ids[j].id.mfg_id != mfg_id)
 				continue;
-			/*
-			 * we have to check unique id
-			 * if there is more than one
-			 * Slave on the link
-			 */
-			unique_id = SDW_UNIQUE_ID(adr);
-			if (link->num_adr == 1 ||
-			    ids[j].id.unique_id == SDW_IGNORED_UNIQUE_ID ||
-			    ids[j].id.unique_id == unique_id) {
-				dev_dbg(bus->dev,
-					"found %x at link %d\n",
-					part_id, link_id);
-				break;
+
+			/* find out how many identical parts are expected */
+			for (k = 0; k < link->num_adr; k++) {
+				u64 adr2 = link->adr_d[i].adr;
+				unsigned int part_id2, link_id2, mfg_id2;
+
+				mfg_id2 = SDW_MFG_ID(adr2);
+				part_id2 = SDW_PART_ID(adr2);
+				link_id2 = SDW_DISCO_LINK_ID(adr2);
+
+				if (link_id2 == link_id &&
+				    part_id2 == part_id &&
+				    mfg_id2 == mfg_id)
+					expected_part_count++;
+			}
+
+			if (reported_part_count == expected_part_count) {
+				/*
+				 * we have to check unique id
+				 * if there is more than one
+				 * Slave on the link
+				 */
+				unique_id = SDW_UNIQUE_ID(adr);
+				if (reported_part_count == 1 ||
+				    ids[j].id.unique_id == unique_id) {
+					dev_dbg(bus->dev, "found %x at link %d\n",
+						part_id, link_id);
+					break;
+				}
+			} else {
+				dev_dbg(bus->dev, "part %x reported %d expected %d on link %d, skipping\n",
+					part_id, reported_part_count, expected_part_count, link_id);
 			}
 		}
 		if (j == num_slaves) {
-- 
2.25.1

