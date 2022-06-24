Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBD55948F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 10:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169071887;
	Fri, 24 Jun 2022 10:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169071887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656057896;
	bh=0hT/ssdR7iFYpnxu1iuIJWWRJQTQkWcXgBa84EnUVKg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z9FSf/kC9UKHydMUY7FMPEN4Zz1B2dKijEIh9ucTjyC2viTzDDdGmdkvozahpCrQF
	 JzIY8o1XHKPNGJ5dOnhSa7vQK06YzXLOq2GhtaIsOZ4gtnAKnzPBJyra4wnbY+HR7W
	 CJXhn5Odwm2xSQs7pjbyY2+OeW7lAgI2LHoLopkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 823B3F80139;
	Fri, 24 Jun 2022 10:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B7EF800CB; Fri, 24 Jun 2022 10:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 731EAF800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 10:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 731EAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jASmZlup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656057829; x=1687593829;
 h=from:to:cc:subject:date:message-id;
 bh=0hT/ssdR7iFYpnxu1iuIJWWRJQTQkWcXgBa84EnUVKg=;
 b=jASmZlupMfM5FKmY0zCjsMppT7kr3y70Sz7w9sLLOO9ZE3OfM9KvHqsV
 0UXUXKnEFslBMc78XvttvK1g3XZlYApbXTOh1IMnh97PTPbOa8UjVJsBq
 fBb59/ZpIWOBzKhOU/7Q4ALt1iKB1kr6msyQF4Rmj/AftRbLnP16NT4MS
 ZTmzObODIYPEt/VHCJmvWPPhjh6D8FviKAFgTiJR9gyqnXHbxR8btkPGn
 FZjfWjP2h8EN7SAs6HKLXhD1Yhi4VPdMeIy35IjYgx/Olo/mPpH/A2ZcP
 pMCocEApLFxWmJHy47dy1CZjZyro2IaD0S+uHgDiAAdCPq2Tz3gOERvqB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="261375929"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="261375929"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:03:42 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="621643169"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:03:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v3 0/2] ASoC/SoundWire: Intel: add sdw BE dai trigger
Date: Fri, 24 Jun 2022 16:03:24 +0800
Message-Id: <20220624080326.29139-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

For SOF IPC4, we need to set pipeline state in BE DAI trigger.
@Vinod, Could you ack if the soundwire patch looks good to you?
And we can go through the ASoC tree since the change is mainly on ASoC.

v2:
 - Change "#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)" to
   "if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))"

v3:
 - Change the multi-line comment style in "soundwire: Intel: add trigger
   callback" patch and take Vinod's Ack.

Bard Liao (2):
  soundwire: Intel: add trigger callback
  ASoC: SOF: Intel: add trigger callback into sdw_callback

 drivers/soundwire/intel.c           |  9 +++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 sound/soc/sof/intel/hda-dai.c       | 14 +++++++++++---
 sound/soc/sof/intel/hda.c           |  2 +-
 sound/soc/sof/intel/hda.h           |  1 +
 5 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.17.1

