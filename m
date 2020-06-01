Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2854B1EA18B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 12:08:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859C616E9;
	Mon,  1 Jun 2020 12:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859C616E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591006098;
	bh=zqTeqDkNTvZE39rID0xR7Ql4EODWqGN5Tj2YuVJEbP8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dQfPZFFB4JZHhkzh2HfzuW6AlIa7WQ8cJmaXMMfeKsYDP/AEtcaJ+GXqXq9fBVQB8
	 o08V56FvLcx+sHASYZQnjuHwTFXk1niWHG7G9ZZ6QMD4HYb34k2lZDuVw7xPBIavE5
	 2squgsVbvZbbjKlU8eMJUt+HoiBI8s72IRu/hbbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81879F800B8;
	Mon,  1 Jun 2020 12:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 587ADF801ED; Mon,  1 Jun 2020 12:06:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 487F5F8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 12:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 487F5F8013D
IronPort-SDR: AvHT9dKKkpJlhHKqIOOvWVlM9FznZ8JTNuR26BrToi6tR+O+UKO399C/YQdAP1aSC3TT5Wa66l
 4hZw1xQAr3xw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 03:06:25 -0700
IronPort-SDR: 2U9CnrfaBAjOCVyEr6se4qdfantf/P39nsaYBjwdJNE0uaUsf4m6I20v2O7XU1JwIkvLoHbdcX
 sEvXAeTuMTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="415758404"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga004.jf.intel.com with ESMTP; 01 Jun 2020 03:06:24 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v3 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Date: Mon,  1 Jun 2020 17:53:18 +0800
Message-Id: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
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

The below series of patches support the KeemBay ASoC platform driver.
The platform driver initialize the i2s to capture and playback the
pcm data on the ARM. The i2s is running in polling mode.

There is no DSP in the KeemBay SoC. Users are rely on the Gstreamer plugin
to perform Audio preprocessing.

Audio graph card is used to connect the platform driver with the
tlv320aic3204 codec.

Change History:
v3:
- Adjusted header format.
- Use Audio graph card instead of custom sound card.
- Use if-else instead of conditional operator.
- Enabled .set_fmt to configure master clock.

v2:
- Corrected I2S naming for DT binding.

v1:
- Initial version.

Sia Jee Heng (3):
  ASoC: Intel: Add KeemBay platform driver
  ASoC: Intel: Add makefiles and kconfig changes for KeemBay
  dt-bindings: sound: Add documentation for KeemBay i2s

 .../bindings/sound/intel,keembay-i2s.yaml          |  68 +++
 sound/soc/intel/Kconfig                            |   7 +
 sound/soc/intel/Makefile                           |   1 +
 sound/soc/intel/keembay/Makefile                   |   4 +
 sound/soc/intel/keembay/kmb_platform.c             | 667 +++++++++++++++++++++
 sound/soc/intel/keembay/kmb_platform.h             | 145 +++++
 6 files changed, 892 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
 create mode 100644 sound/soc/intel/keembay/Makefile
 create mode 100644 sound/soc/intel/keembay/kmb_platform.c
 create mode 100644 sound/soc/intel/keembay/kmb_platform.h

-- 
1.9.1

