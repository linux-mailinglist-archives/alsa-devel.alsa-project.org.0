Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C122B5AC7
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 09:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A231761;
	Tue, 17 Nov 2020 09:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A231761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605600757;
	bh=2E2G3OZCXo6fjrMD2Tc6z3o1sHaxMLoeNdcDKOoq+ks=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AIDuloididgZLYrsj+yl9FicyjaIRRbYop2SHdGMSpI+kyQTT6oYVikw8Fxf89bNk
	 jShA3oGfwhucEKQax2I5WZgG56q2SH8IlZjziDRMJdW9sgHvdgv+vqRrq/qvucTGw4
	 OhrR8twtpaYTqzcLXsuZGfG28yepmum6tQw0TLf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24349F80247;
	Tue, 17 Nov 2020 09:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DED89F8020B; Tue, 17 Nov 2020 09:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41714F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 09:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41714F800FE
IronPort-SDR: oKiiKJDxWIipUl1r39GMVHFrpDiidGEb8/8oIEbo1d187njvL3FKT3hyLg9sUzT+w00+7vr4iA
 zTnreRVNWQNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="255594640"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="255594640"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 00:10:18 -0800
IronPort-SDR: qBCVwOusURdFhtj2Dwvud+zSFyk7ydHRKYIMEaWMsXs9WrOcsY32Wy9D81iLTxa2SH+0nhOgRX
 ZyDNSAPdR18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="358799012"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2020 00:10:15 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/4] Enable DMA mode on Intel Keem Bay platform
Date: Tue, 17 Nov 2020 16:03:45 +0800
Message-Id: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, lars@metafoo.de, andriy.shevchenko@intel.com,
 tiwai@suse.com, jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org
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

v1: Initial patch version, to enable DMA mode on Intel Keembay platform
    by exposing some dmaengine api to work around DMA limitations at the
    client driver level.
    This patchset suggests an ALSA-only quirk, having other more generic 
    means to deal with this limitation would be fine - we just wanted to 
    have a discussion on preferred directions. The IPs used are not 
    Intel-specific so sooner or later someone else will have similar 
    limitations to work-around.

Michael Sit Wei Hong (4):
  dt-bindings: sound: intel, keembay-i2s: Add info for device to use DMA
  ASoC: soc-generic-dmaengine-pcm: Add custom prepare and submit
    function
  ASoC: dmaengine_pcm: expose functions to header file for custom
    functions
  ASoC: Intel: KMB: Enable DMA transfer mode

 .../bindings/sound/intel,keembay-i2s.yaml     |  14 ++
 include/sound/dmaengine_pcm.h                 |  21 ++
 sound/core/pcm_dmaengine.c                    |  46 ++--
 sound/soc/intel/Kconfig                       |   2 +
 sound/soc/intel/keembay/kmb_platform.c        | 202 ++++++++++++++++--
 sound/soc/intel/keembay/kmb_platform.h        |   9 +
 sound/soc/soc-generic-dmaengine-pcm.c         |   8 +-
 7 files changed, 267 insertions(+), 35 deletions(-)

-- 
2.17.1

