Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74E4FD374
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41F617F1;
	Tue, 12 Apr 2022 11:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41F617F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649757260;
	bh=WONMTsC3FvjC4qg2WY8CYMGCCrCAribQ+Jm47yrOJh0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mAqz48yXplWJKUaNf5Y4FfxIx8cy9oIMkBhHSMKfVb00OgPVE8QkDy4W7svzdO1UH
	 6xC5/N87sFvarYx2Q2ncboi1ymMGWPWDqwwfYeHbn1tvwiJaltrYF6jVEsAyb+5+9W
	 0G+rcylLHV+uKcdD/nEK8o8ND8biU5BCw3a09Yg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 247EEF80534;
	Tue, 12 Apr 2022 11:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FA80F80279; Mon, 11 Apr 2022 21:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 006F2F8011C
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 21:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 006F2F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="zoxcUWYW"
Received: by mail-wr1-x431.google.com with SMTP id c7so24655383wrd.0
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T2pHISSBa+vyQR92QCN20csJaECk0Ib305OvqZ71rHM=;
 b=zoxcUWYW3Gll9dA+g/GjitaEWy/DyAUlqsfVUZ3ojP+KlecMBUxwFNrpA8prWNzFM8
 dxiuERPvg2MP+pbMPS/JOt1PuBUC5ikkT1RVkt+AuM9y4fR2M/Z7Et5TLxG0RaH5J9Wf
 b9HD6KOnOmlJY0hkZxe5NFB/kekybtYI2BKbMiUwKB4coa0972KBl9vZSjUkCNgdkDwo
 NMch6eyX+oAeeL6nPnlom/aybBau1AWdfyOkFzV+Rmfo+MLfeGLFsFhf8fCyXAG5LOdN
 eJaU6xyimLvFA89uh2weUbOf0RcSWxxS1tkTLB8n++mSotix7hY6s7uBb9SGZ6K7T938
 HmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T2pHISSBa+vyQR92QCN20csJaECk0Ib305OvqZ71rHM=;
 b=v5ot8cG88Rw5W7QLs+8GFrBTANZsmbEX7QclRuZMiTArYN4i/+LN984Pw/REQgxVvz
 A/RBTnkog1uQLb7EXS33DPJXnTzp7i0Abpco1TFElDuQrdg683i3EXyvg/DRk5eo9jA2
 vFeeRpeS5L2In/i55uMP+Yn0owbOjVmqTGqZgCtjKhJ1z/CoUuJikc+GYYqmZIykbWT1
 RqEyxKGMgjrWfBj5iF7nYWGBXEjIJx7gwqFs6QcLdvTxEnuXT9cALcD6r7mO5fnVDWK2
 OH88CEimnJjjPrLGiL95Z5Z48UetCxJ9NNzf+AZ9ZDq5em57OtzgEaTZqm7iuOayRMaD
 PS7g==
X-Gm-Message-State: AOAM530HZbuR4WFOKuF8xmtRCUxtK+juaj186MILVyB1jC7mUBG/ZZDV
 AwjuPC10X0J0vdatFi50M59gHg==
X-Google-Smtp-Source: ABdhPJxO7/HRhRnIcY4K1+0s34o2a+NwfWWzqFwjG8efgRhmwQJH//fcG8ccAyJosi4yLz8Bf4qFrg==
X-Received: by 2002:adf:eb07:0:b0:207:8534:2ef6 with SMTP id
 s7-20020adfeb07000000b0020785342ef6mr18321441wrn.62.1649706255289; 
 Mon, 11 Apr 2022 12:44:15 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 v1-20020adf9e41000000b00205c3d212easm28218101wre.51.2022.04.11.12.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 12:44:14 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 robh+dt@kernel.org
Subject: [PATCH] dt-bindings: ASoC: fix invalid yaml
Date: Mon, 11 Apr 2022 19:44:09 +0000
Message-Id: <20220411194409.3390002-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Apr 2022 11:51:33 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
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

The word "or" is useless and breaks yaml validation.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/sound/tas27xx.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
index 191f4bceb4ee..66a0df8850ea 100644
--- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
@@ -20,7 +20,6 @@ properties:
   compatible:
     enum:
       - ti,tas2764
-      or
       - ti,tas2780
 
   reg:
-- 
2.35.1

