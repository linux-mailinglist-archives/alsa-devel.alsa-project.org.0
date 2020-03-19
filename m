Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3818C1F3
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 21:54:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE6A17C7;
	Thu, 19 Mar 2020 21:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE6A17C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584651280;
	bh=/PmizT3MZ9AmN4aADqUQ83SR5u8avUaU4kJfiQJYp4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3u5RFjyBlyHDHfBTkpWfaqv9BPG2AozEdqpw1JWGjTutW0k5XBFLy32X3F35FPsi
	 U512MsvP/Q7FLsD/skQt+O3EvkZzdenWevnfkyypHwEq8Gjvy01sSQVKaQ9AF/rrAI
	 sk4C3NeHZC7y2XUR5o25g+LkDoi75VOfGe0tPubM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7284BF80299;
	Thu, 19 Mar 2020 21:51:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A7CF8028C; Thu, 19 Mar 2020 21:50:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F431F80253
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 21:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F431F80253
IronPort-SDR: 7SdNf40OSjeoQlXnBS+Tl4Mhlwu4DRpdqNgzgv/0Y8Y97SMqCRi3+Ii4aWZEMH2kg0RokClrTf
 rE2+NZx+L60Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 13:50:35 -0700
IronPort-SDR: cxpn+uZX3MhFA+MEdL4B+kGgyIayttQ9JAK0mDyPJ8ePpKYWu8M0fCx8FmqTDX32DzmDMe2jUm
 nolAczdDzULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="248661028"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 19 Mar 2020 13:50:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: bdw-rt5650: Remove ignore_suspend flag from
 SSP0 dai link
Date: Thu, 19 Mar 2020 21:49:47 +0100
Message-Id: <20200319204947.18963-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319204947.18963-1-cezary.rojewski@intel.com>
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, lgirdwood@gmail.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, tiwai@suse.com,
 vkoul@kernel.org, broonie@kernel.org
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

As of commit:
ASoC: soc-core: care .ignore_suspend for Component suspend

function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
flag for dai links. While BE dai link for System Pin is
supposed to follow standard suspend-resume flow, appended
'ignore_suspend' flag disturbs that flow and causes audio to break
right after resume. Remove the flag to address this.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 058abf3eec50..4545dbd48879 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -257,7 +257,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.ignore_suspend = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
-- 
2.17.1

