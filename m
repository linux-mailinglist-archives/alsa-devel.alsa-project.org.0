Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401A439EE1
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A155116DB;
	Mon, 25 Oct 2021 21:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A155116DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635188530;
	bh=IOmXWbPhhviwwagnxkw8CrRT8OyOmSWF1iELZAjZMx4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMFrrohl7RiURxn760mZuePUjDIPNkMlHSAuVK3PoT0/zyOUM40AZkfTGT3NzZs4L
	 5IXlkSt7mskhL+jADK9ZOF4XYbMiV3SmBA6h3QeHyEKHuGuN7qTRy8AseE9h1N7JyS
	 WS1ADqBwDxe3Q2199i8i1fXbysU9CrQgicvqViCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1698CF80431;
	Mon, 25 Oct 2021 21:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26D83F80271; Mon, 25 Oct 2021 21:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E65CF80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E65CF80153
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216908154"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216908154"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:55 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554318460"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.118.197])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: rt5682s: use 'static' qualifier
Date: Mon, 25 Oct 2021 13:59:27 -0500
Message-Id: <20211025185933.144327-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
References: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Sparse reports the following warnings:

sound/soc/codecs/rt5682s.c:44:12: error: symbol 'rt5682s_supply_names'
was not declared. Should it be static?

sound/soc/codecs/rt5682s.c:74:26: error: symbol 'rt5682s_reg' was not
declared. Should it be static?

sound/soc/codecs/rt5682s.c:2841:30: error: symbol
'rt5682s_aif1_dai_ops' was not declared. Should it be static?

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index f6435b233a51..470957fcad6b 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -41,7 +41,7 @@ static const struct rt5682s_platform_data i2s_default_platform_data = {
 	.dai_clk_names[RT5682S_DAI_BCLK_IDX] = "rt5682-dai-bclk",
 };
 
-const char *rt5682s_supply_names[RT5682S_NUM_SUPPLIES] = {
+static const char *rt5682s_supply_names[RT5682S_NUM_SUPPLIES] = {
 	"AVDD",
 	"MICVDD",
 };
@@ -71,7 +71,7 @@ static void rt5682s_apply_patch_list(struct rt5682s_priv *rt5682s,
 		dev_warn(dev, "Failed to apply regmap patch: %d\n", ret);
 }
 
-const struct reg_default rt5682s_reg[] = {
+static const struct reg_default rt5682s_reg[] = {
 	{0x0002, 0x8080},
 	{0x0003, 0x0001},
 	{0x0005, 0x0000},
@@ -2838,7 +2838,7 @@ static int rt5682s_resume(struct snd_soc_component *component)
 #define rt5682s_resume NULL
 #endif
 
-const struct snd_soc_dai_ops rt5682s_aif1_dai_ops = {
+static const struct snd_soc_dai_ops rt5682s_aif1_dai_ops = {
 	.hw_params = rt5682s_hw_params,
 	.set_fmt = rt5682s_set_dai_fmt,
 	.set_tdm_slot = rt5682s_set_tdm_slot,
-- 
2.25.1

