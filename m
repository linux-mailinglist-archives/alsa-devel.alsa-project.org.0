Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0E2AFAAF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:45:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1BD517B4;
	Wed, 11 Nov 2020 22:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1BD517B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605131130;
	bh=5rojN382fjinmRI7Ui2mEv8/352jRIsBaOZBg0ZYx/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuK/+B3YdUhN5VNYSn5ud0zlXYJ8dzStwIqkY6p9jtb77hpmeC2YvwnoELC9uPkUE
	 1dDuPT0i5yObcUSdDOlDHH58an0c3Qlbn+jbIwv/fkXRiwCScl+JBMKi6gRe8q/kjK
	 BtC9S4//aJEk+bjS39xmmwPoeCRWglxoq+BmbMA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B27F804C3;
	Wed, 11 Nov 2020 22:43:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC7AF8007E; Wed, 11 Nov 2020 22:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77198F8007E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77198F8007E
IronPort-SDR: GIFSB1whG/k/ZjGlv40zP0OCOXwGtSKwHrZmVfFs9YlOuZkQV3HU6RzqvD6J8pRJhtf32wOcID
 ELxxI+9RXmBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="149495724"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="149495724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:33 -0800
IronPort-SDR: 2HF1em7C13dWILQ5hjhF17pZN8gMz+L7b+fthhpUOwKHKm034Ij8EGtWhxtwwB2Zspyn+tceva
 ZCb2VJjRSD+g==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="356808073"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:43:32 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: sof_sdw: add quirk for new TigerLake-SDCA
 device
Date: Wed, 11 Nov 2020 15:43:15 -0600
Message-Id: <20201111214318.150529-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
References: <20201111214318.150529-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Add quirks for jack detection, rt715 DAI and number of speakers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b29946eb4355..ca968901ac96 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -48,6 +48,16 @@ static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
 }
 
 static const struct dmi_system_id sof_sdw_quirk_table[] = {
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A32")
+		},
+		.driver_data = (void *)(SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.25.1

