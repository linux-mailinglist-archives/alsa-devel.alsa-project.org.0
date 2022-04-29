Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4E514265
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 08:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5971915F2;
	Fri, 29 Apr 2022 08:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5971915F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651213988;
	bh=1qTI2+ULn9S33eUs/y9vp+7qFR3kaOf7jmVnCV4QTU0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ud1uIuJU0m/bfQY8mzNO6MTw11b6ATAjYkQ/wV5198jgFVEmw2OJdRukHmLTnBLje
	 NcHBN9RJUmiFwjTjeIQTZugpyxulRXPhyeKIYk40PQIjO3UqJCcPX0TXWj8GmzbQMb
	 wK9UoETxTLrGijRTbmkwmZ/f32mYupKaJMHvE8gY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C98F804A9;
	Fri, 29 Apr 2022 08:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 806CDF8016E; Fri, 29 Apr 2022 08:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 287CAF8016E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 08:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 287CAF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oKda16HS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E12261D7A;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFB0C385AC;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651213887;
 bh=1qTI2+ULn9S33eUs/y9vp+7qFR3kaOf7jmVnCV4QTU0=;
 h=From:To:Cc:Subject:Date:From;
 b=oKda16HSltrM1J2Qv8n2yHzXm+KWDkgn6vpCbU3CbfalB9DsnP+Ip45pcRoJ4vYG2
 TXInGSja1792BOhv1g7WnGV5fnSbmrIlAMZ5QrXdOG0mmq2AzZB8r/oZTBXI46gMyO
 ILOot9hhasVU6Q0QhI3SUfoPAighV0XqYAhmPmOY/3ybC83GjCeb+DuTVpH6G1LTFW
 RAqC1CzHD5jD0vKp3aOFknDlb0mPlA1z7qAL1GRfGzPn7zVyFkPSvZJnKBjQxDlylc
 gqrmEugOKSe3ZkXOgWUUTx4NvJC+/H2fDLgdHk2RrMji1NnRlfe3qRrpwhJCCULhPY
 nu3UR42ITLJPA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkK9z-001Qmf-Ly; Fri, 29 Apr 2022 07:31:23 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 0/2] Let userspace know when snd-hda-intel needs i915
Date: Fri, 29 Apr 2022 07:31:14 +0100
Message-Id: <cover.1651212016.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 mauro.chehab@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-modules@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

Currently, kernel/module annotates module dependencies when
request_symbol is used, but it doesn't cover more complex inter-driver
dependencies that are subsystem and/or driver-specific.

In the case of hdmi sound, depending on the CPU/GPU, sometimes the
snd_hda_driver can talk directly with the hardware, but sometimes, it
uses the i915 driver. When the snd_hda_driver uses i915, it should
first be unbind/rmmod, as otherwise trying to unbind/rmmod the i915
driver cause driver issues, as as reported by CI tools with different
GPU models:

	https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6415/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
	https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11495/bat-adlm-1/igt@i915_module_load@reload.html

In the past, just a few CPUs were doing such bindings, but this issue now
applies to all "modern" Intel CPUs  that have onboard graphics, as well as
to the  newer discrete GPUs.

With the discrete GPU case, the HDA controller is physically separate and
requires i915 to power on the hardware for all hardware  access. In this
case, the issue is hit basicly 100% of the time.

With on-board graphics, i915 driver is needed only when the display
codec is accessed. If i915 is unbind during runtime suspend, while
snd-hda-intel is still bound, nothing bad happens, but unbinding i915
on other situations may also cause issues.

So, add support at kernel/modules to allow snd-hda drivers to properly
annotate when a dependency on a DRM driver dependencies exists,
and add a call to such new function at the snd-hda driver when it
successfully binds into the DRM driver.

This would allow userspace tools to check and properly remove the
audio driver before trying to remove or unbind the GPU driver.

It should be noticed that this series conveys the hidden module
dependencies. Other changes are needed in order to allow
removing or unbinding the i915 driver while keeping the snd-hda-intel
driver loaded/bound. With that regards, there are some discussions on
how to improve this at alsa-devel a while  back:

https://mailman.alsa-project.org/pipermail/alsa-devel/2021-September/190099.html

So, future improvements on both in i915 and the audio drivers could be made.
E.g. with  discrete GPUs, it's the only codec of the card, so it seems feasible
to detach the ALSA card if i915 is bound (using infra made for VGA
switcheroo), but,  until these improvements are done and land in
upstream, audio drivers needs to be unbound if i915 driver goes unbind.

Yet, even if such fixes got merged, this series is still needed, as it makes
such dependencies more explicit and easier to debug.

PS.: This series was generated against next-20220428.

Luis/Takashi/Daniel/David,

If OK for you, I would prefer to have such patches applied via the drm-tip
tree once reviewed, in order to make easier to use them by some patches
I'm preparing to improve the CI tests that use i915 unbind logic.

Mauro Carvalho Chehab (2):
  module: add a function to add module references
  ALSA: hda - identify when audio is provided by a video driver

 include/linux/module.h     |  7 +++++++
 kernel/module/main.c       | 31 +++++++++++++++++++++++++++++++
 sound/hda/hdac_component.c |  8 ++++++++
 3 files changed, 46 insertions(+)

-- 
2.35.1


