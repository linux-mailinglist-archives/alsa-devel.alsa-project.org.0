Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829029EDF
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879A91722;
	Fri, 24 May 2019 21:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879A91722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558725172;
	bh=zAjeltgEIZM7A91wivsG1XGLl/I/nwt7qMJImVumgQU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N2YhIusatDTMUazhjwRCZFL+m86SZYEYCaoy8OQaJdC9rt7pbRgEchArHzTk1xov9
	 kiSq7Dfbl6w9CulQAzQJ3ezkzB52Xf6i8J5k7jpprrXeqdpkuC1DI5+JxPQLjMUMfU
	 tYB5mZWoMRtiLgNxbrdK12G8Tdnqk8LL58vvfzzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 406BDF89673;
	Fri, 24 May 2019 21:09:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1067AF89633; Fri, 24 May 2019 21:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84D22F89630
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84D22F89630
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 12:09:30 -0700
X-ExtLoop1: 1
Received: from tattafos-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.178.85])
 by fmsmga004.fm.intel.com with ESMTP; 24 May 2019 12:09:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 14:09:16 -0500
Message-Id: <20190524190925.5931-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 0/9] ASoC: SOF: stability fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

No new functionality here but fixes to the IPC, memory allocation,
workqueues, control, runtime_pm and HDaudio support. These issues were
identified during the integration/productization of new platforms.

I added a 'Fixes' tag to make sure backports/stable can pick up these
patches, in case it's too late for them to land in 5.2

The next batch for SOF will be a set of new capabilities for trace,
IPC test, Hdaudio support, they will be submitted after additional
tests and once these fixes are reviewed/merged.

Thanks!

Changes since v2:
Removed 3 patches (Hdaudio memory allocation changes, will be
resubmitted when unclear system freeze is sorted out + patch already
merged by Mark)
Corrected merge issue with IPC patch from Guennadi

Changes since v1:
Feedback from Takashi: use spin_lock_irq instead of spin_lock_irq_save
Added Takashi's Reviewed-by tag


Guennadi Liakhovetski (1):
  ASoC: SOF: ipc: fix a race, leading to IPC timeouts

Keyon Jie (1):
  ASoC: SOF: control: correct the copy size for bytes kcontrol put

Libin Yang (1):
  ASoC: SOF: pcm: clear hw_params_upon_resume flag correctly

Pierre-Louis Bossart (2):
  ASoC: SOF: core: fix error handling with the probe workqueue
  ASoC: SOF: pcm: remove warning - initialize workqueue on open

Ranjani Sridharan (2):
  ASoC: SOF: core: remove DSP after unregistering machine driver
  ASoC: SOF: core: remove snd_soc_unregister_component in case of error

Zhu Yingjiang (2):
  ASoC: SOF: Intel: hda: fix the hda init chip
  ASoC: SOF: Intel: hda: use the defined ppcap functions

 sound/soc/sof/control.c        |   9 +--
 sound/soc/sof/core.c           |  29 +++++++--
 sound/soc/sof/intel/bdw.c      |   9 ++-
 sound/soc/sof/intel/byt.c      |  10 +--
 sound/soc/sof/intel/cnl.c      |   4 ++
 sound/soc/sof/intel/hda-ctrl.c | 102 +++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda-ipc.c  |  17 ++++-
 sound/soc/sof/intel/hda.c      | 109 +++++++--------------------------
 sound/soc/sof/ipc.c            |  13 ----
 sound/soc/sof/pcm.c            |   8 +--
 10 files changed, 176 insertions(+), 134 deletions(-)


base-commit: 188d45fe779eeb8e3521b59fcb12cc48a6f2c203
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
