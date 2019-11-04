Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCCEF0CA
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 23:50:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A002170F;
	Mon,  4 Nov 2019 23:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A002170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572907805;
	bh=rAH7uYsHNifCTfjz60Vs/MGfqX8PwJdsEhKx7VuVt1M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Is9NB+ABZoBF0X84gjP/1brDdULwsAhSCUMTN6LzJSWXHNrgzvuFTezDu8KrgocXA
	 vKf2DSFoOXu4SLydRYCJdC7Is4xsgkAoVDSqQ42nQReOapV3zhLAmVMYB8Feuq/J9N
	 G4MjsMXl0uuSVNmQSOhFRfRObb9jLGRgDVriMUfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53008F803F4;
	Mon,  4 Nov 2019 23:48:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC024F8045F; Mon,  4 Nov 2019 23:48:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F2FCF8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 23:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F2FCF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 14:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="195616733"
Received: from njdenler-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.55])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2019 14:48:08 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  4 Nov 2019 14:48:10 -0800
Message-Id: <20191104224812.3393-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 0/2] Update FE/BE trigger order based on the
	command
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently, the trigger orders SND_SOC_DPCM_TRIGGER_PRE/POST
determine the order in which FE DAI and BE DAI are triggered.
In the case of SND_SOC_DPCM_TRIGGER_PRE, the FE DAI is
triggered before the BE DAI and in the case of
SND_SOC_DPCM_TRIGGER_POST, the BE DAI is triggered before
the FE DAI. And this order remains the same irrespective of the
trigger command.
  
In the case of the SOF driver, during playback, the FW
expects the BE DAI to be triggered before the FE DAI during
the START trigger. The BE DAI trigger handles the starting of
Link DMA and so it must be started before the FE DAI is started
to prevent xruns during pause/release. This can be addressed
by setting the trigger order for the FE dai link to
SND_SOC_DPCM_TRIGGER_POST. But during the STOP trigger,
the FW expects the FE DAI to be triggered before the BE DAI.
Retaining the same order during the START and STOP commands,
results in FW error as the DAI component in the FW is still
active.
    
The issue can be fixed by mirroring the trigger order of
FE and BE DAI's during the START and STOP trigger. So, with the
trigger order set to SND_SOC_DPCM_TRIGGER_PRE, the FE DAI will be
trigger first during SNDRV_PCM_TRIGGER_START/STOP/RESUME
and the BE DAI will be triggered first during the
STOP/SUSPEND/PAUSE commands. Conversely, with the trigger order
set to SND_SOC_DPCM_TRIGGER_POST, the BE DAI will be triggered
first during the SNDRV_PCM_TRIGGER_START/STOP/RESUME commands
and the FE DAI will be triggered first during the
SNDRV_PCM_TRIGGER_STOP/SUSPEND/PAUSE commands.

The above change has been tested with the Skylake driver
on the Kabylake based chromebook and legacy HDA driver
on Kabylake based Dell XPS13. It has also been tested
on all platforms with SOF CI without any regressions
for the past 3 weeks.

More details on the issue can be found here:
https://github.com/thesofproject/linux/issues/1160

Changes in v2:
Fixed comments on function name and consolidating the switch
cases.

Ranjani Sridharan (2):
  ASoC: pcm: update FE/BE trigger order based on the command
  ASoC: SOF: topology: set trigger order for FE DAI link

 sound/soc/soc-pcm.c      | 95 ++++++++++++++++++++++++++++------------
 sound/soc/sof/topology.c |  4 ++
 2 files changed, 72 insertions(+), 27 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
