Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6306B14D2D4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4B3F1678;
	Wed, 29 Jan 2020 23:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4B3F1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580335775;
	bh=fdU8PiuDyrwX5nZJSn4IBoG/ejofXLFxQi5quWbdzgI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OYCwZaUaoRZIZW6PbkZZ4FpPHALKY6Nmc7aD1D8d+Sk4eSUW62livy8NnZi/rTqUl
	 56TqEyyBF2ADvaVluQ6zpjnrehlsMG3BXaYJvpFX8UVaeTmbgaZTimdDi2r4OEvXM8
	 HSV5lqw7GravUjxz5a71UM+dZoNivC3OhMrJH8J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B58F80259;
	Wed, 29 Jan 2020 23:07:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D62F80123; Wed, 29 Jan 2020 23:07:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13F5AF80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F5AF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122353"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:17 -0600
Message-Id: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/9] ASoC: SOF: update S0ix/D0ix support
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

The initial support for S0ix had limitations that were identified
during testing, and opportunitic transitions such as S0/D0ix was not a
case that was handled.

Ranjani suggested a major rework reviewed at length on GitHub
[1][2]. So far all known issues are solved and no regressions are
identified on 5 different platforms, so it's time to share
upstream.

This is not intended for 5.6 and can wait after the merge window
closes. But since the code isn't simple we want to allow plenty of
time for further reviews.

Thanks Ranjani for this important update!

[1] https://github.com/thesofproject/linux/pull/1631
[2] https://github.com/thesofproject/linux/pull/1702

Ranjani Sridharan (9):
  ASoC: SOF: Do not reset hw_params for streams that ignored suspend
  ASoC: SOF: pm: Unify suspend/resume routines
  ASoC: SOF: Add system_suspend_target field to struct snd_sof_dev
  ASoC: SOF: pm: Introduce DSP power states
  ASoC: SOF: Move DSP power state transitions to platform-specific ops
  ASoC: SOF: audio: Add helper to check if only D0i3 streams are active
  ASoC: SOF: Intel: hda: Amend the DSP state transition diagram
  ASoC: SOF: Intel: cnl: Implement feature to support DSP D0i3 in S0
  ASoC: SOF: Intel: hda: Allow trace DMA in S0 when DSP is in D0I3 for
    debug

 sound/soc/sof/core.c          |   4 +-
 sound/soc/sof/intel/cnl.c     |  37 ++++-
 sound/soc/sof/intel/hda-dsp.c | 289 +++++++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda.c     |   5 +
 sound/soc/sof/intel/hda.h     |  21 ++-
 sound/soc/sof/ipc.c           |  29 +++-
 sound/soc/sof/ops.h           |  16 +-
 sound/soc/sof/pcm.c           |   2 +-
 sound/soc/sof/pm.c            | 176 ++++++++-------------
 sound/soc/sof/sof-audio.c     |  42 ++++-
 sound/soc/sof/sof-audio.h     |   3 +-
 sound/soc/sof/sof-priv.h      |  43 +++--
 12 files changed, 502 insertions(+), 165 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
