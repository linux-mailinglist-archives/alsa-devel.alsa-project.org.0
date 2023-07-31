Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25AD76A33A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E97FDF6;
	Mon, 31 Jul 2023 23:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E97FDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840037;
	bh=QSZEaFY8AMkVL52kcnerQ3L5icJby/JL1zgARxHQ/Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ezf4K5zzu4ixkyr/YJBHiWJMfxHtWfFWOwGJ11zriCepTgSz5EaZoX9YEl6FURHy0
	 CT/qq/ExNOdN+sNrsaqR2JDN4QZXthcGjAMwYDPCUkg5LMAtpELHPDDrT2V6vg1UtJ
	 B8hd0lzQZBlkZfuqNcf17yiB9tAvOTY4SMCtwGw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F99F805F5; Mon, 31 Jul 2023 23:43:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B34A5F805EA;
	Mon, 31 Jul 2023 23:43:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C929F8059F; Mon, 31 Jul 2023 23:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7667F8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7667F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iXeYwbII
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839799; x=1722375799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSZEaFY8AMkVL52kcnerQ3L5icJby/JL1zgARxHQ/Fc=;
  b=iXeYwbIImHIgbAJGIgwdxfLcRDqKvKll1CCVWSBft7toCh5cNVHmJait
   9DQEFn+y7xHeUzPxXwz+Eq5RJTV0r8mPzPYa4NTR4khEGjHMWb6kgudos
   dZaDNAbztxRpNof58t9JpFUNhj9Nj4RvuXLnPitTJcH4N+MM3Afz6tdfc
   a89bZcOc+sBxnI94EMhvdoOdr3bbST8dgRFxkmxOU1eMOZELqxJxt0EnO
   RWDIvlF9fgrNYJd/ZsgDnelRk2psYLuvQ0kmPLp7UdDN00k1oAkhHJcrW
   mkxWvnMgl0H9kQAmQ568EsqnegPQEJBGgSWqKWZ0mMoOEVxNCK+oSfMZ3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449770"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449770"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523545"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523545"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/23] ASoC: intel: sof_sdw: Remove some extra line breaks
Date: Mon, 31 Jul 2023 16:42:45 -0500
Message-Id: <20230731214257.444605-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NJKFQJ6U6JEJXAI7EHEPDIEOYQTZX4N7
X-Message-ID-Hash: NJKFQJ6U6JEJXAI7EHEPDIEOYQTZX4N7
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
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0743bf04aa88..4f7ef83c21c5 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -523,7 +523,6 @@ int sdw_prepare(struct snd_pcm_substream *substream)
 	dai = asoc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
-
 	if (IS_ERR(sdw_stream)) {
 		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
 		return PTR_ERR(sdw_stream);
@@ -543,7 +542,6 @@ int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	dai = asoc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
-
 	if (IS_ERR(sdw_stream)) {
 		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
 		return PTR_ERR(sdw_stream);
@@ -631,7 +629,6 @@ int sdw_hw_free(struct snd_pcm_substream *substream)
 	dai = asoc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
-
 	if (IS_ERR(sdw_stream)) {
 		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
 		return PTR_ERR(sdw_stream);
@@ -1107,8 +1104,7 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 			     unsigned int mfg_id,
 			     unsigned int part_id,
 			     unsigned int class_id,
-			     int index_in_link
-			    )
+			     int index_in_link)
 {
 	int i;
 
@@ -1232,7 +1228,6 @@ static int set_codec_init_func(struct snd_soc_card *card,
 			int codec_index;
 
 			codec_index = find_codec_info_part(adr_link->adr_d[i].adr);
-
 			if (codec_index < 0)
 				return codec_index;
 
-- 
2.39.2

