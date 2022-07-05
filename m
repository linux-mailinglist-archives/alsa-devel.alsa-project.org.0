Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AFF5673A5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 17:59:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE2516BF;
	Tue,  5 Jul 2022 17:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE2516BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657036775;
	bh=4UcFBdwVPNGp4VMF2eOGRnKawTrULmg2jhiKGa5OAmM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mCyeBmdUwFunudu/0Ct/YgGUO/rM8eq5ndE8R6c2aClUYqpP9mz4jhCaNjFV5HRHR
	 RXkXGkZRTOtLbZr5LVlrm84j8nG9BkK8o0z2ZCut6gN9xR6ujHTNvprFW3h2xjWigr
	 mAAA9iCRPKwMI826hhfSj9zVch1VW3rlfU7rjNwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5425CF80212;
	Tue,  5 Jul 2022 17:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE48CF800CB; Tue,  5 Jul 2022 17:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC76F800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 17:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC76F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VpRSODC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657036708; x=1688572708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4UcFBdwVPNGp4VMF2eOGRnKawTrULmg2jhiKGa5OAmM=;
 b=VpRSODC1OqZdy/WZKun/8ByUPRYG9kVXdLytM6G1IS25SJCAWq+PapH7
 m6qAn2WJc7f35ctyIaCZWo1dXumVEGQecEtYTgy+1tQrsSyLPIkqjGM8F
 9sXPZ2eMrsVGBUEw7lYHRh7AjlvPcItZ2RXdgiH1ZIjr8NElafOVKbv5S
 VUPbreHDQTOOvexKnKabfrAf8E/QnKf+pdYPzJsVcq5syhSgSPpowSys+
 YRHDOPAP7ZgUEMOAivgclbEcoEWRDsAb9ZwEWbfHk8cKfXQoPgxtk5JII
 mabPXTqcRq5gu9WYi9FuvhFgqAnyBLrkUov3eK0tctcPJBH++SyuFHpVE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="263178290"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="263178290"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 08:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="919769341"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2022 08:58:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id F069E1A0; Tue,  5 Jul 2022 18:58:15 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Date: Tue,  5 Jul 2022 18:58:13 +0300
Message-Id: <20220705155813.75917-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

device_get_match_data() in ACPI case calls similar to acpi_match_device().
Hence there is no need to duplicate the call. Just assign what is in
the id->driver_data.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: moved spec assignment closer to its user (Péter, Czarek)
 sound/soc/intel/catpt/device.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 85a34e37316d..d48a71d2cf1e 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -254,14 +254,11 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	spec = device_get_match_data(dev);
-	if (!spec)
-		return -ENODEV;
-
 	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
 	if (!cdev)
 		return -ENOMEM;
 
+	spec = (const struct catpt_spec *)id->driver_data;
 	catpt_dev_init(cdev, dev, spec);
 
 	/* map DSP bar address */
-- 
2.35.1

