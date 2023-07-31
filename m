Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6676A332
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C40FDF0;
	Mon, 31 Jul 2023 23:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C40FDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839954;
	bh=XhFb8HPXCtI8GJ2CUPoxt6HyksVXJHAZVG6unoEcZRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QUx3UtGJDgoWooEoO/chhP6F2td0jf0vpQE+aPiQY3ukdOwWOfPmyPfbrUS4ShMR0
	 IKbtIHKRRJ+Tpg56zfbG03Sp1CytTDThjPMtX33uN2n9/xRw39chlsHxpnj7IQTa2Q
	 LyPMvdV+9LB1jIW8fe7SzMdwcCMr0GL+aRU9REU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD2C2F805BE; Mon, 31 Jul 2023 23:43:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F53F805A1;
	Mon, 31 Jul 2023 23:43:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C68A7F8059F; Mon, 31 Jul 2023 23:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3175FF8025A
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3175FF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KLM8JaiD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839797; x=1722375797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XhFb8HPXCtI8GJ2CUPoxt6HyksVXJHAZVG6unoEcZRQ=;
  b=KLM8JaiDs7gIOX2KOOXE1zFfUV83IyethJS6i2oTCmGBVmPXznnwlOdP
   UPC9KH5++c62J6xHtWpeYN8ZTOy0yF9biq+rY1KhLR8uIN6ETxzUwjxLl
   8bbYhwdCF1IBSg1i1SDDTnuDOC0W1QGxMJrLyJwD9E0ihufZO9LbZB0Ii
   MVPBf1QeguXztCq4Dge7nWYd+0CwMhY2yeHgb4/AvSVLV2dPXjDzjZur6
   lH9wAcpv5t8PchTD56glXmTFJylSLkKQyf/PJImswWj9zqRgFeRw1mqUC
   d+bxCtPzR0HTaGYHc6qiFva4SfKzsQKqQZpz0LqGxt3+pwuQ2niichiMb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449754"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523535"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523535"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/23] ASoC: Intel: sof_sdw: rename link_id to be_id
Date: Mon, 31 Jul 2023 16:42:41 -0500
Message-Id: <20230731214257.444605-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XTFVFGCCM5NCPXSJAMN4Z27PVSAB4XMX
X-Message-ID-Hash: XTFVFGCCM5NCPXSJAMN4Z27PVSAB4XMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XTFVFGCCM5NCPXSJAMN4Z27PVSAB4XMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The link_id parameter in create_sdw_dailink is actually the BE link id.
Rename it to be_id to be consistent with the caller and less confusion.
No functionality change.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 7e43be46cfa8..acaedd3b2224 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1354,7 +1354,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      const struct snd_soc_acpi_link_adr *link,
 			      int *cpu_id, bool *group_generated,
 			      struct snd_soc_codec_conf *codec_conf,
-			      int codec_count, int *link_id,
+			      int codec_count, int *be_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic,
 			      bool append_dai_type,
@@ -1433,9 +1433,9 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (!codec_info->dais[dai_index].direction[stream])
 			continue;
 
-		*link_id = codec_info->dais[dai_index].dailink[stream];
-		if (*link_id < 0) {
-			dev_err(dev, "Invalid dailink id %d\n", *link_id);
+		*be_id = codec_info->dais[dai_index].dailink[stream];
+		if (*be_id < 0) {
+			dev_err(dev, "Invalid dailink id %d\n", *be_id);
 			return -EINVAL;
 		}
 
@@ -1492,7 +1492,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
-		init_dai_link(dev, dai_links + *link_index, (*link_id)++, name,
+		init_dai_link(dev, dai_links + *link_index, (*be_id)++, name,
 			      playback, capture,
 			      cpus + *cpu_id, cpu_dai_num,
 			      codecs, codec_num,
-- 
2.39.2

