Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7934A632
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 12:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F1E1669;
	Fri, 26 Mar 2021 12:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F1E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616757237;
	bh=CUFRr2mQSkIhW5/Tk5uS452B0FqcgHXBrpUyMYEZN0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LnGsRC8ME/WSqenqNewMA1BdS+u/gS9Pa9dWHu2Ajz+8owONJ1MwJYVrU/jMMMuO0
	 Kniert/kIQIUxOjsQvquSLCyQM93a6iLC0lZ6e1HmFhWO+JrobkUWCzwdStLXz7ROT
	 REgFNJ5hEBZBRbWTUeAXaIxEVCZpiqLuqS2lm9AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7962F801D5;
	Fri, 26 Mar 2021 12:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBADEF8016B; Fri, 26 Mar 2021 12:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E19F80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 12:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E19F80104
IronPort-SDR: u+cyzJZrBg7+2PHtdWaBG/yd2JdkO5yp98Gk6cGujKl/Y0xuwPYj3Dw6Xkvh/1jh7HiHEL31bN
 HUY7PUrfi++w==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="191158048"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="191158048"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 04:12:09 -0700
IronPort-SDR: UGbhmzT+QZPePb7NGkegpDWQcAtyLE6Uy89EUv7bC6ffZMCbLlSyp7eIM1de7N+t015/r8cRsz
 1EuoMtJyG0fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="436855617"
Received: from cooperch-pc1.itwn.intel.com ([10.5.215.29])
 by fmsmga004.fm.intel.com with ESMTP; 26 Mar 2021 04:12:07 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: add max98390 echo reference support
Date: Fri, 26 Mar 2021 19:21:29 +0800
Message-Id: <1616757689-22014-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, brent.lu@intel.com,
 bard.liao@intel.com
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

From: Mac Chiang <mac.chiang@intel.com>

load new topology file with speaker capture pipeline.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 2161b3b..7f6ef82 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -79,7 +79,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98390_spk_codecs,
 		.sof_fw_filename = "sof-cml.ri",
-		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+		.sof_tplg_filename = "sof-cml-da7219-max98390.tplg",
 	},
 	{},
 };
-- 
2.7.4

