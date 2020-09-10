Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE67264794
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 15:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2EA16C0;
	Thu, 10 Sep 2020 15:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2EA16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599746358;
	bh=0B5DA/ng2B2OuMQHJH/WLYrQrb1Kf7V0KDBTy1OaJEk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XcOXfKborEjw+qX+Mz3RbW6NHHHDCOvZrVLilShXbkzKlLj1icA5+XAHWol+znoWt
	 EqTskauLdaKFWil7IkFh4JjgUxHm3dpiHxF/E2RqCpYdQded40kXQ2oRwjn470CCsJ
	 SmOrVEszLFBXXtBy7xRYGqpbPyyrWOJfyxlpDflE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20C4DF80272;
	Thu, 10 Sep 2020 15:57:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68DC1F8026F; Thu, 10 Sep 2020 15:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0F66F801F2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 15:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F66F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h3OxTW3N"
Received: by mail-wm1-x343.google.com with SMTP id b79so128988wmb.4
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MwCnq7FxTYt4OfQXRTiK+fRY/WmJvx9OFmW7bgtzZM0=;
 b=h3OxTW3NXpvEMOq+NbIAj5X/K4i9qGE9aGqbTmvfZMAHL8RYp/UJta3GwL7enE6ljn
 HiyAwx4ynSHp1yJO09Dd/g5TZPS4jepDxtGBQOaHPByNSVdbcEUDwIwa/a9RFQpNZzQt
 n3ZovD2zm7QZBsM20c/2WFJcaFfeYhuopDf3iqh/TIci/TnNwRAb7zvmAlLd5hMqGjbC
 HZctzh8uL40p1JLrxM1lWGjNVzqYan7014t4bSqAO3F1lgdUoVJqNR9v5TmsZiFjJXxq
 3Vk7uocCBH7r01Xcn9AfrAn5j6coZ8kXGdlwZY+Adi9HUeCn5InqXY5klXrafSlY90Q+
 6h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MwCnq7FxTYt4OfQXRTiK+fRY/WmJvx9OFmW7bgtzZM0=;
 b=lHAkEuCDr1zml7zm0KYnoBsEPAzb8kmk7sZujGPD83p050O773vW7dq3Y8aDO3HJTm
 AA9LHGkQUn+hQulXj6mnS46SkSfNH/+38mB0nVYDfCsRmoK1Ly/lxPhNtM+sMwIda/nR
 UrgocB/e6JV8YOem4yie4st9OoKTg8PDmDhiDTAx9IV8maKBGLeZcB5goMEsRv1RUZFI
 bY82BGPmrRoN8SRkvOnO9FmlmYd6R42L7P1EFh++XoNxbbBTL+NQqd60R0PvnRk89srI
 A9M/x4kZb4BQbkYhn5QAvi14LW72dpXwDZvJkYNGaA0n34TMI0C5lq87QefJ93L9BOFv
 3zNA==
X-Gm-Message-State: AOAM532yMCKNk6RwDPBJqGlYqH/pnxZK7yR9M6Aw/fG69iS8v99tDWI8
 2zl0xfxtxAkdeX3lirJb1TIMHA==
X-Google-Smtp-Source: ABdhPJwRnJO2QAzMWY2IwW08545/62SapGFADNSS1K+hkVFBQsS65LXRVZ324BFRXGFRcTOVUUzAtA==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr137190wmb.82.1599746250518;
 Thu, 10 Sep 2020 06:57:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b2sm3786154wmh.47.2020.09.10.06.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:57:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org
Subject: [PATCH 0/2] ASoC: q6afe: add clocks support
Date: Thu, 10 Sep 2020 14:57:06 +0100
Message-Id: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
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

q6afe already exposes clocks using apis, but not as proper
clock controller driver. This patch puts those clocks
in to a proper clock controller so that other drivers that
depend on those clocks can be properly expressed.


Srinivas Kandagatla (2):
  ASoC: q6afe: dt-bindings: add q6afe clock bindings
  ASoC: q6afe-clocks: add q6afe clock controller

 .../devicetree/bindings/sound/qcom,q6afe.txt  |  23 ++
 include/dt-bindings/sound/qcom,q6afe.h        |  74 ++++-
 sound/soc/qcom/Kconfig                        |   4 +
 sound/soc/qcom/qdsp6/Makefile                 |   1 +
 sound/soc/qcom/qdsp6/q6afe-clocks.c           | 270 ++++++++++++++++++
 5 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/qcom/qdsp6/q6afe-clocks.c

-- 
2.21.0

