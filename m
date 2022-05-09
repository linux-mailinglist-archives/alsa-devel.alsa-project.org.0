Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AF520253
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 18:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C07B1918;
	Mon,  9 May 2022 18:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C07B1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652113568;
	bh=XjCnODs5eDe2B6X2CKoYdGCfUAZLm0o230Hy5WWYtoI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZeONydkNumP5xNhRPbyKD6HmPlXBmMV+IqG5bHP9Mfo21LwNJ5RWuFXDJ4lfJtdhu
	 OmskSziRMOdYNRtvqqIoefCOD52UaOsmZ/cn+ixQYiFeUB97gAW76hIoJvfWFiriw7
	 NNLNc+BFarL45r2xvGq3sGJedoQMCM6ilL4wwW90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61AADF8052F;
	Mon,  9 May 2022 18:23:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99BFCF8014C; Mon,  9 May 2022 18:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F6CAF8025D
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 18:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6CAF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dDCQULQx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EA216137D;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E049C385B6;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=XjCnODs5eDe2B6X2CKoYdGCfUAZLm0o230Hy5WWYtoI=;
 h=From:To:Cc:Subject:Date:From;
 b=dDCQULQx6Ix7kDV0M/p/zOdD8C5+qlFZUsCYdG06NUh0Uy31yjFYb2UG7GWVu1V+R
 wexdYfEEQl4hJym0y7yoVcFFkcW0SZC9EJF/u1IqwoxN97dFar7D+XA6TlvumAECd1
 1s9alS5L1GNT+/vr5mUiCL/I0X1Pk+pVaIKRafifXSmmDf9a6d4ZIpMUw4X4ITi1gR
 0kRsP6TIiWHPVXrv5GCD29mz90FmHHP/dcl82vLLjxIoJWo3Ut2350lvSxjevDyABQ
 ONDIEdCUIYQtUZAzpx5mM8JMIgLC/i+aOmUTw/Z0JD9YrvCa1MvGzKJif8nb8bF8+4
 oFBbvRfQFq6fw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVL-E7; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Date: Mon,  9 May 2022 18:23:35 +0200
Message-Id: <cover.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: mauro.chehab@linux.intel.com, Richard Weinberger <richard@nod.at>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-modules@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
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

That's because module_try_get() and symbol_get() doesn't try to
setup the module owner.

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

So, add support at kernel/modules to properly set the holders when
try_module_get() and symbol_get() are used.

This allow allow audio drivers to properly annotate when a dependency 
on a DRM driver dependencies exists, and add a call to such new 
function at the snd-hda driver when it successfully binds into the DRM 
driver.

With that, userspace tools can now check and properly remove the
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

PS.: This series was generated against next-20220506.

---

v6:
- dropped an unused function prototype for __symbol_get_gpl();
- addressed several issues that were noticed while testing the series on
  an slow atom machine;
- also add holders when symbol_get() is used.

v5:
- while v4 works fine, it ends calling try_module_format() recursively, which
  is not what it it was supposed to do. So, change the logic to avoid such
  recursion, by adding a static __try_module_format() and renaming the
  new version that takes two arguments as try_module_format_owner().

v4:
 - fix a compilation warning reported by Intel's Kernel robot when
   !CONFIG_MODULE_UNLOAD or !CONFIG_MODULE.

v3: minor fixes:
 - fixed a checkpatch warning;
 - use a single line for the new function prototype.

v2:
 - the dependencies are now handled directly at try_module_get().
Mauro Carvalho Chehab (4):
  module: drop prototype for non-existing __symbol_get_gpl()
  module: update dependencies at try_module_get()
  module: set holders when symbol_get() is used
  ALSA: hda - identify when audio is provided by a video driver

 drivers/mtd/chips/gen_probe.c           |  4 +-
 include/linux/module.h                  | 13 +++--
 kernel/module/main.c                    | 76 ++++++++++++++++++++-----
 samples/hw_breakpoint/data_breakpoint.c |  2 +-
 sound/hda/hdac_component.c              |  2 +-
 5 files changed, 72 insertions(+), 25 deletions(-)

-- 
2.35.3


