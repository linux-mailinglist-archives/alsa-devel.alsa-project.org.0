Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BE32ABFE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31235190B;
	Tue,  2 Mar 2021 22:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31235190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614718988;
	bh=ojgoHQQkBy96iCX6lBHqP+gMb1oBV2oS3qTnoBNMZUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSR8Fl5iKR/t1Lsf8ytVYW2r0NDx/tj8JtxAVMCY0hU4stE+H60MgnlZL7FB8apU2
	 8UOturV8X0ghtntShg/er+OxHvXIMsOhdhrMQ58fdz2ygSJDcBynvvDjXU6fcRnCo4
	 iXURn1Cjf9Sr2xaBFy3+O2Gb87tFjOin+uZN3Bdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E103F80271;
	Tue,  2 Mar 2021 22:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E77F6F80425; Tue,  2 Mar 2021 22:00:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3EB7F802E3
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3EB7F802E3
IronPort-SDR: eBcNZxlDfK9uLZTH608iXq9VMPtRDbJ8wuPT9J90xU+5us4WWQcSvJScqsUxBRG610Ap2wNF85
 XwxSufuqaUhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174623742"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174623742"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:29 -0800
IronPort-SDR: N3MsXD3UwTjJ+a7WHfFUmRc6o6JeXGBruoydWDhwLAHZqetsn9LDbRIBfZm9x77ORM5LKCw9sE
 Cmu5fPdJpkVw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="373727801"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:00:29 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/9] ASoC: amd: renoir: remove invalid kernel-doc comment
Date: Tue,  2 Mar 2021 14:59:22 -0600
Message-Id: <20210302205926.49063-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
References: <20210302205926.49063-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

make W=1 warning:

sound/soc/amd/renoir/rn-pci-acp3x.c:24: warning: wrong kernel-doc
identifier on line:
 * dmic_acpi_check = -1 - Use ACPI/DMI method to detect the DMIC
   hardware presence at runtime

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 050a61fe9693..19438da5dfa5 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -20,7 +20,7 @@ static int acp_power_gating;
 module_param(acp_power_gating, int, 0644);
 MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
 
-/**
+/*
  * dmic_acpi_check = -1 - Use ACPI/DMI method to detect the DMIC hardware presence at runtime
  *                 =  0 - Skip the DMIC device creation and return probe failure
  *                 =  1 - Force DMIC support
-- 
2.25.1

