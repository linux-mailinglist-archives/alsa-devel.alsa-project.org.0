Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85B24DA604
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 00:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFB016F2;
	Wed, 16 Mar 2022 00:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFB016F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647385772;
	bh=SwyxCuranURw7tTRUUtas+VyRImoaP6B201U1CG7Dg0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iuRndEiZEbG4JIy73kHdcIhC+Lt4bWG1SDTqahNqMKRurTtJqJl8rQFP8PKt/jnMA
	 Mn72SmLBSwnv6c2FLJmQEw3iA6xrul1fLH1rZcsSd9bwOeUEGrLR+rN7XrLFFkVyxW
	 eq50pHBPtIiSPYYg56bRfKEC2aXJ8PHTLkqjT/1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D08F801F7;
	Wed, 16 Mar 2022 00:08:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE39EF80162; Wed, 16 Mar 2022 00:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED9B6F80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 00:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9B6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bRH/YUTY"
Received: by mail-wr1-x42e.google.com with SMTP id x13so625431wrg.4
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 16:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtiiQiHIQhMd0RX5LgSCyiXCNdoSA3NRLMvs3SxeOlk=;
 b=bRH/YUTYKsj+spCdxxuad96aeBIsG8spLEf/MkQeInQYkYHSr+hzJUl7Zbt+zxn4Jg
 PioY0FGaD3vrODJrsJSeDMRnaUdXW0TPVhAtBBMZ7vuKj26uTkxi3ZEkLa6q1euuEvIy
 4DtTKOEJQqOpME+2lg0oCIjsmcjV6YkjLS+4AVZ//KXyqKr4HJpUWvO2AKqT2HaCQAnS
 A+oTlqzp7dsQIvmDQQvgOD/khTIQ6X8F7GEW9PN/9wp31UIrpX1S+tlxs+IedLgOppNe
 S+crJLickDvVNsMJouBBSaI04tc/mZ2sGRXULam+PwR+j04s+OVOgIYabvBaGddsOi+K
 1msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtiiQiHIQhMd0RX5LgSCyiXCNdoSA3NRLMvs3SxeOlk=;
 b=fx/+ToQOwXHsI3/9EpXVRsmKod/bC87/YV9J8rxt24jf/vf/H/AmbhsUtihOwnB+g4
 G8doSNtDjNEOIedfBroOphZ30iX4XSaO1wZWa4QVVWqqF5RQlEnBMlW2SE+Y+B3G8Mly
 p+TJsPs47F8UHfQBa0nFiNYnx2T3WHgEfkyS95rFEqqQ47x79q+vC1cTTD/Hm9R6eC1K
 VZj93ISGcnWq5QRNUqfFniGkJfvlGdysE3AkQr7XbCChI13FANB8FlD3/qZ4QJiyTtmO
 kql75m98+KJGg+c2bw8zv0uZZgyMl1UKAVaLnTvqe4Sj32RV4Qw3YenAUlkl7SmlcygY
 vEfQ==
X-Gm-Message-State: AOAM532j0i34kDsxPuhs8pgWvPQVGXz+O8jZyNW/jjW47k+ykKi4iLy2
 7WVGdk45y4gLVwiBkxxrFAw=
X-Google-Smtp-Source: ABdhPJxAS0Dpw20sHS3bnj03ua9LMF6Pwm3AdOStfhwGjbYJsj0FDhC5+tHEvjtv63EkMGk7XL27CA==
X-Received: by 2002:adf:f943:0:b0:203:b456:c71d with SMTP id
 q3-20020adff943000000b00203b456c71dmr9864142wrr.568.1647385697822; 
 Tue, 15 Mar 2022 16:08:17 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d25-20020adfa419000000b001f04b3a4b46sm196649wra.94.2022.03.15.16.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 16:08:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Subject: [PATCH] ASoC: ti: Fix spelling mistake "cant" -> "can't"
Date: Tue, 15 Mar 2022 23:08:16 +0000
Message-Id: <20220315230816.2964577-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/ti/omap-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index a26588e9c3bc..f3eed20611a3 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -474,7 +474,7 @@ static int asoc_dmic_probe(struct platform_device *pdev)
 
 	dmic->fclk = devm_clk_get(dmic->dev, "fck");
 	if (IS_ERR(dmic->fclk)) {
-		dev_err(dmic->dev, "cant get fck\n");
+		dev_err(dmic->dev, "can't get fck\n");
 		return -ENODEV;
 	}
 
-- 
2.35.1

