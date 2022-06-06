Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88C53EFF8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E9661B3E;
	Mon,  6 Jun 2022 22:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E9661B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654547947;
	bh=RNGdZkia89zKmXDfsM60lpnZE8mA1O1dC7zqAE6q9tE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EKoOGfUTxo/oM/KmmeA8+EC7GAjKkAOHzT8Ae+KGoXR1aVI9NuLAzOr+bcKQ5TpsF
	 l3kQnZqUAtrME6w9AzIg5alhHiVOi5Dd2xgW7HUp2N5BH+FLeW7KJEspWL0lLDGM+D
	 GvyoKm6ZX86zl52s1GId6jfWcdzCLPFBdZ/ipQbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07043F8051E;
	Mon,  6 Jun 2022 22:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFA3AF80089; Mon,  6 Jun 2022 22:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74F51F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F51F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="he7KEte6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654547885; x=1686083885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RNGdZkia89zKmXDfsM60lpnZE8mA1O1dC7zqAE6q9tE=;
 b=he7KEte6cfRu3o3o0M9ZDa9O0eIGUoaelZg7BQcSXTa+ij7ilP0s9WQP
 GK1GeBAyX00BaOsfnAW0zWUyyjsXNqD6lE7XiRMYKcLSuHyFLXHSpM5ZT
 Rl+ETIi3Z2/erzzoVWsT2DF1HbGAgjtyesE+XIGUXBqqW4W0ohhv2szgC
 YeDCpRqTngkaynuWfCiNJM3IlsIPSXMa0Jd+iAcovuO7YWKoasKRqPPn1
 mpr2H0WnUDBmmWqBjxXCi8b/iD5erCHgMWnPOlv7+iVRCqc9YC06vkpQ/
 FqnVjRdGkacSVv0Q/Du3D8CVBT8CW8t5ik1LASMcL416IprBhyDgmZEBk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276730859"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276730859"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:37:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="647728065"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:37:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: harden SoundWire codec/machine drivers used on
 Intel platforms
Date: Mon,  6 Jun 2022 15:37:45 -0500
Message-Id: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

While testing fixes for SoundWire race conditions initially reported
in [1], I found additional issues in codec drivers. When the order in
which drivers are probed is changed, multiple errors are reported,
from unbalanced pm_runtime_enable() calls to invalid mutex lock magic
numbers, workqueues not initialized and missing resume sequences.

In 'nominal' usages, there is no change of functionality, this is just
a first step to test random device/driver bind/unbind sequences.

Important note: these changes only touch Intel-based platforms, I
don't have any background and ability to test on Qualcomm-based
devices.

[1] https://lore.kernel.org/alsa-devel/d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com/

Pierre-Louis Bossart (7):
  ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove
  ASoC: rt711-sdca-sdw: fix calibrate mutex initialization
  ASoC: Intel: sof_sdw: handle errors on card registration
  ASoC: rt711: fix calibrate mutex initialization
  ASoC: rt7*-sdw: harden jack_detect_handler
  ASoC: codecs: rt700/rt711/rt711-sdca: initialize workqueues in probe
  ASoC: codecs: rt700/rt711/rt711-sdca: resume bus/codec in
    .set_jack_detect

 sound/soc/codecs/max98373-sdw.c   | 12 +++++++-
 sound/soc/codecs/rt1308-sdw.c     | 11 +++++++
 sound/soc/codecs/rt1316-sdw.c     | 11 +++++++
 sound/soc/codecs/rt5682-sdw.c     |  5 ++-
 sound/soc/codecs/rt700-sdw.c      |  6 +++-
 sound/soc/codecs/rt700.c          | 30 +++++++++++-------
 sound/soc/codecs/rt711-sdca-sdw.c |  9 +++++-
 sound/soc/codecs/rt711-sdca.c     | 40 ++++++++++++------------
 sound/soc/codecs/rt711-sdw.c      |  9 +++++-
 sound/soc/codecs/rt711.c          | 40 ++++++++++++------------
 sound/soc/codecs/rt715-sdca-sdw.c | 12 ++++++++
 sound/soc/codecs/rt715-sdw.c      | 12 ++++++++
 sound/soc/intel/boards/sof_sdw.c  | 51 ++++++++++++++++++-------------
 13 files changed, 169 insertions(+), 79 deletions(-)

-- 
2.34.1

