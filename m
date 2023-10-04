Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDB7B7F26
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 14:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA4D845;
	Wed,  4 Oct 2023 14:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA4D845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696422672;
	bh=/tnUy5QlMbOtt0txE3I9r/5zvGq/SGUcmi157GlyLWU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YbXyVeVHfA/luXjfojju7zXiYW+KUmRrOVnqjbfAIdgdgy9U2B2B3w2SIWtfQoIAD
	 0rBZ4ohAqmhXsy84Ph1UPrdCyhs5CVUWfXAMcdVWAZgU2UacZNTQQcutWuXSmtP5Kc
	 TFSRrEhViFfXrrOMOZ+swrOCpvzIBfAWbgK2Vhuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28FCFF80553; Wed,  4 Oct 2023 14:30:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A85DF80310;
	Wed,  4 Oct 2023 14:30:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B72AF8047D; Wed,  4 Oct 2023 14:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85A85F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 14:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85A85F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i2luLS4w
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6927528c01dso284277b3a.0
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Oct 2023 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696422602; x=1697027402;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qqogagIVQK4Hvl5PXKLkI1QUrc0BeTTIHfTFQDllF/U=;
        b=i2luLS4wsrqvXEd55tnGm8BaMypP+pFad1EIkYjtif7MDGYSYsjjV8zNnij+ETvMmv
         l3P9Z4DYv7yNDwtbJwTngqPPUO9AhMPCbEnsQ6ii7F8RuTK2D09VICNKgUAEMNiedJnY
         CdFs9QifwuS/At+uBzpEj32uhSCRX96MHyoePivU/RHXXpAMq7cKLtPMexwIaLp2UyTh
         6oDAzFNJ4FGq7xrwdvTXb7E8rEif6Qq8HUDt/MnAt5R/lGI0IGygGZDEiahA6aoTR8Od
         s+vOCkRfeCnSHAWiaqYLs/1QS/H6S7AzyYNSuYKv9U6PnipC1XEIpAoQjl/IuagsJsW+
         dQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696422602; x=1697027402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqogagIVQK4Hvl5PXKLkI1QUrc0BeTTIHfTFQDllF/U=;
        b=aRl69PWXnZnmwYg2Yxsz+3gWG77+p9W+QVQwHLXbOgm3FQREyg9fQydf+PpfxhsGkJ
         +vZ5l0nHpYVPR74BlOfus+xfQBlYIORrb5yjdzbbJI9QQWfmY5VbuSvH/4JhMsyzVNKF
         7/BbjhFzCbvMGEQDjOUMmB1KDzrFObOG2CpsnsCTlU1Q+NI4zg9HWoOKpIuTMbJZwqWm
         oLGf4Nm8Hlma37DebjtfEIUcTA3kETMCG3sVzmZAhnfsXlc6u/5TCdq1VPyoLXzElc1f
         31CgnGkczHQ/za80CgBmQjQz/IqwANOFuL0fQnrpeQnQyrJLUJHrkhrkG0Lsiclg6AFw
         Vrzg==
X-Gm-Message-State: AOJu0YzViEBOrhwtrKMtdKufLd65A7vhmCOl+P/exVJtTQWjAjnGV/1o
	RVkNNGuJNssO7Ut1W0qiGvQ=
X-Google-Smtp-Source: 
 AGHT+IH3k3edhJlkn+t2g3LCoLGyPVCNhz2pyYu1LJmGzhbJOcj8x798/FUy/iByXRsWI4a+KdhHHg==
X-Received: by 2002:a05:6a21:a588:b0:163:ab09:196d with SMTP id
 gd8-20020a056a21a58800b00163ab09196dmr2562313pzc.1.1696422601794;
        Wed, 04 Oct 2023 05:30:01 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cb87:d6f:eb43:afca])
        by smtp.gmail.com with ESMTPSA id
 fm18-20020a056a002f9200b00684ca1b45b9sm3217502pfb.149.2023.10.04.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:30:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	aford173@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells
Date: Wed,  4 Oct 2023 09:29:35 -0300
Message-Id: <20231004122935.2250889-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M6YZL5LAXMERWPUHN4WRMKQBNLZLO5KG
X-Message-ID-Hash: M6YZL5LAXMERWPUHN4WRMKQBNLZLO5KG
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6YZL5LAXMERWPUHN4WRMKQBNLZLO5KG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

imx8mp.dtsi passes #sound-dai-cells = <0> in the micfil node.

Document #sound-dai-cells to fix the following schema warning:

audio-controller@30ca0000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index 4b99a18c79a0..b7e605835639 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -56,6 +56,9 @@ properties:
       - const: clkext3
     minItems: 2
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
-- 
2.34.1

