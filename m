Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F150A2110
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 18:38:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89BFD1688;
	Thu, 29 Aug 2019 18:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89BFD1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567096707;
	bh=SfZzDoIIEau9p+igRAhUEc8NaikM/VqQEJS295XE2yE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yfyo30vfLwVsbuhn+X70OpwyxA0vt+Wknd3S8v8+lkqbZosG2/rUsPzPfYIBE9bey
	 GM3ioG9su18zfSu/+69EQhhuQ9/ePInP0ns6AXJpfNFN9GlbBs2KfqhEvcTco75GDh
	 7oGlfusuUGg1JerPp31qLUBKusV/MHr0eBvCOnO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 285A4F80274;
	Thu, 29 Aug 2019 18:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F6ECF801ED; Thu, 29 Aug 2019 18:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63478F800F1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 18:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63478F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ILi2D94O"
Received: by mail-wr1-x443.google.com with SMTP id u16so4148968wrr.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N+c0qA0XM3CJtKzSOyldE7zb5NKzBbtoCRXB4ExOIbU=;
 b=ILi2D94OAOQwwctQJ3w2ApbF1WkWInktVYqIS55gOb8Ugdl0wE1ny8VP9sSvWelKlX
 hlZrFOecE0RCikC+Hr0LnSzMXqUQrhmMHQ6gWvFPDtIOfSec8yagELdOWLrI9QJE7ITW
 I8n7kp71OEqALz6VefXsWjdvQICRVkrq9TpNOYbmIYWIJiTysdeOwGc5/n4I4EIJJp14
 3qgN1gNIibA+7B3ls4IaUhmPxTj/RnwzRy5nzdO6YKsAEt+AzzYSjQRtKN2Zxb9/b30m
 PvMtJ3Wmpovn6Sf5JixDwUQahojbgiQIESTmVF9vnP6UVP5EwgJjTpHWiCid2hf9c66O
 u2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N+c0qA0XM3CJtKzSOyldE7zb5NKzBbtoCRXB4ExOIbU=;
 b=jdQCd4bsRBxnniFMifABXR2jch/Ukjykyk2dogUl3JnDgB6fa61m4LWeIPPSbHb0NT
 akp20kBVIVxbdM/W877GOsG89Z8J+jknCfdqbMlgJaWl4KUYEuCYVeDATeXRlu/lW+KJ
 Z1CZEXwUO04MVZYm+0OZavJulAkAl5iNjOe+TrTjyzXms1MX7Kf2+MK6qv5fGOUm/O3u
 IGFFFa/qGYevYFPv/ASIVBU54CA3rjGRPG+51lK7vbsPkYMDMsleCUMiCgeU9/3YaHW+
 MqWbqWJvsISsKVkG/130+TUGquN1BrXtpp46xJN64B4/yq5jW96WjlhB2bloCubPOebH
 aeWg==
X-Gm-Message-State: APjAAAVuc09KB9v26ojtALbWUBmcye176OJKTHuhCXvXlrM74YSwv6K/
 KRwI2XV/mQM5WooPSr/c6P25hQ==
X-Google-Smtp-Source: APXvYqycd8fi72Kcd8HMVvxvRzc0dAVNmyoMC+kJmLPG7uQ3k/lN/mNd0JQBtiMLUhXA93Y8EAKJAA==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr12508573wrv.156.1567096595281; 
 Thu, 29 Aug 2019 09:36:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id k9sm4398243wrq.15.2019.08.29.09.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:36:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 17:35:10 +0100
Message-Id: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 0/4] ASoC: codecs: Add WSA881x Smart Speaker
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

Changes since v5:
 - updated slave bindings with proper licencing and fixed up examples.

Srinivas Kandagatla (4):
  dt-bindings: soundwire: add slave bindings
  soundwire: core: add device tree support for slave devices
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   62 +
 .../soundwire/soundwire-controller.yaml       |   82 ++
 drivers/soundwire/bus.c                       |    2 +
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   52 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1134 +++++++++++++++++
 8 files changed, 1345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
