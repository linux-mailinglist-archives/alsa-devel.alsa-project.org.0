Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB74534EEF
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 14:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F7716B8;
	Thu, 26 May 2022 14:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F7716B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653567333;
	bh=MVyzkoB+fDS4sCcQjW6NPbjwMQrpddqPSyKpmVASnoI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aSjm5TNao1ZbB8ooMnT2VfS6NU6io6cn9XEz4iY6bdr0xj3pvbyosJTFffT5VSbn9
	 ncC97T0FUjQENbVPloMW/TJlBmcr8rK3QPgVzjf6IzMiekS9LFiJACUJC2i0Vn3j0T
	 l5V+MRSxnCRhxzwb63Ihi/qAYnZSqb8WPg4cnt8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA5FF800D0;
	Thu, 26 May 2022 14:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 345E1F80137; Thu, 26 May 2022 14:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 2BFB8F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 14:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BFB8F800D0
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 81EEC1C810FB;
 Thu, 26 May 2022 20:14:18 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 26
 May 2022 20:14:18 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 26 May
 2022 20:14:05 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 26 May 2022 20:14:05 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: common: fix typo for tplg naming
Date: Thu, 26 May 2022 20:13:02 +0800
Message-ID: <20220526121301.1819541-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: ctlin0.linux@gmail.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, YHCHuang@nuvoton.com, mac.chiang@intel.com,
 David Lin <CTLIN0@nuvoton.com>, vamshi.krishna.gopal@intel.com
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

Correct typo form sof-adl-mx98360a-nau8825.tplg to
sof-adl-max98360a-nau8825.tplg. The reason is tplg naming without naming
limitaion of length. It will be consistency with sof topology generation.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index e6e52c7b6803..c1385161cdc8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -453,7 +453,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.drv_name = "adl_mx98360a_nau8825",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-mx98360a-nau8825.tplg",
+		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
 	},
 	{
 		.id = "RTL5682",
-- 
2.25.1

