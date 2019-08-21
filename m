Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C019791A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 956BD166D;
	Wed, 21 Aug 2019 14:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 956BD166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389966;
	bh=sfuOZVqMx8wtxNUMAOKV04IS/jRFzrMqOtd5WDFtKrQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p99810vgKAezqG6xm7oOjBfEn01CtQ2maZqZ3qDGoOLA5X/wuLWlI1V1B/jHvm2kB
	 SosMrPQDzussnO/JUJFFH3ZbhqbTvWeuMi3kb1fiOJBmr3o5dD4zHUvJU1AJqFqQyt
	 Gxj0UVF+J0FLIXfHikMpTvLvNL4E35I3B+SdkPAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C93F805FD;
	Wed, 21 Aug 2019 14:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD13BF805F5; Wed, 21 Aug 2019 14:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com
 [209.85.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6C3DF8045E
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C3DF8045E
Received: by mail-ed1-f98.google.com with SMTP id w5so2676213edl.8
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=or+cvsSg6ceM9i70D6UPLNnCbWB/HWcr9PNQOtNGKXI=;
 b=VJ0kdytl90Y6HOaK5NLrNMw02oqUWVxUGchyD+VeHLejBelcxkJsfHNSlLB2ZhXRzj
 uQo5Dq9dZZEtweDdvAtvP+E6KsXWhnWsjuRsfsME14bs9+TrtKOfBXLoBUwpV7gw3N9M
 LG7W8qLdFu926tidzBniExyCKdEYU6BFnlOe9KuRN3JPfmU4mihrKLexrN9MrCuo+3gS
 KIx9X6Hxa/ndkHER1slJW5AvFacj2/aeyTa13338SmF3L/sRj+Ny7mH6eIIupuf3A4a9
 UMai++vIIqHEOljJ55Clza1YWvuheSg+sUd/ujgZv7XNl7ghnrpBldnDFbxgzVR0V5y5
 BrtQ==
X-Gm-Message-State: APjAAAWT8mnDFdpYV0d6T62CZLdorSxsu90htMZSVYYgbhJhTbHfXMeT
 pPzoW+hs87kOxXhgeSjzQPMZ2ka0wkhXRWmK/je+VNIv6Cb/Z1QBul0AgUBO7ZWGRg==
X-Google-Smtp-Source: APXvYqwnL6a2+Wqqe4N5q5Qp5yJbqPQ85mdzWn2tird1yFrGVdQAYor3bqrwIaYpo5lJWM5SLTNhALLptlV9
X-Received: by 2002:a17:906:6c90:: with SMTP id
 s16mr31271826ejr.62.1566389733773; 
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id n20sm115894ejr.72.2019.08.21.05.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PWX-00077D-F7; Wed, 21 Aug 2019 12:15:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B2DC62742FCD; Wed, 21 Aug 2019 13:15:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190814082911.665-3-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190821121532.B2DC62742FCD@ypsilon.sirena.org.uk>
Date: Wed, 21 Aug 2019 13:15:32 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, viorel.suman@nxp.com, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: dt-bindings: Introduce compatible
	string for imx8qm" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: dt-bindings: Introduce compatible string for imx8qm

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c1fe93581ae9d85c3a783b5fad21912bb88a0f34 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 14 Aug 2019 11:29:11 +0300
Subject: [PATCH] ASoC: dt-bindings: Introduce compatible string for imx8qm

Register map for i.MX8QM is similar with i.MX6 series. Integration
of SAI IP into i.MX8QM SOC features a FIFO size of 64 X 32 bits samples.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20190814082911.665-3-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index e61c0dc1fc0b..0dc83cc4a236 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -9,7 +9,8 @@ Required properties:
 
   - compatible		: Compatible list, contains "fsl,vf610-sai",
 			  "fsl,imx6sx-sai", "fsl,imx6ul-sai",
-			  "fsl,imx7ulp-sai" or "fsl,imx8mq-sai".
+			  "fsl,imx7ulp-sai", "fsl,imx8mq-sai" or
+			  "fsl,imx8qm-sai".
 
   - reg			: Offset and length of the register set for the device.
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
