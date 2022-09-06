Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C784B5AF147
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 18:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B36186E;
	Tue,  6 Sep 2022 18:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B36186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483410;
	bh=fQYUkAxXY71C935nLCXmBtUClWnIjPfNIksuukkp5SE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y00gyWgpofrRQW33kFzJAUCnDTBzm5CaO/SOUtSvqsf82WlJRIi+cPHmaiOgPYOrs
	 XG1da40MmTSYTYoilrKfhNEh3OY2SM1fwR9+kr6uHUO3bzbmJPx7HXko4cNjYSyKT4
	 zvgJAPnrcl3CHSx6RbzWkv0FjNVpeDvlQ9Na0OGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B2AF80525;
	Tue,  6 Sep 2022 18:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3A46F80527; Tue,  6 Sep 2022 18:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6970EF8019B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 18:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6970EF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D7pYmEHC"
Received: by mail-wr1-x433.google.com with SMTP id b5so16388228wrr.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xh82u4mQI0vpD+SPbAbOTF4IJW7gl/lNmljBUcHdhrA=;
 b=D7pYmEHChJjmVTgGNvwVE4nrUPAzpULO6H6J2wrcF2qicEK9hAIEv2F/j6EoHN4dG1
 GnzM2fJb4/+l5zVoTOx2L8eBQo0nW7UMUVD7swnirgwT6Ectk3v6tgU+VoUtXfUqHdsx
 t3dyMwLru0dgJd0odBSAGohl9Ms9tTlgK6plTZ3VNyw5ff1h3WoTy0qX4LHQPNKmm/jk
 EtWP1JQQkmmQ4RYMQvI7KgnsvovRK6kvYG8ZL7NvyE+t1yMCoTHQqBU3rMMhvoIUX4WY
 i7XBXglhSZRJacmrXx0s57hf2n7592QLRDBQAlDkDZoEjiEMJCY2Ju6mokiCDWPwS0aI
 MLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xh82u4mQI0vpD+SPbAbOTF4IJW7gl/lNmljBUcHdhrA=;
 b=zjosilgcL1nZbuZkJK+pYGiK1qTh+aCyDhfRcqs9UO7eLsWCGxwXrvoFLzIM4IDuyX
 f6fu7J344Nki2KL+Fa9m9u06i+AyLTYggb4Wg1Gt7KoxNwETGTh4V+iIf0oQ/JYk63Uq
 ZadmqZbA0zgp4Xhn3q/ZXMz+bFFxM/mLnQR3qh/U42t85D45LeY28QiarurSxCylJD0h
 mf43RYaQJLF/EUXnQfgTclghpaixe9sUqdOxfDIB85Xfy3XKEG2vnfQWuO4gpQR6hlkh
 5Ufy3s+Dz36Y1ZGyN5ngRJeWqlOfF72IFGUqdgLVhpSH2cCJYcVH9bOVDW5dlP02/vPH
 467Q==
X-Gm-Message-State: ACgBeo3iV8LfnVs/Qdju/WFopisoPb3yDp6dByUR2APKu9/OwDkXC0LW
 vQUB6KHPQLbFPBBG9oLQ6kv+bw==
X-Google-Smtp-Source: AA6agR59fsFWPW6nj0dDTZpiQhOPQoIZref6IIVobJPKCfEvS29RNTgznn4tg7Itpc1FFfAGon2YFA==
X-Received: by 2002:a05:6000:168d:b0:226:da6a:6d78 with SMTP id
 y13-20020a056000168d00b00226da6a6d78mr23740860wrd.180.1662483315738; 
 Tue, 06 Sep 2022 09:55:15 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b0021eed2414c9sm13775906wrb.40.2022.09.06.09.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 09:55:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
Date: Tue,  6 Sep 2022 17:55:05 +0100
Message-Id: <20220906165508.30801-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c407684ce1a2..e53ad84f8ff5 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -175,6 +175,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(np);
 	return ret;
 }
-EXPORT_SYMBOL(qcom_snd_parse_of);
+EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

