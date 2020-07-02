Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7B2129FD
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 18:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F4C16DF;
	Thu,  2 Jul 2020 18:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F4C16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593708396;
	bh=TvqTRdvkp8gPd20FMdCo6DdgKuRxahGOPi9Hgohfu8M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QQ1km+7QIMum6q9DCZBa686cszrrQAcPX2L6CFE4oIgIIFGQz+pt7sQImm7rHXIH3
	 /VJBzbZCqGr1bSD/jC9W5AMY9zk/codKgFNGnCCkSyxxD/QGL1Cit4IhLKdy1yRGcX
	 DXqYraSXqGvhqlf5EUmjBbANMVm3VPvjnSnbiDAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 624A9F80247;
	Thu,  2 Jul 2020 18:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69322F80247; Thu,  2 Jul 2020 18:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B1BEF800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B1BEF800C1
IronPort-SDR: b6YVzdVhIT35yH0DftEyO2BhukBm+Nwu/e4Ako9tBZCkTEz0llzM4nFKuwzW9vr2aU7NgwtFz5
 i9OIwdxmRyUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144470104"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144470104"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:44:46 -0700
IronPort-SDR: jyHnqyXgTHCMZ01DG5HF+OJSxjkqzdYCkJaVfPtVDkmt4AVztKJk7cL/ZarORKwyyM4JhmkP8X
 4ejNs+YjpTgA==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426011051"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:44:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: amd: remove warnings with make W=1
Date: Thu,  2 Jul 2020 11:44:27 -0500
Message-Id: <20200702164433.162815-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Yet another cleanup series, with good findings of variables not used
for anything.

Pierre-Louis Bossart (6):
  ASoC: amd: acp-da7219-max98357a: fix 'defined but not used' warning
  ASoC: amd: acp-rt5645: fix 'defined but not used' warning
  ASoC: amd: raven: acp3x-pcm-dma: fix 'set but not used' warning
  ASoC: amd: raven: acp3x-i2s: fix 'set but not used' warning
  ASoC: amd: raven: acp3x-pcm-dma: remove unused-but-set variable
  ASoC: amd: raven: acp3x-i2s: remove unused-but-set variable

 sound/soc/amd/acp-da7219-max98357a.c | 2 ++
 sound/soc/amd/acp-rt5645.c           | 2 ++
 sound/soc/amd/raven/acp3x-i2s.c      | 4 ----
 sound/soc/amd/raven/acp3x-pcm-dma.c  | 4 ----
 4 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.25.1

