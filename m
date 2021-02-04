Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46630E9CE
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 03:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4CA16F9;
	Thu,  4 Feb 2021 03:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4CA16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612404141;
	bh=jozClzbjCi+Yzkkgd0d3AjX8B+W/LiHiUb+bKstIyIM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dRQXwkzcpa5p17nzUd5r2hm2aEqa+BT5KQyMpydm0+XsG3Kr7+7lCrxt8/87ORhqF
	 HDfzXuxhDL9o6fxm0Sig5wQMDqb36R/vQROoNnQ94Jj1Ly1M0yYwoyPrMoQMbHn4xH
	 xB4ciKm6+KFKztLnpogZlVoQQsBOM9aHyKPfiSPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 297CDF8021D;
	Thu,  4 Feb 2021 03:00:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 464ECF8021D; Thu,  4 Feb 2021 03:00:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F79FF80156
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 03:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F79FF80156
IronPort-SDR: FTJ1G9+/AtWpmfYCpFuylQqVJ3NBSwGLYLdEbWURVV4181jPTNSM3Umfl1eTRfpF698QteTGe4
 /E+Il8wsVSeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="245227969"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="245227969"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:00:34 -0800
IronPort-SDR: GRKlz1GG6vTzRvRhSGpoXEyLt64PDey8ryAbPEy0MpNT516rWSu9i2jOTFP3ZR4bhYIGliH4mn
 VQkablqFjeUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="433711997"
Received: from jsia-hp-z620-workstation.png.intel.com ([10.221.118.135])
 by orsmga001.jf.intel.com with ESMTP; 03 Feb 2021 18:00:32 -0800
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 0/4] Add HDMI support for Intel KeemBay I2S
Date: Thu,  4 Feb 2021 09:42:54 +0800
Message-Id: <20210204014258.10197-1-jee.heng.sia@intel.com>
X-Mailer: git-send-email 2.18.0
Cc: broonie@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com,
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

The below patch series are to support Audio over HDMI.
The modification in this patch series shall allow I2S driver
to playback standard PCM format and IEC958 encoded format to
the ADV7511 HDMI chip.

ALSA IEC958 plugin will be used to compose the IEC958 format.

Existing hdmi-codec driver only support standard pcm format.
Support of IEC958 encoded format passdown from ALSA IEC958 plugin
is needed so that the IEC958 encoded data can be streamed to the
HDMI chip.

Sia Jee Heng (4):
  ASoC: codec: hdmi-codec: Support IEC958 encoded PCM format
  drm: bridge: adv7511: Support I2S IEC958 encoded PCM format
  dt-bindings: sound: Intel, Keembay-i2s: Add hdmi-i2s compatible string
  ASoC: Intel: KMB: Support IEC958 encoded PCM format

 .../bindings/sound/intel,keembay-i2s.yaml     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511.h      |  1 +
 .../gpu/drm/bridge/adv7511/adv7511_audio.c    |  6 ++
 include/sound/hdmi-codec.h                    |  5 ++
 sound/soc/codecs/hdmi-codec.c                 |  4 +-
 sound/soc/intel/keembay/kmb_platform.c        | 73 ++++++++++++++++++-
 sound/soc/intel/keembay/kmb_platform.h        |  1 +
 7 files changed, 89 insertions(+), 2 deletions(-)


base-commit: 2557c711b87cd42bb22be9ca6ff3fce038624f30
-- 
2.18.0

