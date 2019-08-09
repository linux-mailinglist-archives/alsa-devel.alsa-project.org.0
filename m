Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 556DB886E2
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 01:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75871660;
	Sat, 10 Aug 2019 01:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75871660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565393071;
	bh=mCUqTh/9JtVgMsmVY52RGR2T5Zfg7q4UxSwbNzq87yU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UMZXjuivvStbzhHgDaI0dVlPJjVMc91/PO0J1Dt1Gpmx9Ikoc9eV7S9fk6CEQX6RY
	 D3LT9TXMl3fYxPEeLiHG06C7x1HZTk/gJW+C6ac2B0A+vuVudbZOzwYyeXQzSOQU/z
	 0N0PjA044S0rTYZQjbnNfw3wIZbGxsXV0zGWB2XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24732F80529;
	Sat, 10 Aug 2019 01:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4517CF800E4; Sat, 10 Aug 2019 01:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40638F800E4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 01:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40638F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 16:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,367,1559545200"; d="scan'208";a="177770338"
Received: from jpfeiff1-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.128.143])
 by orsmga003.jf.intel.com with ESMTP; 09 Aug 2019 16:22:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 18:22:32 -0500
Message-Id: <20190809232236.21182-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: Intel: boards: quirks and DMIC
	corrections
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Extend quirk for GeminiLake-based Chromebooks and correct missing
dependencies for DMIC support (align with all other machine drivers).

Keyon Jie (3):
  ASoC: Intel: sof-rt5682: add dmic dapm widget to support dmic PCM
  ASoC: Intel: skl-hda-dsp-generic: add dependency to dmic driver
  ASoC: Intel: skl-hda-dsp-generic: add dmic dapm widget and route

Sathya Prakash M R (1):
  ASoC: Intel: boards: Match Product Family instead of product

 sound/soc/intel/boards/Kconfig               | 1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 4 ++++
 sound/soc/intel/boards/sof_rt5682.c          | 7 +++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
