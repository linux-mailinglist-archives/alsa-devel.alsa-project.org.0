Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C85542FE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 08:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0161A1F67;
	Wed, 22 Jun 2022 08:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0161A1F67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655880621;
	bh=vDb9ZqLBniV+QjClc1EbWsu5kwdKpYD8rSmPwbWspD0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcsPBwUQ0kRRZCUDpu3/4Crf68AKmIrqLykbE4uUyZNuTng2RPKczfbio6EY8NTbP
	 /1cp/wCyhUpXTmRTKvOSboZdtBMGbXja5Gg27/ODCkiKDMOHvW/nNSzVOwUPHX13OX
	 OhVCsUZIgJtO5feDgz3DmnXWOWQYIVPyMN4M5kBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84397F8053A;
	Wed, 22 Jun 2022 08:48:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E7AF8053B; Wed, 22 Jun 2022 08:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19DFEF80536
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 08:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19DFEF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qV7gMAdS"
Received: by mail-ej1-x631.google.com with SMTP id u15so4428963ejc.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9DOoIhOIXLMpNcIvOgH0b4QaNFlGhZBdv3PWCfH2y3Q=;
 b=qV7gMAdSgelSWa7TFM6/x0Pn3f3imGFjcBspWKsqSR6NIIr/pf+lVvZE3iKZXMnuRG
 kdhAzuCYC+fLu06G9lXm8FEe0fHDsxw20bB9qXYITLi9BRiJ0bIg9OJ7bEr/gmd0Vf0m
 bb9tfvRSQGgoP/wCjsh052utMVrm4pjAsK3XhwXQeiZiaOMtV/uvPxkJqk4XQoI4Klx9
 yML4UcfP1wFfk8fU/AowEXYBlf4881Ce+nMIpTiqEGXcUOWno37ebdFO0USTjNIrSUAx
 aTt4BXPsqzHETONwmXc1fleZuOx9ne5K97uNIokcdRLMr/dIkkBUrpeWQLxK70kj1Iog
 w5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DOoIhOIXLMpNcIvOgH0b4QaNFlGhZBdv3PWCfH2y3Q=;
 b=SdjzZw6wSbeDFYMXBx1MWqf3OcdHRfrZAEC6G66tyRqtpcBK5ABMPVKQKDzXrOapkZ
 qu/hMbGD9DsB96qKzpPO6e/64kZglEFqWM+HJS6BUdFPiBumGHwb5ud4gK1OPLEM3k/A
 FeGRa6zSjdE3lGdqmw6Fc/qSaYbE+XIW+w/ExOqjy5JlrWec9wOq+0xvKbFGThQNWkLb
 MIeCo2r1xcP2Qn6pvAJIoV5oCoL9KZdjIsN/4zObVDPpcQx4RU5JyzOBgrMNKsShpf7C
 J3KNywt/Ic7zPp22WPCHAozS3vyTe2zmfjjKq5Cj6RG/t4wPG6vEINjYjUkmhEUq6jQz
 +fhQ==
X-Gm-Message-State: AJIora9uF6TOL5ANyz663Ikc8PW5JboiCPmU2YM5VVfVv/WSKdmeYdWi
 SbiIGgZCukjV9RzbTB7g9bc=
X-Google-Smtp-Source: AGRyM1scE35n8xZ+4qERsfvT4HLJEkrOBgu2EDwyloit1cuSCOWgK9XfPhZyBILW4l1ICBo28yajZA==
X-Received: by 2002:a17:907:c202:b0:710:8d0c:6e89 with SMTP id
 ti2-20020a170907c20200b007108d0c6e89mr1665564ejc.141.1655880522353; 
 Tue, 21 Jun 2022 23:48:42 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd12-20020a1709076e0c00b00722e8c47cc9sm1197148ejc.181.2022.06.21.23.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 23:48:40 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ASoC: wcd9335: Use DT bindings instead of local DAI
 definitions
Date: Wed, 22 Jun 2022 10:47:57 +0400
Message-Id: <20220622064758.40543-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622064758.40543-1-y.oudjana@protonmail.com>
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <yassine.oudjana@gmail.com>,
 phone-devel@vger.kernel.org
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Get DAI indices from DT bindings and remove the currently used
local definitions.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 sound/soc/codecs/wcd9335.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 7d40a61b03b0..3554b95462e8 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -24,6 +24,8 @@
 #include "wcd9335.h"
 #include "wcd-clsh-v2.h"
 
+#include <dt-bindings/sound/qcom,wcd9335.h>
+
 #define WCD9335_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
 			    SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
@@ -203,17 +205,6 @@ enum wcd9335_sido_voltage {
 	SIDO_VOLTAGE_NOMINAL_MV = 1100,
 };
 
-enum {
-	AIF1_PB = 0,
-	AIF1_CAP,
-	AIF2_PB,
-	AIF2_CAP,
-	AIF3_PB,
-	AIF3_CAP,
-	AIF4_PB,
-	NUM_CODEC_DAIS,
-};
-
 enum {
 	COMPANDER_1, /* HPH_L */
 	COMPANDER_2, /* HPH_R */
-- 
2.36.1

