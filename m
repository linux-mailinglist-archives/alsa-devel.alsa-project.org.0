Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0FA571974
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4582F1669;
	Tue, 12 Jul 2022 14:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4582F1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657627800;
	bh=U5QkyWxKma0sjnkiZstiSlMfiY2fFJ0dabBi+8wO3CQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vVs2DE3nRkkw6+Hfccu7dt4NN17ZHfjVCns3My/bZ6CtJcfu6VkkkCro+EZ5SMuNc
	 PsaKYiAIGqM+seK+9xRGSpcAJhNen23sjh9QoQAsjKskQuNGoBTyujODtPItMMoDDM
	 tqNBqHcKobevyIm//kbCV0Pzm/kRmSl3bpv2FIB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F2AF802DB;
	Tue, 12 Jul 2022 14:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ADAFF80279; Tue, 12 Jul 2022 14:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E53B4F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E53B4F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f1hiTTvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657627736; x=1689163736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U5QkyWxKma0sjnkiZstiSlMfiY2fFJ0dabBi+8wO3CQ=;
 b=f1hiTTvTguV5ZwP5g6W8yEtbVuFUNbvxFu9OoAltehNOKCeKYj8NLIXf
 lrwSUObkahg7415aPJe10y64HUPMp3AzlHTtq1BVujg9XxV0MSwcbHd2+
 Z4oK48MAT/G8wo9owcdBTeC5eUuVpTej/PK9HvzyZxdPs8qP2a4IVtQCS
 MeA7oZQd8GWIsyn8PywJSy7l5BeXBmEfR8XZKBVsAnfgm+Tl/8np0ISGV
 XZk52YQqhdVY5/6oup4JgcCf5pcvUp2HcO7OMVd8lwyUXKYXuCaW7IluA
 QM645l0coB1jLu0ytTz8gUYPEciX9AYka0uYoxKWj7ee6S2xSjuyzq278 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="371225543"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="371225543"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:08:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545403343"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:08:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: hda: Use cold/purge boot after firmware
 crash
Date: Tue, 12 Jul 2022 15:09:34 +0300
Message-Id: <20220712120936.28072-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Hi,

In case of a firmware crash we force the DSP to be powered down and rebooted.
To make sure that the next boot is going to be clean, force the boot process to
skip the IMR booting and re-download the firmware.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: Intel: hda: Introduce skip_imr_boot flag
  ASoC: SOF: Intel: hda: Skip IMR boot after a firmware crash or boot
    failure

 sound/soc/sof/intel/hda-dsp.c    | 12 ++++++++++++
 sound/soc/sof/intel/hda-loader.c | 10 ++++++----
 sound/soc/sof/intel/hda.h        |  1 +
 3 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.37.0

