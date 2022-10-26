Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9160E231
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 15:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DA03B8F;
	Wed, 26 Oct 2022 15:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DA03B8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666791271;
	bh=D2r6+JPslQDN78fPXJ2sv//aSH7qefTnKlabZdVL/7A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rApEx45Wlt+D7URv4kaNKdmibxMXCVRxtynhu816WFXGYaKn/yPaRPZh8pvG2HRFl
	 WJuRghi2+2eh3dUXKObcAREt4NukTrPhUAp/LjtqoHPWbTnMu2EsS/EMPeorF1wiSa
	 bglza2LTheJUrrvhjBudjU9AWQJX3gT/0ZXjkKGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A62F8027C;
	Wed, 26 Oct 2022 15:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79E5CF8027C; Wed, 26 Oct 2022 15:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68384F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 15:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68384F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZwZqga3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666791212; x=1698327212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D2r6+JPslQDN78fPXJ2sv//aSH7qefTnKlabZdVL/7A=;
 b=ZwZqga3HJ9ucxmr5N7X0jcYBeGVXqzocFaJz+063qtTGzWE9OzB5o6gG
 ND1/VG4LHpI2Rbm6L5IWEWHNWzXs7zfeDyPGjnF+KBc/UsP9e0bYJvlFf
 9Tpjn0Ta/VF0VNrlmDzH61VIgI7XUuJQ6sajZky4pJ+acKSraelbJLlYq
 HGwfurAf3MSrGA1yROqXuvdKUaN4dDDIzJF4NkjIQxA/P8/pu6f1FlSpt
 eSPt9sHu5yxJF06U7mz9e3YrXbLr5jsgbyg2OoVhLoRToaV6I3+u+c7xU
 iR7ZSqxB6L/8mEVNgBC71LKp6pEmhCgix0AO/Srak3++f36Bvp3pa9Z18 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="372155576"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="372155576"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 06:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="609952624"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="609952624"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 06:33:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 0/9] ASoC: Intel: avs: PCM power management
Date: Wed, 26 Oct 2022 15:50:05 +0200
Message-Id: <20221026135014.1403705-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Goal of the series is implementation of suspend/resume operations for a
PCM stream along with all the collaterals connected to the subject.

Start with splitting avs_dai_fe_hw_free() as ideally we would like to
reuse as much of existing code as possible but snd_pcm_lib_free_pages()
is not desired part of the function when speaking of suspend operation.

The actual implementation of suspend/resume() for component drivers
follows. For most scenarios, the PM flow is similar to standard
streaming one, except for the part where the position register are being
saved and the lack of PCM pages freeing. To reduce code duplication, all
avs_dai_suspend_XXX() and avs_dai_resume_XXX() functions reuse their
non-PM equivalents.
Order of operations is affected by the fact that path binding/unbinding
happens only in FE part of the stream.

Above essentially unlocks SX+streaming scenarios i.e.: power transitions
with an ongoing stream.

As some streams are allowed to run in low power state, support is
provided for S0iX state. The handlers check ACPI capabilities and the
number of active low-power paths before deciding between SX and S0iX
flows.

The last portion of the patchset is addition of power/clock gating
overrides. There is no single set of registers that ensures AudioDSP
firmware loads 100% of time on every single configuration. By having
them exposed, user can have the loading procedure behavior adjusted for
their configuration without having to recompile the kernel.


Changes in v2:
- moved DRSM reg polling to separate function,
  snd_hdac_stream_wait_drsm() as suggested by Pierre
- moved the acpi_gbl_FADT under AVS_S0IX_SUPPORTED macro and relocated
  the checks from pcm.c to topology.c so that the low-power streams are
  filtered as early as possible
- fixed compilation when CONFIG_ACPI is disabled as reported by the test
  robot
- simplified all the avs_dai_resume/suspend_xxx() by moving
  ->ignore_suspend check one level up, to avs_component_pm_op()
  (patch 0002)


Amadeusz Sławiński (1):
  ASoC: Intel: avs: Handle SUSPEND and RESUME triggers

Cezary Rojewski (7):
  ASoC: Intel: avs: Split pcm pages freeing operation from hw_free()
  ASoC: Intel: avs: Introduce PCM power management routines
  ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
  ASoC: Intel: avs: Restart instead of resuming HDA capture streams
  ASoC: Intel: avs: Count low power streams
  ASoC: Intel: avs: Power and clock gating policy overriding
  ASoC: Intel: avs: Enact power gating policy

Piotr Maziarz (1):
  ASoC: Intel: avs: Standby power-state support

 include/sound/hdaudio.h        |   1 +
 include/sound/hdaudio_ext.h    |   5 +
 sound/hda/hdac_stream.c        |  21 ++
 sound/soc/intel/avs/avs.h      |   8 +
 sound/soc/intel/avs/core.c     |  97 +++++++--
 sound/soc/intel/avs/loader.c   |  10 +
 sound/soc/intel/avs/pcm.c      | 373 +++++++++++++++++++++++++++++----
 sound/soc/intel/avs/topology.c |  10 +
 8 files changed, 465 insertions(+), 60 deletions(-)

-- 
2.25.1

