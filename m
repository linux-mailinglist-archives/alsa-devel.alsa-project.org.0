Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFE54ED21
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEB21AFC;
	Fri, 17 Jun 2022 00:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEB21AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417356;
	bh=b17oNvDYiOgSboel0vaIV6r+eE5rtstCTwdyZE/6jos=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CDl3HsHF+Lyc9ZRpOLQA896SIFyKIT9ukn/DeRI39vnxvFmo77wisUyku1oE9uK0Y
	 fukEYZv6KHQ3OU53E+9+Ohs0icEWs1MACAMXquAQTzv0S199/0iBNIlHXLwLtLvcmu
	 qozoiKZeqZ/E5tjqQUYWVOsFRk/AloHZgqCvN0xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFDFF804D0;
	Fri, 17 Jun 2022 00:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0DCAF80423; Fri, 17 Jun 2022 00:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42952F800D3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42952F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DH/FbweJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417172; x=1686953172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b17oNvDYiOgSboel0vaIV6r+eE5rtstCTwdyZE/6jos=;
 b=DH/FbweJ30I9EcHi/Vl1X/CLdKpp4sIZBBnUbIba/6bkRXqBzZHlSvKc
 XOiUqie2rk4jfXM5NWiNWrA1C8ysODL689WB1sFj+adacL7jAFjG5xvGy
 M/ajFLaV7Aj9ASeNY16Y4uMBIdRIseaOpQFe8BJEFZkdA8N5cL1UJL2wb
 KMiOyElaHSgm7mtFIAwGUGSb1oJEucaUGb+JGGtInuR1hIdXbeNiRIGdU
 3/gDe4bf8VkJnwvNEbHEznOZQSM1q8sWgjuo/qsuOKWJ5QEeIzbadMu+Y
 71qUayVQyAJwIHQqggbWVHMI78VCVmn3a9Up2WRX4eyTNIgwbCpvl2zrQ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280076621"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280076621"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:06:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="713525464"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:06:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: intel-nhlt: remove use of __func__ in dev_dbg
Date: Thu, 16 Jun 2022 17:05:59 -0500
Message-Id: <20220616220559.136160-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/hda/intel-nhlt.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 4063da3782833..9db5ccd9aa2db 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -55,8 +55,8 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 
 		/* find max number of channels based on format_configuration */
 		if (fmt_configs->fmt_count) {
-			dev_dbg(dev, "%s: found %d format definitions\n",
-				__func__, fmt_configs->fmt_count);
+			dev_dbg(dev, "found %d format definitions\n",
+				fmt_configs->fmt_count);
 
 			for (i = 0; i < fmt_configs->fmt_count; i++) {
 				struct wav_fmt_ext *fmt_ext;
@@ -66,9 +66,9 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 				if (fmt_ext->fmt.channels > max_ch)
 					max_ch = fmt_ext->fmt.channels;
 			}
-			dev_dbg(dev, "%s: max channels found %d\n", __func__, max_ch);
+			dev_dbg(dev, "max channels found %d\n", max_ch);
 		} else {
-			dev_dbg(dev, "%s: No format information found\n", __func__);
+			dev_dbg(dev, "No format information found\n");
 		}
 
 		if (cfg->device_config.config_type != NHLT_CONFIG_TYPE_MIC_ARRAY) {
@@ -95,17 +95,16 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 			}
 
 			if (dmic_geo > 0) {
-				dev_dbg(dev, "%s: Array with %d dmics\n", __func__, dmic_geo);
+				dev_dbg(dev, "Array with %d dmics\n", dmic_geo);
 			}
 			if (max_ch > dmic_geo) {
-				dev_dbg(dev, "%s: max channels %d exceed dmic number %d\n",
-					__func__, max_ch, dmic_geo);
+				dev_dbg(dev, "max channels %d exceed dmic number %d\n",
+					max_ch, dmic_geo);
 			}
 		}
 	}
 
-	dev_dbg(dev, "%s: dmic number %d max_ch %d\n",
-		__func__, dmic_geo, max_ch);
+	dev_dbg(dev, "dmic number %d max_ch %d\n", dmic_geo, max_ch);
 
 	return dmic_geo;
 }
-- 
2.34.1

