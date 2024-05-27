Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645B8D0E51
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81CD4868;
	Mon, 27 May 2024 21:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81CD4868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838873;
	bh=ih6BwwZkBO8p6XkXeac4kg6IsIuNg8xO76PcQYXBbiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FvSeAJdVAuVE3KdBNSlVul8XUILpRqDBvfAz2IzfZ6c4r0W4rqSTc1M4Dewz0yYou
	 7AUwnmP90wQQjxFHqu69vAmAHbA8XCya2WbAa8eC2wsyKdRR4NcpUz+XtWeu2xXNOT
	 OJlj3byKe2PsMB30sSQLekVg9vlbtLSlrXtXHLgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DC13F80606; Mon, 27 May 2024 21:38:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA526F805FF;
	Mon, 27 May 2024 21:38:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE69F805B2; Mon, 27 May 2024 21:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6481DF800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6481DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FQ8q2Jks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838575; x=1748374575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ih6BwwZkBO8p6XkXeac4kg6IsIuNg8xO76PcQYXBbiM=;
  b=FQ8q2Jks+e4VgAn/5aX0h/0YG4r4sZXX7TTSfsjTcyjgnMlE21H6bMzE
   qazpeL8ti32XEjf9uUMkryVBaMQUHKsqSG+iLWgOcRB0jmBSfinKfReah
   HXzaz2YbFQQqIhSCqMNZq9koIDq9Sa3L+stKQtvQLU87Y2M6MJYmIzcnL
   i0UeO+lq7Te2xjED/5R59WPyITzf2qMsJ8OldaxVl2YmjT/bjc8ECg6a/
   kB0RR05TZynKM/d6UtY5PrM02DT/eU3Uz5zfKgkteoXjwSbDxCkdaCB4p
   Gxr85e94bg7JzlU4mr+zAwFeV6Ff4gEJYpvautjgYMJunIzCV+AnPL/xM
   g==;
X-CSE-ConnectionGUID: tYkSp00pT5O2ft0G7QSp5w==
X-CSE-MsgGUID: 44nX6E7TQB+pUjZNNKWq+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339315"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:09 -0700
X-CSE-ConnectionGUID: jcxOIgDSTH6Bp95YNKwlpQ==
X-CSE-MsgGUID: gJYznnWgS3mQERdT56hDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029753"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/18] ASoC: Intel: sof_sdw_cs42l42: use dai parameter
Date: Mon, 27 May 2024 14:35:35 -0500
Message-ID: <20240527193552.165567-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KRAAUC2ANXUMYR66Q46KSM2M64XEVXCV
X-Message-ID-Hash: KRAAUC2ANXUMYR66Q46KSM2M64XEVXCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRAAUC2ANXUMYR66Q46KSM2M64XEVXCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai is passed from the parameter. We don't need to find the dai
by name.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs42l42.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index fdb75fc71c26..fc18e4aa3dbe 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -36,24 +36,15 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"cs42l42"
-};
-
 int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 
-	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:cs42l42",
 					  card->components);
-- 
2.43.0

