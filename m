Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB5928465B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:54:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39A3176D;
	Tue,  6 Oct 2020 08:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39A3176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601967286;
	bh=E/kHsWdSdr3jwHv8HbeD5ZR2UMZZ9s192yRuRIlOyig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUrSDuseO2tOkHQsPXNxkjt429YGz7IJSIRGscFUTD5kp4kEbvvABFaMVKm4MtSFt
	 fPEc+ZiisuOL1IEhl09hiM9IqZNjzmF2IUHcmdrytQwrJpAnxL2c2gOrX07lqUfsVs
	 ZxdjaPG/VMglL4u0DH63BllfBo4lRO7mllk5zYLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 480D3F80255;
	Tue,  6 Oct 2020 08:50:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF73F80304; Tue,  6 Oct 2020 08:50:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38A4CF802E0
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A4CF802E0
IronPort-SDR: YMYSI4R63q2p7aB1foXzLjJbv4RCKn/vQSu+jTm1XCLxVRQAQ27fJD0e/3OmRevjK6O1OezE9+
 UMtICtHBp4pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249091300"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="249091300"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 23:50:15 -0700
IronPort-SDR: lvxunrrNNNKHLPn6ZNSoSFvA9HDt01+jp9CcHxcWpxP23z6a1TOz6xkoYEbprJjsxWH+yvFrrS
 OQd1xfmjlK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="315491260"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2020 23:50:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/13] ASoC: Intel: Skylake: Unassign ram_read and
 read_write ops
Date: Tue,  6 Oct 2020 08:49:01 +0200
Message-Id: <20201006064907.16277-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006064907.16277-1-cezary.rojewski@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

Skylake driver makes no use of ram_read or ram_write operation so remove
the assignments. This prepares sound/soc/common/sst-dsp* for following
removal of unused DSP operations.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 2 --
 sound/soc/intel/skylake/cnl-sst.c | 2 --
 sound/soc/intel/skylake/skl-sst.c | 2 --
 3 files changed, 6 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 38b9d7494083..fd4fdcb95224 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -533,8 +533,6 @@ static struct sst_ops skl_ops = {
 	.irq_handler = skl_dsp_sst_interrupt,
 	.write = sst_shim32_write,
 	.read = sst_shim32_read,
-	.ram_read = sst_memcpy_fromio_32,
-	.ram_write = sst_memcpy_toio_32,
 	.free = skl_dsp_free,
 };
 
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index c6abcd5aa67b..355a7b116886 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -300,8 +300,6 @@ static struct sst_ops cnl_ops = {
 	.irq_handler = cnl_dsp_sst_interrupt,
 	.write = sst_shim32_write,
 	.read = sst_shim32_read,
-	.ram_read = sst_memcpy_fromio_32,
-	.ram_write = sst_memcpy_toio_32,
 	.free = cnl_dsp_free,
 };
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 00a97cea58b4..39d027ac16ec 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -506,8 +506,6 @@ static struct sst_ops skl_ops = {
 	.irq_handler = skl_dsp_sst_interrupt,
 	.write = sst_shim32_write,
 	.read = sst_shim32_read,
-	.ram_read = sst_memcpy_fromio_32,
-	.ram_write = sst_memcpy_toio_32,
 	.free = skl_dsp_free,
 };
 
-- 
2.17.1

