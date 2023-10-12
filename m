Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485BA7C67D9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 10:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11335E85;
	Thu, 12 Oct 2023 10:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11335E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697100183;
	bh=b18PgqezDaaE8D/RmQSc5htXgKfAmXNwcnG5pPJ4Hrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NcNSmtjWzJwNTdva+ol3aC7wf6bY3KPln25nOhEWlIEZppuOdS3OzaIt2Mfyjlng1
	 yEXy0/5xQA1QO/iVnLqEiotpIwe4RnnahjRFSdPtuAnwXkIwdj5UrJ9pBPEOoRjfxX
	 lpe9OLmgDG0DuC27yva3fqFOf02UNpIulU4IUkGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 419DFF805F9; Thu, 12 Oct 2023 10:39:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 801A4F805EE;
	Thu, 12 Oct 2023 10:39:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B82D0F802BE; Thu, 12 Oct 2023 10:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E49DAF80571
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 10:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E49DAF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N4OtbgOj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099738; x=1728635738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b18PgqezDaaE8D/RmQSc5htXgKfAmXNwcnG5pPJ4Hrg=;
  b=N4OtbgOjAkv33HRzMcEiqgGFeUKqocI2aKfq8bEnm467phB5YSyaqMXV
   fFeM3XYypytxR4BvyiPslLQwX6wcDWJ5fFAIqMi/xq2gy0ff5Ryo8DUvM
   s8xpvf/Ts6esRHHXYfnLCNHSLgzVPwv1HQFRxxEFUMKQLHZYqX8Nar2oh
   RNIJF1+u+G4sr/6G8Bb5/gOBP1ZaGloN7ZVetN1Gm98IW3xZ3CriD8aif
   cC7y82n3O4cDvHME5KCb458uoInSUga7rzfrutDKdbcpAxU9qCKkUiDhS
   u3POWD/+mf03UECuqw+3CsKbqpwlKmAfk4W1+i4SBMdb7IzITRiYyMuUz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6417321"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="6417321"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824516709"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="824516709"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 01:35:34 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 15/16] ASoC: Intel: avs: rt5663: Validate machine board
 configuration
Date: Thu, 12 Oct 2023 10:35:13 +0200
Message-Id: <20231012083514.492626-16-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
References: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EOKP26JICZ6FD4AEB6TM5ZH6MKNABFGI
X-Message-ID-Hash: EOKP26JICZ6FD4AEB6TM5ZH6MKNABFGI
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOKP26JICZ6FD4AEB6TM5ZH6MKNABFGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for board to be used with TDMs.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt5663.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 2e84bd629766..3effd789a45e 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -15,6 +15,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "../../../codecs/rt5663.h"
+#include "../utils.h"
 
 #define RT5663_CODEC_DAI	"rt5663-aif"
 
@@ -133,7 +134,7 @@ static const struct snd_soc_ops avs_rt5663_ops = {
 
 
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
-			       struct snd_soc_dai_link **dai_link)
+			       int tdm_slot, struct snd_soc_dai_link **dai_link)
 {
 	struct snd_soc_dai_link_component *platform;
 	struct snd_soc_dai_link *dl;
@@ -145,13 +146,15 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	platform->name = platform_name;
 
-	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
+	dl->name = devm_kasprintf(dev, GFP_KERNEL,
+				  AVS_STRING_FMT("SSP", "-Codec", ssp_port, tdm_slot));
 	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
 	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
 	if (!dl->name || !dl->cpus || !dl->codecs)
 		return -ENOMEM;
 
-	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+					    AVS_STRING_FMT("SSP", " Pin", ssp_port, tdm_slot));
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5663:00");
 	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT5663_CODEC_DAI);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
@@ -200,13 +203,16 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 	struct rt5663_private *priv;
 	struct device *dev = &pdev->dev;
 	const char *pname;
-	int ssp_port, ret;
+	int ssp_port, tdm_slot, ret;
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
-	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
 
-	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
+	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
+	if (ret)
+		return ret;
+
+	ret = avs_create_dai_link(dev, pname, ssp_port, tdm_slot, &dai_link);
 	if (ret) {
 		dev_err(dev, "Failed to create dai link: %d", ret);
 		return ret;
-- 
2.34.1

