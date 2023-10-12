Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E87C7689
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271D5E72;
	Thu, 12 Oct 2023 21:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271D5E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138160;
	bh=h1FP9Nj+5lcKYxCeFBno4REm6pK3o80ij8/pdegV6UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TjNGbQpN5LCEtg4tDeUNwvm7xWDfGmCjhLcyikcP9UIU5o0KYaMoMsZEroprVzU1h
	 BKz6XSgn367QdEYUAK7Wln55jAgTsGa8DtkTeupGU820TrhfACi6jaNKF14YY4hOLg
	 Ieaj1RP+93eYRfuR7mxGBOS9Ml4PSIaIyorwXZgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA9B0F802E8; Thu, 12 Oct 2023 21:10:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 332CCF80552;
	Thu, 12 Oct 2023 21:10:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F296EF8058C; Thu, 12 Oct 2023 21:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06E9CF80552
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E9CF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZwRPkyOb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137741; x=1728673741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h1FP9Nj+5lcKYxCeFBno4REm6pK3o80ij8/pdegV6UE=;
  b=ZwRPkyOb0w6EMAXXFa+1Sa6069CekuV+pJd/hqfyOHL370KfJx3Co26E
   gUEYusFq7xsDNo72t8QF8KC9YKJ4WrtVpjxnmYtHBhWoHnBO48jLjN9Tu
   nn02QU4ppN5hehKuC6OFRdLGJ7mcVd/7TmNhYQqhVNSvHUuhmkbTvpQig
   5oblBATka73P1V+14j0KK2NO+HtpOfE2Pps5xPerK+6IA7BU+hF5W6Qoh
   YAYsugk2gr6k3hqfKKQiUMYZEeaqCozhUbhmf3qcEq529vYIeY3xuTyEx
   83nALIrSnTdyIYGBVy3cYWKbMdxtE8XOpZ2tApEZuQ6BmmaOWljv3oI2Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060185"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060185"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108065"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108065"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/23] ASoC: Intel: sof_sdw_rt712_sdca: construct
 cards->components by name_prefix
Date: Thu, 12 Oct 2023 15:08:09 -0400
Message-Id: <20231012190826.142619-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6QWMULBDBXEOXU6GT3MMX75D2HSUCJEB
X-Message-ID-Hash: 6QWMULBDBXEOXU6GT3MMX75D2HSUCJEB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QWMULBDBXEOXU6GT3MMX75D2HSUCJEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

sof_sdw_rt712_sdca is used by rt712 and rt713. Using different
cards->components string allow UCM distinguish the two codecs.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 84c8025d24e3..3092029419df 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -80,10 +80,12 @@ int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
 static int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:rt712-sdca-dmic",
-					  card->components);
+					  "%s mic:%s",
+					  card->components, component->name_prefix);
 	if (!card->components)
 		return -ENOMEM;
 
-- 
2.39.2

