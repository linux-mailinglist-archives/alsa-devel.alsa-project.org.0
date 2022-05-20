Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF352F4E5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 292EA1725;
	Fri, 20 May 2022 23:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 292EA1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081520;
	bh=OyzaCZBD9ZALRpT9MLyMAQuhOFvPwUiQYnS1u98ntZU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h3B5uM/Mwgxel39RblX5u0MSs5Riqh+ueLSE0ZWN2Ih9bNfLGRJJIDXW57TPQQ8Y2
	 70GaAPbYLJYc64d7YbTet6gAarRESRLq1VFSMaPz3zvkXxq2BstiFdN7jnNcRoFfpL
	 j8UYACT+ivE4yMv6muBe4A65kVezES2Cdz08bP6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C31DF8051B;
	Fri, 20 May 2022 23:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92AC8F804BD; Fri, 20 May 2022 23:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E972DF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E972DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GylOqrzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081457; x=1684617457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OyzaCZBD9ZALRpT9MLyMAQuhOFvPwUiQYnS1u98ntZU=;
 b=GylOqrzvjLaaEbhVXHbB3dz7lxmx8nVPw8a4kQhWeFm9QDFoE4Fh9ZkP
 HCWjK6lcdkwIexz3iAynfzSdiJHRWw90Rsy5uRID/WU6UPZZt4vUL6XJ9
 muPL7sgkEiEZBsjJwtin4LrAGQEaVSH5rZwGXDMXAiJpBlYkQQkfBcRvI
 BGYls1z0BcsVSU0G9AC5O4XMQqiuplSHo8BA2M23yNuqhUJaQPffuMIYa
 ooDGh9br3GrL703gNmSQOiAYVH4IncxtjFrU1CnNpV6oghXq1aMj3Tzko
 6hGjqSYRqiNJvup/jE8gbpLTrnAjoMt8o7hh36OMJaxdsUb17y3Eattkc A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324214"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324214"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796005"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/16] ASoC: trivial changes for cppcheck warnings
Date: Fri, 20 May 2022 16:17:03 -0500
Message-Id: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This can probably wait for the next merge window, I found a number of
cppcheck warnings that I didn't see in my last checks. The irony is
that the only really important issue found by cppcheck was on one of
my previous DPCM changes (submitted separately as a fix).

Pierre-Louis Bossart (16):
  ASoC: cs35l45: typo in argument definition
  ASoC: cs42l42: remove redundant test
  ASoC: wcd-mbhc-v2: remove useless initialization
  ASoC: wcd9335: remove redundant tests
  ASoC: Intel: atom: sst: remove useless initialization
  ASoC: Intel: atom: sst_ipc: remove redundant test
  ASoC: Intel: atom: sst_ipc: remove useless initializations
  ASoC: Intel: atom: controls: remove useless initializations
  ASoC: Intel: boards: reset acpi_chan_package
  ASoC: Intel: sof_pcm512x: remove unnecessary init
  ASoC: mediatek: mt8195: simplify error handling
  ASoC: qcom: q6dsp: q6adm: remove useless initializations
  ASoC: qcom: q6dsp: remove spurious space
  ASoC: rockchip: simplify error handling
  ASoC: samsung: snow: simplify error handling
  ASoC: meson: remove useless initialization

 sound/soc/codecs/cs35l45.h                 | 2 +-
 sound/soc/codecs/cs42l42.c                 | 3 +--
 sound/soc/codecs/wcd-mbhc-v2.c             | 2 +-
 sound/soc/codecs/wcd9335.c                 | 4 ++--
 sound/soc/intel/atom/sst-atom-controls.c   | 4 ++--
 sound/soc/intel/atom/sst/sst.c             | 2 +-
 sound/soc/intel/atom/sst/sst_ipc.c         | 8 ++++----
 sound/soc/intel/boards/bytcr_rt5640.c      | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c      | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c    | 2 +-
 sound/soc/intel/boards/sof_pcm512x.c       | 2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 8 ++++----
 sound/soc/meson/meson-codec-glue.c         | 2 +-
 sound/soc/qcom/qdsp6/q6adm.c               | 6 +++---
 sound/soc/rockchip/rk3288_hdmi_analog.c    | 4 ++--
 sound/soc/samsung/snow.c                   | 2 +-
 16 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.30.2

