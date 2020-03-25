Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB748193395
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 23:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3701675;
	Wed, 25 Mar 2020 23:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3701675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585174181;
	bh=u9qMlkVSWgtqL9psR3yAkGIeJopY4mcK7+Ik2feS2ZA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WW8Fc8kjdq+ixV3x07uGZ1Pm/IrHGQEs7D9GhQAZC0Ns9M8eLJpt7H/oizpZMEpcu
	 mrEdJdAeW2VqzgWSWKcrkQcoPiTMmPsWtuWhQmXV1wa5oEXx5tF/mqjGysJ04Ksw5j
	 68obBHGnM3BDZ7LtEMPhQJQyHqQ6cwTn4Ri2YmxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48BB5F801DA;
	Wed, 25 Mar 2020 23:08:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C80DCF801DA; Wed, 25 Mar 2020 23:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA6F6F800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 23:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA6F6F800EF
IronPort-SDR: AbmNdukjyYR4Fb4n/IyU4V2wm5Q+OikvdcmV9Vk2JCXtVBJhFdwgp7FBOl1xszApyYgTfRqba+
 d9eWUJleSwXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 15:07:49 -0700
IronPort-SDR: bkluYb+fnqlXj2HWaxEz4AJblgutxEVFLMqFkpLGLGvr0XJ3yXu0uHlvK82fRX7iM6aDXPXcqV
 30s/9Zn5CUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="238634735"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 15:07:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: Intel: add SoundWire machine driver
Date: Wed, 25 Mar 2020 17:07:42 -0500
Message-Id: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

To handle multiple hardware combinations, this patchset suggests a
single machine driver which will create and initialize dailinks
dynamically. This allows us to support new configurations easily, as
shown with the TigerLake rt5682 example.

Each configuration updates the card component string, and UCM can test
for the presence of components to configure them as needed.

Since we use a single the machine driver name, all previous ACPI
tables need to be updated. That should have no impact since the
machine drivers listed at the time were not upstreamed and are no
longer maintained.

Naveen Manohar (2):
  ASoC: Intel: common: add match table for TGL RT5682 SoundWire driver
  ASoC: Intel: sof_sdw: Add Volteer support with RT5682 SNDW helper
    function

Pierre-Louis Bossart (1):
  ASoC: Intel: boards: add sof_sdw machine driver

Rander Wang (1):
  ASoC: Intel: soc-acpi: update topology and driver name for SoundWire
    platforms

 sound/soc/intel/boards/Kconfig                |  24 +
 sound/soc/intel/boards/Makefile               |   8 +-
 sound/soc/intel/boards/sof_sdw.c              | 962 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h       | 114 +++
 sound/soc/intel/boards/sof_sdw_dmic.c         |  42 +
 sound/soc/intel/boards/sof_sdw_hdmi.c         |  97 ++
 sound/soc/intel/boards/sof_sdw_rt1308.c       | 151 +++
 sound/soc/intel/boards/sof_sdw_rt5682.c       | 126 +++
 sound/soc/intel/boards/sof_sdw_rt700.c        | 125 +++
 sound/soc/intel/boards/sof_sdw_rt711.c        | 156 +++
 sound/soc/intel/boards/sof_sdw_rt715.c        |  42 +
 .../intel/common/soc-acpi-intel-cml-match.c   |  24 +-
 .../intel/common/soc-acpi-intel-icl-match.c   |   6 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  30 +-
 14 files changed, 1896 insertions(+), 11 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_common.h
 create mode 100644 sound/soc/intel/boards/sof_sdw_dmic.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_hdmi.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1308.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt5682.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt700.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt711.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c

-- 
2.20.1

