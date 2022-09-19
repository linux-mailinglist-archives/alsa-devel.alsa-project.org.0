Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FD5BD425
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768A515E5;
	Mon, 19 Sep 2022 19:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768A515E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663610005;
	bh=QdddNi3xNXTqW9R7OXfPq7qq+hZkkcHfGOJFzY4TwbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtGZy8syJXmEkAeotEAnkHbxoUtZla2n3/1+0atZUG+V965w0vRhlKGP6uhzpk0ce
	 gsU0VGvun/K4bD1rsuLYyI+pJFYT3PE2azKFE5HcP19fQcL0HG7W7/iUCx2zAr9ezm
	 DZyxrhfgcBWveNku+jiwaT712eur16A4+LPbQETQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A670F8016D;
	Mon, 19 Sep 2022 19:51:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76C66F80548; Mon, 19 Sep 2022 19:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC3AF804AE
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC3AF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g0oQ9kEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609853; x=1695145853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdddNi3xNXTqW9R7OXfPq7qq+hZkkcHfGOJFzY4TwbA=;
 b=g0oQ9kEPbmhpBGXf9zMs4z9lv7U43nx60iBgy6CVoweq06iiAVdtGl9g
 nueFcHcRKJuxQPyRyMMgd2Z9Tbo/31tBRTIcpguEaxVig1KzSLqwkii4f
 zIFxV1k/N/sij17e5qGmrxBZCk+nZUOcVKcLsNCwtmlPYBt1l8AC7f9Ot
 NeRDRt3C50go4fFGQtbIhKbK+iyvrIzy8q78eyD5FWXK+oW9aBJy9D7wd
 9zI7xvlcwb+WtWc43nA1+kIflH4FTVCUPtZnjQBVuHKNXAIYrjSuCYmil
 ucNDp24dqZRlxSPUzW0YemGj/x5wQPlNEnmuQxK6yEj4P6Qik/yzO0mpl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498715"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498715"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658402"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/11] soundwire: intel: move all PDI initialization under
 intel_register_dai()
Date: Tue, 20 Sep 2022 01:57:14 +0800
Message-Id: <20220919175721.354679-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
References: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Start regrouping functionality in high-level functions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index d7852cc7dd96..676de04c5070 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1171,11 +1171,20 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 
 static int intel_register_dai(struct sdw_intel *sdw)
 {
+	struct sdw_cdns_stream_config config;
 	struct sdw_cdns *cdns = &sdw->cdns;
 	struct sdw_cdns_streams *stream;
 	struct snd_soc_dai_driver *dais;
 	int num_dai, ret, off = 0;
 
+	/* Read the PDI config and initialize cadence PDI */
+	intel_pdi_init(sdw, &config);
+	ret = sdw_cdns_pdi_init(cdns, config);
+	if (ret)
+		return ret;
+
+	intel_pdi_ch_update(sdw);
+
 	/* DAIs are created based on total number of PDIs supported */
 	num_dai = cdns->pcm.num_pdi;
 
@@ -1347,7 +1356,6 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 
 int intel_link_startup(struct auxiliary_device *auxdev)
 {
-	struct sdw_cdns_stream_config config;
 	struct device *dev = &auxdev->dev;
 	struct sdw_cdns *cdns = auxiliary_get_drvdata(auxdev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
@@ -1385,14 +1393,6 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	if (ret)
 		goto err_init;
 
-	/* Read the PDI config and initialize cadence PDI */
-	intel_pdi_init(sdw, &config);
-	ret = sdw_cdns_pdi_init(cdns, config);
-	if (ret)
-		goto err_init;
-
-	intel_pdi_ch_update(sdw);
-
 	/* Register DAIs */
 	ret = intel_register_dai(sdw);
 	if (ret) {
-- 
2.25.1

