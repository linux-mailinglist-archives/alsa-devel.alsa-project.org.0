Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ED331F234
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4AA4166F;
	Thu, 18 Feb 2021 23:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4AA4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613686988;
	bh=2KmqaU044XSZq5rOme7iGeSq38OMOb+xGmwtkfKt7Bg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmbQkUiaHr1F1d2W5wYpR7ePkI+UDwmXSHTqfLjlymLNLu2tmaYiiKgSqyBgOfJsS
	 Gocy4d7MmxdWvGVsL8OC02vEQegQZTUM8WPZ12G3SgERBTLA2kl0bYqnOqG9aYC6kU
	 PJ+UWDSp04fqacqh+Bsg6qT4j52Dur/+I3ThNsg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ACF4F8042F;
	Thu, 18 Feb 2021 23:19:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B8DAF802C9; Thu, 18 Feb 2021 23:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77D3F80274
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:19:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77D3F80274
IronPort-SDR: xabsz2KB3mkF+h/Kjh9lamJW+7VbesQJ/rMwHYAFRrDKP96xqyz/lz/xlEceK52WVvVkgQ11XZ
 StNfjteb8wRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170801499"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="170801499"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:39 -0800
IronPort-SDR: m57yOy0kt85jedsGJzrbaL/FLPfv52qvYjzHhTOid2OO+YH/XMjAkyORAC2/qkK8Lw5s4jIosj
 hJhMaDndyhUw==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="581441992"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:37 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: soc-topology: clarify expression
Date: Thu, 18 Feb 2021 16:19:20 -0600
Message-Id: <20210218221921.88991-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
References: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

sound/soc/soc-topology.c:1676:52: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
   flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_RATES ? 1 : 0;
                                                   ^
sound/soc/soc-topology.c:1680:55: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
   flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_CHANNELS ?
                                                      ^
sound/soc/soc-topology.c:1685:57: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
   flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_SAMPLEBITS ?
                                                        ^
sound/soc/soc-topology.c:1768:52: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
   flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_RATES ? 1 : 0;
                                                   ^
sound/soc/soc-topology.c:1772:55: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
   flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_CHANNELS ?
                                                      ^
sound/soc/soc-topology.c:1777:57: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
   flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_SAMPLEBITS ?
                                                        ^
sound/soc/soc-topology.c:1782:48: style: Clarify calculation
precedence for '&' and '?'. [clarifyCalculation]
  flags & SND_SOC_TPLG_LNK_FLGBIT_VOICE_WAKEUP ?
                                               ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 1b0cd33a1348..73076d425efb 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1673,16 +1673,16 @@ static void set_dai_flags(struct snd_soc_dai_driver *dai_drv,
 {
 	if (flag_mask & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_RATES)
 		dai_drv->symmetric_rate =
-			flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_RATES ? 1 : 0;
+			(flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_RATES) ? 1 : 0;
 
 	if (flag_mask & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_CHANNELS)
 		dai_drv->symmetric_channels =
-			flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_CHANNELS ?
+			(flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_CHANNELS) ?
 			1 : 0;
 
 	if (flag_mask & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_SAMPLEBITS)
 		dai_drv->symmetric_sample_bits =
-			flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_SAMPLEBITS ?
+			(flags & SND_SOC_TPLG_DAI_FLGBIT_SYMMETRIC_SAMPLEBITS) ?
 			1 : 0;
 }
 
@@ -1765,22 +1765,22 @@ static void set_link_flags(struct snd_soc_dai_link *link,
 {
 	if (flag_mask & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_RATES)
 		link->symmetric_rate =
-			flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_RATES ? 1 : 0;
+			(flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_RATES) ? 1 : 0;
 
 	if (flag_mask & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_CHANNELS)
 		link->symmetric_channels =
-			flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_CHANNELS ?
+			(flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_CHANNELS) ?
 			1 : 0;
 
 	if (flag_mask & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_SAMPLEBITS)
 		link->symmetric_sample_bits =
-			flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_SAMPLEBITS ?
+			(flags & SND_SOC_TPLG_LNK_FLGBIT_SYMMETRIC_SAMPLEBITS) ?
 			1 : 0;
 
 	if (flag_mask & SND_SOC_TPLG_LNK_FLGBIT_VOICE_WAKEUP)
 		link->ignore_suspend =
-		flags & SND_SOC_TPLG_LNK_FLGBIT_VOICE_WAKEUP ?
-		1 : 0;
+			(flags & SND_SOC_TPLG_LNK_FLGBIT_VOICE_WAKEUP) ?
+			1 : 0;
 }
 
 /* create the FE DAI link */
-- 
2.25.1

