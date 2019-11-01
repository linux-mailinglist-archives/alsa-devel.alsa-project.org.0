Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F12EC793
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:33:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C462369;
	Fri,  1 Nov 2019 18:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C462369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572629621;
	bh=g5RTsAbUykR3/wb0ZHmo+1FxeqnZQIrDzRhb17N7c1Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vw2+K82GEdAq8v293+GBpHvAx+wnYCKwR2/DUlvoD4ccYX1p9GORlJjEGhyNuoseS
	 KaWc3ML9aST6P9AI2kBK3fDxWCtUxDRwRv/MdyeG73lL5mttuCzuhq/5rehpr4KMyO
	 BFFWoJL5J0beqo5lsqiGXUuZHm8AOFkr6cfkOQO4=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 717D1F805FD;
	Fri,  1 Nov 2019 18:31:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845F3F8015A; Fri,  1 Nov 2019 18:31:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B27C9F803D6
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B27C9F803D6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 10:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="206457412"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.92.243])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2019 10:30:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  1 Nov 2019 12:30:37 -0500
Message-Id: <20191101173045.27099-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
References: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 03/11] ASoC: Intel: add mutual exclusion
	between SOF and legacy Baytrail driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This legacy driver is already deprecated, let's make sure there is no
conflict with SOF.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 7e9feca333b7..d6c5c68b7499 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -65,7 +65,7 @@ config SND_SOC_INTEL_HASWELL
 
 config SND_SOC_INTEL_BAYTRAIL
 	tristate "Baytrail (legacy) Platforms"
-	depends on DMADEVICES && ACPI && SND_SST_ATOM_HIFI2_PLATFORM=n
+	depends on DMADEVICES && ACPI && SND_SST_ATOM_HIFI2_PLATFORM=n && SND_SOC_SOF_BAYTRAIL=n
 	select SND_SOC_INTEL_SST
 	select SND_SOC_INTEL_SST_ACPI
 	select SND_SOC_INTEL_SST_FIRMWARE
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
