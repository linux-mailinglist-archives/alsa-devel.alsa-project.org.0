Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4D6D9CA3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A6FF1D;
	Thu,  6 Apr 2023 17:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A6FF1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680796047;
	bh=dR84uI7ZBoQQJvfuEKdy3/8HXpaGr9DgN1ZNXegAeng=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fJ6X1yQwoDxJumdfwICtWI9canI+BnfTuPmJvlt2s4hfTU65Oqnmf8jVM8DBzRwsM
	 ykKnw2tk2MiMLhFe1u3rGFbWr2BekS/4bTaLLnZkJJdN+tjdbEj1sGiaPeFOEXVbV6
	 jhlHINkLim7cd/ohA6NMlNTrmL3RE3Woq08N71fI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4B8F80448;
	Thu,  6 Apr 2023 17:46:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C35C3F8051F; Thu,  6 Apr 2023 17:46:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90243F8026A
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90243F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cDTl/NmR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680795958; x=1712331958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dR84uI7ZBoQQJvfuEKdy3/8HXpaGr9DgN1ZNXegAeng=;
  b=cDTl/NmRWnsAAQIK0B9YMpaWZvmYhYLLLFMg9EGbTp1M6l4LaHEyvGPc
   jscXssYhTE9a4mrYis7fU4hjTEec2NjBYh8MJgI7OX+cfbett9d/NTTPS
   HpuTi0IEJsdgcpvGUouP28FRCeD/n2sU6SEytz/EDOMcXX/+DMEYBTNSV
   bcpJArzQ5bfoji8zun34l9nwjn27PBTYzUoD18sauMVn4oAkkvntO7m73
   sZHFuxYYC8yuGL/7lU56rJCS+Id1tkJVlo8jlf8PZ0Jebj0jB7xknrEjj
   AdbGe5ItjORbwB55N1ZmjQkD7OQmaerTxlXlARLuPTu/SBupM2t1VmGFF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331405440"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="331405440"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664516971"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="664516971"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:45:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98373: change power down sequence for smart amp
Date: Thu,  6 Apr 2023 10:45:35 -0500
Message-Id: <20230406154535.18205-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FLFVUVGOBZXLOLZDB4WJBESF27ZSGWRC
X-Message-ID-Hash: FLFVUVGOBZXLOLZDB4WJBESF27ZSGWRC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org, Long Wang <long.wang@analog.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLFVUVGOBZXLOLZDB4WJBESF27ZSGWRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Long Wang <long.wang@analog.com>

In order to avoid pop noise which occurs when switching
device from speaker to headphone, the amplifier should
power down first when stopping playback.

Signed-off-by: Long Wang <long.wang@analog.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/codecs/max98373.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index f90a6a7ba83b..fde055c6c894 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -31,7 +31,7 @@ static int max98373_dac_event(struct snd_soc_dapm_widget *w,
 			MAX98373_GLOBAL_EN_MASK, 1);
 		usleep_range(30000, 31000);
 		break;
-	case SND_SOC_DAPM_POST_PMD:
+	case SND_SOC_DAPM_PRE_PMD:
 		regmap_update_bits(max98373->regmap,
 			MAX98373_R20FF_GLOBAL_SHDN,
 			MAX98373_GLOBAL_EN_MASK, 0);
@@ -64,7 +64,7 @@ static const struct snd_kcontrol_new max98373_spkfb_control =
 static const struct snd_soc_dapm_widget max98373_dapm_widgets[] = {
 SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
 	MAX98373_R202B_PCM_RX_EN, 0, 0, max98373_dac_event,
-	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,
 	&max98373_dai_controls),
 SND_SOC_DAPM_OUTPUT("BE_OUT"),
-- 
2.37.2

