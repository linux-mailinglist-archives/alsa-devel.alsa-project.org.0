Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5682A8B3B63
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7EA5DEC;
	Fri, 26 Apr 2024 17:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7EA5DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145273;
	bh=wJ+K0kGzDt7cV8Ivu/Cbi1pV10bEEu2u/O3vynYkHxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CzlURiSAhTbCMOqi82NUDu9/DKIXwmRKJ7COhJfPTpksoalzyjpEKeQP68yyYpmmC
	 2IBtf7qRV05N1Ib/dSAUjVAQJMYADAB/5ge2L58wLBV3UAvIwLVnW1TfM5yA6DX2pE
	 55AbKOpZaOqmcHj0xwQ4VzZxL6Ya81wuoSjBdg0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD110F80696; Fri, 26 Apr 2024 17:26:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBBBF8068C;
	Fri, 26 Apr 2024 17:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5098F805E9; Fri, 26 Apr 2024 17:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04CB2F805AB
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04CB2F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LFgawC1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145147; x=1745681147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJ+K0kGzDt7cV8Ivu/Cbi1pV10bEEu2u/O3vynYkHxM=;
  b=LFgawC1EtnYwwPJTtKNQYAZceAv4qLV38OaLTVXU/pTWBtu/l02ZrUj7
   kZeOw0d0Dh/7aI5SC6LH4CBQ5HaqfGVmjv5nX0+XEL/imihcb/rbWEZba
   5qcFeWfzCTazkp49A3TnVmfcMZi3wwksJaF4FPkXo6GbFYSslO/BvLzmQ
   Nq3YdZmFP23M0XzNdhuihgGBjetcB8T3CgyXMWaPECP1DexZbox8Du1pV
   SKizimkjY2y2azo6U6l5cKoJ/vGAc08myM5g3aWmwB0jcoOphZqAxcOs/
   /YzbHr2yacQqw0YYKM0v6U5n90JT1bYkTlKi65TBId/lyWwMMbPZB6cQn
   g==;
X-CSE-ConnectionGUID: pxpepF2WRNSMZOskg7pxrg==
X-CSE-MsgGUID: 9ryOcgaDRBawQscOOs01SQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291299"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:43 -0700
X-CSE-ConnectionGUID: 3uzE7i83SnCaXox851EeQA==
X-CSE-MsgGUID: bhTPoK+5SdOPC/NUl2VcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259550"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/23] ASoC: Intel: sof_rt5682: add missing MAX98357A config
Date: Fri, 26 Apr 2024 10:25:13 -0500
Message-Id: <20240426152529.38345-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5YVM56TBP54D5BFRCXSWJLN2UV3KFFW4
X-Message-ID-Hash: 5YVM56TBP54D5BFRCXSWJLN2UV3KFFW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YVM56TBP54D5BFRCXSWJLN2UV3KFFW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

sof_rt5682 supports MAX98357A/MAX98360A amp. Select SND_SOC_MAX98357A
as needed.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cb3984b08d1f..8dfc1cc0f08e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -486,6 +486,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
+	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98390
 	select SND_SOC_RT1011
-- 
2.40.1

