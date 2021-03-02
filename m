Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9932AC52
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55FD41AF2;
	Tue,  2 Mar 2021 22:35:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55FD41AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720963;
	bh=Al11bVZWOFSBD34GQkdChWF9YLIJH/XwJYR9rBcuLyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRCEn+DcKu4Rc0JnmV6OuCw/fFZwMaue+Z+R8CNgz6KVqG+wjpBRUM3NE+Vhpvmyv
	 2Whu66JGtUHU2UKCij22AJnVC+2KTB6oH5ebMZWQqKU/W7Z0AeDNV4inh42vpI1J3I
	 EUaV/Hen/0LWfX4gy6Va3YOe5vh2eDS2QlSZ7UdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B927F80558;
	Tue,  2 Mar 2021 22:26:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12F23F80527; Tue,  2 Mar 2021 22:26:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8D40F802A9
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D40F802A9
IronPort-SDR: yfBZnVF8QVjjaD385f43W2qaj0EXJGbkf4YL4/EJAyRHB3+LQ8CzMoyCQaN6tVfdsuO8hLZ+8d
 BhOhjqupPJYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174631449"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174631449"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:16 -0800
IronPort-SDR: u5viCwLYaLyRuyuKDXHP+zEmSEk0tWl3pC0sBI1B7JToos1g/oHdBbyxCornmlahDv45iDDhGQ
 gmFgLmLwtNow==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223492"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 23/24] ASoC: rt5682: remove useless assignments
Date: Tue,  2 Mar 2021 15:25:26 -0600
Message-Id: <20210302212527.55158-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
References: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

cppcheck warnings:

sound/soc/codecs/rt5682.c:1234:6: style: Redundant initialization for
'idx'. The initialized value is overwritten before it is
read. [redundantInitialization]
 idx = rt5682_div_sel(rt5682, dmic_clk_rate, div, ARRAY_SIZE(div));
     ^
sound/soc/codecs/rt5682.c:1228:10: note: idx is initialized
 int idx = -EINVAL, dmic_clk_rate = 3072000;
         ^
sound/soc/codecs/rt5682.c:1234:6: note: idx is overwritten
 idx = rt5682_div_sel(rt5682, dmic_clk_rate, div, ARRAY_SIZE(div));
     ^

sound/soc/codecs/rt5682.c:1263:6: style: Redundant initialization for
'idx'. The initialized value is overwritten before it is
read. [redundantInitialization]
 idx = rt5682_div_sel(rt5682, ref, div_f, ARRAY_SIZE(div_f));
     ^
sound/soc/codecs/rt5682.c:1248:25: note: idx is initialized
 int ref, val, reg, idx = -EINVAL;
                        ^
sound/soc/codecs/rt5682.c:1263:6: note: idx is overwritten
 idx = rt5682_div_sel(rt5682, ref, div_f, ARRAY_SIZE(div_f));
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index e4542200009d..8d5b8f01f55c 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1225,7 +1225,7 @@ static int set_dmic_clk(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	int idx = -EINVAL, dmic_clk_rate = 3072000;
+	int idx, dmic_clk_rate = 3072000;
 	static const int div[] = {2, 4, 6, 8, 12, 16, 24, 32, 48, 64, 96, 128};
 
 	if (rt5682->pdata.dmic_clk_rate)
@@ -1245,7 +1245,7 @@ static int set_filter_clk(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
-	int ref, val, reg, idx = -EINVAL;
+	int ref, val, reg, idx;
 	static const int div_f[] = {1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48};
 	static const int div_o[] = {1, 2, 4, 6, 8, 12, 16, 24, 32, 48};
 
-- 
2.25.1

