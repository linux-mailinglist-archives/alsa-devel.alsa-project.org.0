Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD04394FD
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 13:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5F916D9;
	Mon, 25 Oct 2021 13:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5F916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635162068;
	bh=0Y3746nq1kBuRXifsuZITQ3vJOBnNTqQjB6msl86Lp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARohax9ALApiGY1NSE7FcsiODJibJDGyDJxVxmsyZnj5XHMta9rxZDe9qKmUviOR4
	 JrppsrMhYISDWx/QSidAJqZ9dtN+MYWkG31c3LCc2ZVKmMvsMPxv3JDi3gTKzUCwVw
	 HwSkJfxfB/s9/Wt24wWw1YDbgOyrYl85rhhttKqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0FF3F80166;
	Mon, 25 Oct 2021 13:39:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A13F8032B; Mon, 25 Oct 2021 13:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 5339CF80166
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 13:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5339CF80166
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id 470511C810A9;
 Mon, 25 Oct 2021 19:39:21 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 25 Oct
 2021 19:39:20 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 25 Oct 2021 19:39:20 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: nau8825: add set_jack coponment support
Date: Mon, 25 Oct 2021 19:38:57 +0800
Message-ID: <20211025113857.3860951-2-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
References: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotRedirectTo-PP: TRUE
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com, CTLIN0@nuvoton.com
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

Use set_jack ops to set jack for new machine drivers. Meanwhile,
the old machine drivers can still call previous export function
"nau8825_enable_jack_detect".

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/codecs/nau8825.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 67de0e49ccf4..e7a6bd918be3 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1434,6 +1434,12 @@ int nau8825_enable_jack_detect(struct snd_soc_component *component,
 
 	nau8825->jack = jack;
 
+	if (!nau8825->jack) {
+		regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+				   NAU8825_HSD_AUTO_MODE | NAU8825_SPKR_DWN1R |
+				   NAU8825_SPKR_DWN1L, 0);
+		return 0;
+	}
 	/* Ground HP Outputs[1:0], needed for headset auto detection
 	 * Enable Automatic Mic/Gnd switching reading on insert interrupt[6]
 	 */
@@ -2416,6 +2422,12 @@ static int __maybe_unused nau8825_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+static int nau8825_set_jack(struct snd_soc_component *component,
+			    struct snd_soc_jack *jack, void *data)
+{
+	return nau8825_enable_jack_detect(component, jack);
+}
+
 static const struct snd_soc_component_driver nau8825_component_driver = {
 	.probe			= nau8825_component_probe,
 	.remove			= nau8825_component_remove,
@@ -2430,6 +2442,7 @@ static const struct snd_soc_component_driver nau8825_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(nau8825_dapm_widgets),
 	.dapm_routes		= nau8825_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(nau8825_dapm_routes),
+	.set_jack		= nau8825_set_jack,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-- 
2.25.1

