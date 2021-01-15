Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B372F8151
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 17:57:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 856A51835;
	Fri, 15 Jan 2021 17:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 856A51835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610729847;
	bh=QpBQddm8uxBszssbJdZ84soxqw9Tu9qDUll/PQ4yAx4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r29OvEqvzhdo8vn7jCMoJlDoHKa02SG9WsvepgziZB1NLkU8D5v5nWHsilA6DhZ8v
	 jUctpKkcTiHNrr23OMQPWwRkAr4Uc71zMK63VrqpWKGQoTOrowi52qxlBrLDM692HM
	 i2npisPlCXfWqWyzBxHrou367P+cthTt4UoroFSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3781F8016D;
	Fri, 15 Jan 2021 17:55:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC9C9F8026B; Fri, 15 Jan 2021 17:55:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30B10F80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 17:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30B10F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JyOzx4Fv"
Received: by mail-wr1-x432.google.com with SMTP id q18so9983830wrn.1
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qpoU5fqNwBrgG+uQnSKsFtoenWMjs1fcRQ3GYXtUAfw=;
 b=JyOzx4Fv8jpmSqjzz6uWttvy15gDpPwhLvBE47Jl3j6+4seX77+kh+s4z7qdkB9XZv
 1m5mBd6QIBVByhFMCsF4auzJ5pFw0xD2bg+jljTwtbDE8dBxE2ak4Z249fFIHrQKqJJq
 fckoWR4/PauSu9ShyA+gryhbfUNV7Nd3M1Po56yCIHeP9DiRjbWkELJP7mt88CNxMi5L
 JJKeO5A/skGVOdJ9K44j1OEM2uSW+hCw5xZMgjt/16rThqkag4TM3TZArH1mV7+GWF5G
 CAEaMR5JUQK9H+FVGM4ggZjFKevYm4RgYBlp7wzKspfqfFNfB2Bc+Ep//R26wR2p+33+
 3MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qpoU5fqNwBrgG+uQnSKsFtoenWMjs1fcRQ3GYXtUAfw=;
 b=DzisxpofrZUux+VEP1opfzcGFBKd6GHtVCqDGbYxqMAuImd3h8Oc/l6BgGUQpyLq4E
 OJyzf20i86eeY4i+CIp0D7xCvPfQ6VQM1Ke9smqBJ4iUw0xp7ChPFRwbnHxN/ElouI55
 ODdAnqKUQOMzdM1KJxAuyoGjICL10oHPB++LKJcc/Wy89zavCeIAil+dJ7swKLHLGJDy
 fhhENPN1VqbKg2QVl4yhuPn0qvldPas3MGrVrbLynxMm+K2iSBlRNO7QbhDCndfZpZCB
 9ZwlOGo4fw6/uXrNEMuua3RYEMxlhhbViVc6SwembahexMOBj8dwu4BoAO5q6BPIiRJ4
 vUGw==
X-Gm-Message-State: AOAM531iSmA8jGiTZtvkPhE1DDmseVn1TOacl9YUB12nvre1tnpoG5F9
 vkIAvJyKoibeHwLTv8x4HURErg==
X-Google-Smtp-Source: ABdhPJyLPxRwkrI+zHOIgoHA0e737MQMy5mIKOsHajXwgWnZq2enQJ0S7G1aMQrecyoNBQzsgdsyAQ==
X-Received: by 2002:adf:bc92:: with SMTP id g18mr13731534wrh.160.1610729733129; 
 Fri, 15 Jan 2021 08:55:33 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm14655045wru.33.2021.01.15.08.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:55:32 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-kernel@vger.kernel.org,
	broonie@kernel.org
Subject: [PATCH 2/2] MAINTAINERS: update qcom ASoC drivers list
Date: Fri, 15 Jan 2021 16:55:20 +0000
Message-Id: <20210115165520.6023-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210115165520.6023-1-srinivas.kandagatla@linaro.org>
References: <20210115165520.6023-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: plai@codeaurora.org, bgoswami@codeaurora.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
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

Add full list of ASoC drivers that are maintained!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1545817c899..7699d9d94a49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14516,6 +14516,14 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@codeaurora.org>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+F:	sound/soc/codecs/lpass-va-macro.c
+F:	sound/soc/codecs/lpass-wsa-macro.*
+F:	sound/soc/codecs/msm8916-wcd-analog.c
+F:	sound/soc/codecs/msm8916-wcd-digital.c
+F:	sound/soc/codecs/wcd9335.*
+F:	sound/soc/codecs/wcd934x.c
+F:	sound/soc/codecs/wcd-clsh-v2.*
+F:	sound/soc/codecs/wsa881x.c
 F:	sound/soc/qcom/
 
 QCOM IPA DRIVER
-- 
2.21.0

