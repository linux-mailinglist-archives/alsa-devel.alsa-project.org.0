Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEBC42F7F1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360FD181A;
	Fri, 15 Oct 2021 18:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360FD181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634314623;
	bh=4BYP662aW+SCFmtokX4LjlwbXnXOwZ0M1o4liKvlQj8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L+4FlhBNTy3du1GYcfiSAFEljq8x96A5lcRsfJZ1K8PnWhCcByaB5ZvpHw0ZhaLBi
	 lkpqoZwnqMFLwDPZWJ2WFSnRq5VdlZi4A0Frl08mAPvgCm9ZNCxBz+VfZUtFjrBF1W
	 2L0Yok7afHs6S7wi/oxJZjkPF6o6DkP/jVYsxuw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89239F80290;
	Fri, 15 Oct 2021 18:15:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D051F8028D; Fri, 15 Oct 2021 18:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D8FBF8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D8FBF8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="225404612"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="225404612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="564375167"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2021 09:10:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: Sanity checks and soc-topology updates
Date: Fri, 15 Oct 2021 18:12:51 +0200
Message-Id: <20211015161257.27052-1-cezary.rojewski@intel.com>
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

Couple of soc-topology related changes and a use-after-free fix. Said fix
and two sanity checks for soc-topology lead the way. While the
use-after-free is quite obvious, the sanity checks are here to cover for
cases where user malformed the topology file -or- access to filesystem
somehow got interrupted during copy operation. We shouldn't be reading
outside the file boundary.

Afterward a change to soc_tplg_add_kcontrol(): device being passed to
soc_tplg_add_dcontrol() from comp->dev to tplg->dev which corrects
dev_xxx() invoked later on.
Also, device used for topology memory allocations from component->dev to
component->card->dev so memory gets freed each time card device (usually
platform device) is removed rather than the component device what may
happen less frequently.

Dummy component gets smarter and no longer overrides hw_params if
there are other components accociated with related struct
snd_soc_pcm_runtime instance.

Amadeusz Sławiński (5):
  ASoC: core: Remove invalid snd_soc_component_set_jack call
  ASoC: topology: Check for dapm widget completeness
  ASoC: topology: Use correct device for prints
  ASoC: topology: Change topology device to card device
  ASoC: Stop dummy from overriding hwparams

Cezary Rojewski (1):
  ASoC: topology: Add header payload_size verification

 sound/soc/soc-core.c     |  3 ---
 sound/soc/soc-topology.c | 34 ++++++++++++++++++++++++++++++----
 sound/soc/soc-utils.c    | 13 +++++++++++++
 3 files changed, 43 insertions(+), 7 deletions(-)

-- 
2.25.1

