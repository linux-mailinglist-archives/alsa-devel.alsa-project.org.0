Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0C9638FBE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933CE1798;
	Fri, 25 Nov 2022 19:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933CE1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400826;
	bh=Ysy69L8HM0YbGGAtnOYqJuWV/TUhDas/7vRkQNHYZnw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cM+7lTCQss5WZLIqvpFLSqKQZIJCi+dIT21PWMzgwj2wL8PIFXlSh34If42K/EGWf
	 WRQhEDlpDDT0zHLf/JIAiaVS4eGLI9pRIF5H7leqfOj9g50JgPdb9WY1sjHQQrdV3s
	 5Pba1BWhdjm0CxyaFNclHGedOMWlIDedIX8LWrs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F950F805A9;
	Fri, 25 Nov 2022 19:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E696F80579; Fri, 25 Nov 2022 19:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0F9CF80579
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F9CF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UD6MUTyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400629; x=1700936629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ysy69L8HM0YbGGAtnOYqJuWV/TUhDas/7vRkQNHYZnw=;
 b=UD6MUTyo4ttbaTZowa0sE5WipOG3r6bMVpT8J8oAtWbPosi/QinLeT/S
 Im9ykaX6IyDFU6LFAQLGQrawK56HQs7yEVYmT+E5fZ8g9CzKPRQuZOjXR
 wcdJov7WOIQNUU7ln1NPoQzo/NFEF1l95rgSP2xH7wtYCnjHDyaJnZh3K
 23Ituxx6ldEXiKs7PWZA9evdzZyk0zOL2uqjBR0KdUlm21sQOd5vQ6uxM
 80TWn13AoMJ4J2kfoh6rsHu0m+I954w8Tz9ossazH93hnbi+fOA/N55lz
 oUhvKZXlTeX5v4PrGMRYZAv887qmroMH9RnrlP6U0Xjt4QpqlAu76QDli Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909231"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909231"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005579"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005579"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 10/11] ASoC: Intel: avs: rt5682: Add define for codec DAI name
Date: Fri, 25 Nov 2022 19:40:31 +0100
Message-Id: <20221125184032.2565979-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Following commits will make use of it to find codec DAI, define it
first.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt5682.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 01f9b9f0c12b..7f9edf4cbd04 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -26,6 +26,7 @@
 #define AVS_RT5682_SSP_CODEC_MASK	(GENMASK(2, 0))
 #define AVS_RT5682_MCLK_EN		BIT(3)
 #define AVS_RT5682_MCLK_24MHZ		BIT(4)
+#define AVS_RT5682_CODEC_DAI_NAME	"rt5682-aif1"
 
 /* Default: MCLK on, MCLK 19.2M, SSP0 */
 static unsigned long avs_rt5682_quirk = AVS_RT5682_MCLK_EN | AVS_RT5682_SSP_CODEC(0);
@@ -184,7 +185,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5682:00");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "rt5682-aif1");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, AVS_RT5682_CODEC_DAI_NAME);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
@@ -194,6 +195,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->num_platforms = 1;
 	dl->id = 0;
 	dl->init = avs_rt5682_codec_init;
+	dl->exit = avs_rt5682_codec_exit;
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-- 
2.25.1

