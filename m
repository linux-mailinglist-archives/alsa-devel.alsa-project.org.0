Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5739C2179CF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1141685;
	Tue,  7 Jul 2020 22:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1141685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155583;
	bh=A1hr6BPyyEig0lirfHmmRfglflHwXfCMfCwaeniKt4s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dc/0Ay2oMax09kW6ORVY2hbVMw+wagt5lGLrv/D0rmH9bpPnscupt4DceN4TZsGhR
	 9lVK5cSS0yHkmEXJEM59n//01fYBSxXD0BlIG2HjtPMcexjk579dtyTR74Bl2kXvVU
	 /D8N0DmTjkPoe/hMvoA0xceCmsdVUVB7Sa9GST9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F1BF80274;
	Tue,  7 Jul 2020 22:58:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69171F800DF; Tue,  7 Jul 2020 22:58:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0002F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0002F800DF
IronPort-SDR: vFeUpOjZzuMPPZpcO3dxhjLcbM+zK03LyseX9pnNyhpgSmEUDG3asKlRTXOCS9pAdlXTVh/J1C
 62/4ln20sS/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762909"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762909"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:51 -0700
IronPort-SDR: GKFApGQ5OBB5nNRkJpE6CZVlVAt9uFrfkbkLwMwxbjOOY/NR6Zdf8Ru+SxG5hj/kC50oxrkOpd
 LO4hzsCejYrQ==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796636"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/6] ASoC: codecs: add MAX98373 Soundwire driver
Date: Tue,  7 Jul 2020 15:57:34 -0500
Message-Id: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

V2 with a number of cleanups:
split between I2C and SoundWire modes, as done for rt5682, and updated
Kconfigs.
removed useless initializations common to both modes
removed idle_bias on
fixed register classified as volatile in error
fixed SPDX comments

Pierre-Louis Bossart (2):
  ASoC: codecs: max98373: split I2C and common parts
  ASoC: Intel: sof-sdw: add MAX98373 I2C dependencies

Ryan Lee (2):
  ASoC: codecs: max98373: Removed superfluous volume control from chip
    default
  ASoC: codecs: max98373: add SoundWire support

randerwang (2):
  ASoc: codecs: max98373: remove Idle_bias_on to let codec suspend
  ASoC: Intel: sdw_max98373: add card_late_probe support

 sound/soc/codecs/Kconfig                  |  20 +-
 sound/soc/codecs/Makefile                 |   4 +
 sound/soc/codecs/max98373-i2c.c           | 612 +++++++++++++++
 sound/soc/codecs/max98373-sdw.c           | 887 ++++++++++++++++++++++
 sound/soc/codecs/max98373-sdw.h           |  72 ++
 sound/soc/codecs/max98373.c               | 619 +--------------
 sound/soc/codecs/max98373.h               |  17 +-
 sound/soc/intel/boards/Kconfig            |   7 +-
 sound/soc/intel/boards/sof_sdw.c          |  19 +-
 sound/soc/intel/boards/sof_sdw_common.h   |   6 +
 sound/soc/intel/boards/sof_sdw_max98373.c |  12 +
 11 files changed, 1668 insertions(+), 607 deletions(-)
 create mode 100644 sound/soc/codecs/max98373-i2c.c
 create mode 100644 sound/soc/codecs/max98373-sdw.c
 create mode 100644 sound/soc/codecs/max98373-sdw.h


base-commit: a5911ac5790acaf98c929b826b3f7b4a438f9759
-- 
2.25.1

