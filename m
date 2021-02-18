Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FE31F250
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:31:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAA6E1661;
	Thu, 18 Feb 2021 23:30:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAA6E1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687493;
	bh=Mpwpqa89I7FRO55zLFRpkxxoFpv+zvPVOpL9PkeNd0I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4MsUdUbR5hsV4/9xfL1zagA+Dzs/NguqTJLSLVNVcGIS1q3d1dmBk0mmaFuHHOLP
	 2EbtU38xV6czy1YpIxn2Kr3lIlKtzeMEcloJSBS+zTQaNMwjrbOMU94TTydGSFchIv
	 01ZVSGIBKGhXGjRJT/qmLtVatpEjGbEFqgpGRKWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E09F8016E;
	Thu, 18 Feb 2021 23:30:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFE78F80155; Thu, 18 Feb 2021 23:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A53C5F80155
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53C5F80155
IronPort-SDR: 5dXWb7niEnPCX9qjhle5r3M5XQE86qlk1EL5a5ZX96y2PuB5j9miGK6oLlxbZFQU4mpRk/N40n
 fb8mXVRUoN5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875617"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875617"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:35 -0800
IronPort-SDR: mMdY9A/jrZs43qXgE7zZGW/AM6sAyE14NmkhSFDZGY3KvRLaGQfIPhWqbG8IJ3siyZblAFR0ul
 sjpnAGF8TX3w==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990828"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ASoC: qcom: lpass-hdmi: remove useless return
Date: Thu, 18 Feb 2021 16:29:07 -0600
Message-Id: <20210218222916.89809-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
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

cppcheck warning:

sound/soc/qcom/lpass-hdmi.c:189:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/qcom/lpass-hdmi.c:186:6: note: If condition 'ret' is true,
the function will return/exit
 if (ret)
     ^
sound/soc/qcom/lpass-hdmi.c:189:9: note: Returning identical
expression 'ret'
 return ret;
        ^
sound/soc/qcom/lpass-hdmi.c:206:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/qcom/lpass-hdmi.c:203:6: note: If condition 'ret' is true,
the function will return/exit
 if (ret)
     ^
sound/soc/qcom/lpass-hdmi.c:206:9: note: Returning identical
expression 'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/lpass-hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
index abfb8737a89f..24b1a7523adb 100644
--- a/sound/soc/qcom/lpass-hdmi.c
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -183,8 +183,6 @@ static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	ret = regmap_field_write(sstream_ctl->dp_staffing_en, LPASS_SSTREAM_DEFAULT_ENABLE);
-	if (ret)
-		return ret;
 
 	return ret;
 }
@@ -200,8 +198,6 @@ static int lpass_hdmi_daiops_prepare(struct snd_pcm_substream *substream,
 		return ret;
 
 	ret = regmap_field_write(drvdata->meta_ctl->mute, LPASS_MUTE_DISABLE);
-	if (ret)
-		return ret;
 
 	return ret;
 }
-- 
2.25.1

