Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728E773101
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:14:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F50B857;
	Mon,  7 Aug 2023 23:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F50B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442868;
	bh=wRw5XIStdyGsfS11BsszPNhOcjXB0lvs3TWpwiaHEa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rggpJ24tZak+noLPHd39n+DVoTNWsGCUyIrt4uFUqmNE+q9aUBh+CVJhgQxg2Mcw+
	 jUp2CoMpRJbh75F4rVesJYIraKOLhjEvq7GFTM4ZmhGWYA5d+9I59tLim7dtnwP8OO
	 qTAxin4eKmGmzCp+t4tRjIF9RMj1oYkB5UKgU4Ug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4DA3F805F7; Mon,  7 Aug 2023 23:10:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 289C3F805F1;
	Mon,  7 Aug 2023 23:10:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C01AAF805B2; Mon,  7 Aug 2023 23:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72D37F80552
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D37F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PBPX04Gu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442625; x=1722978625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wRw5XIStdyGsfS11BsszPNhOcjXB0lvs3TWpwiaHEa4=;
  b=PBPX04GuKk89PzH/EfnX43RT77Wd6o0hQD1Sc/1wtAOsjFUKNDmgEmwR
   6Gyi6B0VE/Fhw2vC3LkKo6x2+psDyW91lJBQtk++GAOOCKHhqobh/J3nA
   NoR/rg0jNgBEZdT3sqC9Kdex7oEoPeb14TUbnuJMqPXbIVqUZiqxLQDGt
   MI7LRQk14nLfuSU6Zyb/5biPoGrAa2UzL5olsYA2JwDjaj47p6forDiKJ
   3QeIXxLMJ6ngyQPRl2+BKfDUdKINibf/xGnB5/63MiqiobdHC3L6pEKRn
   2t1Fkqb9tC+uvGvsp56ps+Q1QcGBZYMnW0E7eT7LFWpYoOBmTdMQAV39C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244366"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465242"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465242"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 13/20] ASoC: SOF: Intel: hda-dai-ops: add ops for SoundWire
Date: Mon,  7 Aug 2023 16:09:52 -0500
Message-Id: <20230807210959.506849-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NHBLHIOZ5ITIY6HD4DS3D4TYNC7ZICU6
X-Message-ID-Hash: NHBLHIOZ5ITIY6HD4DS3D4TYNC7ZICU6
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Same abstraction as SSP/DMIC, with only the get_hlink helper changing.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 9a6d995a8453..4ae211141c40 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -296,6 +296,14 @@ static struct hdac_ext_link *dmic_get_hlink(struct snd_sof_dev *sdev,
 	return hdac_bus_eml_dmic_get_hlink(bus);
 }
 
+static struct hdac_ext_link *sdw_get_hlink(struct snd_sof_dev *sdev,
+					   struct snd_pcm_substream *substream)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	return hdac_bus_eml_sdw_get_hlink(bus);
+}
+
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
@@ -466,6 +474,19 @@ static const struct hda_dai_widget_dma_ops dmic_ipc4_dma_ops = {
 	.get_hlink = dmic_get_hlink,
 };
 
+static const struct hda_dai_widget_dma_ops sdw_ipc4_dma_ops = {
+	.get_hext_stream = hda_ipc4_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
+	.pre_trigger = hda_ipc4_pre_trigger,
+	.trigger = hda_trigger,
+	.post_trigger = hda_ipc4_post_trigger,
+	.calc_stream_format = generic_calc_stream_format,
+	.get_hlink = sdw_get_hlink,
+};
+
 static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.get_hext_stream = hda_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
@@ -591,6 +612,11 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
 				return NULL;
 			return &dmic_ipc4_dma_ops;
+		case SOF_DAI_INTEL_ALH:
+			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
+				return NULL;
+			return &sdw_ipc4_dma_ops;
+
 		default:
 			break;
 		}
-- 
2.39.2

