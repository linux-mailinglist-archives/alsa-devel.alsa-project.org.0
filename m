Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88F9A3FB
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 01:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CAC1658;
	Fri, 23 Aug 2019 01:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CAC1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566517212;
	bh=/qTEHIHB8NdHTdBwdwkD/RqT/semz9vl1AKu5/G+m7s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lbjL97VQiNqc1oQVRYuPiW34vAgpINj1tqVe6t9H4FQ2A8ChPFhnaYkPiG+JfAzQ9
	 Ehuuzunc7SfWZujxg/J4H52hoywLCUbO/0jvcWTIkSzynPc+fzn1/eqq/QEhwZ1qw7
	 Sx0p4/2MpcFSZf8urr4in6E19O8vVJ7rLn45sTtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D06F803F3;
	Fri, 23 Aug 2019 01:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B18FF80112; Fri, 23 Aug 2019 01:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34F51F80112
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 01:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34F51F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dsMUqV6r"
Received: by mail-wr1-x444.google.com with SMTP id z1so6918259wru.13
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxo0eAEf3fJwKk0DHfBYnFpenezLkSgCZl+oCD3TV3M=;
 b=dsMUqV6r4O2zGkVt3hW+Fx7aIsyRgpSQErbvTBN7+ZPaKFr9tuyizHRQVNeMj8c4XL
 WFqYh1lZiXvZUF8xFPzF25S0ERpoYImdgLie7gREL490yoNp1SvV8CBy/YApGjaF1xfb
 YMQXlQfC5sVNrCpzMUAAR8I5GJpnuxwlW6wz/sOa45gwrVdGDthTfDW7U08uwMNtn/bg
 RYUxSd6OeQCpxstLos3AlTzNgqV4UDeRrK+BP8U4DIahtvTu7depDZnlMMDU8KeiSp1E
 TyATForz+R18C3S+TDdHTIV2Aw67+PvqLnMsmtOkgF6lE+Gfu7jnCB4RljVzbuI2rQik
 ta4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxo0eAEf3fJwKk0DHfBYnFpenezLkSgCZl+oCD3TV3M=;
 b=St9KVgaKqjkWV8m2IY6pllroBZn0IWB/sDMKp+7NfRVCUndxnV6+2DtE3ODK+mdben
 6EMLmMSDYT98XHtEtJobx+rhl9B7uNXlLRl7nDyea57ItAL3nSTAG/DJsWr+zJ9FfjDC
 TQ6hnzS90hsqeNcxzHPvBgGOGRB1QYtCD+QNk9gaIQeE/cxLUN5/Pvz5u5fgx6UH/yED
 brhksuAYFFw4s+JY4g2IpGl0s3h0mzdEnmNFyxvxwd4OnBnYeYwViKxWEcmCqf2ED3Qo
 TCJ28HqV7KUobbQUOefigjoNJwV9Wy+WmzcdHhBiGo1mZ/CHExVq00joLykNdvYDEuJB
 q1dw==
X-Gm-Message-State: APjAAAWRNFFPwjWFZCEmBy0lOldBf1D+ifyHEv1qEaCfjBcV7/Vucccu
 mU7q07hlfNutN2ErbVJt80fPXw==
X-Google-Smtp-Source: APXvYqzVwNyXgKAoUxu6i1pDAVSMuh+VIbRZnl5lFohQGcKO7KCWaa0n9xm8Y4YFV9dQ970h6z0pmA==
X-Received: by 2002:a5d:4ec6:: with SMTP id s6mr1210862wrv.327.1566517099942; 
 Thu, 22 Aug 2019 16:38:19 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f134sm1705157wmg.20.2019.08.22.16.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 16:38:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Fri, 23 Aug 2019 00:37:55 +0100
Message-Id: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RESEND PATCH v4 0/4] ASoC: codecs: Add WSA881x Smart
	Speaker amplifier support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Resending this series due to a typo in yaml filename!

Thanks for reviewing v3 patchset, here is v4 with addressing the comments in v3

This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
Amplifier which is SoundWire interfaced.
This also adds support to some missing bits in SoundWire bus layer like
Device Tree support.

This patchset along with DB845c machine driver and WCD934x codec driver
has been tested on SDM845 SoC based DragonBoard DB845c with two
WSA8810 speakers.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
	Add thermal sensor support in WSA881x.

Thanks,
srini

Changes since v3:
 - updated slave bindings according to Rob's Suggestion.
 - moved bindings to yaml

Srinivas Kandagatla (4):
  dt-bindings: soundwire: add slave bindings
  soundwire: core: add device tree support for slave devices
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   44 +
 .../soundwire/soundwire-controller.yaml       |   75 ++
 drivers/soundwire/bus.c                       |    2 +
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   52 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1134 +++++++++++++++++
 8 files changed, 1320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
