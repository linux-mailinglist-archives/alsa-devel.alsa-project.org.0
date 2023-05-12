Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0873700E98
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED919EB2;
	Fri, 12 May 2023 20:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED919EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915657;
	bh=ye9jusbayFAN6BeKWnMrN/yfoHmOtz2V7Wbp+pSA61A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cucj8hUeXnnV+BoTOnYT/OvTqVcZhTypHhZ5FKqDyOI24m4pV9rZCs3k32EpylACa
	 yp9wYYG/ndNel8xCN2k3HpHYHDiPywZeiJ/sXzUkYZtrggE8AZ3zathFe2N/W2KVlx
	 eQnxYo0rQ1UJeQTmZxLeDVbzwmNTYtVmDu76WYzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAE4AF805C9; Fri, 12 May 2023 20:18:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E75BF805C9;
	Fri, 12 May 2023 20:18:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9A9F80587; Fri, 12 May 2023 20:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9766F8053B
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9766F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kH4XByKr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915463; x=1715451463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ye9jusbayFAN6BeKWnMrN/yfoHmOtz2V7Wbp+pSA61A=;
  b=kH4XByKrpjriIseJloPleBlo0mJN8QQ4BWab8e31VCzGfMZ57VNFqkbP
   VNGN60sRu0fv54PGY+VlXDjnaJ0Xu6nphIpG9v3mk2pn9ZJZjH3haIAcD
   tvB/EpbSxxmVznttErHswC8YBHbyHUS8nbGmu5lUGa2+VEhrXEE5NHK8E
   NLekUbi91euYVwAcwx3lvGYw8PonP+tapXkxVGRMJlhpic0FK4LOvbt4h
   i7iPE05mBauCVNtBOh4lO3L/dSlc3q7ZdLuWObk02ky7ESgWyDm8sCyHp
   mb5hCGhd6rEUbt1j2jt3C5yup/ao7cPBiF/W/5TVh/GDa4rWDQlyCp2lt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223222"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223222"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895088"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895088"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 6/9] ASoC: SOF: Intel: hda-dai: move hda_dai_prepare() code
Date: Fri, 12 May 2023 13:16:59 -0500
Message-Id: <20230512181702.117483-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WH4SICZNRCHFOHXGRD3QBT7TY3LXE2VY
X-Message-ID-Hash: WH4SICZNRCHFOHXGRD3QBT7TY3LXE2VY
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WH4SICZNRCHFOHXGRD3QBT7TY3LXE2VY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Before we change the Kconfig support, move code around. No
functionality change with this commit in isolation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 7e71cce7f531..cdd842288811 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -259,14 +259,6 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 	return hda_dai_config(w, flags, &data);
 }
 
-static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int stream = substream->stream;
-
-	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, dai);
-}
-
 /*
  * In contrast to IPC3, the dai trigger in IPC4 mixes pipeline state changes
  * (over IPC channel) and DMA state change (direct host register changes).
@@ -325,6 +317,14 @@ static int hda_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	return 0;
 }
 
+static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int stream = substream->stream;
+
+	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, dai);
+}
+
 static const struct snd_soc_dai_ops hda_dai_ops = {
 	.hw_params = hda_dai_hw_params,
 	.hw_free = hda_dai_hw_free,
-- 
2.37.2

