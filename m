Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1832ABFB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:02:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9714118F2;
	Tue,  2 Mar 2021 22:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9714118F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614718927;
	bh=mi84cBZBfoZsmJMQKjE8JAIdtn9sFqCw/4C/l8vSpvg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L3kXPSNFZnUGFOSFRfST4HiUJfqg+7vQywm5vs7dmRxNbM+ItVBu8vmJPvvbrZBoR
	 7Hk35803SuO+4p0rQQDFP2pqHe6CVPF8DQwXYdq1G6KTrFwqxcJ5+e/O/EjVq0gJwv
	 ae0BOLWtjl2hGvmgiE1cOA+8bXa3PKONg/fnYH9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5FCEF802E2;
	Tue,  2 Mar 2021 22:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8F69F80277; Tue,  2 Mar 2021 22:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935A9F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935A9F8012D
IronPort-SDR: a+E22AyT1HGTAczqdbNWALLGjLLKnwcv6P0nQvfd+U0K4AnxZjtbXvGmZE08zdOohYzCyOO94X
 tiIN1hDjYLLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623699"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623699"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:25 -0800
IronPort-SDR: P0pm7MRnJiNg9TfyIzz4Vvjf3hhU6eGaEhJsWx+9RRuNZd0syr3cpLzM97/I0HxNXUp1PIp3dZ
 0RVlucnrfuJA==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727780"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/9] ASoC: remove more make W=1 warnings
Date: Tue,  2 Mar 2021 14:59:17 -0600
Message-Id: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

These warnings get in the way of automation/CI, let's remove them.

Pierre-Louis Bossart (9):
  ASoC: cs4270: fix kernel-doc
  ASoC: jz4760: fix set but not used warning
  ASoC: rt5631: fix kernel-doc warning
  ASoC: sigmadsp-regmap: fix kernel-doc warning
  ASoC: amd: renoir: remove invalid kernel-doc comment
  ASoC: fsl: fsl_ssi: fix kernel-doc warning
  ASoC: fsl: fsl_easrc: fix kernel-doc warning
  ASoC: Intel: bytcr_wm5102: remove unused static variable
  ASoC: qcom: q6dsp: fix kernel-doc warning

 sound/soc/amd/renoir/rn-pci-acp3x.c   | 2 +-
 sound/soc/codecs/cs4270.c             | 1 +
 sound/soc/codecs/jz4760.c             | 4 ++--
 sound/soc/codecs/rt5631.c             | 2 +-
 sound/soc/codecs/sigmadsp-regmap.c    | 2 +-
 sound/soc/fsl/fsl_easrc.c             | 2 +-
 sound/soc/fsl/fsl_ssi.c               | 2 +-
 sound/soc/intel/boards/bytcr_wm5102.c | 8 --------
 sound/soc/qcom/qdsp6/q6afe.c          | 2 +-
 9 files changed, 9 insertions(+), 16 deletions(-)

-- 
2.25.1

