Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98977310F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11BC4836;
	Mon,  7 Aug 2023 23:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11BC4836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442967;
	bh=QA7kHUykPDd0YjBfngflhZUlLrAxS1GzAate3UJRT+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V9uKo6vCNCVJmeG4WxuY99Ha/DH3kq46XXz4h3ItvroH4AjJ4N+3MVq18Ym8pu/xm
	 23SCHJMPHyXCiaow+4180OUjSyeKj2V5xZPYF8bTPwlZlbj2I14JAto4+i/D90wTdK
	 8xQ7dZmo3oAUjFYkukpLbYiQqZC0+aS2ZXaAQ6Mg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B58DF80632; Mon,  7 Aug 2023 23:11:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAA5F80633;
	Mon,  7 Aug 2023 23:11:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACFF3F805BB; Mon,  7 Aug 2023 23:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB4EEF80548
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB4EEF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=khjj8lSp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442625; x=1722978625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QA7kHUykPDd0YjBfngflhZUlLrAxS1GzAate3UJRT+4=;
  b=khjj8lSpXg2vySdK23RHo163JKYVfknQWvMQxtTm1WKHW1gJZa6tYKCp
   DpzcFD3lJYi3UwUpIS52mrqI4yy2G1+8B+/CdoYZZah1qp5pSZE17QTX8
   H754vmcolFJsK8cga47hcgmZiT1EQVhPWdp75zu6yBXaYOwMtGsqseJFO
   Dfrcgz8ZYqZJ7NOzMYGaTmZVNcyVpvjKi1ZcKZKc6nUvU1J32tTQNV/R3
   csaOSCcTh3rjQWOQvzbVZwixK9PNqvtNoICgRs4gbKhFSar/LTpYVnop5
   e0SooKsL6o/LUKtx06BK/LAu0p2kuzl54PqWaXBcqLBsvy8r9gih0fiER
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244359"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244359"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465237"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465237"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 12/20] ASoC: SOF: Intel: hda-dai-ops: only allocate/release
 streams for first CPU DAI
Date: Mon,  7 Aug 2023 16:09:51 -0500
Message-Id: <20230807210959.506849-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WQW4WAZZQBEWCGOXQIYVDOVNG3C5JDAJ
X-Message-ID-Hash: WQW4WAZZQBEWCGOXQIYVDOVNG3C5JDAJ
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

When we have multiple CPU DAIs in a dailink, typically for SoundWire
aggregated solutions with amplifiers on multiple links, we only want
to allocate one HDaudio stream_tag. The simplest solution is to
allocate the hext_stream/stream_tag for the DAI with index 0 in the
dailink, and reuse the same stream for all other CPU DAIs.

This assumption relies on serialization of DAIs by the ASoC core,
where all CPU DAIs are handled in a loop.

The stream release follows the same idea of releasing the tag for the
first DAI only. Ideally we would want the loop to be handled in
reverse-order to summetry, but there is no risk of reusing a
stream_tag which is no longer valid.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index b66886244f24..9a6d995a8453 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -145,9 +145,17 @@ static struct hdac_ext_stream *hda_assign_hext_stream(struct snd_sof_dev *sdev,
 						      struct snd_soc_dai *cpu_dai,
 						      struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai;
 	struct hdac_ext_stream *hext_stream;
 
-	hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
+	/* only allocate a stream_tag for the first DAI in the dailink */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+	if (dai == cpu_dai)
+		hext_stream = hda_link_stream_assign(sof_to_bus(sdev), substream);
+	else
+		hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+
 	if (!hext_stream)
 		return NULL;
 
@@ -160,9 +168,14 @@ static void hda_release_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai
 				    struct snd_pcm_substream *substream)
 {
 	struct hdac_ext_stream *hext_stream = hda_get_hext_stream(sdev, cpu_dai, substream);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai;
 
+	/* only release a stream_tag for the first DAI in the dailink */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+	if (dai == cpu_dai)
+		snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
-	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 }
 
 static void hda_setup_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream,
-- 
2.39.2

