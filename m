Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEDC644DEC
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 22:26:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379C517A8;
	Tue,  6 Dec 2022 22:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379C517A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670361991;
	bh=RrbUfcshIO3oQwiIQEgJUEdpttHFzBgkM2h3QD/RFkQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sm3GdOzseNEQWfdhPB2nC3IAUthfOHSKHTNLTEDjYMpKuz4KlHnDYmFvo064kDrOm
	 SGfHxUSvHs38LtxcuPScKw/T+Z6xb3oSiTen81pwDJ6P19fNavrokx5BJ+7l88pcpA
	 nK8SRCW9UlYnUzWuKEfkvugyHUs+7Nsl95g9i83E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3546F802DB;
	Tue,  6 Dec 2022 22:25:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40FAFF80290; Tue,  6 Dec 2022 22:25:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0388EF80121
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 22:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0388EF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nwpuuOiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670361930; x=1701897930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RrbUfcshIO3oQwiIQEgJUEdpttHFzBgkM2h3QD/RFkQ=;
 b=nwpuuOiYyrd353bB7M/EFZjtIJ/PggYkXxu0joYcmoX4XRZBCA34udfa
 GblUU/Hle4oeVaiEirvP43NCLyCMpDl5Pu5uvleIa39PFiFsjkJwxsMEk
 3e3hdRt2cCzgIDWdn46pqerbvF9MKsZmlL4gH56v0cSOu0auaNHtnSHY5
 ERdGKvUNdErS+elFpdBn7GtA4jWLWB9xS2palz7+Ymri8Oe88/Eg2FGbB
 2NEUM+Ywik3Y0KYDpevI93REOWqRGGtvOt1BTmxNo1mWORqxLSm8/BE1o
 JIRS/XYgOgJFAmxGuIgstY4CyC5WP7D+JFLzQF+U+a5comRAnhxRNHzCs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300154666"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="300154666"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="646362652"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="646362652"
Received: from rwwalthe-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.124])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 13:25:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel: boards: updates for SOF boards
Date: Tue,  6 Dec 2022 15:25:04 -0600
Message-Id: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

One new JasperLake configuration, core refactoring between RT1316 and
RT1318 and a minor uninitialized variable corner case.

Bard Liao (1):
  ASoC: Intel: sof_realtek_common: set ret = 0 as initial value

Brent Lu (1):
  ASoC: Intel: sof_rt5682: add jsl_rt5682 board config

Gongjun Song (1):
  ASoC: Intel: sof_sdw: use common helpers for all Realtek amps

 sound/soc/intel/boards/Makefile               |   3 +-
 sound/soc/intel/boards/sof_realtek_common.c   |   3 +-
 sound/soc/intel/boards/sof_rt5682.c           |   6 +
 sound/soc/intel/boards/sof_sdw.c              |  10 +-
 sound/soc/intel/boards/sof_sdw_common.h       |  20 +-
 sound/soc/intel/boards/sof_sdw_rt1316.c       | 239 ------------------
 sound/soc/intel/boards/sof_sdw_rt1318.c       | 120 ---------
 .../{sof_sdw_rt1308.c => sof_sdw_rt_amp.c}    | 139 +++++++---
 .../intel/common/soc-acpi-intel-jsl-match.c   |   5 +
 9 files changed, 133 insertions(+), 412 deletions(-)
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt1318.c
 rename sound/soc/intel/boards/{sof_sdw_rt1308.c => sof_sdw_rt_amp.c} (59%)

-- 
2.34.1

