Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CA302253
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 08:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C6B187D;
	Mon, 25 Jan 2021 08:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C6B187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611558654;
	bh=c6y2xFRNs/glxUJNYmbDYP5PJH7iCcOMo9ijZs4rGQI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y0qyffpfzgN5PymloCCmjKa1082J/dST/zq+Up8wG1LO8C4mZwU9DcTEDqbOhKIVh
	 3ihDPd9OdrnwnpUL9B0EGqfjvAHm4mR3Q03FZpkfmcMkunGN0fg4zQ82NSYsAaqCbo
	 mEaCM+Emb7pdFNtfiswYq3LMlZAtidkKIezPmvkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B4C1F804B1;
	Mon, 25 Jan 2021 08:08:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 927C8F8028B; Mon, 25 Jan 2021 08:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AB97F80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 08:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AB97F80130
IronPort-SDR: YaupjcGtrihzTT2WS5W9jbDnh6/WZTrmo3idxRQvQR756fM6L34wSCxY308xzCjXiKqbJ2JDuS
 rfTlzhTnNQCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264497717"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="264497717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2021 23:08:21 -0800
IronPort-SDR: KmBjNn8066C3NiYJdCML3+YpxcRkVU9vD1Wjm+XVNN1S8WukBZz+6XBnu9+DTr1MPP8CiSnCtP
 DAbS9FBvnckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="429154832"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 24 Jan 2021 23:08:19 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: Intel: adl: remove sof_fw_filename setting in ADL
 snd_soc_acpi_mach
Date: Mon, 25 Jan 2021 09:05:00 +0200
Message-Id: <20210125070500.807474-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
References: <20210125070500.807474-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

ADL will use sof-adl-s.ri if it is ADL-S platform. So let's use
the default_fw_filename in pdata->desc for the ADL FW filename.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 06b233d63b73..0aca340ebc25 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -44,7 +44,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.link_mask = 0x1, /* link0 required */
 		.links = adl_rvp,
 		.drv_name = "sof_sdw",
-		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-rt711.tplg",
 	},
 	{},
-- 
2.29.2

