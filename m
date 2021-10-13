Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4D42C34B
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 16:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E61671684;
	Wed, 13 Oct 2021 16:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E61671684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634135556;
	bh=wg2hO1AtzDTxBpWxZfnZ54dkEzVV+SjDrKjJ6ixmvK4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HNIKBtr/MCf/JIqBPtzMrVF3wOCAJoKphVkgqOe6Hj+N6afqN8tZ8t2U21nRLGYGD
	 hhgh+iDGoCsZ4ePuYtVhOV45cF7gCCkGx9CESCxk/lmHN3Q8+CgJ1AEUb6SztG9U4H
	 +7e8xO0CfWxKq5V2yfyztXGd6rPcU0aNzKPVmAgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D6D1F804B4;
	Wed, 13 Oct 2021 16:31:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F60F8028D; Wed, 13 Oct 2021 16:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91B47F800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 16:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B47F800C0
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="313639486"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313639486"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524649446"
Received: from ssafavib-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v3 00/13] ASoC : soc-pcm: fix trigger race conditions with
 shared BE
Date: Wed, 13 Oct 2021 09:30:37 -0500
Message-Id: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Sameer Pujar <spujar@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

This patchset suggests the removal of the dedicated 'dpcm_lock', and
the use of the FE PCM lock before walking through the BE list, a
mutual exclusion between triggers using the BE PCM lock, and the use
of a refcount to decide when to trigger the BE. With these patches I
am able to run our entire validation suite without any issues with
this new 'deep buffer' topology, and no regressions on existing
solutions [1]

One might ask 'how come we didn't see this earlier'? The answer is
probably that the .trigger callbacks in most implementations seems to
perform DAPM operations, and sending the triggers multiple times is
not an issue. In the case of SoundWire, we do use the .trigger
callback to reconfigure the bus using the 'bank switch' mechanism. It
could be acceptable to tolerate a trigger multiple times, but the
deadlock on stop cannot be fixed at the SoundWire layer alone.

I chose to send this patchset as an RFCv3 to gather more feedback and
make use others know about DPCM issues. We're going to spend more time
on this but if others can provide feedback/test results it would be
greatly appreciated. The change in the locking model could be
problematic on other platforms so we do want more time to comment/test
before even considering a merge.

Opens:

1) is this the right solution? The DPCM code is far from simple, has
notions such as SND_SOC_DPCM_UPDATE_NO and 'trigger_pending' that I
have no background on. It's not clear if these cases are still needed
with the locking changes.

2) There are other reports of kernel oopses [2] that seem related to
the lack of protection. I'd be good to confirm if this patchset solve
these problems as well.

[1] https://github.com/thesofproject/linux/pull/3146
[2] https://lore.kernel.org/alsa-devel/002f01d7b4f5$c030f4a0$4092dde0$@samsung.com/

changes since RFCv2:
Removal of dpcm_lock to use FE PCM locks (credits to Takashi Iwai for
the suggestion). The FE PCM lock is now used before each use of
for_each_dpcm_be() - with the exception of the trigger where the lock
is already taken. This change is also applied in drivers which make
use of this loop (compress, SH, FSL).
Addition of BE PCM lock to deal with mutual exclusion between triggers
for the same BE.
Alignment of the BE atomicity on the FE on connections, this is
required to avoid sleeping in atomic context.
Additional cleanups (indentation, static functions)

changes since RFC v1:
Removed unused function
Removed exported symbols only used in soc-pcm.c, used static instead
Use a mutex instead of a spinlock
Protect all for_each_dpcm_be() loops
Fix bugs introduced in the refcount

Pierre-Louis Bossart (13):
  ASoC: soc-pcm: remove snd_soc_dpcm_fe_can_update()
  ASoC: soc-pcm: don't export local functions, use static
  ASoC: soc-pcm: use proper indentation on 'continue'
  ASoC: soc-pcm: introduce snd_soc_dpcm_fe_lock_irq/unlock_irq()
  ASoC: soc-pcm: align BE 'atomicity' with that of the FE
  ASoC: soc-pcm: remove dpcm spin_lock, use PCM stream lock
  ASoC: soc-pcm: protect for_each_dpcm_be() loops
  ASoC: soc-compress: protect for_each_dpcm_be() loops
  ASoC: sh: rcar: protect for_each_dpcm_be() loops
  ASoC: fsl: asrc_dma: protect for_each_dpcm_be() loops
  ASoC: soc-pcm: serialize BE triggers
  ASoC: soc-pcm: test refcount before triggering
  ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE

 include/sound/soc-dpcm.h     |  20 +--
 include/sound/soc.h          |   2 -
 sound/soc/fsl/fsl_asrc_dma.c |   2 +
 sound/soc/sh/rcar/core.c     |   2 +
 sound/soc/soc-compress.c     |   4 +
 sound/soc/soc-core.c         |   1 -
 sound/soc/soc-pcm.c          | 253 ++++++++++++++++++++++++-----------
 7 files changed, 187 insertions(+), 97 deletions(-)

-- 
2.25.1

