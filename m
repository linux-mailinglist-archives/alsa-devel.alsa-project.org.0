Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD095673F0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 18:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA0816FA;
	Tue,  5 Jul 2022 18:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA0816FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657037589;
	bh=8/q1hXVhKg9yQEzY3bhW4w5a4akFV783q++XCNoIrns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7AhyBIGy3c5+KzF8/3jogmN7N2uMtRvzTPHXstZh7d0kD6v2Rrii7R26jdwhVbbD
	 MeJ0NRUY2hj/AHvmNrClf7lFJX1FCsqxDkubpf4A6Olp983RrzVNXj/LiOVkNNxgg1
	 A7H5j2HoHatGLKzpGDWjrZvz+hFfg9JzLyEbT4hA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0835F80538;
	Tue,  5 Jul 2022 18:11:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C386F80104; Tue,  5 Jul 2022 18:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF0D2F80104;
 Tue,  5 Jul 2022 18:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0D2F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LYxCTWCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657037488; x=1688573488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/q1hXVhKg9yQEzY3bhW4w5a4akFV783q++XCNoIrns=;
 b=LYxCTWCVrCqLB1xusyhi3+SUe59sjTDNUux0TH0ZpeHzfhdJdq06F6P/
 YAcGiyFkLq+JyW/AtOveAAU5x3+f1CmT3Ido0H2FWu13LuV7R1kRTlzYx
 pyb+AtJSThe7UTWq9K719iumBHn5KrMBD3rVNptOFE6QjUs5/l3pv8o9R
 TGJntbiMOYOBtx1miPS8B2PSZfMMjw3fx4Mf8Vk5ry7/fGNf8CRCA2R4n
 ojE9cICqbEip89mj8ytbo2ga8L3mcoPShB20bBKND89axrOF0a612PZDz
 3JC5t0bd3PJDOLKUX9ImwgHqvE80HqAzFIdGVD/4xBG+JyhbzNnNIvTVi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="263815543"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="263815543"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 09:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="592972442"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 05 Jul 2022 09:11:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2B286CE; Tue,  5 Jul 2022 19:11:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: SOF: Intel: byt: remove duplicating driver data
 retrieval
Date: Tue,  5 Jul 2022 19:11:02 +0300
Message-Id: <20220705161102.76250-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
References: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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
v2: new patch (Pierre)
 sound/soc/sof/intel/byt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 4ed8381eceda..e6dc4ff531c3 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -465,10 +465,7 @@ static int sof_baytrail_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	desc = device_get_match_data(&pdev->dev);
-	if (!desc)
-		return -ENODEV;
-
+	desc = (const struct sof_dev_desc *)id->driver_data;
 	if (desc == &sof_acpi_baytrail_desc && soc_intel_is_byt_cr(pdev))
 		desc = &sof_acpi_baytrailcr_desc;
 
-- 
2.35.1

