Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41D8D0E53
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01CCE68;
	Mon, 27 May 2024 21:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01CCE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838900;
	bh=YUZRQX2mKZ5gfIkh+Vr07Pz1IYqZFFFZgqwYlxYqv4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hKh4JaPbCu3mj8e8YJ5y6AseCfRdMmuoG3A9yZnWmSMHlFB7KpbUtesI0Mer+to1N
	 axLN9iy8Sr/Ttle/mvBeBoTPqC+eY33YlkokhZmRK7smrV3rdux9/LTxaX2E5WoJEg
	 hCIDRIAAk0LyUmXe2xJKbWkcM8ludlf4kxD1oY90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24D18F80673; Mon, 27 May 2024 21:38:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCCDF80652;
	Mon, 27 May 2024 21:38:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A064CF80634; Mon, 27 May 2024 21:38:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F272F804B2
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F272F804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vhp0RxLF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838580; x=1748374580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YUZRQX2mKZ5gfIkh+Vr07Pz1IYqZFFFZgqwYlxYqv4I=;
  b=Vhp0RxLFnXnI+YbHLAwG1DSLpKIWBXCaAj3f+pqMqiywojGBqdJl2kOd
   a4MiPYf6HNNchvK6pvnjchLKURjSwOBCuIN6unBaOmn0HMOLNJ/knnDqS
   fto8S28R8/D1e3uyz87wTdnfPaS7+JxKWzlsVUbiMUW/Zcg7cVgIdozcM
   p8soqRUZYWc5jJscp0p3dhD2WMf+OI/hPzBdzrGvypMTIHBIuJsN8tK/V
   segjwIvmmB3DT7+AXh5LSk2N2raTZskPNCvxtlmdNooixZpbeWCQgjK6P
   y5R+vHoQSgjmfzCzZxrzxdIIfPsVHq2gIBsHdM9+vX8tNqhGQ+tZ57J8c
   Q==;
X-CSE-ConnectionGUID: knksUEz7TuKdHraAS7D50Q==
X-CSE-MsgGUID: KpFgiBeUSYKbqHP/bm1M7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339338"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339338"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:13 -0700
X-CSE-ConnectionGUID: KixdqEyuTE+4jttLsMiIPA==
X-CSE-MsgGUID: dfQbgSOwRL+qeAcre3UfFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029762"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai
 parameter
Date: Mon, 27 May 2024 14:35:40 -0500
Message-ID: <20240527193552.165567-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3WAKPY5QIIR62WNSBDDHXMFMIJ752X73
X-Message-ID-Hash: 3WAKPY5QIIR62WNSBDDHXMFMIJ752X73
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WAKPY5QIIR62WNSBDDHXMFMIJ752X73/>
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
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 012195c50519..4254e30ee4c3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -74,10 +74,6 @@ static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"rt711", "rt712", "rt713", "rt722"
-};
-
 /*
  * The sdca suffix is required for rt711 since there are two generations of the same chip.
  * RT713 is an SDCA device but the sdca suffix is required for backwards-compatibility with
@@ -91,17 +87,12 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *d
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 	int i;
 
-	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:%s",
 					  card->components, component->name_prefix);
-- 
2.43.0

