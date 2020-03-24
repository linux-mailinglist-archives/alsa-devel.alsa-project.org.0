Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1D190D6C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 13:31:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61CC01657;
	Tue, 24 Mar 2020 13:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61CC01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585053079;
	bh=2Z1hYkcYO1xRmbiOzg/YGlV3feo9ipNMi/NsWwjdzSw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OD38sqLjMneiNj6h1qUhXS7kD7nRrh+yQ+RhfOidbC+b09PCzYZADm2Tu4RlvfuaR
	 FaZgp5ylMtZuALHpilGqh53rPHH+u2grxzEV4JELquy/8AyVxYtpN/io+YvHr9qISt
	 EyGv4bYsvywKEsVcqW76b+XrzbpevCfk0gA7QbVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6496EF80234;
	Tue, 24 Mar 2020 13:29:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7980FF80227; Tue, 24 Mar 2020 13:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5066F800FE;
 Tue, 24 Mar 2020 13:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5066F800FE
IronPort-SDR: BHYcZxsypWkx3Oz9V0+mfFsz1Zg1HP/hm2tUCGRp6tSUbLwPLBXOec10qw7yS17BD1kYcshuHq
 ILQ7QgKcXk+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 05:29:24 -0700
IronPort-SDR: AsDsKyfPdgL9dxzv4GyYqXy7Nn4VGNrjHw8f2XSa/+AceF85cyIDIC9OeTAhUvUS+8a0Ej+eZ0
 eO6GU8q8TmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="246638956"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.33.88])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2020 05:29:22 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: initialise work immediately
Date: Tue, 24 Mar 2020 13:29:19 +0100
Message-Id: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Mark Brown <broonie@kernel.org>, sound-open-firmware@alsa-project.org
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

Fix uninitialised work errors by moving initialisation to directly
after allocation.

Guennadi Liakhovetski (2):
  ASoC: SOF: (cosmetic) use for_each_pcm_streams() in sof_dai_load()
  ASoC: SOF: fix uninitialised "work" with VirtIO

 sound/soc/sof/pcm.c       |  4 +---
 sound/soc/sof/sof-audio.h |  3 +++
 sound/soc/sof/topology.c  | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

-- 
1.9.3

