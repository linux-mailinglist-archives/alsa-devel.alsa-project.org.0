Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C07862CF89
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 01:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8276E16AB;
	Thu, 17 Nov 2022 01:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8276E16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668644797;
	bh=SI196Te/5WEgBymC/q8siZfZ3VobBAg+iggSiKQLJbo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J+b6tA1AqHTD49Fv5Kxgc2tmA1eBaqG23REbSthczfWgKaTIrQqekGotg8lfJK5rp
	 T8DbjYwk6wfLg+SOXYyyTBTfQLyuJw/FFtkmi7jlmBTkFllpiRbmMv7EmyqWMLjQRw
	 GhDiZHMDQYZ78J/GKqqrcZ1QqcKHhUvDDsDnbtYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E5FF800B8;
	Thu, 17 Nov 2022 01:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9152F80240; Thu, 17 Nov 2022 01:25:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F12C4F800B8
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 01:25:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12C4F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TEtNtXaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668644738; x=1700180738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SI196Te/5WEgBymC/q8siZfZ3VobBAg+iggSiKQLJbo=;
 b=TEtNtXaC+TA/lbtVHMyTBfP51BXcICPNARgk/nHgbPqVhfR+nirhssIk
 TAZ/ECWdfSQbuv1wXFzgyKv0DEPt9UzbZA2BOPXpcFaryfZi5ij8/lXGN
 T01GV6n7d9UYwfolRVYo21VPETAn46vlMR3Qqh2U1PgBOa9zbAvG9KohX
 NwDkdy/EQtkMSem6wvpxoJ1MiAcg9GP6yY5Mlcd3qIJsJ07sf8uW6MZFQ
 hEuI4F66d/30277WLov6rc0RhugWCQiw0NnWALWM+Tq54RhR2icgxJ18S
 hW7shqbWaK5aDX6MdqJFJ+OPKRFbgCOJ9j3CktVFKWX5n6SvjaX3AmEo8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314523539"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="314523539"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764535097"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="764535097"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:31 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/3] ASoC: Intel: add Dell SKU 0C11 support
Date: Thu, 17 Nov 2022 08:27:55 +0800
Message-Id: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

Add Dell SKU 0C11 support with rt1318 codec.

Gongjun Song (3):
  ASoC: intel: sof_sdw: add rt1318 codec support.
  ASoC: Intel: sof_sdw: Add support for SKU 0C11 product
  ASoC: Intel: soc-acpi: add SKU 0C11 SoundWire configuration

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/Makefile               |   4 +-
 sound/soc/intel/boards/sof_sdw.c              |  17 +++
 sound/soc/intel/boards/sof_sdw_common.h       |   7 +
 sound/soc/intel/boards/sof_sdw_rt1318.c       | 120 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   |  48 +++++++
 6 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1318.c

-- 
2.25.1

