Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B20E611713
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 18:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2DCE1E7B;
	Fri, 28 Oct 2022 18:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2DCE1E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666973323;
	bh=fUUNzUPro632vHb3h48FvHNnok6nwfJQ9VSZfjuTw9E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvKn8YTt+gbq63QqWV4OjPnsCvRD6JVhPOoQFl4TLhSbAk8cwW8e9wHduomVW+p0z
	 kDX6bno3IhBjfltKT1hGTAch1ijL6LeXbd+oiQ03u5F1FK7N38euJj6JoMQwj9/Du4
	 aeKA2FfbpQoTiq1SiiA26s5CVvY5Pr8uA3Gq21ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE87F8025A;
	Fri, 28 Oct 2022 18:07:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 446C2F8024C; Fri, 28 Oct 2022 18:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B43FF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 18:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B43FF80095
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="TBwhRcOe"
Received: by mail-pf1-x434.google.com with SMTP id k22so5162148pfd.3
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zOOeNwz1lHcYrYVw7YxVzbU02ivQx+BTv/5n41W3bX0=;
 b=TBwhRcOe7hVlwmqY6HUfGe6XCFoCRE1+KHVYm8ubTunpaq8IuWSDdHZb0mv7AKJ0pb
 6vqGCQEcYnmEH7blpAnG8YrWz/NCb05cw2LMNk4fISFhMogzeBzvbhplkPQ2zmmjWTYE
 DNuW5ykjw2/p1Z6y7Xp3DoQhat2+FvBfTxygO1qOR+N26sYyumfE9AsHNgN3/4BudxYx
 0DH+n2Uf9SF/Fgwh7/gu0zLI1Fj9hAv/bNvQfKQSGy8TK4Q/TDKr0bR8jxGrSja8hc3X
 knx5Se357JcvpcBS4oKAz/Zf7pdwvbG0P5HYMh+ZEgBQcq6ByJ1WblRdXzR4gSxjwMlk
 Jwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zOOeNwz1lHcYrYVw7YxVzbU02ivQx+BTv/5n41W3bX0=;
 b=lwNCTookDIzkuGiGdSg43itRi/wFg8FrIHrKYmZDfx6zkMEnY7EEmlt120zojTPMox
 rlb+xT5F00MZ1LHbGrEBt84aaRyyow3ai2q0p0CZ9Lp91HwcPtxYv5DSQgMlN0n2SsGc
 dGSbmZmYkRiRXiy4DZpXiwsQRTFfkZ0z2nB4tjAJH+CYVK49zX9djt1f+5YrCYu2czAQ
 WhjT43PI65XAirAC4fZEveYxrw0zz1Ly7gkKnqA4wfeg9ppv1yFoP046nFONgJZw4dv7
 JOT3O9iC7Um2sEPCn4Kuvpcml/ZVJiUEEICLAOx+Ee49osDU808c5LdoIxnbAMxo9VxS
 HOhw==
X-Gm-Message-State: ACrzQf3WhNZytVjwYXb1aAFhAeuAi94Yej0lkjnK1tC1WcyLCbCxYI4N
 xjwPyZ3Y1ggG0SLlH8ioVlhtYA==
X-Google-Smtp-Source: AMsMyM4RcOrg2Q1kN+KY0hi/d1VbeCr4RdhBFV8N97v5IKoJxGQz8UMgUwHdhkR8Xx3H/wL+OZoRwg==
X-Received: by 2002:a05:6a00:847:b0:56c:b03f:8a1a with SMTP id
 q7-20020a056a00084700b0056cb03f8a1amr140694pfk.47.1666973261937; 
 Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 b70-20020a621b49000000b0056abfa74eddsm3112071pfb.147.2022.10.28.09.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Date: Sat, 29 Oct 2022 00:07:31 +0800
Message-Id: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

v1:
- Documentation: Add dmic-gpios optional prop for two DMICs case.
- dmic codec driver: 
  - "dmic-gpios" property is used for amixer control to switch
     the dmic signal source between the Front and Rear Dmic.

Thanks for the review!

Ajye Huang (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
  ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs
    case

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   6 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 104 +++++++++++++++++-
 2 files changed, 109 insertions(+), 1 deletion(-)

-- 
2.25.1

