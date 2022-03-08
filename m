Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41F4D217E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DACF18B6;
	Tue,  8 Mar 2022 20:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DACF18B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767833;
	bh=gIPidTCkt+hMG05SigVPkwXfKWSt3ku7znRlY3Y8WbE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YswBqJzpKc+gYP7WDqRQGI4Ox44NeNYFAlX3dqX7R/WvDOyuUSqIX0APvyQ6f43Uu
	 UYLqN7jUxAO51vfF63w9VozdPe4ReGCob4b+ZmT+/fHnks26+90AdPe4ohvWNOCNvt
	 y87Dhew5pIx3mmYmYsery05ud9QueFe4AmuRu0b8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C1EF80528;
	Tue,  8 Mar 2022 20:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EB90F8053C; Tue,  8 Mar 2022 20:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5D92F8051A
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D92F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cpGaZN5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767610; x=1678303610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIPidTCkt+hMG05SigVPkwXfKWSt3ku7znRlY3Y8WbE=;
 b=cpGaZN5O6XTSkdjIqFJP02/eYCQuI/bS4WaNUsCv3Mw+6NHFGod7+iAd
 8j51OG66tL5oio/Bn6/MWEsFCetP+85j/yjlD5NJYxDE4dmSucM1jM2D0
 a2R07kC9RVfi3apkPkz53Atb5WCjGfOPsP1xXsgw/4d4KhXIvxzwFC/Mc
 Hsxt6kKh/ulnfI+GD9eF9hQPvsO820BkjvJDjDTZBM/3MjG5VwQoxbDAf
 4PZH98vcNRh/ouxk1yTP9KeCyvKFHn3kELC3Eb5fglidehSFCcP39uZ6F
 KZ1B8+565xfrjKXZAUQe/XTyi16CvUcMazcidhAEV9Mf8aMuDh8fpT/lt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363719"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363719"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573969"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/20] ASoC: Intel: sof_es8336: make gpio optional
Date: Tue,  8 Mar 2022 13:26:01 -0600
Message-Id: <20220308192610.392950-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Do not fail if the GPIO used for speakers is not present, at least the
headphone, headset and internal mics should work.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e6d599f0cd26..eb792bd911fa 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -523,11 +523,10 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	if (ret)
 		dev_warn(codec_dev, "unable to add GPIO mapping table\n");
 
-	priv->gpio_pa = gpiod_get(codec_dev, "pa-enable", GPIOD_OUT_LOW);
+	priv->gpio_pa = gpiod_get_optional(codec_dev, "pa-enable", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpio_pa)) {
-		ret = PTR_ERR(priv->gpio_pa);
-		dev_err(codec_dev, "%s, could not get pa-enable: %d\n",
-			__func__, ret);
+		ret = dev_err_probe(dev, PTR_ERR(priv->gpio_pa),
+				    "could not get pa-enable GPIO\n");
 		goto err;
 	}
 
-- 
2.30.2

