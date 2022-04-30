Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA30515DCE
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 15:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D7D15DC;
	Sat, 30 Apr 2022 15:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D7D15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651326223;
	bh=z1ShzoCSkbQb+bOpuaiBtOfCObZ5xV/5jCkA52fVM7U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cM7hIGGUlfBdIhBw3zAi2Rm+IyoOWHU/5yE6NSdHda5nvI6Io4sd0W3E9XrM+NIZO
	 luozZD80En6ks/xz/pfJ1V8N+nj8tORC5uzyH8fgruflfpoRTQLuNKNhuJ5+PfwkvN
	 lbE3UMiuTMEOqUkry94dmpJvp572wCf4WDodkd0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D6E1F80510;
	Sat, 30 Apr 2022 15:42:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97B84F80125; Sat, 30 Apr 2022 15:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FB22F80125
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 15:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FB22F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZSoiPmfw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A157260EA5;
 Sat, 30 Apr 2022 13:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05609C385AA;
 Sat, 30 Apr 2022 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651326114;
 bh=z1ShzoCSkbQb+bOpuaiBtOfCObZ5xV/5jCkA52fVM7U=;
 h=From:To:Cc:Subject:Date:From;
 b=ZSoiPmfwpPthXwwLa+SgKEi3DzH2Y1E+GN8PH8yc8mRVbjar4q05Gt45Z5GnuOC9r
 DTQR2PrUvyCR5hjBBVFXEkXT/24eZiI/31Qzl2M+9U+jdclLfZJ4cJOSqO/0zXB3fi
 /JQQCltMWzh4hCzbuZ49YlcTU/AynOFfg0PGeINz91OtWxxI3MnYaomVQO8VumZTZI
 JOj8/uyj+4pj+2nnTnlWrLoKjlTWhjC+PcukaXUpFLgVzNGNysenUz6lb4icrnpUMp
 loucqMnkOtEc6nfxhIT7qckU12c5SF85dy/WmK2mbaQCzhDuwYIkXc9z9/FXiTII/Q
 4GiqNWH0i7hZw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nknM6-001nsd-HX; Sat, 30 Apr 2022 14:41:50 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v3 0/2] Let userspace know when snd-hda-intel needs i915
Date: Sat, 30 Apr 2022 14:41:46 +0100
Message-Id: <cover.1651326000.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: mauro.chehab@linux.intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-modules@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
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

---

v3: minor fixes:
 - fixed a checkpatch warning;
 - use a single line for the new function prototype.

v2: 
 - the dependencies are now handled directly at try_module_get().


Mauro Carvalho Chehab (2):
  module: update dependencies at try_module_get()
  ALSA: hda - identify when audio is provided by a video driver

 include/linux/module.h     |  4 +++-
 kernel/module/main.c       | 33 +++++++++++++++++++++++++++++++--
 sound/hda/hdac_component.c |  2 +-
 3 files changed, 35 insertions(+), 4 deletions(-)

-- 
2.35.1


