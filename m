Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C68579A313
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 00:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35614847;
	Fri, 23 Aug 2019 00:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35614847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566513495;
	bh=F6q3yZ7ygfz6l5u1EBqa3AZDpIxUa/RhqkNlrKI8AiM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=im7pfs80k51ttsuOIyYHJT/1i8MGJRE+26g9Ju5CoU+LuSfvdkHfjoTojMC1DZXL5
	 M8VhdQQDv7E9uTz+KomSXQwVrh+/CMnhCMctnCOPHDKYVw7xV6sVxRiAETNA9boucm
	 4aqabSxsyRJJgnecwz4NQHr+hQft8qPX7vkrCKWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 740DFF8036D;
	Fri, 23 Aug 2019 00:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DC83F803F3; Fri, 23 Aug 2019 00:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 969DCF80112
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 00:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 969DCF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ew8+IDWC"
Received: by mail-wr1-x441.google.com with SMTP id c3so6836999wrd.7
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps5fSEr1qMGUj4gJBzVj6xZCpnRrFx1jjYFeOMLoqEo=;
 b=ew8+IDWCuDX0P3zBzbl9bTTlRaF0BjyzxzUXr2A4u5xK1/1vjRmnlQsuoznfX/TRJz
 h98W/LezmoT47tSdIUXsrmmR+t0yKAEoenYnGoC2W/iQbwTBsqrE83QFkkQOeovJUs8B
 BF4mlJ3rRB4eusmQ3nFwosElKoFRF8Dtrz6BsFm7D2JOnayubL8m4n6yldfxF4O4u9Rc
 NQI0TUTQNl3MgJg7SBSkWeeckHhdkMeqqaqkZAX3WUUnM35p1ij+guS9I4PFQFB3YNH7
 e0bpPWTJyNfm1HV+9YTAU7KErnLd2q7vPz9CUpUoXuTtldjoqbgZVyK1GL2AKEdQcCc5
 sK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ps5fSEr1qMGUj4gJBzVj6xZCpnRrFx1jjYFeOMLoqEo=;
 b=o+HaXYhE0gyt5R/WibMd898TTJv7pLUNeAseBUXHAT8zzWAnlf6VAo9ZBJ/xS9G6vw
 wBAtnhubYDN0PgUDGa+hV92oiNHgS3kBT7St0UDr8r0z7CLkWewODIRn3eyIRI5faZjQ
 BswGdOSDDMuj1GShz8BP98YKYCHpupTkxws2cqTQHn+jjaYFtzbwuyNlqk0l8KbwvAIs
 qW1ue2seBtiFFFCkFnWX5BPn6esrgxcSX54L+iCd3eNkDNgqr+8Q44DrKUmkmGOT+77G
 nTps2jwWPsy7LZ8ebNyyrDlPGk5btG9rM9e5HVV2st51N61n7rKRrdqiXemFjQLh2VIm
 hMrw==
X-Gm-Message-State: APjAAAXPsBpgVvCEO4ezHvxc/wcJZ/qoOvSSyVxNhKVTeM/RbFaslgVm
 q1PM+4u1Rc1Rh1W9t7lRjkqDTA==
X-Google-Smtp-Source: APXvYqx0IIRgPoB4p4JYzy/bI4HE0dPeSOqiMsFu/NXuJ66mmtgb/OaIc1NqXxObaoj/F0XPLcPH+A==
X-Received: by 2002:a5d:678a:: with SMTP id v10mr1136982wru.116.1566513381364; 
 Thu, 22 Aug 2019 15:36:21 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id m188sm1886380wmm.32.2019.08.22.15.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 15:36:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 22 Aug 2019 23:36:02 +0100
Message-Id: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 0/4] ASoC: codecs: Add WSA881x Smart Speaker
	amplifier support
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
 .../soundwire/soudwire-controller.yaml        |   75 ++
 drivers/soundwire/bus.c                       |    2 +
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   52 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1134 +++++++++++++++++
 8 files changed, 1320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 Documentation/devicetree/bindings/soundwire/soudwire-controller.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
