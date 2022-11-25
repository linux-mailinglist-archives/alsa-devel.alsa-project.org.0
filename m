Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B3638FC7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:27:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E023174B;
	Fri, 25 Nov 2022 19:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E023174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400856;
	bh=+jpNXCjnA2vtqC68OJz5DzPsHQxplj15ix2RuVKRoFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ww4QT8/unlFsng9W6Ld/1rDYCyChUNH02GC5sbZ0FnAjFIy23XV1Jmk5Z6WbThgvP
	 wSNrDDJLPsQVAL470gJVh36FMnE21Ckxl6aI1NttH0OfMTumOzDAAIT6mhx9zyHWbO
	 Yopc11XzBFqfPw3CE5dGaAQmBYTfUrMXIhB/cLxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73970F805B6;
	Fri, 25 Nov 2022 19:23:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B1BDF80579; Fri, 25 Nov 2022 19:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43DEF80579
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43DEF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dk3U+RLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400633; x=1700936633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+jpNXCjnA2vtqC68OJz5DzPsHQxplj15ix2RuVKRoFQ=;
 b=Dk3U+RLdcEFmk8HzSGWbQdviTVtuffQXyJBdzVJw4Gm4YAU5JlZaoVWe
 ItStMwM/p0aUO+inaRfsFMykGW/zpsc85nQHI67SDlV3N5nzIrqXQXx8x
 VuQ3ukA0FtLA4Vl8JnRXMXtquQ9Iq9m+GmYyzUpKIcboFCR0o8lD/19U4
 oU2A8LMpZk2Ak5N//WuYeC0yNt5bfQQwGERToS/XX7CJMGJpCiyKFaVqw
 9b6gikxt9OMF5EzlntWuFW67xbg3oIKmXJAeNINKsLEpgPv7hFOwUWX4+
 9nn9wrDMFmyW5Ng/rrCzFdqb4wKMQSnwZ1BY44xcYfKl0DRwsZhLz15gh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909234"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005596"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005596"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/11] ASoC: Intel: avs: rt5682: Refactor jack handling
Date: Fri, 25 Nov 2022 19:40:32 +0100
Message-Id: <20221125184032.2565979-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Use link->exit() rather than pdev->remove() to unassign jack during card
unbind procedure so codec link initialization and exit procedures are
symmetrical.

Also, there is no need to perform search for codec dai in suspend_pre()
and resume_post() ourselves. Use snd_soc_card_get_codec_dai() instead.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt5682.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 7f9edf4cbd04..473e9fe5d0bf 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -120,6 +120,11 @@ static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 	return 0;
 };
 
+static void avs_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component, NULL, NULL);
+}
+
 static int
 avs_rt5682_hw_params(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params)
 {
@@ -239,30 +244,19 @@ static int avs_create_dapm_routes(struct device *dev, int ssp_port,
 	return 0;
 }
 
-static int avs_card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
-{
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component)
-		snd_soc_component_set_jack(component, jack, NULL);
-	return 0;
-}
-
-static int avs_card_remove(struct snd_soc_card *card)
-{
-	return avs_card_set_jack(card, NULL);
-}
-
 static int avs_card_suspend_pre(struct snd_soc_card *card)
 {
-	return avs_card_set_jack(card, NULL);
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, AVS_RT5682_CODEC_DAI_NAME);
+
+	return snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
 }
 
 static int avs_card_resume_post(struct snd_soc_card *card)
 {
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, AVS_RT5682_CODEC_DAI_NAME);
 	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
 
-	return avs_card_set_jack(card, jack);
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
 static int avs_rt5682_probe(struct platform_device *pdev)
@@ -306,7 +300,6 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	card->name = "avs_rt5682";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
-	card->remove = avs_card_remove;
 	card->suspend_pre = avs_card_suspend_pre;
 	card->resume_post = avs_card_resume_post;
 	card->dai_link = dai_link;
-- 
2.25.1

