Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915126249B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A472B16FB;
	Wed,  9 Sep 2020 03:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A472B16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599615822;
	bh=PZ2d1bDEhNRzwHB/XDhMu+rZKXgbn/IgHcbbZgorTCU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VK9PINsQL7epvVJIF4gsrX7pbotWnDr9YGbXOxSlFw6nImpryqvg4c86V8slUAOrh
	 aoI69uZn/8Qsq4/tZ1qNvbTjTPnTMCFqVrqvChLZIak/53DjwdN48IxcOUeseWeAcp
	 2lzqd7o4V2WdugxUeOt2Mox/ODQJzdijBUSxvQAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5095F802F9;
	Wed,  9 Sep 2020 03:39:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DCFFF802E2; Wed,  9 Sep 2020 03:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E3E8F802C4
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E3E8F802C4
IronPort-SDR: x+2L08sh59W+fBZD21QFrs1vJ0Uqz5ClfVQDZtsHlSdFRJ1VTXdtQ4SDAfsHWaCsmwCJJQky6f
 ucaGmj9+LPsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222458471"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="222458471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:24 -0700
IronPort-SDR: ozjnOh4U0DPpyy2aFTunLf651Vh0Q38T9PdgOSqk8pwu86Itu/D84R0rgJelNdVB6YiaG7/7ei
 OB9HOJEsmzUQ==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="449018113"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 5/7] ASoC: codecs: realtek-soundwire: ignore initial PARITY
 errors
Date: Tue,  8 Sep 2020 21:45:19 +0800
Message-Id: <20200908134521.6781-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
References: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The parity calculation is not reset on a Severe Reset, which leads to
misleading/harmless errors reported on startup. The addition of a
quirk helps filter out such errors while leaving the error checks on
in steady-state.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1308-sdw.c | 1 +
 sound/soc/codecs/rt5682-sdw.c | 1 +
 sound/soc/codecs/rt700-sdw.c  | 1 +
 sound/soc/codecs/rt711-sdw.c  | 1 +
 sound/soc/codecs/rt715-sdw.c  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index e02b325240df..c74685b016af 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -124,6 +124,7 @@ static int rt1308_read_prop(struct sdw_slave *slave)
 	struct sdw_dpn_prop *dpn;
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = true;
 
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 8d4ea46bc6b5..feb2db95829e 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -545,6 +545,7 @@ static int rt5682_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 8d9678d1f3c7..c6fd22058b62 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -341,6 +341,7 @@ static int rt700_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index d4b3d7716cac..10435d97f9ab 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -345,6 +345,7 @@ static int rt711_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 0e5c75f85926..9fb14a0d7334 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -439,6 +439,7 @@ static int rt715_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
-- 
2.17.1

