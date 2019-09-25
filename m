Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85894BE2E6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 18:54:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94DD1721;
	Wed, 25 Sep 2019 18:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94DD1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569430456;
	bh=I4hCohpyK/CVg8seu5sAtma3zjVyZTxHLwVnsX36ov0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZ1WLcm0ot0ZyxW4H9zDdZggy8PpsyPQhFVc5+qVYcrA56Ngm0vymWJah2XLlaTMZ
	 +Y/HYKWBxTeGz/OvSUjKtLyO8vLBJhNq8JDhtvaF+hnzBrwqCUZXLr02lVmKGHs96V
	 RVxMu1YKy+GdOtw6bqNmj0hHal8086FBBseDYm3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE73CF8060E;
	Wed, 25 Sep 2019 18:51:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7884F805F7; Wed, 25 Sep 2019 18:51:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0676FF8049A
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 18:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0676FF8049A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 09:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="203642162"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.177])
 by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2019 09:51:28 -0700
From: sathya.prakash.m.r@intel.com
To: alsa-devel@alsa-project.org
Date: Wed, 25 Sep 2019 22:27:04 +0530
Message-Id: <1569430624-30505-3-git-send-email-sathya.prakash.m.r@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569430624-30505-1-git-send-email-sathya.prakash.m.r@intel.com>
References: <1569430624-30505-1-git-send-email-sathya.prakash.m.r@intel.com>
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.de
Subject: [alsa-devel] [PATCH v4 2/2] ASoC: Intel: Add acpi match for rt1011
	based m/c driver
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

From: Naveen Manohar <naveen.m@intel.com>

Add match for CML m/c with RT1011 and RT5682

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 771b0ef21051..af7e85a4fc86 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -29,6 +29,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
+		.id = "10EC1011",
+		.drv_name = "cml_rt1011_rt5682",
+		.quirk_data = &cml_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
+	},
+	{
 		.id = "MX98357A",
 		.drv_name = "sof_rt5682",
 		.quirk_data = &cml_codecs,
-- 
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
