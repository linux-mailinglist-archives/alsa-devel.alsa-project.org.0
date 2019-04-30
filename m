Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE21032C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B6A16A9;
	Wed,  1 May 2019 01:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B6A16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556665944;
	bh=+yuvEuYSZZHmI9JeuvbJBRjc8l5gTr4jT+BE5ImGz3I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDFsU3po9pTy1Cri/MrwJJ/m4Jz/kAhjDlxw2tvlXrmwItUoz96Ug2aVwIwjNyUhQ
	 Q+Wu9ilwY2S/30gp/5i7PMA+HAHmvgfGQ3rKWnGJ72BeOjeAafLBeXnhgSQTRBdql0
	 zXC5ofcC8QAwTotEVh6bx7vZpI2AvR6x0qRCp/T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E710CF8972B;
	Wed,  1 May 2019 01:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F1E9F89720; Wed,  1 May 2019 01:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA30F8065C
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA30F8065C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540876"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:09:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:16 -0500
Message-Id: <20190430230934.4321-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 01/19] ASoC: SOF: add Kconfig option for strict
	ABI checks
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

When the kernel is more recent than firmware files, it will always
behave in backwards-compatible ways.

Add optional behavior to check if the kernel is older than the
firmware files, so that the kernel fails early instead of attempting
to use new functionality it does not support.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index eaa380092c3b..a1a9ffe605dc 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -53,6 +53,21 @@ config SND_SOC_SOF_NOCODEC
 	  Say Y if you need this nocodec fallback option
 	  If unsure select "N".
 
+config SND_SOC_SOF_STRICT_ABI_CHECKS
+	bool "SOF strict ABI checks"
+	help
+	  This option enables strict ABI checks for firmware and topology
+	  files.
+	  When these files are more recent than the kernel, the kernel
+	  will handle the functionality it supports and may report errors
+	  during topology creation or run-time usage if new functionality
+	  is invoked.
+	  This option will stop topology creation and firmware load upfront.
+	  It is intended for SOF CI/releases and not for users or distros.
+	  Say Y if you want strict ABI checks for an SOF release
+	  If you are not involved in SOF releases and CI development
+	  select "N".
+
 config SND_SOC_SOF_DEBUG
 	bool "SOF debugging features"
 	help
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
