Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084B54ECC2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92FC61AFF;
	Thu, 16 Jun 2022 23:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92FC61AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655415846;
	bh=MSJeYZ1k0Hj2i4KZdgXPUK/3009SdQm8fZ8Myx49hs8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kxUt5rtgN4tyoSSAvRRZrtBtn6krIQmhqIAVIB3WZ9EZUeruk/N+1cV6cNTgMzzVq
	 Y5WpXOD01yv3QTRNHaJgX2d0tF3YZjLAPc9blCSb5s46g2Hgt3ob8ESYtVlTsJnsMh
	 aO61TNYF1UyFgieTUTWPJI0V2qg+LBVPy+1isXyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5945AF80557;
	Thu, 16 Jun 2022 23:41:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4629F8053D; Thu, 16 Jun 2022 23:41:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC07F801D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC07F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eMaXTYo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655415672; x=1686951672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MSJeYZ1k0Hj2i4KZdgXPUK/3009SdQm8fZ8Myx49hs8=;
 b=eMaXTYo6Dua7se14IugxKopaeDg6Z0+ie1Twe0692GyQbFEB5i9J34k6
 sbzqPZrOtbe8aa8/a7IW7e3pjwnl7t0O4kUvsrEQfdZfaFb3euK9W5Oya
 joTTuRvvZQX74oUsVLXL8OBjei8gJemZHWZ1/G0I/f+3xnExEHGg3nAHS
 CcH3Nyut3q7ZbvVSb2N8/E8s/j0rm3rDuKpWAfofJthPDvdQBjyTrFR82
 oddlvgQlF4P59xP96iX9larACK8ZZ23prYD5qraqUP9ItvBoYcbEooz/O
 CSoVFTEN3M0QklW8KBAY7+BXOwNht7AGIqAXmq1rV8WeutQvdiasz+2xr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276932400"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276932400"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="831746708"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:41:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ASoC: Intel: Chromebooks: remap jack pins
Date: Thu, 16 Jun 2022 16:40:42 -0500
Message-Id: <20220616214055.134943-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

This patchset adds the missing jack pin remapping needed by upstream
UCM on Chromebooks, suggested by Jaroslav Kysela [1].

These patches were succesfully tested on GeminiLake and JasperLake
platforms, and generalized to other Chromebooks.

[1] https://mailman.alsa-project.org/pipermail/sound-open-firmware/2022-June/004468.html

Pierre-Louis Bossart (13):
  ASoC: Intel: skl_nau88l25_max98357a: remap jack pins
  ASoC: Intel: skl_nau88l25_ssm4567: remap jack pins
  ASoC: Intel: kbl_rt5663_max98927: remap jack pins
  ASoC: Intel: kbl_da7219_max98357a: remap jack pins
  ASoC: Intel: kbl_da7219_max98927: remap jack pins
  ASoC: Intel: kbl_rt5663_rt5514_max98927: remap jack pins
  ASoC: Intel: bxt_da7219_max98357a: remap jack pins
  ASoC: Intel: glk_rt5682_max98357a: remap jack pins
  ASoC: Intel: cml_rt1011_rt5682: remap jack pins
  ASoC: Intel: sof_cs42l42: remap jack pins
  ASoC: Intel: sof_da7219_max98373: remap jack pins
  ASoC: Intel: sof_nau8825: remap jack pins
  ASoC: Intel: sof_rt5682: remap jack pins

 sound/soc/intel/boards/bxt_da7219_max98357a.c | 21 +++++++++++++----
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 23 +++++++++++++++----
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 21 +++++++++++++----
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 21 +++++++++++++----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 21 +++++++++++++----
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 21 +++++++++++++----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 21 +++++++++++++----
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 19 ++++++++++++---
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 19 ++++++++++++---
 sound/soc/intel/boards/sof_cs42l42.c          | 23 +++++++++++++++----
 sound/soc/intel/boards/sof_da7219_max98373.c  | 23 +++++++++++++++----
 sound/soc/intel/boards/sof_nau8825.c          | 23 +++++++++++++++----
 sound/soc/intel/boards/sof_rt5682.c           | 23 +++++++++++++++----
 13 files changed, 224 insertions(+), 55 deletions(-)

-- 
2.34.1

