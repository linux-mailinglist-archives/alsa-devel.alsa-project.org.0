Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53405BCB29
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E471915E5;
	Mon, 19 Sep 2022 13:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E471915E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663588513;
	bh=q/uvWWvW+4M6DKxLEVsLs6ozoctHctaFyRZU9qYPyYQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B+Ewv1Xp4x+Vu6OzmR8G2HT+tSHvKtNLkxY0iad4pwp1OA2oJHG2YmWnEXUC2OSVW
	 JWmdHT5UxrK4igCJv3G4VrqoPPofLa5JLmn+6rQEh2yvuj8jBeMHkioxJe/McOdwPN
	 XOW+r9FDkcd6/SQ9IvzzZs5+7bNeXi+YmpIGdquQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58ED4F8032B;
	Mon, 19 Sep 2022 13:54:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92E32F800C9; Mon, 19 Sep 2022 13:54:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF3EF800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF3EF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ELvldq8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663588451; x=1695124451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q/uvWWvW+4M6DKxLEVsLs6ozoctHctaFyRZU9qYPyYQ=;
 b=ELvldq8azPVdUulvOe1BnX9S6AVtZylk7s0cYnGRNTBnfREr0IQtAZIz
 onlT35Lgk84sfCL+D1s4W74R6/9+JseYHTr5QVKVXlXExVFDy+AVrqfYq
 1vYYfUMr3y538ZN19nKyY9mz56RjXkT3mK8XdQVwXU8qXzoyCRP0wir4B
 55U1aDfGQnR7bJ/be0RI5tlxZC3zCQPYDSFW8mJ6KmLjRZIn2uVxy5zEk
 lhQZbQsbn4hx4O29B/uC6Cfnl5QdtehHdD8ntAhH4yRxahGCewmJR6ZWi
 5uchwVnYtTB/e7MbYtxqErGQRMZv7mJaJBo9fzdpykdYEQbSOVjkqxod1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="282405540"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="282405540"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:54:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="744086823"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:54:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ASoC: SOF: Intel: override mclk_id for ES8336 support
Date: Mon, 19 Sep 2022 13:53:46 +0200
Message-Id: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
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

This patchset solves a known issue with ES8336 platforms wrt MCLK
selection. Most of the devices use the MCLK0 signal, but some devices
do use the MCLK1 signal.

The MCLK is defined in the topology, it would be a nightmare to
generate more topology files just for one MCLK difference. With a
minor extension to the intel-nhlt library, the MCLK information can be
found by parsing the NHLT table, and we can override the mclk_id at
boot time.

The only known issues for this platform remain the detection of GPIO
and microphone connections, currently only possible with manual
quirks.

Thanks to Eugene J. Markow for testing this patchset.

v2: addressed comments from Takashi and Amadeusz
Better error handling for the 1.5 case
Report error at the library level when 2 mclks are used

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: hda: refine SSP count support
  ASoC: SOF: add quirk to override topology mclk_id
  ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
  ASoC: SOF: Intel: hda: override mclk_id after parsing NHLT SSP blob

 include/sound/intel-nhlt.h    |  7 ++++
 sound/hda/intel-nhlt.c        | 79 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c     | 39 +++++++++++++++++
 sound/soc/sof/intel/hda.h     |  2 +
 sound/soc/sof/intel/mtl.c     |  2 +-
 sound/soc/sof/intel/tgl.c     |  8 ++--
 sound/soc/sof/ipc3-topology.c |  7 ++++
 sound/soc/sof/sof-priv.h      |  4 ++
 8 files changed, 143 insertions(+), 5 deletions(-)

-- 
2.34.1

