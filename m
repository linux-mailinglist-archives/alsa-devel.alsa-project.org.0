Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D12417D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 21:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1845A165E;
	Mon, 20 May 2019 21:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1845A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558381932;
	bh=24PG2KjZ1KXTs0DyoLa2aWZ+t2A+Nl4mP08Hv87R/c8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wqz8CRwhARu0zXR0kyOv02VNxL9Vs3MoSjPOtpKCSeo9PDMaUcuSYNR5qDw32k1X/
	 2384io33u5DjAskhagZXcxa4xPmJjVQL80ItoORYcNx+XdDb/NoFmgV11XnhCUzyvs
	 dv6z/BDb2MiFgj0WDHSM8EvBFZlce+AQc1GgKjMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 519EEF8962F;
	Mon, 20 May 2019 21:48:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 561F8F89630; Mon, 20 May 2019 21:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB47F8962F
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 21:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB47F8962F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 12:46:53 -0700
X-ExtLoop1: 1
Received: from nvkremer-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.207.212])
 by FMSMGA003.fm.intel.com with ESMTP; 20 May 2019 12:46:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 20 May 2019 14:46:44 -0500
Message-Id: <20190520194645.432-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520194645.432-1-pierre-louis.bossart@linux.intel.com>
References: <20190520194645.432-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 4/5] ASoC: Intel: soc-acpi: Fix machine
	selection order
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

From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>

The selection order of m/c in match table is corrected
to use common codec as last in the list.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index df7c52cad5c3..c36c0aa4f683 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -29,17 +29,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
-		.id = "10EC5682",
+		.id = "MX98357A",
 		.drv_name = "sof_rt5682",
+		.quirk_data = &cml_codecs,
 		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt5682.tplg",
+		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
 	},
 	{
-		.id = "MX98357A",
+		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-		.quirk_data = &cml_codecs,
 		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
+		.sof_tplg_filename = "sof-cml-rt5682.tplg",
 	},
 
 	{},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
