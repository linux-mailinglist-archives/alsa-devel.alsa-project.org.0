Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF84E86E4
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 10:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 661B2163F;
	Sun, 27 Mar 2022 10:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 661B2163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648369111;
	bh=cXGNLFQRGdyvUpfGS8BvRs/soDysMY24EBX4blom7AY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lVpn2rr0+BjDkdTXxrsGV9XgwFxDyIp/SAPvGzWU91SlYKVxtk5ImRbCYv4K6QbLc
	 5cleS23MhgKpExmU/unR8b4NDiJb4Cf9IIVBTLnKhB2KFAGrhciKeF2HQFQNHe3XHI
	 mTRApK9Qmakl545FTg3CHLPMTigw1Tqi7Crdz4CE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDAF6F8019B;
	Sun, 27 Mar 2022 10:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D708F800F8; Sun, 27 Mar 2022 10:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 444FBF800F8
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 10:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 444FBF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LAKy3CHd"
Received: by mail-pg1-x535.google.com with SMTP id b130so8473092pga.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=gk8h605KYyOaQkK8GayRXSvbqa84qjOB4akygZBA5nk=;
 b=LAKy3CHdIodKnQ+HOvEdnnQw8iw0xZlKosPEZUSXrRkUWJ//+VKiQd+cbIOeoUtP52
 mlhuysstOCwAXn5c91thFW8SkNi9dow/rkpmbHGiAdEIN4KTu3GRUjrZQvxe8VRw/Oxv
 cwaYHBmYnZc/HsT2Gr4R4laxRymuYI4ge9siqHlW6di2hYPeh/Rk9Rs8nM52er9vs4VT
 3UxD9EntXWGIT1gcuL3NsVPLLmgN06blXZ32mHwiL4p5sY7D7nUrqQcpFw5RbLdCwwpy
 ahJhKdWHiJQwtlkRjHMd0zvbZScUnCGNJ2LActIbvm4S4fWhtZZ58C6e05wH3xR3M6Xo
 M23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gk8h605KYyOaQkK8GayRXSvbqa84qjOB4akygZBA5nk=;
 b=H55HMpfxzz5kd0Z1RZ6oEwLjrNWoOzTT+DKcStn0ObOMBuQ2eb3JaJsesgeMDA+I8o
 sCmMDGn4kVYJNjmokvZjf0PTVIc9T1ajhMLq3A4hovUJMRiEUT3eX0vd8hiBfLCVY1km
 YYZ1bOU0jcqf8q3BHFCmWqvqLgF6hNez/33tmINVi49umNrhmecLziA75tgiXCuL77WN
 NE0cMDBYnuyZio73poEAIOCZ4VuXLG/CH5aaKvTeebLz+tsOw5vWxCz0QjSSPaFvjpOu
 5qrAhMeU1oNLnXn72Ez0WGbIoeKNwZIoAO9oMYpgXptr2doJb8JlMQWDyxLvEA3TUs4o
 jiiQ==
X-Gm-Message-State: AOAM533CAzho+99BtLSKW179dZWJUxNYN30K+nSrtW9DuKU+lMUvbQYT
 YE+OhzQdIhhYpkv9iD+IKT4q/cmS/20=
X-Google-Smtp-Source: ABdhPJzrMtufiuUSfPFRFyW/Lmgnl8OMtHUoxn5VcC8mJqseO1qEDX8kB+apZiI5JWTCwNez2mCBfA==
X-Received: by 2002:a05:6a02:105:b0:381:fd01:330f with SMTP id
 bg5-20020a056a02010500b00381fd01330fmr5885943pgb.483.1648369039023; 
 Sun, 27 Mar 2022 01:17:19 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 a7-20020a056a000c8700b004fb55798f64sm453861pfv.90.2022.03.27.01.17.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:17:18 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com
Subject: [PATCH] mediatek: mt8195: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 16:17:12 +0800
Message-Id: <20220327081712.13341-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, rikard.falkeborn@gmail.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 yc.hung@mediatek.com, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 stable@vger.kernel.org, dan.carpenter@oracle.com, trevor.wu@mediatek.com
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

The bug is here:
 mt8195_etdm_hw_params_fixup(runtime, params);

For the for_each_card_rtds(), just like list_for_each_entry(),
the list iterator 'runtime' will point to a bogus position
containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator,
otherwise it will lead to a invalid memory access.

To fix the bug, use a new variable 'iter' as the list iterator,
while use the original variable 'runtime' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: 3d00d2c07f04f ("ASoC: mediatek: mt8195: add sof support on mt8195-mt6359-rt1019-rt5682")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 .../mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 29c2d3407cc7..dc91877e4c3c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -814,7 +814,7 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai_link *sof_dai_link = NULL;
-	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_pcm_runtime *runtime = NULL, *iter;
 	struct snd_soc_dai *cpu_dai;
 	int i, j, ret = 0;
 
@@ -824,16 +824,17 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		if (strcmp(rtd->dai_link->name, conn->normal_link))
 			continue;
 
-		for_each_card_rtds(card, runtime) {
-			if (strcmp(runtime->dai_link->name, conn->sof_link))
+		for_each_card_rtds(card, iter) {
+			if (strcmp(iter->dai_link->name, conn->sof_link))
 				continue;
 
-			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
+			for_each_rtd_cpu_dais(iter, j, cpu_dai) {
 				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
-					sof_dai_link = runtime->dai_link;
+					sof_dai_link = iter->dai_link;
 					break;
 				}
 			}
+			runtime = iter;
 			break;
 		}
 
@@ -845,7 +846,8 @@ static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
 	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
-		mt8195_etdm_hw_params_fixup(runtime, params);
+		if (runtime)
+			mt8195_etdm_hw_params_fixup(runtime, params);
 	}
 
 	return ret;
-- 
2.17.1

