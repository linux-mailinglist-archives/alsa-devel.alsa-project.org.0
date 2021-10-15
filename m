Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0E42F86A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE401836;
	Fri, 15 Oct 2021 18:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE401836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634315986;
	bh=zahFgcBZ/gPkOmmy8aY1sPD2isaO2VpVedvanrTADjU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V5VhVYiXlwLnhwXJ1VZRORFcL9wTepNFx4HobQdbQSe0b8rLmBlKDjG4a9pg2brNN
	 UISANGN4or5RCk3/FaLdsbrSl10b7XIc+5gAo0sEVXcB+UiTJvmBD7xd1SGTyN92ZP
	 dtcRgnaKi7TKPMHv4NFM7vmCMyulPfhHFgQUyu90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 121E9F80423;
	Fri, 15 Oct 2021 18:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD4FF8028D; Fri, 15 Oct 2021 18:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDF1F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDF1F8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="251395113"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="251395113"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593028292"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2021 09:38:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ALSA: hda: New NHLT functions and cleanup
Date: Fri, 15 Oct 2021 18:40:42 +0200
Message-Id: <20211015164047.44492-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org
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

Changes add two crucial functions: endpoint presence-check and
retrieval of endpoint's BLOB (hardware configuration) to NHLT API.

Few cleanups accompany the above:
First, drop device pointer usage in NHLT interface as those function
don't really make use of it. Work is done to align NHLT-struct naming
with other, commonly used ACPI-structs. While cleaning up, don't forget
about "is DMIC in NHLT?" check. No need to check for channel count or
anything DMIC-configuration related, just straight up verify link_type
presence.

Amadeusz Sławiński (5):
  ALSA: hda: Drop device-argument in NHLT functions
  ALSA: hda: Follow ACPI convention in NHLT struct naming
  ALSA: hda: Fill gaps in NHLT endpoint-interface
  ALSA: hda: Simplify DMIC-in-NHLT check
  ASoC: Intel: Skylake: Use NHLT API to search for blob

 include/sound/intel-nhlt.h             |  37 +++++--
 sound/hda/intel-dsp-config.c           |   6 +-
 sound/hda/intel-nhlt.c                 | 127 ++++++++++++++++++++++---
 sound/soc/intel/skylake/skl-nhlt.c     | 108 +--------------------
 sound/soc/intel/skylake/skl-pcm.c      |   3 +
 sound/soc/intel/skylake/skl-topology.c |  27 +++---
 sound/soc/intel/skylake/skl-topology.h |   1 +
 sound/soc/intel/skylake/skl.c          |   5 +-
 sound/soc/intel/skylake/skl.h          |   6 +-
 sound/soc/sof/intel/hda.c              |   6 +-
 10 files changed, 173 insertions(+), 153 deletions(-)

-- 
2.25.1

