Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5781839D3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7D61749;
	Thu, 12 Mar 2020 20:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7D61749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584042682;
	bh=7xCaE0TsCDDzSOkdytoRJMkdblSMpAdSQW6nRwXw2uE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g0TzRJmyk6ml9mrRQgVjDvx5+rxpZhV6DMqJk2fcGBi/Z8deu3l9Yrl5VlP9zfZth
	 VJMV5ZNqwS0uXR8kzCp2Z/8ZQUFAGU4WNkqtDNn0Mvl6F/6v3C1SdCq68YdD6+uPcg
	 GRVbPhINCtEkiM8Zr4Ry7IGQTKypleZ1sl8tX69w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D01DF8013E;
	Thu, 12 Mar 2020 20:49:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 463B1F8013E; Thu, 12 Mar 2020 20:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17672F8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17672F8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="416058370"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga005.jf.intel.com with ESMTP; 12 Mar 2020 12:49:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/10] ASoC: Intel: machine driver updates for 5.7
Date: Thu, 12 Mar 2020 14:48:49 -0500
Message-Id: <20200312194859.4051-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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

Fix HDaudio/HDMI Kconfig dependencies, cleanup code, and add support
for 2 new configs (DA7219+Maxim 98360A and RT5692+RT1015)

Note that the last patch is the first case where we added the
Reviewed-by tags automagically from the list of GitHub
approvers. Feedback/comments welcome on the format, and thanks to
Ranjani for the nice script!

Changes since v1:
Change base to broonie/for-5.7
Rebase and fix for_each_codec_dais() macro in Patch 9.
Add new patch to remove GFP_ATOMIC

Guennadi Liakhovetski (3):
  ASoC: codecs: hdac_hdmi: (cosmetic) remove redundant variable
    initialisations
  ASoC: Intel: skylake: (cosmetic) remove redundant variable
    initialisations
  ASoC: Intel: (cosmetic) simplify structure member access

Kai Vehmanen (4):
  ASoC: Intel: boards: drop reverse deps for SND_HDA_CODEC_HDMI
  ASoC: Intel: sof_pcm512x: drop reverse deps for SND_HDA_CODEC_HDMI
  ASoC: Intel: sof_pcm512x: make HDMI optional for all platforms
  ASoC: SOF: Intel: hda: remove SND_SOC_SOF_HDA_COMMON_HDMI_CODEC

Pierre-Louis Bossart (1):
  ASoC: Intel: don't use GFP_ATOMIC for machine driver contexts

Yong Zhi (2):
  ASoC: Intel: sof_da7219_max98373: Add support for max98360a speaker
    amp
  ASoC: Intel: sof_rt5682: Add rt1015 speaker amp support

 sound/soc/codecs/hdac_hdmi.c                  |   6 +-
 sound/soc/intel/boards/Kconfig                |  20 ++--
 sound/soc/intel/boards/bdw-rt5650.c           |   2 +-
 sound/soc/intel/boards/bdw-rt5677.c           |   2 +-
 sound/soc/intel/boards/broadwell.c            |   2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |   2 +-
 sound/soc/intel/boards/bxt_rt298.c            |   2 +-
 sound/soc/intel/boards/bytcht_da7213.c        |   2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |   2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   2 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |   4 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c |   2 +-
 sound/soc/intel/boards/haswell.c              |   2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |   2 +-
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |   2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |   2 +-
 .../soc/intel/boards/skl_nau88l25_max98357a.c |   2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |   2 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |  78 +++++++++++--
 sound/soc/intel/boards/sof_pcm512x.c          |  38 ++++--
 sound/soc/intel/boards/sof_rt5682.c           | 110 +++++++++++++++++-
 .../intel/common/soc-acpi-intel-jsl-match.c   |  34 +++++-
 sound/soc/intel/skylake/skl.c                 |   4 +-
 sound/soc/sof/intel/Kconfig                   |  11 --
 sound/soc/sof/intel/hda.c                     |   3 +-
 26 files changed, 269 insertions(+), 71 deletions(-)


base-commit: 101247a3b86e1cc0e382b7e887a56176290fc957
-- 
2.20.1

