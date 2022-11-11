Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23A625660
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 10:14:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1ED1652;
	Fri, 11 Nov 2022 10:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1ED1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668158077;
	bh=RuINYQZ5Th+7NVFljR2ZSR/G+NE1fJQTUDPQgXymcxY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jJx+t9F1BLPR5DM/5h7JtTjYjroThTCykWR9a0gMwh/T1N/ilDZ8ULSC7LVmM2Dvn
	 uYsMfmE+/ASxO1nqgoTWibongz76SR2sfIg08h/j/cE4ZB67pDBYx+WNxVLV/SiKzr
	 7O8F3lv4rT3L52W/Cem+jw0aAYKYkoXsa5Da1M1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E443DF804AB;
	Fri, 11 Nov 2022 10:13:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2714F8028D; Fri, 11 Nov 2022 10:13:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A0A4F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 10:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A0A4F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OsGDvA/g"
Received: by mail-lj1-x231.google.com with SMTP id u2so3859595ljl.3
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 01:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CG70r3R3U+ByF6Dm/fb3An6dalcnfgrC/IIfYr0Kegg=;
 b=OsGDvA/gwAYIEnfwgCEeq3G4Iacv4yJG9WsMbMnmYM3BNIoqI+ZEDGAB5DKR+pTXUE
 NZkJETBvkiqw1aKOrORv331gFtG2EiJECkF7Uc12L7Q8ZGDUBLiQ3Pxa9buUXCt+jasD
 XpFZVTCrN4E1jD6P5dXWpNBYMxxIzEnorL9FlUL2LQblzD3/r1rnHIvY6D4wq0r1a7XV
 Qdbwld4fdDamXBSWfMpx8+3Q1B8DrTO33jNTiLAkg0SKwIi9892i/5xMGWZpNuC7CylI
 gjg8JpCdJW+icXNmfC6LSeUYO3eVIn8o/t0GRt91VVVlCgcAOQuqxCOlZFiI4vK/VFLC
 u7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CG70r3R3U+ByF6Dm/fb3An6dalcnfgrC/IIfYr0Kegg=;
 b=fvg/A1PLQAeV0cyMJf7Wa+VtGUbgoYtmT+bb9pSHEGJboeDrmNXmijE8bghoo4k6lC
 mFLLic4PfRr/LtX9/wFF0nbIQgUwyXlG3oShHpiAslLWtm1tw3THOXRjVaGCgbo7fhpE
 NARjK/3Z+33vb5dzJNcu26fyTF2oFjuicHvZfTI6iL3DjZig0WyJjJerTR5EhrpA/gDR
 Prx8HyQ5ssf1o9J2RKgzGJOL70CV2fkRJ6qB6zxplS6oJ+Rdihtq0Zlgvhh6PtBTsUvZ
 wSX3IGcWZ+7G2ZqZuE93SlYWPwYRvil1tBy19mhnzjwWyb+me3QSNCwaROUlg+wHKp96
 djjQ==
X-Gm-Message-State: ANoB5pkCca0rpvijaQz2qZcmRbxsnXssBKTVUPftDPumc0xphZOPF8g3
 oqC+hpFIu77OCfgCI+TG4ycz2w==
X-Google-Smtp-Source: AA0mqf7jfxUQwV/asX6PTGhypg3OXbuthfIPAebxbxNVePC1vqYuLhevUGqfg7OaxzBtBi8ZjYX+ZA==
X-Received: by 2002:a2e:a5c8:0:b0:26d:d55f:f1cf with SMTP id
 n8-20020a2ea5c8000000b0026dd55ff1cfmr325829ljp.175.1668158011429; 
 Fri, 11 Nov 2022 01:13:31 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a056512314700b004946b549a19sm229553lfi.45.2022.11.11.01.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:13:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6prm: Correct module description
Date: Fri, 11 Nov 2022 10:13:28 +0100
Message-Id: <20221111091328.31549-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

The description was copied from APM driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6prm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index cda33ded29be..8aa1a213bfb7 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -247,5 +247,5 @@ static gpr_driver_t prm_driver = {
 };
 
 module_gpr_driver(prm_driver);
-MODULE_DESCRIPTION("Audio Process Manager");
+MODULE_DESCRIPTION("Q6 Proxy Resource Manager");
 MODULE_LICENSE("GPL");
-- 
2.34.1

