Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F262243BF87
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EEB16D3;
	Wed, 27 Oct 2021 04:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EEB16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301236;
	bh=l8NVcFx1UtPiGLOQnf/XdgVu5ChbfBnerADa+8WYqD4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eaPakP/c3IR6vWllIPujpvPfmWptb52X7oJ57Kq9kgtDuJw3WRRFbiQaX56nsPoox
	 Kvr9fdWeEyrrn69WUMFWbRpPH/LAIwbpxcDHUFu92rbbjjmh3hs+g7JOJzL54I1dA3
	 YdqmaJiy7rZjylZgJpoU3qLKKDHiMN8MduMIyMoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D85FF8025A;
	Wed, 27 Oct 2021 04:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2DC2F80271; Wed, 27 Oct 2021 04:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC726F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC726F800FF
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229374"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229374"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:37 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446254"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 00/10] ASoC: Intel: sof_sdw: Use fixed DAI link id
Date: Wed, 27 Oct 2021 10:18:14 +0800
Message-Id: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

This series provides a way to use constant dailink numbers for different
devices. So that we don't need to renumber them in topologies.
Some patches with different purpose are sent together in this series
since they are dependent.

Bard Liao (8):
  ASoC: intel: sof_sdw: return the original error number
  ASoC: intel: sof_sdw: rename be_index/link_id to link_index
  ASoC: intel: sof_sdw: Use a fixed DAI link id for AMP
  ASoC: intel: sof_sdw: move DMIC link id overwrite to
    create_sdw_dailink
  ASoC: intel: sof_sdw: remove SOF_RT715_DAI_ID_FIX quirk
  ASoC: intel: sof_sdw: remove sof_sdw_mic_codec_mockup_init
  ASoC: intel: sof_sdw: remove get_next_be_id
  ASoC: intel: sof_sdw: add link adr order check

Pierre-Louis Bossart (2):
  ASoC: Intel: sof_sdw: fix jack detection on HP Spectre x360
    convertible
  ASoC: Intel: sof_sdw: add SKU for Dell Latitude 9520

 sound/soc/intel/boards/sof_sdw.c            | 152 ++++++++++----------
 sound/soc/intel/boards/sof_sdw_common.h     |   7 +-
 sound/soc/intel/boards/sof_sdw_rt715.c      |   7 -
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c |   7 -
 4 files changed, 85 insertions(+), 88 deletions(-)

-- 
2.17.1

