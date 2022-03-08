Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF64D2194
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:33:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB22E1904;
	Tue,  8 Mar 2022 20:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB22E1904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767993;
	bh=YJ3rgonVNF8TIfR8pAWq/X4mw4wp81le54Z8mYk8n+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0l6LAXOJ3ZqajSkAp7m75evhzSr6C0OR7bEQl81NgNxliN7/EviyRr/bYkmU0Q7l
	 jCPFcvcIbWpLm9qpBOG2BKaW5t3U5QDAwo6hxcvQUHNUT2ftHZxTC3DAKHar3hhs5B
	 1JCaT+1luDoeWBM6SrNT/zH4J5SG+i445pRaod4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB027F805AB;
	Tue,  8 Mar 2022 20:27:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2916BF8052D; Tue,  8 Mar 2022 20:27:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C782BF80525
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C782BF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NHztG1Sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767613; x=1678303613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJ3rgonVNF8TIfR8pAWq/X4mw4wp81le54Z8mYk8n+g=;
 b=NHztG1SroWNgcpXcICd0/C+IEGWJw80H0rkTa2IskLZd5Fd1m8ukI4P9
 hFqk5uH1QPViM6YvSE3kv8GjSFePo+MMZR1lNcn4mIBvQSP3ZnWtLgdbZ
 so2I818m69OT4V/vYdjtbuP4DhofFK56h8mw+3wT/YaWl1pGuhyxKb+ce
 A9C2Z8GOONxIfFpL68D7CJB/SREKlZYL1B3dXQdGMhOqbpexuEOH+cLSW
 E2nOEgu5kqXFq99mrx2apMxUBPd0OKCu2laP35ZzmdOJ0R5xbAefxHPcn
 DHzBL8KcDaTY90wqBcPlvPvZHM327XBOiwsm96b5+GvK1GhTEpX8Y8UXt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363746"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:51 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573991"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:50 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/20] ASoC: Intel: sof_es8336: move comment to the right place
Date: Tue,  8 Mar 2022 13:26:06 -0600
Message-Id: <20220308192610.392950-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Additional code was added and the comment on the speaker GPIO needs to
be moved before we actually try to get the GPIO.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e2daa57902af..d7dff61c9ba8 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -537,12 +537,12 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* get speaker enable GPIO */
 	codec_dev = acpi_get_first_physical_node(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
 	priv->codec_dev = get_device(codec_dev);
 
+	/* get speaker enable GPIO */
 	ret = devm_acpi_dev_add_driver_gpios(codec_dev, gpio_mapping);
 	if (ret)
 		dev_warn(codec_dev, "unable to add GPIO mapping table\n");
-- 
2.30.2

