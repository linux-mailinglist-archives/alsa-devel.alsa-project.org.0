Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF758604EFC
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD12A201;
	Wed, 19 Oct 2022 19:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD12A201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201136;
	bh=qK46j88EtRErtmmVe99pgWcCGGYoaYHwEJmixolT9pE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BxzAXKyQ1OP8JpkFprT/bxN19OGbU4Qt72sKAGOf6DrhHiCZFJcurGBRPLMI/cJWy
	 ahE54BlEBtuZXwF5/r8FCP5hk2zcNPh3SdPilJRJwO9B5Fx89sQEx2MnvtqV/gbpuH
	 Au8zXxEKLsI/x2XRlyuhLd1qx/1jPPxNPZ58R5Ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE503F80087;
	Wed, 19 Oct 2022 19:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05A03F80166; Wed, 19 Oct 2022 19:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A0C6F80166
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A0C6F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iaCutFQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201053; x=1697737053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qK46j88EtRErtmmVe99pgWcCGGYoaYHwEJmixolT9pE=;
 b=iaCutFQ1w+RxTBFIpNIBuLJliv1FPcRT3/78uPTNUYOPEpx32L9Kmun9
 RKAC/F9rLZBSHA5fPFPGLK7olCCLX/EvWvx5K7HMRwC6Clv5/hbthO0sM
 t4CdLqXs8BwTO3E/6CG4Dbhv61i0TttViddgwwXT6ZCQkgblpVXOU3wdT
 aM2YhtC/957aYNIk/oqkrH3TojBFdQwhsjfdAvDhoK94Rz2tXcr3zMKFK
 BF+v9HHe1/ZuAo3CoLQcilbgeyJZVdpEMeyohO0JhQqY8gWrot2Av1uPT
 5GZ4IVIIxhIMt77fXII8WRr38GnM4zzl69cMMF/OiUd3nTXPtIK95U1P9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045641"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045641"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898506"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898506"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/8] ASoC: Intel: avs: PCM power management
Date: Wed, 19 Oct 2022 19:53:09 +0200
Message-Id: <20221019175317.1540919-1-cezary.rojewski@intel.com>
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

Amadeusz Sławiński (1):
  ASoC: Intel: avs: Handle SUSPEND and RESUME triggers

Cezary Rojewski (6):
  ASoC: Intel: avs: Split pcm pages freeing operation from hw_free()
  ASoC: Intel: avs: Introduce PCM power management routines
  ASoC: Intel: avs: Restart instead of resuming HDA capture streams
  ASoC: Intel: avs: Count low power streams
  ASoC: Intel: avs: Power and clock gating policy overriding
  ASoC: Intel: avs: Enact power gating policy

Piotr Maziarz (1):
  ASoC: Intel: avs: Standby power-state support

 include/sound/hdaudio_ext.h  |   5 +
 sound/soc/intel/avs/avs.h    |   1 +
 sound/soc/intel/avs/core.c   |  97 +++++++--
 sound/soc/intel/avs/loader.c |  10 +
 sound/soc/intel/avs/pcm.c    | 387 +++++++++++++++++++++++++++++++----
 5 files changed, 440 insertions(+), 60 deletions(-)

-- 
2.25.1

