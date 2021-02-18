Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B530831F251
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:31:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C439E1666;
	Thu, 18 Feb 2021 23:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C439E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687505;
	bh=eesYFSYGjs8zW2CeJKZoCBDgfZRcKTbQfItwQBvvbow=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KxNgDvZFUKGwqDuygp5KUWTKLUj21fgUylWKGFqrLMdtraWSMGUDWVgqjU3cWeG9M
	 ZoxVTzbQSvEXzkWZvOBqAlirTJZSGc6wswLkWWmLyQ8oRdDPkisL4fgDzYqbKvmLO0
	 pu+nDUJ2ewNCz7GBebIk0YDrRdUvn0F20o+OMZMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C77BF8015A;
	Thu, 18 Feb 2021 23:30:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 560E1F8028B; Thu, 18 Feb 2021 23:29:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5355F800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5355F800E9
IronPort-SDR: 5dnWNFaoUFlNvg/8WH2M7hSu53Jz7afxzlZVBHHgx715ZDihAGO+ft3dyFF+hNqxHoQ2uG5Tek
 3+dtfHvCePow==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875615"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875615"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:35 -0800
IronPort-SDR: soTA2cFKFapdBGFPWqUp/ySA+Ea8695RAamSLvokBlYC8UrLoKmnry9iuUJNnFI2RiaF+LGCx7
 lqEFf7dPCBfg==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990826"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: qcom: remove cppcheck warnings
Date: Thu, 18 Feb 2021 16:29:06 -0600
Message-Id: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Second batch of cleanups for Qualcomm SOCs and codecs. The only
functional change is the addition of a missing error check in the last
patch.

Pierre-Louis Bossart (10):
  ASoC: qcom: lpass-hdmi: remove useless return
  ASoC: qcom: lpass-platform: remove useless assignment
  ASoC: qcom: q6dsp-dai: clarify expression
  ASoC: qcom: q6afe: remove useless assignments
  ASoC: qcom: q6afe: align function prototype
  ASoC: qcom: q6asm: align function prototypes
  ASoC: wcd-clsh-v2: align function prototypes
  ASoC: wcd9335: clarify return value
  ASoC: wcd934x: remove useless return
  ASoC: lpass-wsa-macro: add missing test

 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 sound/soc/codecs/wcd-clsh-v2.h     | 6 +++---
 sound/soc/codecs/wcd9335.c         | 2 +-
 sound/soc/codecs/wcd934x.c         | 2 --
 sound/soc/qcom/lpass-hdmi.c        | 4 ----
 sound/soc/qcom/lpass-platform.c    | 2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c   | 2 +-
 sound/soc/qcom/qdsp6/q6afe.c       | 5 ++---
 sound/soc/qcom/qdsp6/q6afe.h       | 2 +-
 sound/soc/qcom/qdsp6/q6asm.h       | 6 +++---
 10 files changed, 14 insertions(+), 19 deletions(-)

-- 
2.25.1

