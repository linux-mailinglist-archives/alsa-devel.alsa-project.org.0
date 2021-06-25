Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781E3B49E2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 22:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D8E168A;
	Fri, 25 Jun 2021 22:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D8E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624654464;
	bh=mJ4+vdL514zY9qAnBec/nagQ8JWygykajWAHYr/Alcw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sa7sQhgnjUTbLcGyPED82duKf8vTMqUWsyTsR9xC2J/GF9DfpdKJfrE+Yvavw/JNf
	 6pro2bVVWZTaE0n0wHNT4VYLdhrqsBY3/6Dnosaj8yq1rNhWwDf2myVLm4yADNmtRI
	 9zHXnuJRqi+CDtpOIrpGaInm26rmEekAlTXOuFQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF172F804E1;
	Fri, 25 Jun 2021 22:51:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86E5DF804DF; Fri, 25 Jun 2021 22:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A0E5F804B4
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 22:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A0E5F804B4
IronPort-SDR: qcvZpfRbOBKutwwDSLfJkC4w1Trq4vXIYRQITRwyNsoDBuobMcnHB/mea1kgDN0jCyXSyzSWl4
 Az3RGt5mmQ/A==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="188122681"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="188122681"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:51:11 -0700
IronPort-SDR: CfdCblRX48r2wv8CNA60VUoVvAwlwr7WEkfa7OpLhcy6+q+N5WuPFbyg4TdbjHRUXoztaJLIqd
 AWQI7SZRF3ag==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="640223036"
Received: from rlcervan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.127.151])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:50:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: sof_cs42l42: use helper function to get bclk
 frequency
Date: Fri, 25 Jun 2021 15:50:42 -0500
Message-Id: <20210625205042.65181-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
References: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Use sof_dai_get_bclk() function to get bclk frequency instead of a
hard-coded magic number depending on configuration in topology.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 42aadf801f72..2b16011b7a06 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -16,6 +16,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/sof.h>
 #include <sound/soc-acpi.h>
 #include <dt-bindings/sound/cs42l42.h>
 #include "../../codecs/hdac_hdmi.h"
@@ -122,7 +123,12 @@ static int sof_cs42l42_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int clk_freq, ret;
 
-	clk_freq = 3072000; /* BCLK freq */
+	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
+
+	if (clk_freq <= 0) {
+		dev_err(rtd->dev, "get bclk freq failed: %d\n", clk_freq);
+		return -EINVAL;
+	}
 
 	/* Configure sysclk for codec */
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
-- 
2.25.1

