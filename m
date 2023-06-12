Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F272BBBB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 11:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B924A83A;
	Mon, 12 Jun 2023 11:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B924A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686560881;
	bh=jo+X8uO9gXWIQ4Yp4MLiXi4sgrrGbroD4LCNGNV+4M4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KgndU3nHe4Xa8S+EYM58Slf8VW/HWmldqlT1wycvMvNb/BYkyKlfoqaaznJWvFYc7
	 me2cVEcAVwY7FGtA4ND+/+CouFxaV5ZYLBLcR0vhEcM0W0QluvnWXyO96hQ5oPQNqk
	 yqKYHt1Yfoovfx2R3o1TYqCZEgRFDSsozmJ7sZmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7355F80552; Mon, 12 Jun 2023 11:06:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E9ACF80552;
	Mon, 12 Jun 2023 11:06:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E5AF8055C; Mon, 12 Jun 2023 11:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB723F800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 11:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB723F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JKzEkLKy
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-974638ed5c5so840586866b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686560767; x=1689152767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7+T9ror82USLosqb+kMl4rjrjfhje49/ZyOCNXi7ko=;
        b=JKzEkLKynaeNnaDVnKlCrW+rJ6NPX6yrmcjLwwFMzvrx+LGGoTZ46EYY9KmOQw5xDf
         L5ZAn2nVbhCbw7Q97Yeh089Uchbr+imzUnZk19tHLCuR8gJOGIiYQ+jkbvUXFX7hmqPR
         AUrQNYN6RKc4XrTUhbOWzTLCuBvZUJstuDZ7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686560767; x=1689152767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7+T9ror82USLosqb+kMl4rjrjfhje49/ZyOCNXi7ko=;
        b=JpWx9oagl55vtFdTnHNUmmKOtzsszhZzlJIRRHQRd9JR60WHQJ08xC2LAgizHH4bGq
         QXIbCqHsmkeTjOELEtxTCahbU5y92ZmIphNVr5s+wKvlAS0JQKViDGQZUrFFFs0loTMC
         l2z9REA95oIxUoksGqy5EenKmNnEjQ15IjYIYY6XeCT0Pe8fxr2uy6lCrzxdrheNcTfm
         26sZpppSWsp9kXZjzqhM8yWZrBZjJBGg1GRgp9KHkd+7mEjDRQBZz9FjVVlR0Hmxovsi
         7220ZipBEOiEXwipMKrrMemotNkC+5Xx/sjuApHUt8048+/ADJTkxijG7AJlQ8EX63XT
         3oVQ==
X-Gm-Message-State: AC+VfDxWr1a7imeVNUDBHyneL6YNg05ZMNtb2FjUmCyuwI6bEowTmlGS
	tedZKdkyvBIA89rJ+5afh8hWDg==
X-Google-Smtp-Source: 
 ACHHUZ5InuqYeOZy5I+/X3fsLat/TnUkv5PBIlf5CBZNkJRYvqzQiZVsCvIG7tT/Degh88f2AnjcCw==
X-Received: by 2002:a17:906:9751:b0:96f:c545:6fd with SMTP id
 o17-20020a170906975100b0096fc54506fdmr8866911ejy.10.1686560766808;
        Mon, 12 Jun 2023 02:06:06 -0700 (PDT)
Received: from alco.roam.corp.google.com
 ([2620:0:1059:10:82e9:e3cf:d6f0:4c6a])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1709061d4a00b0096a742beb68sm4867275ejh.201.2023.06.12.02.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:06:06 -0700 (PDT)
From: Ricardo Ribalda Delgado <ribalda@chromium.org>
Date: Mon, 12 Jun 2023 11:05:31 +0200
Subject: [PATCH v2 1/2] ASoC: mediatek: mt8173: Fix
 snd_soc_component_initialize error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-mt8173-fixup-v2-1-432aa99ce24d@chromium.org>
References: <20230612-mt8173-fixup-v2-0-432aa99ce24d@chromium.org>
In-Reply-To: <20230612-mt8173-fixup-v2-0-432aa99ce24d@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ricardo Ribalda Delgado <ribalda@chromium.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=jo+X8uO9gXWIQ4Yp4MLiXi4sgrrGbroD4LCNGNV+4M4=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkht/4yUvNcHG35BG/KrFS5PrlpHzlqdRlErE+H
 JfuJwL5SciJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZIbf+AAKCRDRN9E+zzrE
 iG8SD/4qf+ADY8vriM5ijaza7D/izE7k3S+iQQf8OA2OdmLDusxEwt0iCSonmOkAQndcQwzS0GH
 jEY3n8wpzqw0Ze01VbE8RQrERCr6UKBTO/6gtNyyqLC/pDjNdX7RTNk+QLMONTchv5luMdp6vdJ
 KkbwJGHlL+us+x3zasP1S8fTsg6m9OmhUNV2CYa/yBw4WaZu4qTA5xN76h2enS00k9Z/qFDHKQl
 mnDMs0H8HeMaZStjyC2oFscPcjaH0CNtGNnbRdXDBGotVAHH5QnTc3bakku8J2YBIVrgzhIag5i
 EjzQ2FM9adCpfKPPUnFW+LgHyfMjPgttDv0icRtzHqp7B8KDPZYuzUYlu2Iy8VsImCjklQAtvzu
 iOrymbnM98iYTzMX6G2BFyofM2ntQoINlib58d6Ud/eROQ9/MGpWyVTqjDC9vb3A+8L8Y5UIi8q
 WqytQosaCOH+4DFyTY0a0cnQlN+x9p333zBrcI1J09EKREZyaesS6WiUipncrOxUdMwjMPYjS+/
 33D2atsdtmdjIB9GElht1KH3ziKp6hVjoWbywTW677Rv7OHNDoTbMmI6+jOjqIyRj6awpZNctaW
 i7XKRgC+8yknqBXjUxyYeBy5z5FDEGPOz/9hRbv5FTiG4hnUqwmtvRVnSygWxg0VD25jxUrenM8
 6F60DksxzEzPdKA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Message-ID-Hash: BEVT6HRLUFY6JN6EN62N2SDVNBXBZ75F
X-Message-ID-Hash: BEVT6HRLUFY6JN6EN62N2SDVNBXBZ75F
X-MailFrom: ribalda@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEVT6HRLUFY6JN6EN62N2SDVNBXBZ75F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the second component fails to initialize, cleanup the first on.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: stable@kernel.org
Fixes: f1b5bf07365d ("ASoC: mt2701/mt8173: replace platform to component")
Signed-off-by: Ricardo Ribalda Delgado <ribalda@chromium.org>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index f93c2ec8beb7..ff25c44070a3 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1156,14 +1156,14 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
 	if (!comp_hdmi) {
 		ret = -ENOMEM;
-		goto err_pm_disable;
+		goto err_cleanup_components;
 	}
 
 	ret = snd_soc_component_initialize(comp_hdmi,
 					   &mt8173_afe_hdmi_dai_component,
 					   &pdev->dev);
 	if (ret)
-		goto err_pm_disable;
+		goto err_cleanup_components;
 
 #ifdef CONFIG_DEBUG_FS
 	comp_hdmi->debugfs_prefix = "hdmi";

-- 
2.41.0.162.gfafddb0af9-goog

