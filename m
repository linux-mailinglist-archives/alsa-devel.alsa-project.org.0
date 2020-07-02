Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D5212AA7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5E016DD;
	Thu,  2 Jul 2020 19:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5E016DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593709263;
	bh=qAyFVCi6YJgvZW1L2NuDPOJloDn78d07I2oW4BBKVYY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FrwMZM5OfJ03cxOY80//WgOSCnY2AUoFoU1BDDn9ktHzTVM/W2epEoA3nVwXocFgB
	 jxbiILX0U/IrUso91TrA/tFSiG6qrQHkSewpJ0QNxUZ7/6ilJW11Emnzaqs1IpSUNy
	 ZoGvr65YZ3PRnXcA+FLThkvJ//0djA2lRcEUwe0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBAD0F80253;
	Thu,  2 Jul 2020 18:59:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3CA3F80247; Thu,  2 Jul 2020 18:59:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FF8FF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF8FF800ED
IronPort-SDR: kxJXQ79jCjo/wMKI5H+o6T3MMsVhHrKCZG97aiVVMQdv7bbCR08LnfsxBdG8XzcvjTAyZg+1Sw
 c4JqIM4n0GfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126583241"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126583241"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:13 -0700
IronPort-SDR: S32QVmkkQVa3s0Gg3942axTvfmltOO+tytzTmc+7l3ZyPEvhOZHKGDYew802g4DRo9IhLHcD16
 hV+W6oLfGCZg==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426014834"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ASoC: fix W=1 warnings for various SOCs
Date: Thu,  2 Jul 2020 11:58:53 -0500
Message-Id: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
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

One more series of trivial fixes for atmel, samsung, qualcomm, sunxi,
tegra, uniphier.

Pierre-Louis Bossart (8):
  ASoC: atmel: fix kernel-doc
  ASoC: samsung: spdif: fix kernel-doc
  ASoC: samsung: pcm: fix kernel-doc
  ASoC: qcom: q6asm: fix kernel-doc
  ASoC: sunxi: sun4i-i2s: fix kernel-doc
  ASoC: sunxi: sun4i-spdif: fix kernel-doc
  ASoC: tegra: tegra20_das: remove always-true comparison
  ASoC: uniphier: aio-core: fix kernel-doc

 sound/soc/atmel/atmel-pcm-dma.c |  2 +-
 sound/soc/atmel/atmel_ssc_dai.c |  1 +
 sound/soc/qcom/qdsp6/q6asm.c    |  2 +-
 sound/soc/samsung/pcm.c         |  5 +++++
 sound/soc/samsung/spdif.c       |  6 +++---
 sound/soc/sunxi/sun4i-i2s.c     | 10 +++++++++-
 sound/soc/sunxi/sun4i-spdif.c   |  2 +-
 sound/soc/tegra/tegra20_das.c   |  3 +--
 sound/soc/uniphier/aio-core.c   |  7 +++----
 9 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.25.1

