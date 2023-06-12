Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F204C72B603
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 05:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8415A83A;
	Mon, 12 Jun 2023 05:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8415A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686539991;
	bh=5ZigPkJDIXift16/nF0BqzBHx5umgdG3eHZSsE529p8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UaLydcf3i/DaDk9SmhTBiW9yKj1Z3SwHGEQRnhiFMzUv9nih7IwMlu8SdNpRReiv1
	 ux53IgNf4JCTPmlLmoIgckaetZKCgk4qoCxEGRmuUTdWXo7ViD1jSlxc+kAJYKxoI/
	 v3+C7CUlIll4A+8PBTvRVztN/+dRs0XlyQKDRB1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22193F805F5; Mon, 12 Jun 2023 05:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49A23F805EC;
	Mon, 12 Jun 2023 05:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA706F805E5; Mon, 12 Jun 2023 05:15:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B4BEF80149
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 05:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B4BEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MWFjyJIM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686539695; x=1718075695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ZigPkJDIXift16/nF0BqzBHx5umgdG3eHZSsE529p8=;
  b=MWFjyJIMGwODS7DQioipgT8GEBGPZeNlmoEKMRcGSJilzeC3pGqHfP4/
   9vCj0ZiG+fzSrd+4McsT3Sj8aKB0LOnx5zsLTQcEXJBbSUI8dEyx5XSTu
   5HlnR3BreyNovUDjSm+bVIQV2IPG8JDk0xyyHYFVafuA6GNvz0A5BgvLl
   np6rsGwMpPrDI00qMzf/msetYYyzgI39diEV/bdvbbzFX8ym+O4wmjoYf
   24B096C5I361OC3jI+OsZkU3+qN1sN3tl//9dxaoLD94Jk/DC2cxxIzNT
   AtjCX/T7mnJHIQbw5e7B3HU+KIfRs43OroKEIT47dOL/UrMnKKPAqaQM4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347578922"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="347578922"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 20:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776191901"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="776191901"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2023 20:14:49 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/12] ASoC: Intel: avs-hdaudio: remove redundant dapm routes
Date: Mon, 12 Jun 2023 19:09:49 +0800
Message-Id: <20230612110958.592674-4-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612110958.592674-1-brent.lu@intel.com>
References: <20230612110958.592674-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P2ZXWWYJFOHL2JYPNIPYAFEYJSXMVWPU
X-Message-ID-Hash: P2ZXWWYJFOHL2JYPNIPYAFEYJSXMVWPU
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2ZXWWYJFOHL2JYPNIPYAFEYJSXMVWPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Three routes "HDMI 0 Playback<-hdaudioB0D2-cpu0 Tx",
"HDMI 1 Playback<-hdaudioB0D2-cpu1 Tx" and
"HDMI 2 Playback<-hdaudioB0D2-cpu2 Tx" are created by
snd_soc_dapm_connect_dai_link_widgets() automatically. Remove the
duplicate routes.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 65 +---------------------------
 1 file changed, 1 insertion(+), 64 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index a542a67e21d0..cb00bc86ac94 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -64,56 +64,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 	return 0;
 }
 
-static int avs_create_dapm_routes(struct device *dev, struct hda_codec *codec, int pcm_count,
-				  struct snd_soc_dapm_route **routes, int *num_routes)
-{
-	struct snd_soc_dapm_route *dr;
-	struct hda_pcm *pcm;
-	const char *cname = dev_name(&codec->core.dev);
-	int i, n = 0;
-
-	/* at max twice the number of pcms */
-	dr = devm_kcalloc(dev, pcm_count * 2, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
-
-	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
-		struct hda_pcm_stream *stream;
-		int dir;
-
-		dir = SNDRV_PCM_STREAM_PLAYBACK;
-		stream = &pcm->stream[dir];
-		if (!stream->substreams)
-			goto capture_routes;
-
-		dr[n].sink = devm_kasprintf(dev, GFP_KERNEL, "%s %s", pcm->name,
-					    snd_pcm_direction_name(dir));
-		dr[n].source = devm_kasprintf(dev, GFP_KERNEL, "%s-cpu%d Tx", cname, i);
-		if (!dr[n].sink || !dr[n].source)
-			return -ENOMEM;
-		n++;
-
-capture_routes:
-		dir = SNDRV_PCM_STREAM_CAPTURE;
-		stream = &pcm->stream[dir];
-		if (!stream->substreams)
-			continue;
-
-		dr[n].sink = devm_kasprintf(dev, GFP_KERNEL, "%s-cpu%d Rx", cname, i);
-		dr[n].source = devm_kasprintf(dev, GFP_KERNEL, "%s %s", pcm->name,
-					      snd_pcm_direction_name(dir));
-		if (!dr[n].sink || !dr[n].source)
-			return -ENOMEM;
-		n++;
-	}
-
-	*routes = dr;
-	*num_routes = n;
-	return 0;
-}
-
 /* Should be aligned with SectionPCM's name from topology */
 #define FEDAI_NAME_PREFIX "HDMI"
 
@@ -172,13 +122,12 @@ static int avs_card_late_probe(struct snd_soc_card *card)
 
 static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 {
-	struct snd_soc_dapm_route *routes;
 	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_dai_link *links = NULL;
 	struct snd_soc_card *card = rtm->card;
 	struct hda_codec *codec;
 	struct hda_pcm *pcm;
-	int ret, n, pcm_count = 0;
+	int ret, pcm_count = 0;
 
 	mach = dev_get_platdata(card->dev);
 	codec = mach->pdata;
@@ -200,18 +149,6 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 		return ret;
 	}
 
-	ret = avs_create_dapm_routes(card->dev, codec, pcm_count, &routes, &n);
-	if (ret < 0) {
-		dev_err(card->dev, "create routes failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, routes, n);
-	if (ret < 0) {
-		dev_err(card->dev, "add routes failed: %d\n", ret);
-		return ret;
-	}
-
 	return 0;
 }
 
-- 
2.34.1

