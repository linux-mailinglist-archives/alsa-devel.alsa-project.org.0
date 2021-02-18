Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8431F25B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F59F1655;
	Thu, 18 Feb 2021 23:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F59F1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687634;
	bh=4vONfOjuSAXAOHO6ncM06mLO79nCrHytBdG28rVmsBc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/m48einkM11V22whFzAwgiPAQFwEgC4nx+LNxJFn/bfK++/Q8dePsxXjp/tRVelk
	 Eb/V9sk+OVdbSQI6exiqBkEzMWd1nWvA0SNXzT1+7DKlAXSajncdyAX+Mksr3qGjuS
	 NFIFQ8pQ319BjnKERiVlyfe7/4K28Z+DXX7gi1Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77070F80424;
	Thu, 18 Feb 2021 23:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F17AF8020C; Thu, 18 Feb 2021 23:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C1C3F80274
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C1C3F80274
IronPort-SDR: DdNZiZLFBVscPt6fDXgtYAIxucF18uf+mu4++UarZ1+NT5ER5wu4LmpatwkhWo+TVwY47B8WeJ
 w4yozz8e8RlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875631"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875631"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:39 -0800
IronPort-SDR: LBq/Zq3PrN1nG/0w2OiAb44Bz1/zE6dKc3OszH+0cNENE7mxXfwj77kXmoBQcfIFwbswaqcxUA
 Z9G2Rpa5vq8w==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990838"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ASoC: qcom: q6afe: align function prototype
Date: Thu, 18 Feb 2021 16:29:11 -0600
Message-Id: <20210218222916.89809-6-pierre-louis.bossart@linux.intel.com>
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

sound/soc/qcom/qdsp6/q6afe.c:1101:63: style:inconclusive: Function
'q6afe_set_lpass_clock' argument 3 names different: declaration
'clk_src' definition 'attri'. [funcArgNamesDifferent]
int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
                                                              ^
sound/soc/qcom/qdsp6/q6afe.h:236:63: note: Function
'q6afe_set_lpass_clock' argument 3 names different: declaration
'clk_src' definition 'attri'.
int q6afe_set_lpass_clock(struct device *dev, int clk_id, int clk_src,
                                                              ^
sound/soc/qcom/qdsp6/q6afe.c:1101:63: note: Function
'q6afe_set_lpass_clock' argument 3 names different: declaration
'clk_src' definition 'attri'.
int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
                                                              ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/q6afe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index 22e10269aa10..41133f8797c9 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -233,7 +233,7 @@ void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir);
-int q6afe_set_lpass_clock(struct device *dev, int clk_id, int clk_src,
+int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
 			  int clk_root, unsigned int freq);
 int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 			     char *client_name, uint32_t *client_handle);
-- 
2.25.1

