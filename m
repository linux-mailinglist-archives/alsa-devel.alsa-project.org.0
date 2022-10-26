Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7A60DBF8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 09:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB14411D;
	Wed, 26 Oct 2022 09:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB14411D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666768697;
	bh=vVzu7eTnrwZ2NcZHoP8HWV3sYW9l/QA0ML8mjfjBHiI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jFgZIcAwIS/efGiqbwINc/YXo9PK5T6vVlRy5t0Hi1Fz84mR0ZiO7x29ByXdGppes
	 WlBfK3bntzQFS/SOCEzs9ijs3lQNk/rc8IMVGRBPw6WlMHC9AFl3Q5Xq5RGoA/FDZZ
	 YZEnMgHE9oUEbE5Mhru6UIG43ImdV5eQ1pfAbRO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A63F6F80494;
	Wed, 26 Oct 2022 09:17:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F6EF80100; Wed, 26 Oct 2022 09:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3261DF80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 09:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3261DF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jk9CI3Jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666768638; x=1698304638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vVzu7eTnrwZ2NcZHoP8HWV3sYW9l/QA0ML8mjfjBHiI=;
 b=jk9CI3Jy2rYG/GLpP+0zk1uWYiqu6nvKIWDiFOE6jBYRGKyIKJoKjF9a
 WLAU0+mqsqz9QQnfm6jxXWT/0y2qZ2XZ6GQZrljqJP09e8cNfGBHepBK/
 hiFN5ZCXTavXqUeiVu9ciL0SoEU0prKdMRSB9GO0MvIdDutH7M/fRDBsp
 JLgDYsN61Z/DoGsJ44W7MS0bmKr148daFDimLpoIwntIfnKvBquIPjgGh
 Bxe7GfasZnZjTKzWQHpZA9slGcoKHTGRFaGlnTJlMoIum+e7iZultf1A4
 k2EId/+oW4dvI1PcWBUFSzt4b64QYnpNgCPQorSWMLucBAu/5nCTTuP8b A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="287596187"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; d="scan'208";a="287596187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 00:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="663096896"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; d="scan'208";a="663096896"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2022 00:16:52 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: Intel: sof_rt5682: quirk auto detection
Date: Wed, 26 Oct 2022 15:14:07 +0800
Message-Id: <20221026071409.3235144-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Chao Song <chao.song@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Gongjun Song <gongjun.song@intel.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajye Huang <ajye.huang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

A new feature to compose quirk value according to the result of
amplifier and SoC type detection at runtime.

Brent Lu (2):
  ASoC: Intel: add helpers to detect SoCs
  ASoC: Intel: sof_rt5682: quirk auto detection

 include/linux/platform_data/x86/soc.h         |  24 +++
 sound/soc/intel/boards/sof_rt5682.c           | 173 +++++++-----------
 .../intel/common/soc-acpi-intel-adl-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |   6 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |   6 +-
 5 files changed, 101 insertions(+), 120 deletions(-)

-- 
2.25.1

