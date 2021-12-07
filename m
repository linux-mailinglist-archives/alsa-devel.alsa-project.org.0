Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00E46C275
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 19:10:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3557123F8;
	Tue,  7 Dec 2021 19:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3557123F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638900655;
	bh=NGJqc3MmSm97Oh0IZWB9GRhkNIUdvwsBbFQbW8v6P8I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dK1fyZ6EoZRDIhQkAQD1SCaW+JrwR1p3I2PEwZtLD++A2EwO+IqfEHS5cp2X62GSE
	 xX2DOia5uJO0izT0130o6tuNJeZg8SJBUuEz0QH331DSJDFu6dzMQrQhKbHAjGiEMy
	 tp39UX0iSBTEGmiiB7HuRqfBR+Xg9ALm4F8RljQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0FFF804AE;
	Tue,  7 Dec 2021 19:09:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D0AF80253; Tue,  7 Dec 2021 19:09:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D19BF80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 19:09:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D19BF80253
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237873569"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237873569"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:38:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="751385217"
Received: from charriso-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.98.250])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:38:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC : soc-pcm: fix trigger race conditions with shared BE
Date: Tue,  7 Dec 2021 11:37:39 -0600
Message-Id: <20211207173745.15850-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
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

This patchset suggests the removal of the dedicated 'dpcm_lock' and
follows the design suggested by Takashi Iwai.  By default the
protection relies on the 'pcm_mutex', except for the FE and BE
triggers where the mutex cannot be used.  In this case, the FE PCM
lock is used instead. In the cases where a BE is added/removed, the
pcm_mutex and FE PCM lock are both taken.  In addition, the BE PCM
lock is used to serialize access to a shared BE.

With these patches I am able to run our entire validation suite
without any issues with this new 'deep buffer' topology, and no
regressions on existing solutions [1]. The tests were reproduced by
Bard Liao for SoundWire devices.

One might ask 'how come we didn't see this earlier'? The answer is
probably that the .trigger callbacks in most implementations seems to
perform DAPM operations, and sending the triggers multiple times is
not an issue. In the case of SoundWire, we do use the .trigger
callback to reconfigure the bus using the 'bank switch' mechanism. It
could be acceptable to tolerate a trigger multiple times, but the
deadlock on stop cannot be fixed at the SoundWire level alone.

Opens:

1) The issues reported by Nvidia on the RFCv3 may or may not be
present. We'd need test results to make sure the locking update does
not introduce a regression on Tegra.

2) There are other reports of kernel oopses [2] that seem related to
the lack of protection. I'd be good to confirm if this patchset solve
these problems as well.

[1] https://github.com/thesofproject/linux/pull/3146
[2] https://lore.kernel.org/alsa-devel/002f01d7b4f5$c030f4a0$4092dde0$@samsung.com/

changes since RFCv3:
Used two patches from Takashi. We now use the pcm_mutex, the FE stream
lock when adding and deleting a BE, and the BE stream lock to handle
concurrency between streams using the same BE.
Added a patch to use GFP_ATOMIC for the DPCM structure.
Fixed PAUSE_RELEASE transition (GitHub comment from Kai Vehmanen)

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

Pierre-Louis Bossart (4):
  ASoC: soc-pcm: use GFP_ATOMIC for dpcm structure
  ASoC: soc-pcm: align BE 'atomicity' with that of the FE
  ASoC: soc-pcm: test refcount before triggering
  ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE

Takashi Iwai (2):
  ASoC: soc-pcm: Fix and cleanup DPCM locking
  ASoC: soc-pcm: serialize BE triggers

 include/sound/soc-dpcm.h |   2 +
 include/sound/soc.h      |   2 -
 sound/soc/soc-core.c     |   1 -
 sound/soc/soc-pcm.c      | 351 +++++++++++++++++++++++++++------------
 4 files changed, 246 insertions(+), 110 deletions(-)

-- 
2.25.1

