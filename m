Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DF2492B3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 04:05:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A996717AC;
	Wed, 19 Aug 2020 04:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A996717AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597802743;
	bh=+/PU/Eoi3PjKnAwzrbd//Fjc4Xw12gF7bO1LI23wGuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pel5kNUoNEfW3VEABU2f/P2geN8atYQeRCEwYDoC9TpjYot02Frz/E1WvuaSvSwL7
	 /gz+X15l9yCXP/hzd64XqiJrqH6vdRM5OItrHF40X9Ke85NZwGChA9ebUxa4vPDcIZ
	 rjngbljiIZWUuUAhb0LEFniRzVz4zKbf5Xj2ySD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DBEF802F9;
	Wed, 19 Aug 2020 04:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0B97F802E0; Wed, 19 Aug 2020 04:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 115FCF80255
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 04:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 115FCF80255
IronPort-SDR: praCjnpgnYPDDkfk8hCX1WiJDNNQ6TzZOU590HZAZVlb9j4X6f26627307nckRducOlJKbI9sP
 weW21S1El1qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239865550"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="239865550"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:01:03 -0700
IronPort-SDR: jm7ZcW/dZk/waEJZvpQVmAefCr+re9Cl8AOVJzwLIKkUmWPu/P76g1d0J7z39WZ+RX/b8V8ant
 B6hE+uJ1dxWA==
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="279565122"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:00:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/7] ASoC: codecs: realtek-soundwire: ignore initial PARITY
 errors
Date: Tue, 18 Aug 2020 22:06:54 +0800
Message-Id: <20200818140656.29014-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
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
---
 sound/soc/codecs/rt1308-sdw.c | 1 +
 sound/soc/codecs/rt5682-sdw.c | 1 +
 sound/soc/codecs/rt700-sdw.c  | 1 +
 sound/soc/codecs/rt711-sdw.c  | 1 +
 sound/soc/codecs/rt715-sdw.c  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 5cf10fd447eb..81e3e2caeb2f 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -124,6 +124,7 @@ static int rt1308_read_prop(struct sdw_slave *slave)
 	struct sdw_dpn_prop *dpn;
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = true;
 
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 544073975020..148d4cff267b 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -545,6 +545,7 @@ static int rt5682_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index a46b957a3f1b..2d475405b20d 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -341,6 +341,7 @@ static int rt700_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index a877e366fec5..7a1ae7442e75 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -345,6 +345,7 @@ static int rt711_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 0eb8943ed6ff..761d4663e813 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -439,6 +439,7 @@ static int rt715_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
 		SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 
 	prop->paging_support = false;
 
-- 
2.17.1

