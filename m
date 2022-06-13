Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 257295482AA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3FC1862;
	Mon, 13 Jun 2022 11:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3FC1862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111475;
	bh=mWndD1v/L6Q/CUvI+lpqOu/cubY0weetbdZ0iqrfd+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hYb678yBRDgHOI58vsMZbDqbnnLL95ukqLFs1TfbbWnn8MnlYBoKGHgXNIJRQJZLp
	 JyCPYayvA7Rf3Q0qHkU5s1mrgo7q4XdQP9f9/+hqG3oqY1MoFRPKQtvwVqq4uKsPA3
	 KjszGhk1nNOzJQzyL6RMivdcBL8oWe/okw+vzVfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF712F805C0;
	Mon, 13 Jun 2022 11:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0812EF805B0; Mon, 13 Jun 2022 11:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C88F4F80588
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C88F4F80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hNhfSBK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111172; x=1686647172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mWndD1v/L6Q/CUvI+lpqOu/cubY0weetbdZ0iqrfd+I=;
 b=hNhfSBK2OnI9xu3k/QFMJIqNgyHcilOeL+lyTHyW4HONikxpS2OoYsJu
 1Nh6ySH9KtH+Ei/614T0XDiVVzoT3n//+zjYrx0LD0K1BEqIP+dpwhVc2
 4aCUu8cdnXAkJSg3ppgc2f6gXznGZxxlLsgthNLiKMS6Pl49xq9fUwuUd
 usHXDuJTIszlDY2X0ztri08anAuPr4ADMlnUt3KJZKNY6cVnYBNip/+7u
 X3Pu7uSslyI/NFvC3Vxk+wqUzSTYH+SDdBoRA20r/1qthhl/dKlREOT9M
 zsblQ6tZVLeIivsG6kS/xU53OwJGXWgDwJCR8liQcA203z90LJn2bOfDi w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753968"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753968"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639626279"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 16/17] ASoC: Intel: bdw_rt286: Refactor suspend/resume
Date: Mon, 13 Jun 2022 11:15:45 +0200
Message-Id: <20220613091546.1565167-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613091546.1565167-1-cezary.rojewski@intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
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

Make use of card->remove() rather than pdev->remove() to unassign jack
during card unbind procedure.

To reduce code size, define unified jack setter in form of
bdw_rt286_set_jack() and invoke it during remove(), suspend_pre() and
resume_port().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 50 +++++++++---------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 92fddf6061e8..106a06398858 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -199,43 +199,33 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	},
 };
 
-static void broadwell_disable_jack(struct snd_soc_card *card)
+static int card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
 {
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component) {
-		if (!strcmp(component->name, "i2c-INT343A:00")) {
-			dev_dbg(component->dev, "disabling jack detect before going to suspend.\n");
-			snd_soc_component_set_jack(component, NULL, NULL);
-			break;
-		}
-	}
+	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, "rt286-aif1");
+
+	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
 }
 
-static int card_suspend_pre(struct snd_soc_card *card)
+static int card_remove(struct snd_soc_card *card)
 {
-	broadwell_disable_jack(card);
+	return card_set_jack(card, NULL);
+}
 
-	return 0;
+static int card_suspend_pre(struct snd_soc_card *card)
+{
+	return card_set_jack(card, NULL);
 }
 
 static int card_resume_post(struct snd_soc_card *card)
 {
-	struct snd_soc_component *component;
-
-	for_each_card_components(card, component) {
-		if (!strcmp(component->name, "i2c-INT343A:00")) {
-			dev_dbg(component->dev, "enabling jack detect for resume.\n");
-			snd_soc_component_set_jack(component, &card_headset, NULL);
-			break;
-		}
-	}
-
-	return 0;
+	return card_set_jack(card, &card_headset);
 }
 
 static struct snd_soc_card bdw_rt286_card = {
 	.owner = THIS_MODULE,
+	.remove = card_remove,
+	.suspend_pre = card_suspend_pre,
+	.resume_post = card_resume_post,
 	.dai_link = card_dai_links,
 	.num_links = ARRAY_SIZE(card_dai_links),
 	.controls = card_controls,
@@ -245,8 +235,6 @@ static struct snd_soc_card bdw_rt286_card = {
 	.dapm_routes = card_routes,
 	.num_dapm_routes = ARRAY_SIZE(card_routes),
 	.fully_routed = true,
-	.suspend_pre = card_suspend_pre,
-	.resume_post = card_resume_post,
 };
 
 /* Use space before codec name to simplify card ID, and simplify driver name. */
@@ -278,18 +266,8 @@ static int bdw_rt286_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(dev, &bdw_rt286_card);
 }
 
-static int bdw_rt286_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	broadwell_disable_jack(card);
-
-	return 0;
-}
-
 static struct platform_driver bdw_rt286_driver = {
 	.probe = bdw_rt286_probe,
-	.remove = bdw_rt286_remove,
 	.driver = {
 		.name = "bdw_rt286",
 		.pm = &snd_soc_pm_ops
-- 
2.25.1

