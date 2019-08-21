Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BDB98532
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DD81607;
	Wed, 21 Aug 2019 22:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DD81607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418045;
	bh=CzFHXHYv0rlqIcjyQzEFYHe5Y/bkp6azgfvBV/aMO98=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CD3ufovRpLTbcwPF7YTi+Yj/BgcqC2PXXOW5wIbL/4PsJ0PQzyP/pft1H0RtZ871l
	 5TI7MzJkQTdM2Ry3A9MQhMnAwbH5774y4t8G9AiIg4SfwUrCroCbeW3WiSPbmm9Z44
	 mNQnEofWm1M3TdMfZ63j9ilKF7n1/8Lr5HGwkwW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB2EF805A1;
	Wed, 21 Aug 2019 22:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D289F80322; Wed, 21 Aug 2019 22:05:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93109F800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93109F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="196069731"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2019 13:05:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:05:10 -0500
Message-Id: <20190821200521.17283-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 00/11] soundwire: intel: simplify DAI/PDI
	handling
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

In the initial SoundWire code released by Intel, the PDIs and ports on
the Master interface were dynamically allocated. This wasn't a bad
idea at the time and would have allowed for interesting routing.

Fast-forward to 2019, with the hardware available on
CometLake/IceLake, that dynamic allocation makes it complicated to
deal with statically-allocated ASoC dailinks and topology-defined
DAIs. In this series, we suggest a drastic simplification where the
SoundWire code reuses information provided by DAIs and dailinks. We
also suggest removing the dynamic allocation of ports on the master
since in practice there is a 1:1 mapping between ports and PDIs.

In the second part of the series, we suggest adding new callbacks to
SoundWire DAIs, so that all the SoundWire stream operations are
contained at the DAI level. This solution results in a very simple
integration with the SOF code (which will be shared in a separate
series since SOF will not apply directly on top of
soundwire/next). The SOF parts only call a SoundWire init/release API,
and provides 2 callbacks for hw_params and free, with all the details
of the SoundWire DAIs and IP handled in drivers/soundwire.

This solution has been tested on CometLake/IceLake with simple
capture/playback. When ASoC supports the multi-cpu capability needed
for synchronized playback/capture across multiple links, we will have
to modify slightly this solution so that the stream alloc, release and
trigger operations are done once. This is future work that will take
place later, likely after 5.4, and which should not impact the SOF
integration.

The code in this patchset is the result of collaboration between Bard
Liao, Rander Wang and Pierre Bossart, with ideas coming from all 3
sides. It's likely that there are still some parts in the code that
can be improved, hence the RFC state.

Bard Liao (3):
  soundwire: intel: fix intel_register_dai PDI offsets and numbers
  soundwire: intel: remove playback/capture stream_name
  soundwire: cadence_master: improve PDI allocation

Pierre-Louis Bossart (3):
  soundwire: remove DAI_ID_RANGE definitions
  soundwire: cadence/intel: simplify PDI/port mapping
  soundwire: intel: don't filter out PDI0/1

Rander Wang (5):
  soundwire: intel: improve .config_stream callback, add .free_stream
  soundwire: intel: add prepare support in sdw dai driver
  soundwire: intel: add trigger support in sdw dai driver
  soundwire: intel: do sdw stream setup in setup function
  soundwire: intel: free all resources on hw_free()

 drivers/soundwire/cadence_master.c  | 158 ++++------------
 drivers/soundwire/cadence_master.h  |  34 +---
 drivers/soundwire/intel.c           | 278 ++++++++++++++++------------
 include/linux/soundwire/sdw.h       |   3 -
 include/linux/soundwire/sdw_intel.h |   4 +-
 5 files changed, 209 insertions(+), 268 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
