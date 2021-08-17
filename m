Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7782D3EF053
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 18:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F391679;
	Tue, 17 Aug 2021 18:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F391679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629218572;
	bh=RaWSqPmz0JZTXwCs7ndfDPn8QpnlImCksR05Jdcj5qo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BZw4OgtBaPa+VBWF8zF7Cd8utSZNrEPMBVIdl4y23WEwnOyH+SKHhOObyByv84PJp
	 599JrVXhoG73cNwP2Xa+jru1ZF5RSXLQADYlx7/Vi73deLOdJRjuw9GXlcsWnX6KSm
	 w/OMz76m+XQc/AhhWBEM5Hy1iX9pdsqXffAh2j1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7845BF802C4;
	Tue, 17 Aug 2021 18:41:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD0A3F802C4; Tue, 17 Aug 2021 18:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B598F80163
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 18:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B598F80163
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="279884372"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="279884372"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 09:41:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="449342692"
Received: from aaadelek-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.12.89])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 09:41:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/2] ASoC: soc-pcm: fix trigger race conditions with
 shared BE
Date: Tue, 17 Aug 2021 11:40:52 -0500
Message-Id: <20210817164054.250028-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org
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

We've been adding a 'deep buffer' PCM device to several SOF topologies
in order to reduce power consumption. The typical use-case would be
music playback over a headset: this additional PCM device provides
more buffering and longer latencies, leaving the rest of the system
sleep for longer periods. Notifications and 'regular' low-latency
audio playback would still use the 'normal' PCM device and be mixed
with the 'deep buffer' before rendering on the headphone endpoint. The
tentative direction would be to expose this alternate device to
PulseAudio/PipeWire/CRAS via the UCM SectionModifier definitions.

That seemed a straightforward topology change until our automated
validation stress tests started reporting issues on SoundWire
platforms, when e.g. two START triggers might be send and conversely
the STOP trigger is never sent. The SoundWire stream state management
flagged inconsistent states when the two 'normal' and 'deep buffer'
devices are used concurrently with rapid play/stop/pause monkey
testing.

Looking at the soc-pcm.c code, it seems that the BE state
management needs a lot of love.

a) there is no consistent protection for the BE state. In some parts
of the code, the state updates are protected by a spinlock but in the
trigger they are not. When we open/play/close the two PCM devices in
stress tests, we end-up testing a state that is being modified. That
can't be good.

b) there is a conceptual deadlock: on stop we check the FE states to
see if a shared BE can be stopped, but since we trigger the BE first
the FE states have not been modified yet, so the TRIGGER_STOP is never
sent.

This patchset suggests using the same spinlock used in other parts of
soc-dpcm.c, and the use of a refcount to decide when to trigger the
BE. With the two patches I am able to run our entire validation suite
without any issues with this new 'deep buffer' topology.

One might ask 'how come we didn't see this earlier'? The answer is
probably that the .trigger callbacks in most implementations seems to
perform DAPM operations, and sending the triggers multiple times is
not an issue. In the case of SoundWire, we do use the .trigger
callback to reconfigure the bus using the 'bank switch' mechanism. It
could be acceptable to tolerate a trigger multiple times, but the
deadlock on stop cannot be fixed at the SoundWire layer alone.

Opens:

1) is this the right solution? The DPCM code is far from simple, has
notions such as SND_SOC_DPCM_UPDATE_NO and 'trigger_pending' that I
have no background on.

2) it's not clear if we need the full-blown spin_lock_irq_save()
version or just the regular spin_lock()?

3) is this universal? this might break platforms with other types of
'POST' or 'BESPOKE' trigger.

4) is this ok to proceed with such an incremental fix, or do we have
to revisit (possibly rewrite) the entire FE-BE interaction?

I chose to send this patchset as an RFC to gather feedback and make
use others know about DPCM issues. We're going to spend more time on
this but if others can provide feedback/test results it would be
greatly appreciated.

Note that these DPCM issues will add more complexity to our SOF
distribution. We've never hit a case where even recent kernels do not
support a minor topology change that isn't related to an ABI
change. We might have to introduce the deep buffer PCM device in a new
topology file, add a kernel patch to make use of this new file and
keep the old (w/o deep buffer) and new file (w/ deep buffer) for a
very long time (not sure when we can assume that all users of SOF
would transition to 5.15+...)

Pierre-Louis Bossart (2):
  ASoC: soc-pcm: protect BE dailink state changes in trigger
  ASoC: soc-pcm: test refcount before triggering

 include/sound/soc-dpcm.h |   2 +
 sound/soc/soc-pcm.c      | 151 +++++++++++++++++++++++++++++++++------
 2 files changed, 130 insertions(+), 23 deletions(-)

-- 
2.25.1

