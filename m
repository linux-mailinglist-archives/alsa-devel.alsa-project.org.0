Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A1F54FF17
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 23:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F8151F0A;
	Fri, 17 Jun 2022 23:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F8151F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655499830;
	bh=qFh+dd8CXbHUfi7lA3JulUHV5mqmnpnkLW6nttqYLos=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qRq/MtCOsbJKlFGnjPVL+vtuHyFJ/5YE6qH7qq+riKuZ5ModJpJXpSRNUz4wsHbJz
	 8Y3g3TYGyFW4pcCCQAAxD1LX/dOM5Y4t59Z3P47fP7qfwqVjsDPGmY+VD+ssEM/eR9
	 IjhBkHxmrpoxd2FRXBwL+RajFy7T2aigT+PWy/oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E51F80528;
	Fri, 17 Jun 2022 23:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F34F3F80527; Fri, 17 Jun 2022 23:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CABF3F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 23:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CABF3F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="g/JQ/8dz"
Received: by mail-pf1-x42b.google.com with SMTP id x4so5114701pfj.10
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yl1WnhoCY1o1ij3d39EJgjFHyM+kps2gtjL5Md9kHN0=;
 b=g/JQ/8dzqqtIkIvMuzLXPCPAptiDE/pZLC6GdUbH/ozO+s5fyKrqv8i6sCLYcVi0X3
 wtDKCl3HtnTV0r+sSscUzEfWXmWjOoHIm4yX2925WDDezljG+qLN8icnKJ3H1i3Aov+z
 ekzoLLrijG+GCDf+d3sZ47ecIKCxJAl6t0PaUX1hQJhBHspwLkGHmdExUf1D/cAD8WHQ
 74oEY7dgy1g6PHyBIzy4CfC/cWkdi3Cfx4Ug44v4yqXJW9c1A9Lqh3LyOHLMYlvSdGIW
 we3beQyVYMFEFusqqqCmCf62LTSZn50HeEdiE+vsfVNXX4kmlBV8z9ZrvWsM/4hV0LJM
 W0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yl1WnhoCY1o1ij3d39EJgjFHyM+kps2gtjL5Md9kHN0=;
 b=yYL7CFyfsZifx9K1eaKCBSzZBPODGGu9eF3UiAgT/vBcf1mzHgPyZG3mmWPOLyDQud
 yLE3aa8tRaQuLi+SNIgo1BNT8wy5CETTJRfm3UUTFWpx4bUhNrsL+mU/Cz3pIlZb9jin
 mTItq16oAZWVLc7nHoBfTIy/dNiQNF6sE5vkGNFe07PG7hcZgKFNBGd9zmiwdhOsd+hL
 9eBJSWem5eAlpFLHkeFpPfLGRD5eYrKKJfJCz48W/LCS1rBTJW5fSVOjKPbHEyWVu9na
 mdpUQg70VkjZDPpuaetamSNv3witsjLQvNfOG23l6sxdk2tpS3PHFbLuh3u7C4cZ5TN2
 /f4Q==
X-Gm-Message-State: AJIora+fDZxa0ZACUvowcTr4Y5Hz16CS8UU8ImhggZBvu4qxNGaYSo8w
 wNhPv9fwTvw2xB/xsFhUj0Cu5A==
X-Google-Smtp-Source: AGRyM1spHaLkiHnAC4RwNbMh43KO7QMzojOVAbtMH0vwbOBz5txQsJDt50hUaHDhToilZeG/xzy/kw==
X-Received: by 2002:a63:88:0:b0:3fe:2558:674 with SMTP id
 130-20020a630088000000b003fe25580674mr10392898pga.504.1655499760034; 
 Fri, 17 Jun 2022 14:02:40 -0700 (PDT)
Received: from localhost.localdomain ([216.9.110.13])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm4039200pla.83.2022.06.17.14.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 14:02:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] MAINTAINERS: update ASoC Qualcomm maintainer email-id
Date: Fri, 17 Jun 2022 14:02:30 -0700
Message-Id: <20220617210230.7685-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Update Banajit's email address from codeaurora.org to quicinc.com, as
codeaurora.org is not in use anymore.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 440f3d7c93b9..171fa3160696 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16247,7 +16247,7 @@ F:	drivers/crypto/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-M:	Banajit Goswami <bgoswami@codeaurora.org>
+M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/codecs/lpass-va-macro.c
-- 
2.25.1

