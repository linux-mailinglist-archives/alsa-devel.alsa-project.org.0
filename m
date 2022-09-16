Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665E5BA6BD
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94EE71A3B;
	Fri, 16 Sep 2022 08:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94EE71A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309471;
	bh=ZfsU0TQ4rXI7RzKjnLE/eOovCKhr/+2a/6gMwBj3s4g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ld1BN7mIZW1rVsNLCxPAFsy6XVdoV6srnHM8lInBQ1l2KkdAGE8Wn+f8LrE30h6NP
	 KNZZMoEkrYhd3FzuFgHxzFzC6LTYlC8+vGE2AK2Z46pA5vQMAJezmtgdjr3A5PO5pY
	 dvaklGJxy45eEY2AqygltnXmDV2WisdzAkBNa8uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 960E1F80496;
	Fri, 16 Sep 2022 08:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64BF4F8024C; Fri, 16 Sep 2022 08:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02622F8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02622F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Due9kOWj"
Received: by mail-pl1-x62e.google.com with SMTP id t3so20523392ply.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=9WPnJIv68r3eHx97tiSao6RMaGX0K8/r7hr7MDhMuGo=;
 b=Due9kOWjZZPGsq8FRnTRNIvIOkaZFODGtW3UDMmy3OiwDfprjm2XHaCf0WPdabMdaH
 GcbvfNPt+9GGUsRu2Ez80bPVJ3d5qVIHiZlKP9Jw7XgnhjgevlrG+WflR00z6lT1GpVM
 IRcU+Bbw07eKJ3T4IOdZK8CtyqLJ4yppfeRCJnk4NFfWlxLyF7Cvc1Q4o/2P+HxkIvw1
 Hw+8pDpBNMErzfGsQ5sgwzVFldVlNyuquRHlWAKPiEMSDJn+u3AM4xJCo3mT24gzlj+l
 rV3l4/ORauMDdptHccIrRIBXTsv2E1u5roypX5AtIHzwvq+ZWuuiVTw41feuKRE9g2AX
 VQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=9WPnJIv68r3eHx97tiSao6RMaGX0K8/r7hr7MDhMuGo=;
 b=MlaxzXJv77ZhHck0V2uEZ2CJzwkvjMoOl+g39UYv4+76WNm/9GTGyQEJuvDJugiZ4G
 rh8/M7PRVj+zsRhGOej/fOQWY/YN175FmzKWxoouTjhBUEj7AIKqfb1lXAAbj0Xgs7Qs
 q75KKmgVZhMAFRPgCT0SmUXQk5jCPWy8Awm8ZAPvvpe9WvVClWDc6+d/TUXJNu3X/rI9
 DJ1RAwFIFdZoVRM75nUBNYFs/f1pdWNBC/KBNtMoRF6XQbZyHFhHj5l7IeRujU8fDUpI
 KFZnaTnHkwWD5dMr3tJAlaS3Ifs68SxMMIqvXxO4cS1lnAj9EgNEVRFTiDiklQQb1kXZ
 F3Mg==
X-Gm-Message-State: ACrzQf1HF0DLlPSc5L/GrEFzn4PZI/PrK0f8LVg3j5GhMTyHrrgeQDlU
 RGTJXbLjfAyTzjkICS+MKQ8=
X-Google-Smtp-Source: AMsMyM5oCsHdiZ80TKLRHXynQhP+KlKYJqa+uIjMCefAmfB6p+7MmQUiXWXM7hGROC6FzVUXYGmkOw==
X-Received: by 2002:a17:902:c941:b0:177:e69a:a517 with SMTP id
 i1-20020a170902c94100b00177e69aa517mr3301595pla.144.1663309405815; 
 Thu, 15 Sep 2022 23:23:25 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 z129-20020a626587000000b00537e1b30793sm13972305pfb.11.2022.09.15.23.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:23:25 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: Intel: sof_nau8825: use function
 devm_kcalloc() instead of devm_kzalloc()
Date: Fri, 16 Sep 2022 06:23:20 +0000
Message-Id: <20220916062320.153456-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com, akihiko.odaki@gmail.com,
 ye xingchen <ye.xingchen@zte.com.cn>, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, yong.zhi@intel.com
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Use 2-factor multiplication argument form devm_kcalloc() instead
of devm_kzalloc().

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/intel/boards/sof_nau8825.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 8d7e5ba9e516..5585c217f78d 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -355,10 +355,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	struct snd_soc_dai_link *links;
 	int i, id = 0;
 
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
-			     sof_audio_card_nau8825.num_links, GFP_KERNEL);
-	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
-			     sof_audio_card_nau8825.num_links, GFP_KERNEL);
+	links = devm_kcalloc(dev, sof_audio_card_nau8825.num_links,
+			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
+	cpus = devm_kcalloc(dev, sof_audio_card_nau8825.num_links,
+			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
 	if (!links || !cpus)
 		goto devm_err;
 
@@ -421,9 +421,10 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 	/* HDMI */
 	if (hdmi_num > 0) {
-		idisp_components = devm_kzalloc(dev,
-						sizeof(struct snd_soc_dai_link_component) *
-						hdmi_num, GFP_KERNEL);
+		idisp_components = devm_kcalloc(dev,
+						hdmi_num,
+						sizeof(struct snd_soc_dai_link_component),
+						GFP_KERNEL);
 		if (!idisp_components)
 			goto devm_err;
 	}
-- 
2.25.1
