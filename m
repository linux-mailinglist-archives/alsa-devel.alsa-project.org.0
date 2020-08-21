Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B524E1C4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AA21654;
	Fri, 21 Aug 2020 22:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AA21654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040153;
	bh=RsZb5ZcJlPZ/fmiRp2oF2VVME04wYU8JwnycqMJfnqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARMFlSe7lrQHCpElAr3w5gamSVz5glI1T6HO2nEdVU/aBCse9gL6Y8vLMw4JSLtsl
	 vA5GVuFcam/jK0OxD6GVKGn5w5lK54qZcFt4OnXL3FesNwfnQD4S1MnNm4+FUGYVEU
	 u1I1UFxqkWTZAZFKp1L+CVg8BgkQtNC/hOquVauY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37971F80308;
	Fri, 21 Aug 2020 21:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59BAAF802EC; Fri, 21 Aug 2020 21:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794D5F80216
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 794D5F80216
IronPort-SDR: x/w9ID/uOAfYEfX6eWV8EtElCdPGTEj/uyGK1ngBSlSy8RD0H7Nca7r5BS4RPRO2R5fxc3nE6W
 v+afXfvM2xaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158564"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158564"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:22 -0700
IronPort-SDR: LlGcD1hWUfPUu2FdG/h881tRL2iABQhr+9nPhI7cBfS6zRQk3OkV4+mpMGpoOQ9PPIQYQtBNr5
 pZ6AzdM4+2og==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002426"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/14] SoC: Intel: sof_sdw: Add support for product Ripto
Date: Fri, 21 Aug 2020 14:55:58 -0500
Message-Id: <20200821195603.215535-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

Ripto is another product based on TGL with the same
audio hardware configuration as Volteer.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ca231459ac10..44d06fa48b24 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -123,6 +123,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ripto"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
+					SOF_SDW_FOUR_SPK),
+	},
 
 	{}
 };
-- 
2.25.1

