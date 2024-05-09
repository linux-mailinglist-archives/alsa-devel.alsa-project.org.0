Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5B8C1310
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 339BCE65;
	Thu,  9 May 2024 18:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 339BCE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272592;
	bh=NwPL9b9kOT7XFtkwmLOgpqy3mczmMWc5vCVdQ5uhZ0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pi30HMLyWx9/aEJCWNiSBCLDnxaFJav0dvCmXlApcbxNKNx2CdzshSA4zUll8xsU9
	 YQWDG7Wc8gwcWXUAWWCjA/1dJ4QhXQ9Tt6+ad19nmc40zDEK8y4e5rZVd6HKbOOLvq
	 1xGQhdvv8AVyNy7qLMvWvNnlrAS4b3fcwplD/obo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 781C5F80651; Thu,  9 May 2024 18:35:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8118F80636;
	Thu,  9 May 2024 18:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E424EF8057E; Thu,  9 May 2024 18:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 429FDF80564
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 429FDF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H3YVO3G3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272478; x=1746808478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwPL9b9kOT7XFtkwmLOgpqy3mczmMWc5vCVdQ5uhZ0M=;
  b=H3YVO3G3ueHIQILWbjHId5YjQP/2/A1i4j+YGo1t8Vf2hIUPYea76xzx
   XaHBYh0CqoLOp85QRXUWSV9MYdZreqgHU/ckhm5ptlw9fFd/gQPNoGcVw
   f8Ii3j5h0b65bC7H5n62j8eafW6KS8NxGDjJ3h4VjD/BRrnDXQkBoNw5Q
   5P9I6niY9Oi33twG6qz5wcGbRMvWsNsEb+gAVhNGk8JyH4GLzFwjXqq2L
   HlgsJkpHRniHZvU5JhrMkVueGBBvQdP40jU6f/CqwjTiD/yUXGuv7cEXo
   wN01DRH444qSLIcJ9RbubCIOSachBGX7MYNF//F4rO95EfGgqMuvGmtIn
   g==;
X-CSE-ConnectionGUID: M/JGkGUcTKSO/YqNobwZ2Q==
X-CSE-MsgGUID: e9nZhs80QY+XUcnNGuB64g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017553"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017553"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:29 -0700
X-CSE-ConnectionGUID: 9xaPMpyVRrOMLt/hMn2Dug==
X-CSE-MsgGUID: Z/tFoEiaRN2baXoyfFY/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761011"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/18] ASoC: Intel: maxim-common: add max_98373_dai_link
 function
Date: Thu,  9 May 2024 11:34:07 -0500
Message-Id: <20240509163418.67746-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4KSNHQVDRCEHPFYVYMSJUZMBHHMR5LMR
X-Message-ID-Hash: 4KSNHQVDRCEHPFYVYMSJUZMBHHMR5LMR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KSNHQVDRCEHPFYVYMSJUZMBHHMR5LMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function, max_98373_dai_link(), for machine driver to
initialize dai link of maxim max98373 speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 9 +++++++++
 sound/soc/intel/boards/sof_maxim_common.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 7e1f485dce7a..c38c5598d87f 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -188,6 +188,15 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_NS(max_98373_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
+void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link)
+{
+	link->codecs = max_98373_components;
+	link->num_codecs = ARRAY_SIZE(max_98373_components);
+	link->init = max_98373_spk_codec_init;
+	link->ops = &max_98373_ops;
+}
+EXPORT_SYMBOL_NS(max_98373_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
 void max_98373_set_codec_conf(struct snd_soc_card *card)
 {
 	card->codec_conf = max_98373_codec_conf;
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 8886f985de68..2d8257cc5229 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -25,6 +25,7 @@ extern struct snd_soc_ops max_98373_ops;
 extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
 
 int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link);
 void max_98373_set_codec_conf(struct snd_soc_card *card);
 int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
-- 
2.40.1

