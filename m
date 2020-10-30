Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D72A058E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6C5165D;
	Fri, 30 Oct 2020 13:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6C5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061555;
	bh=CLeJ0uXR60i3YKbOcrj/O0Bf0wrsOSfO54ZoPoL8//g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ryfOLNLK+M0kftzqDFJLjDR6EBonpN0Yba7o00DSN9Agl1i1a2lm5OYPTQSwIln0y
	 h1MkeY2EJDPk3f6M+hjQ/DG/hTpi9ukKr8zwKpLZtVR9uOFmH4Vph3XAeDRIhEhcZ6
	 m8vdfvsBo46iKRLYQfDFigHLhx/bC/9nilCTAufQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59B3FF80272;
	Fri, 30 Oct 2020 13:37:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20201F80107; Fri, 30 Oct 2020 13:37:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEF5BF80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF5BF80107
IronPort-SDR: JLNTZnKPtwh6RYTI/ldsEsQ9LDefzmcjxkGpFNOsrsWNd7HVCNwDPe0r4YPZTqH5Z/7pwZ5ySM
 BmI3+9zVP4qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230233996"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="230233996"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:37:30 -0700
IronPort-SDR: DhroVS1WuPf0M8PE6mqg7mv2tzbf9w0DpyJt+4cbd24+979Ej4xGLFZQxYVY+5grYa7RcNt6iq
 rIPCCntdNUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="362433692"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 05:37:28 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/7] ASoC: topology: Change to resource managed memory
Date: Fri, 30 Oct 2020 10:54:21 -0400
Message-Id: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

Almost all other allocations in ASoC API are resource managed, the only
exception is soc-topology.c.

This patchset clean ups few unnecessary functions in preparation for
change and then changes to devm_ functions for allocation.

Amadeusz Sławiński (6):
  ASoC: topology: Remove unused functions from topology API
  ASoC: topology: Remove multistep topology loading
  ASoC: topology: Unify all device references
  ASoC: topology: Change allocations to resource managed
  ASoC: topology: Remove empty functions
  ASoC: topology: Simplify remove_widget function

 include/sound/soc-topology.h           |  13 +-
 sound/soc/intel/skylake/skl-topology.c |   9 +-
 sound/soc/soc-topology.c               | 302 +++++--------------------
 sound/soc/sof/pcm.c                    |   2 +-
 sound/soc/sof/topology.c               |   4 +-
 5 files changed, 57 insertions(+), 273 deletions(-)

-- 
2.25.1

