Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5791CD06C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 05:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED58786F;
	Mon, 11 May 2020 05:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED58786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589167903;
	bh=hAp7F7YsndkWgDYByTkdl5Cy1J5VGpyGs/7oE8KqIjI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XVBYD0UEz1gVfHIMpk9ucnvqjDXKP0waurjNKB/R7i5bZd7sp2rWvFL/6x52YXxfH
	 f4XJkLvW7ysAq3zqlgXHWh5m7xV/yrjTYeTiysB+GLSmsDYX5xBM/JNA10+c1bBxwk
	 ooCx5PwfvNGSlOpZqH9HtWYiq1ShBJsy763571yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36E7EF80299;
	Mon, 11 May 2020 05:29:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F12A8F80254; Mon, 11 May 2020 05:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98159F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 05:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98159F80107
IronPort-SDR: uQQbhfgq7Cki1msOHwdvdoKoTDYz0F3LVzYllHu8LFkcqhheaKocXNDX7QD2vm7S9Mx4BbD1zs
 1M90SFQEt+HQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2020 20:28:46 -0700
IronPort-SDR: mfkB/rwuap2/BU6fcfKUuhZsQyfAKeMANglKVOlJOQlmoxsCOey8LkKbBJhumBrHNnViVYpaJM
 z6jedoXLKggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,378,1583222400"; d="scan'208";a="265024222"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2020 20:28:45 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 0/4] ASoC: Intel: Add KeemBay ASoC driver
Date: Mon, 11 May 2020 11:16:00 +0800
Message-Id: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: liam.r.girdwood@linux.intel.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

The below series of patches support the KeemBay ASoC driver.
It enabled the tlv320aic3204 machine driver and the platform driver initialize
the i2s to capture and playback the pcm data on the ARM. The i2s is running
in polling mode.

There is no DSP in the KeemBay SoC. Users are rely on the Gstreamer plugin
to perform some Audio preprocessing.

Sia Jee Heng (4):
  ASoC: Intel: Add KeemBay platform driver
  ASoC: Intel: Boards: Add KeemBay machine driver
  ASoC: Intel: Add makefiles and kconfig changes for KeemBay
  dt-bindings: sound: Add documentation for KeemBay sound card and i2s

 .../bindings/sound/intel,keembay-i2s.yaml          |  57 ++
 .../bindings/sound/intel,keembay-sound-card.yaml   |  30 +
 sound/soc/intel/Kconfig                            |   7 +
 sound/soc/intel/Makefile                           |   1 +
 sound/soc/intel/boards/Kconfig                     |  15 +
 sound/soc/intel/boards/Makefile                    |   4 +
 sound/soc/intel/boards/kmb_tlv3204.c               | 144 ++++
 sound/soc/intel/keembay/Makefile                   |   4 +
 sound/soc/intel/keembay/kmb_platform.c             | 746 +++++++++++++++++++++
 sound/soc/intel/keembay/kmb_platform.h             | 145 ++++
 10 files changed, 1153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-sound-card.yaml
 create mode 100644 sound/soc/intel/boards/kmb_tlv3204.c
 create mode 100644 sound/soc/intel/keembay/Makefile
 create mode 100644 sound/soc/intel/keembay/kmb_platform.c
 create mode 100644 sound/soc/intel/keembay/kmb_platform.h

-- 
1.9.1

