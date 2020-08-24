Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 031AF250342
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 18:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A78C51698;
	Mon, 24 Aug 2020 18:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A78C51698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598287330;
	bh=z7HQxv9VSgRcd7nBu9ujYpFT8TnEHBX4hITSL08r+ps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IHr5qSjHbpELw930MTs0EA+gUuWkuqjAX3g7l8Bi/4U2kHx3wd0gHJ1Jr9J7Kcd1M
	 100ARqQCr8GyGGFeMKCF6+CpGJjo7Pvz/7LgpEMp9fSpqFaGN3+chN66qfWQs1GbFA
	 Ll/yloAAHeygC0K9baxCnZ6nRxOverBbWlvD6vtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF41F802BC;
	Mon, 24 Aug 2020 18:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51B93F8025E; Mon, 24 Aug 2020 18:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 179BAF8013D
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 18:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 179BAF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HjFHXrSn"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD82D22DA7;
 Mon, 24 Aug 2020 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287140;
 bh=z7HQxv9VSgRcd7nBu9ujYpFT8TnEHBX4hITSL08r+ps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HjFHXrSnCSnLjtu77Wqh8xf3DzlWrWY4KIfKQfQSnIWMaqT+uGJktBdQ8v9BDMJzu
 hE9MzrHEMB6d2TUGH/ZwvNQEZQvtEpqRIMRxl6Ya8PaEIC5+3Lq3lcntc3KaZi/w60
 hRUQY3On1xa2q80cz31IJ8DUP/kCv+CGqMlWA6pI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/21] ASoC: wm8994: Avoid attempts to read
 unreadable registers
Date: Mon, 24 Aug 2020 12:38:35 -0400
Message-Id: <20200824163845.606933-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163845.606933-1-sashal@kernel.org>
References: <20200824163845.606933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>
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

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

[ Upstream commit f082bb59b72039a2326ec1a44496899fb8aa6d0e ]

The driver supports WM1811, WM8994, WM8958 devices but according to
documentation and the regmap definitions the WM8958_DSP2_* registers
are only available on WM8958. In current code these registers are
being accessed as if they were available on all the three chips.

When starting playback on WM1811 CODEC multiple errors like:
"wm8994-codec wm8994-codec: ASoC: error at soc_component_read_no_lock on wm8994-codec: -5"
can be seen, which is caused by attempts to read an unavailable
WM8958_DSP2_PROGRAM register. The issue has been uncovered by recent
commit "e2329ee ASoC: soc-component: add soc_component_err()".

This patch adds a check in wm8958_aif_ev() callback so the DSP2 handling
is only done for WM8958.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200731173834.23832-1-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8958-dsp2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 108e8bf42a346..f0a409504a13b 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -419,8 +419,12 @@ int wm8958_aif_ev(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wm8994 *control = dev_get_drvdata(component->dev->parent);
 	int i;
 
+	if (control->type != WM8958)
+		return 0;
+
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 	case SND_SOC_DAPM_PRE_PMU:
-- 
2.25.1

