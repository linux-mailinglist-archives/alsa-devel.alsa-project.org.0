Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C929167F4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 18:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9E517E4;
	Tue,  7 May 2019 18:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9E517E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557246911;
	bh=KMfuzje456dNcI8kvURarddWMY6BkCUuyvyRLpO5NrQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMjL1l2ZQYYtpqdD7Sd8QdOePR4xLLwU+58F/7KB54laZDCe1JrjRk64p+m1WMCqZ
	 KCS1UxdeTWF/knH7DG0EYjXwXhUYA35ityeF3vLG2CbyGDZLt6EEUVQBv8js6y6233
	 MmcteMQhl70wqP6U8mYYiukcRJI9nJgh6liQ0DWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E39D2F8970E;
	Tue,  7 May 2019 18:32:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1115F89671; Tue,  7 May 2019 18:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BEFAF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 18:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEFAF89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 09:32:41 -0700
X-ExtLoop1: 1
Received: from jcsedaya-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.228.16])
 by orsmga001.jf.intel.com with ESMTP; 07 May 2019 09:32:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  7 May 2019 11:32:35 -0500
Message-Id: <20190507163236.8783-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507163236.8783-1-pierre-louis.bossart@linux.intel.com>
References: <20190507163236.8783-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, kbuild-all@01.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: SOF: xtensa: fix undefined references
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

The SND_SOC_INTEL_COMMON Kconfig was removed months ago from SOF
Kconfig files but is still selected instead of the correct
SND_SOC_SOF_INTEL_COMMON kconfig which does select xtensa stuff,
leading to the following errors.

ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x120): undefined reference
to `sof_xtensa_arch_ops'
ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x180): undefined reference
to `sof_xtensa_arch_ops'
ld: sound/soc/sof/sof-acpi-dev.o:(.rodata+0x1e0): undefined reference
to `sof_xtensa_arch_ops'

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 32ee0fabab92..603e0db4f012 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -36,7 +36,7 @@ config SND_SOC_SOF_INTEL_HIFI_EP_IPC
 
 config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	tristate
-	select SND_SOC_INTEL_COMMON
+	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This option is not user-selectable but automagically handled by
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
