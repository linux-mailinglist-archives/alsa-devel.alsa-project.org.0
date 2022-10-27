Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30160F74A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 14:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCC5E2C38;
	Thu, 27 Oct 2022 14:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCC5E2C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666873881;
	bh=6DI1POJhiqU6U4Pzcge3kqPT/f+3U6YacVd6stkwqAo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oBbziy9oMHqkHRiGuWKzA3nWt/bNMyELdgZvhw07PO45ADXKd0Hp3iI7QgvWBeOWL
	 EA+OR+qPFUbgBR41w7RQsDGSpVdKRue8esdixIs1klhytWiRAKg1A6hR4w5Aa+3WVl
	 fDr9PZ9wmO1kiEZSTBlj6sEZPj5anLJf/MsxyxNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C1F5F804F3;
	Thu, 27 Oct 2022 14:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92734F80095; Thu, 27 Oct 2022 14:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E03F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 14:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E03F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lvzLB23T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666873822; x=1698409822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6DI1POJhiqU6U4Pzcge3kqPT/f+3U6YacVd6stkwqAo=;
 b=lvzLB23TsZ/aBWnihoa+GE8oXy1sbv+KTusL1HNKsP7Bdu/SKDRcaQyy
 5RDeZ+8kvR7xy7FxxaDKbujrXAp1sk9yeboGl3geQqAdSmc/hfJT4+REB
 AhE8dTH6OGglqIEKhitsENZG3SdrxGUIo+YG8d5IeYPSkm9mtzvH8VulL
 vrVspcK+UWREUG0o/VyQ5L7WEPwAdtV24Kg4Efi/qv/MjlTCI7yerakV3
 11E6O2ol9h2Fc75eURNouqdITiXU4HiMnMPR3eM042xk8g1wQPNzP852O
 /yGZjkSiVo2O0x7SMjO+vz6znhcEPzFtxrZUBAUrTl6XyvPK6Yc5hX4Vj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334839870"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="334839870"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 05:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807435619"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="807435619"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2022 05:30:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 0/9] ASoC: Intel: avs: PCM power management
Date: Thu, 27 Oct 2022 14:46:53 +0200
Message-Id: <20221027124702.1761002-1-cezary.rojewski@intel.com>
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


Changes in v4:
- replaced readb_poll_timeout() with read_poll_timeout() for the DRSM
  polling function as the register is u32 wide, not u8

Changes in v3:
- fixed unused-but-set-variable warnings reported by the test robot

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
 sound/hda/hdac_stream.c        |  22 ++
 sound/soc/intel/avs/avs.h      |   8 +
 sound/soc/intel/avs/core.c     |  97 +++++++--
 sound/soc/intel/avs/loader.c   |  10 +
 sound/soc/intel/avs/pcm.c      | 368 +++++++++++++++++++++++++++++----
 sound/soc/intel/avs/topology.c |  10 +
 8 files changed, 461 insertions(+), 60 deletions(-)

-- 
2.25.1

