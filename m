Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE461633D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 14:00:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41DB0167E;
	Wed,  2 Nov 2022 13:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41DB0167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667394047;
	bh=re49nLN9KiSV/xUHWy8FVAPZH8eaMkNgRBccLEM2FM8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M2HbN0LcTWjugA9ouvcImFh4QrFnMlbY73Hu6x3khw8epidlMaBsdMCz8EfILIpnv
	 JA6nlWWPP7rXvGMRxC/aDfziKjCBZfRpnHCfxb/oI5M9mxl8lSn35wObgAyfG/psPy
	 shd0dlpya7koWE/yofLCGCBNVQMBG7iVcajSBJ/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5019F80155;
	Wed,  2 Nov 2022 13:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A022F80155; Wed,  2 Nov 2022 13:59:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A52AF80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 13:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A52AF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="KPv16VgS"
Received: by mail-pf1-x42b.google.com with SMTP id b29so16295436pfp.13
 for <alsa-devel@alsa-project.org>; Wed, 02 Nov 2022 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7JeNjduJ11iTjItlrELM3uT2g5gNbw14nHXxfp2BQo=;
 b=KPv16VgSY+zS/r0qBRp9hB7SGa38CEdYWE8qXB+FuB+/CGBU/BGQakBKmqCwFgRkTx
 3d3eGwXk7jed+3ksnRqcUhjjLqTSdLQSwduXMA/1y45BGUR2vHTtJj4Xe8BbKkz51UK9
 ntKVKdYdde655Jj8YsfI38h/1qxED8fTfgRMzxU9J6+dgD9Ev+j46DDfhUgPPzbB/WMJ
 WWx0nDilpyH6UQghabPcUKFVkyn0EmS/kybPV8rLJSoHWFrgabZTaP1GmN3pXG+mxH34
 bwbViDK28GpqXvpo1e08gjfg6nkMVh5eBK6LjaW4IwMH6GWJvwXPS2/hNM3tisMOmngI
 Oyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7JeNjduJ11iTjItlrELM3uT2g5gNbw14nHXxfp2BQo=;
 b=SAjnQ3jzlkLUEQWadEA9bP4eKHLRg+pOdwtlDxpoas6OSAq7ubFuRmhl91/SMqcEzi
 eii8vlvOolY+dSlyG0XzXCjlPPdTNbNlR8HNH6MeGSaw/vqe5yS3uj4mX/XVcB6Q+SJo
 FqoduTL8C3qUCnyvB1HrqA0GqV/V1iUSFhNNMIM0j1+sxchFMO22OSg6Z1pI6V0+rUhz
 vsd4VeWAjBJbJx6H0yIT1nsAHavfWJ2DqmuZYNPjOHneW0E78UAQdw0bhd7oqEH4oyRd
 XJsNQKc/Ozh0fukpQKGIeXq2QsqzVOpnIs2RC9ssA7ZOLQ0MWq6BlT2kxo4njRbLTh5v
 T2pQ==
X-Gm-Message-State: ACrzQf0oNrGQXtvnluLpFIpi7vtLWuqMKksbWKB4zNV9cgXFQNy7foT8
 +8qnwB4AcgHD4fVYZE0sgXtZZCNWBjqPMQ==
X-Google-Smtp-Source: AMsMyM45Yjmw8JpdtXQkZ9vOIRK40sRXZtsKoP2XWwt+qHD2TbV0WaKrxJVHL1PtY7KzniIjkj5zsA==
X-Received: by 2002:a63:93:0:b0:470:9d3:7d48 with SMTP id
 141-20020a630093000000b0047009d37d48mr2183665pga.425.1667393983888; 
 Wed, 02 Nov 2022 05:59:43 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-180.dynamic-ip.hinet.net.
 [118.167.210.180]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170902d58e00b0017f59ebafe7sm8259345plh.212.2022.11.02.05.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:59:43 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Date: Wed,  2 Nov 2022 20:59:34 +0800
Message-Id: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
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

v6:
- dmic codec driver: 
  - Modify "FrontMic" to "Front Mic" and "RearMic" to "Rear Mic"
    to consisit with commit 3cfbf07c6d27 mentioned in description.

v5:
- Documentation: 
  - Add #include <dt-bindings/gpio/gpio.h> in order to use
    GPIO_ACTIVE_HIGH.
  - Remove the change-id in message.

v4:
- Documentation: 
  - Fix the FATAL ERROR: Unable to parse input tree.

v3:
- Documentation: 
  - Add an explain example in description.
  - Add the pinctrl-name and pinctrl id in its example.

v2:
- dmic codec driver: 
  - Remove the unnecessary use of_property_read_bool()

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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  14 ++-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.25.1

