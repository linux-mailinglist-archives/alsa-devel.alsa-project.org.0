Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FCA610E6E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85FF523BC;
	Fri, 28 Oct 2022 12:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85FF523BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666952815;
	bh=OeWPc7oWMGPiGIdKZqwxDwL7JCnzTIddLOwR0TQE0VQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ne2xZem4COknNZyaQWME8b2CVqlzEDIh1FRvAo/Ud7+9YpSDWWTlgOapQdbuN5V38
	 x6s+/T+jib/2XwCNfgKvLkDOAJhUPNSNx+hjf6Qq1c1fudsa+PQG9JOzfMMHPdRQ+U
	 RZmDnHojo88edd9vAlIhLI9lgVPtMAmoi+H5HzgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69253F80551;
	Fri, 28 Oct 2022 12:25:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6730AF80557; Fri, 28 Oct 2022 12:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E116F80558
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E116F80558
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="vOC/xKdM"
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13b103a3e5dso5804270fac.2
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ci1NI4rEDngdiIs8klmEEe/VgSVPTbSHjvB1KeT7kI=;
 b=vOC/xKdMUo642qaKQH78hZIqPpTZUPYnjK3EGVr+0Op2zSKxXyp6TtAf2S3VcbZrba
 tINVIqD6zWtjOgefgvzhYrG+wmguFT/XM1Tu91Ra4H+kCzYaSWaZWNMHYXXwSxm5AmoJ
 4S3b4Q2XUvNUxmtYEmDYVEJ1FmFRAfbPPrD7hfslyblh+6CAgZ5/alZ2pTuRmnfNNg7y
 xYRShGLqziBYo4JFrwSaF+luHyYRtif7mzPZPc1S5QZ4Yt32W8i1mFzm22+thOC9xI5/
 Rk4ZII8CiN5me5xRrH+OoKtbqMnfO5+XayqbfeXAZYRiAoPq2/bT/zECUOzsYNblxX4y
 2P7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ci1NI4rEDngdiIs8klmEEe/VgSVPTbSHjvB1KeT7kI=;
 b=w4dFr06sPVNV1fMEUN5sHg9Bky6vVNsYt+RZWzXK75n+0dGIt2mWSdYImQ4OHd/FRp
 yx3MQ5/lGGf4ZLWaBD8vuUbaRU9oiV7LShiwtI+j8eGSn8dPG3TyuqYf6IcANxeVeGl/
 fFhrvcXtg7f+ES811DhuaKTDvgurMPGzBgS3ZOLnM1tqoAiUlmMvkEGBf6+oECBTItvL
 97COhBksEZTBM+VZ52pIZLUpXcHpgubMXf3LbFv2rX0vmXUKqN+EdA8GMsL6v9M/2VIX
 lDC7FnjBmkL9hsd5rCtTNR7vdcfGdBCwau1gVmx9oPuTvcrlf9QImC2ZZ12S1/QE1Sh4
 6DWg==
X-Gm-Message-State: ACrzQf0ffZWYX+0qazCnnlOfwWy8ub74enlNSEFL598YaY6Epdl7rqW4
 touDkkKxT8qTeqZx6OV/EE2Jd89DCDVtgA==
X-Google-Smtp-Source: AMsMyM5p59DDqaMCPQtyBwckPVjxO8rqbMGhs0bxJed+3GQ/ycCvWR71cW2eMf0VHFL+RSgqFw2M1Q==
X-Received: by 2002:a17:90b:254c:b0:20a:8a92:ea5b with SMTP id
 nw12-20020a17090b254c00b0020a8a92ea5bmr15151822pjb.81.1666952710834; 
 Fri, 28 Oct 2022 03:25:10 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 o1-20020aa79781000000b0056b6a22d6c9sm2565236pfp.212.2022.10.28.03.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:25:10 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: dt-bindings: Document dmic_sel-gpios optional
 prop for two DMICs case
Date: Fri, 28 Oct 2022 18:24:49 +0800
Message-Id: <20221028102450.1161382-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Document dmic_sel-gpios optional prop for switching between two DMICs.
Ex, the GPIO can control a MUX to select Front or Rear dmic.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 Documentation/devicetree/bindings/sound/dmic-codec.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
index bba27c985996..4013af65f3e7 100644
--- a/Documentation/devicetree/bindings/sound/dmic-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
@@ -36,6 +36,10 @@ properties:
   wakeup-delay-ms:
     description: Delay (in ms) after enabling the DMIC
 
+  dmic_sel-gpios:
+    maxItems: 1
+    description: GPIO for switching between DMICs, ex Front/Rear dmic
+
 required:
   - compatible
 
@@ -48,6 +52,7 @@ examples:
     dmic {
         compatible = "dmic-codec";
         dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+        dmic_sel-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;
         num-channels = <1>;
         wakeup-delay-ms = <50>;
         modeswitch-delay-ms = <35>;
-- 
2.25.1

