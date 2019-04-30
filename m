Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E210288
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 00:39:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064C1167C;
	Wed,  1 May 2019 00:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064C1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556663997;
	bh=5fmpgTSEOXo+LBvPiKj1l4KdQWNvRLfTE7uLmH/+8NU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s40f4Bcp0L8KU/P5PnUBuI83Nyr+O0fS0o6/8TIupYaz8x1Lg231m4cXDCvnEMIGL
	 VxRagT4GlZTkBuTrlD3ew9M+6xR+ipKWfDBtlDiiGXZ42b1FjSM4hmxTDEpP8raHqZ
	 taor3zH7BoaXIb4iyY5od9TiIrlBqYCdtoeMBhio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A22CF8962C;
	Wed,  1 May 2019 00:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63D05F896E3; Wed,  1 May 2019 00:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3056EF80759
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 00:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3056EF80759
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 15:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="147124103"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by orsmga003.jf.intel.com with ESMTP; 30 Apr 2019 15:37:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 17:37:41 -0500
Message-Id: <20190430223744.3863-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/3] ASoC: Intel: machine drivers for SOF
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for the two main machine drivers used by SOF (not tested
with the Skylake driver due to lack of hardware and/or firmware
signature/ missing topology)

The DMIC support for HDaudio-based devices is very much needed for a
number of WhiskyLake+ platforms designed for Windows. SOF will be the
only Intel driver supporting this configuration. A firmware binary
signed with the required production key should be available shortly.

The rt5682 codec is the main validation vehicle of the Intel SOF team,
with eval boards connected to the Baytrail MinnowBoard as well as more
recent devices. The main difference with traditional Intel machine
drivers is that the dai links are added dynamically at probe time to
avoid multiple table copy/pastes.

Bard liao (1):
  ASoC: Intel: add sof-rt5682 machine driver

Rander Wang (2):
  ASoC: Intel: skl_hda_dsp_generic: add DMIC support
  ASoC: Intel: skl_hda_dsp_generic:refine code style

 sound/soc/intel/boards/Kconfig                |  16 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  22 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h   |   2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  19 +-
 sound/soc/intel/boards/sof_rt5682.c           | 563 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-byt-match.c   |   6 +
 .../intel/common/soc-acpi-intel-cht-match.c   |   6 +
 .../intel/common/soc-acpi-intel-cnl-match.c   |  19 +
 .../intel/common/soc-acpi-intel-icl-match.c   |   6 +
 10 files changed, 656 insertions(+), 5 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_rt5682.c

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
