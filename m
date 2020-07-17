Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F962245CA
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 23:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32AF916AD;
	Fri, 17 Jul 2020 23:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32AF916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595020824;
	bh=ASHHWkJsa6q3U1ooLAi7MSyTjnLkcSoBGuWxRk86mdg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qeidk9j4e5XNrmjZTsZczmb1SftjeWwHKLulKy4GXMHDf71AnZR9otPTFbbcaZHSn
	 B1Sf50H29lH0y1Ke6xlMcgwMuA2n/uzGVfLTCrAFzdqBISGEEdcsMqyXXBf0cJTXX2
	 oV3ZH8eYiWWbXuNvSOntUItP2gkL0jAO5CGbtT+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FBFF802DC;
	Fri, 17 Jul 2020 23:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A2CF802DC; Fri, 17 Jul 2020 23:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A59CF80217
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 23:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A59CF80217
IronPort-SDR: tMKkhEavbWiVNffmJ6kobk6oIOPqYpvYkcoDckOgTVLQtB53qVsgORHEEc1w5VNRbkc+XkVScz
 LDSOmlKsGaDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129758220"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="129758220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:52 -0700
IronPort-SDR: K6GM19Mh63cqwzL/PJWiCvMOx7cwx+bDJ66eSMZO4S4xg3jhOweJD9aInBK61CEdgAwb8649UC
 i1ZMsjffcNXA==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="282905803"
Received: from toddjdav-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: Intel: common: change match table ehl-rt5660
Date: Fri, 17 Jul 2020 16:13:37 -0500
Message-Id: <20200717211337.31956-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
References: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
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

From: Libin Yang <libin.yang@intel.com>

This configuration is for EHL with the RT5660 codec. RT5660
should use "10EC5660" ID instead of "INTC1027".

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index 45e07d886013..badafc1d54d2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -12,7 +12,7 @@
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[] = {
 	{
-		.id = "INTC1027",
+		.id = "10EC5660",
 		.drv_name = "ehl_rt5660",
 		.sof_fw_filename = "sof-ehl.ri",
 		.sof_tplg_filename = "sof-ehl-rt5660.tplg",
-- 
2.25.1

