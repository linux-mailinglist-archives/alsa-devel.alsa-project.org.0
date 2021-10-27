Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020BE43C057
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB4E16FB;
	Wed, 27 Oct 2021 04:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB4E16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635303231;
	bh=XfvAK7lAjxDSAZqjFbhwEbrWVs1MJ2uxOjKQh3/iQi0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n9X62q6aDjvxVAfsaW9immK3uiuwiR299UWTX4THrPIyuDcoqc5lJxtAjb2Mk17Oi
	 Euir/QyzMvw1SoUi5zjOyYTA7Mb76xtGsaXcbXrcFm0PnHLrduVuLwdk5nzGRqMPuq
	 ts4hppPpU+xUPyc+rm/+pK4R3b0Sd0lUal4txITU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BC0F8032B;
	Wed, 27 Oct 2021 04:52:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98777F8027B; Wed, 27 Oct 2021 04:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id C4C38F800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C38F800D1
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 3D70E1C8104D;
 Wed, 27 Oct 2021 10:51:53 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 27
 Oct 2021 10:51:52 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 27 Oct
 2021 10:51:52 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 27 Oct 2021 10:51:52 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: nau8825: add set_jack coponment support
Date: Wed, 27 Oct 2021 10:51:41 +0800
Message-ID: <20211027025142.25898-2-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211027025142.25898-1-CTLIN0@nuvoton.com>
References: <20211027025142.25898-1-CTLIN0@nuvoton.com>
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

Co-developed-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 67de0e49ccf4..c845f19b7c41 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2416,6 +2416,12 @@ static int __maybe_unused nau8825_resume(struct snd_soc_component *component)
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
@@ -2430,6 +2436,7 @@ static const struct snd_soc_component_driver nau8825_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(nau8825_dapm_widgets),
 	.dapm_routes		= nau8825_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(nau8825_dapm_routes),
+	.set_jack		= nau8825_set_jack,
 	.suspend_bias_off	= 1,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-- 
2.25.1

