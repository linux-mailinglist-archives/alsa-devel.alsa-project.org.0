Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2AC58ABB1
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 15:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BAAA1D7;
	Fri,  5 Aug 2022 15:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BAAA1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659706513;
	bh=e9/UQEIuAvlidCtK9VVJwqNqMj/5mYvjJXH3Ijdyhfw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nn/ob6jfJacxWYf+JVlPLspRqyu8g9ha+mc1aGSZaDWw1hgd3s9G1m4hLqvlfqY+/
	 aLghGEsI5+8L7Tr0KAgeE2Vew9aUqlmToVG+eD2yDAANs35AUnM5iqDC1DbGEb+pMu
	 /m7X/d4n5sFR/J49ln7SwbgmZyzqIDfkAMZMFjfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00F49F80121;
	Fri,  5 Aug 2022 15:34:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86F36F8025A; Fri,  5 Aug 2022 15:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B56DAF8013D
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 15:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56DAF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hp1fH4dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659706449; x=1691242449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e9/UQEIuAvlidCtK9VVJwqNqMj/5mYvjJXH3Ijdyhfw=;
 b=Hp1fH4dhS7fSCUtlwV5wbuFqAZpmzpq/ZoWzc/TfAkaA77yE/65l0iyU
 kl4oa1Ls5l1mIiX94QrNRFMHkEfYooSOauHaEpRVnSIGwrumw1heuqyg4
 cxOsscALhLtNW7fIBSHVOaHwyMcrN3Sh6hnI7n4cjOXYsV9LAkGWCV4Ez
 TTur0WpipEK5IELrhYRLfE1rgV6BQwWxaNKBMPEXZs4S3miBS/R4IrjOH
 1R1Ekl5VOgqKdAKScHN4Ggub6bgZNJsX5IkPjgiYcQwQVZY7ZrhJS9bQl
 nbE5S1gCOS+4JWmt86VUkQw7d8QH61W1C5k1ZVVIZ6eT9dFBmaH7RMxLj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="288959355"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="288959355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 06:33:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="632013943"
Received: from mpaolini-mobl1.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.33.38])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 06:33:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: fix sof_es8336 probe
Date: Fri,  5 Aug 2022 15:33:32 +0200
Message-Id: <20220805133332.207932-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Eugene J Markow <ejmarkow@yahoo.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Changes to add HDMI capture support broke the machine driver probe for
all other platforms. The commit listed in the Fixes tag added a
board_id descriptor but didn't add the default name for the
sof_essx8336 machine driver.

Add the missing entry and remove the now-useless platform driver
alias.

Reported-by: Eugene J Markow <ejmarkow@yahoo.com>
BugLink: https://github.com/thesofproject/linux/issues/3336
Fixes: 86b1959a2ccb ("ASoC: Intel: sof_es8336: add support for HDMI_In capture")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index c7f33c89588e..606cc3242a60 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -759,6 +759,9 @@ static int sof_es8336_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id board_ids[] = {
+	{
+		.name = "sof-essx8336", /* default quirk == 0 */
+	},
 	{
 		.name = "adl_es83x6_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_ES8336_SSP_CODEC(1) |
@@ -786,5 +789,4 @@ module_platform_driver(sof_es8336_driver);
 
 MODULE_DESCRIPTION("ASoC Intel(R) SOF + ES8336 Machine driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:sof-essx8336");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-- 
2.34.1

