Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624851A1AC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 18:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65C7189D;
	Fri, 10 May 2019 18:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65C7189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557506411;
	bh=oKITeXlARuF36pfxY5lCjV7U2YDZ5I7i59p1tPA8o7g=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OgXEI5jTecGVJYhoDUR2clfkPQnxrjtorV7vcLb62W43rvnL9nH0i6RZIFlKcDi7E
	 HK0u4YfuFxh04msbW9zzzNXpTjfVDN5lROheYwAPjaBjKQM4zLCYh28rnVZdqdW83Z
	 2EIf7c7Ig0jIFTBKZ3WSsvzKRhT5PU68HfY24Ges=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0BE7F896FD;
	Fri, 10 May 2019 18:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C62F896FD; Fri, 10 May 2019 18:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D81C8F89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 18:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D81C8F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 09:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,454,1549958400"; d="scan'208";a="170379036"
Received: from bgtruong-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.205.232])
 by fmsmga002.fm.intel.com with ESMTP; 10 May 2019 09:38:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 May 2019 11:38:03 -0500
Message-Id: <20190510163803.8742-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, YueHaibing <yuehaibing@huawei.com>,
 rdunlap@infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: nocodec: fix undefined reference
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

The nocodec option can be selected individually, leading to the following
issue:

sound/soc/sof/core.o: In function `snd_sof_device_probe':
core.c:(.text+0x4af): undefined reference to `sof_nocodec_setup'

Fix by selecting the SND_SOF_NOCODEC option as needed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Reported-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index b204c65698f9..a9a1d502daae 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -44,7 +44,10 @@ config SND_SOC_SOF_OPTIONS
 if SND_SOC_SOF_OPTIONS
 
 config SND_SOC_SOF_NOCODEC
-	tristate "SOF nocodec mode Support"
+	tristate
+
+config SND_SOC_SOF_NOCODEC_SUPPORT
+	bool "SOF nocodec mode support"
 	help
 	  This adds support for a dummy/nocodec machine driver fallback
 	  option if no known codec is detected. This is typically only
@@ -80,7 +83,7 @@ if SND_SOC_SOF_DEBUG
 
 config SND_SOC_SOF_FORCE_NOCODEC_MODE
 	bool "SOF force nocodec Mode"
-	depends on SND_SOC_SOF_NOCODEC
+	depends on SND_SOC_SOF_NOCODEC_SUPPORT
 	help
 	  This forces SOF to use dummy/nocodec as machine driver, even
 	  though there is a codec detected on the real platform. This is
@@ -135,6 +138,7 @@ endif ## SND_SOC_SOF_OPTIONS
 config SND_SOC_SOF
 	tristate
 	select SND_SOC_TOPOLOGY
+	select SND_SOC_SOF_NOCODEC if SND_SOC_SOF_NOCODEC_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
