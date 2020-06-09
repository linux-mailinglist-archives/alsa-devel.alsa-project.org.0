Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B31F3405
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 08:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E51F1678;
	Tue,  9 Jun 2020 08:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E51F1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591683689;
	bh=q/wgEYdgX4dJlXTwnZjlMobNZ2d8oNdAXoGmQMykRvI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JyZ2i/ucB8nio6wGs6ZQICT0T56/St7kj0LwuZfjvP6Kg24GRcnZhFY0LxVIkG5Qa
	 o1SgWvd+ElAZpZBnqLgPBWJJUuLbhWCNDPavDqz/2mIgFWcmMaE3X6eVNYnCRHTm4/
	 tkep4MXgADM30C9BP3Vo+5wFa93No5ep1oS6PNTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE81F80292;
	Tue,  9 Jun 2020 08:19:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19758F8028D; Tue,  9 Jun 2020 08:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECC2FF80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 08:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC2FF80124
IronPort-SDR: F0pDEhRovqCJ2ajmQnYdDV/1p8/PdG5mikTZZGTLbvhjxT/pbykaoydoLx4IiS/teOLuOn+poS
 jG8EFIlygLlQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 23:19:38 -0700
IronPort-SDR: A+9FyTcCsH5YWsyMAZE5e8wO6t7bl4UsLRVjhdVBveMY4b0Bi6D7kbnf07OmK2sAl63rGsIGev
 gDzP0uNvFSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; d="scan'208";a="288728659"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 23:19:35 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v5 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Date: Tue,  9 Jun 2020 14:06:20 +0800
Message-Id: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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
v5:
- Remove OF dependency from Kconfig as OF is shifted to audio graph card. 

v4:
- Reduce if-otology at the tx/rx function.
- Fix indentation.
- specify .rate directly

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
 sound/soc/intel/keembay/kmb_platform.c             | 654 +++++++++++++++++++++
 sound/soc/intel/keembay/kmb_platform.h             | 145 +++++
 6 files changed, 879 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
 create mode 100644 sound/soc/intel/keembay/Makefile
 create mode 100644 sound/soc/intel/keembay/kmb_platform.c
 create mode 100644 sound/soc/intel/keembay/kmb_platform.h

-- 
1.9.1

