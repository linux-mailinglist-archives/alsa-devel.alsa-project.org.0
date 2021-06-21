Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995593AF65F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 21:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261141674;
	Mon, 21 Jun 2021 21:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261141674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624304709;
	bh=kjesBnmvm2tSMNWJO2yj7Hkcp8L53AwZk54cC6sVvNg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ANY/K918BE4K/lHVzY8KPoEAFWCM1oUqC916i/7acLCCFT8zW9L+aY0ruWLIvzA06
	 bXKi0MRNf5Mo+4vfKxq9OP3Q3DkQXcq7JR30i1X0bLzZcN/S2F6BZmNbMKNk0UTtP2
	 0+A4iu3GqqfAYYBaRb7fhBxzO/FB9qDMmhn8aeoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F14C2F804F1;
	Mon, 21 Jun 2021 21:41:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23FABF80245; Mon, 21 Jun 2021 21:41:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65772F801D5
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 21:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65772F801D5
IronPort-SDR: Y9NdEivrYwvaCx0XroZv6zmbr+gpsDqINj8d7Z2he4azWO/apSDCGmX+acwF+X7OpOVcnew9nv
 QzO5D9PtUJSg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="203903339"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="203903339"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:23 -0700
IronPort-SDR: 2Q3gyYkGzjpDXTHYlqg5PJ3QNjoeVsswxBwnVXdsSWvF4tG7prQ/JCTXu6zcQe1yGcDI8NU/wz
 FBOqIysXv9UA==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="486619079"
Received: from gwhaugh-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.175.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/10] ASoC: Intel: sof_sdw: fix signed/unsigned warning
Date: Mon, 21 Jun 2021 14:40:54 -0500
Message-Id: <20210621194057.21711-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
References: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>
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

Sparse throws the following warning:

sound/soc/intel/boards/sof_sdw.c:796:31: error: incorrect type in argument 6 (different signedness)
sound/soc/intel/boards/sof_sdw.c:796:31:    expected int *group_id
sound/soc/intel/boards/sof_sdw.c:796:31:    got unsigned int *

The group_id cannot be negative, use unsigned int.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 34f142d7b3f9..e9118234b30e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -682,7 +682,7 @@ static int set_codec_init_func(const struct snd_soc_acpi_link_adr *link,
  */
 static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
-			  int *codec_num, int *group_id,
+			  int *codec_num, unsigned int *group_id,
 			  bool *group_generated)
 {
 	const struct snd_soc_acpi_adr_device *adr_d;
-- 
2.25.1

