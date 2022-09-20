Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 798005BE6DA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA224868;
	Tue, 20 Sep 2022 15:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA224868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663679918;
	bh=xUU6gAS3uEwVGWj/XiLcExZLphCBQGllfYbZWQeefgI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bjJ40fTpL+P1PKF67a9u/VgewSrprnshCo7vtDzumx2vCuCQq4v0HjG0tQHTLKvHY
	 N01W/KmR7kz6ZbWU6NutBiKwNRUw9Lyi16Q/Kzs9T3V4eLtQ6VTvTpDf8Inmc8fpCg
	 PLt80zon2ZEMXURhlThA0Gl2yHgVExu3wrcy8k0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D8BF804D8;
	Tue, 20 Sep 2022 15:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0DA7F801D5; Tue, 20 Sep 2022 15:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6203BF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6203BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CA4KI/uP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663679856; x=1695215856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xUU6gAS3uEwVGWj/XiLcExZLphCBQGllfYbZWQeefgI=;
 b=CA4KI/uP87AP06kHc41sT/0LEI2z9zR6XgWffSf8RoPzcJ9IDq3U1ULF
 b7irMG/4UbRoJ8A8DuLZX7JRLx2uE7uJyB4UxG/MXcxwWfk/j6cRpLzYK
 V8ucnaqJPQbkP04tyIaafG0xC7x9UnjcCREs+Rr+jv5C460vB3yxb5pSh
 5DiyWgD0RakxU7F1h97tMJJiEHPVTArwTReeClSu58GHclH+jqvzyV5ly
 siontP4Zo/BcOZdRuEUVoWX4O7RijObxZrR8pw/DxghcFEQfSwDpQA6pb
 N4bMct4iWmRuPTYPnzyGVb0ry9AXe1joqAvpKcMVRtDntMCfd5AL2KB6n g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282719126"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="282719126"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="652089661"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ASoC: SOF: Add SKL/KBL support for IPC4 CI tests
Date: Tue, 20 Sep 2022 15:16:56 +0200
Message-Id: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
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

This patchset was submitted earlier in April 2022 as part of the
"ASoC: SOF: add INTEL_IPC4 plumbing" series. As requested the SKL/KBL
support is moved to a different series.

This update adds minor style fixes and the ops that were missing at
the time. SKL and KBL daily tests have been running for several months
and helped identify missing sequences in the SOF driver for HDaudio
links, or platform differences that the driver did not account for
(number of pipelines, etc).

Note that this capability is not recommended for any distribution, it
is ONLY for SOF IPC4 CI tests on HDaudio devices, we will not extend
this SKL/KBL support for I2S devices based on ES8336 or Chromebooks
which are ONLY supported by the AVS driver.

v2:
Squashed commits from Peter Ujfalusi that fixed compilation issues and
ipc4-mtrace information. Peter's Signed-off-by tag was kept for
credit.
Updated commit messages to remove obsolete statements about IPC4
integration.

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda-dsp: expose functions for SKL support
  ASoC: SOF: Intel: add SKL/KBL hardware code loader
  ASoC: SOF: Intel: add initial SKL/KBL hardware support
  ASoC: SOF: Intel: add ops for SKL/KBL

 sound/soc/sof/intel/Kconfig          |  25 ++
 sound/soc/sof/intel/Makefile         |   4 +
 sound/soc/sof/intel/hda-dsp.c        |   4 +-
 sound/soc/sof/intel/hda-ipc.c        |   8 +
 sound/soc/sof/intel/hda-loader-skl.c | 580 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c            |   2 +
 sound/soc/sof/intel/hda.h            |  13 +
 sound/soc/sof/intel/pci-skl.c        |  91 +++++
 sound/soc/sof/intel/skl.c            | 116 ++++++
 9 files changed, 841 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-loader-skl.c
 create mode 100644 sound/soc/sof/intel/pci-skl.c
 create mode 100644 sound/soc/sof/intel/skl.c

-- 
2.34.1

