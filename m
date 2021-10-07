Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDE425859
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 18:48:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC422165E;
	Thu,  7 Oct 2021 18:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC422165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633625300;
	bh=NS/fzMl2IJQhPVmzxMwpB9C7ho+4R7lcrkT748ZcAvk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YI+xkLwG787h7S0EB9VU6DO8ttQnmBwuvuvpfqdRo986doZZfL9UYrgFfXcoUxYOM
	 pQ3NccRpXF4rV9rCc/Zd0zu1Cc/rVTQ+2PM1/Q8VXhDWz8xS7hHuDuLGgyLmrDxc4o
	 FkElj8pQRl3Zptl0oPr1EVRwTDo0wRtgNQRSXJGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD76F8028B;
	Thu,  7 Oct 2021 18:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5EC5F8027D; Thu,  7 Oct 2021 18:47:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B4CAF800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 18:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4CAF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="213445777"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="213445777"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="522666011"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 07 Oct 2021 09:45:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CCB18299; Thu,  7 Oct 2021 19:45:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] ASoC: Intel: bytcht_es8316: Switch to use
 gpiod_get_optional()
Date: Thu,  7 Oct 2021 19:45:22 +0300
Message-Id: <20211007164523.27094-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007164523.27094-1-andriy.shevchenko@linux.intel.com>
References: <20211007164523.27094-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

First of all, replace indexed API by plain one since we have index 0.
Second, switch to optional variant and drop duplicated code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 171f3d8c5996..d8dcf63825a6 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -566,16 +566,12 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 
 	devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
 	priv->speaker_en_gpio =
-		gpiod_get_index(codec_dev, "speaker-enable", 0,
-				/* see comment in byt_cht_es8316_resume */
-				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-
+		gpiod_get_optional(codec_dev, "speaker-enable",
+				   /* see comment in byt_cht_es8316_resume() */
+				   GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(priv->speaker_en_gpio)) {
 		ret = PTR_ERR(priv->speaker_en_gpio);
 		switch (ret) {
-		case -ENOENT:
-			priv->speaker_en_gpio = NULL;
-			break;
 		default:
 			dev_err(dev, "get speaker GPIO failed: %d\n", ret);
 			fallthrough;
-- 
2.33.0

