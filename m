Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3F55FB56
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 11:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90971652;
	Wed, 29 Jun 2022 11:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90971652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656493689;
	bh=ySV5+JWfCS4g+b16Haud+qvLRuWRulucge1TkeiDpSY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fW9bD81fZ0Lqf7fyv6HTEOBEuwz9J/xnjDX37jxIy4j56hu0abidgGQLOkYYJ7g/t
	 ULc5B6Xlv63FadBIsxQ4HP6Ey2/ljgC8M7qJBPmSrltgC1S1qx9G5xr/D7wiiFb2S+
	 LKhdU0IZzeU0IrYKDVPclN6wYXD5H2Invc2KMLP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D748F8027B;
	Wed, 29 Jun 2022 11:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BBE8F8020D; Wed, 29 Jun 2022 11:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E99D1F800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 11:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E99D1F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SbqRZ2lG"
Received: by mail-wm1-x32b.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so2783031wme.5
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 02:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FUi18BfABJfFdfrTy/zmZdsKXzzTHRjYZn6DAYr2OpM=;
 b=SbqRZ2lGoBj4MFROYCQz/qjnA+OfVT1NoH4TCsIICdxIY3XDK0tLMdH6vOxYVAiKEg
 t4f0CnvkczgFg+Y89hiBtWjI9lfG4lqTu0GHPFY8e1YHjSzOVDDNuvBcxYmNhv2pUVlt
 VEeBCpZjEy5hW0ImOSRG6M44PUYsxVJGN44H/C8IpUY2tZryK98kM8XzzHxMXFIiPlB4
 AxAULWW5UTYg7GaO0HtefCtiaqgRqE5ZPLjZBXK1fkJ3b711dfSYrZsmp+nlnfCr1nE1
 vqIHo7RWSv0qL6t1aYoQjLgq71ZOe4JeDSpARgiYArkzZrQd11BY3Z579lFfAk/hNtxD
 DKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FUi18BfABJfFdfrTy/zmZdsKXzzTHRjYZn6DAYr2OpM=;
 b=eyko2KE6Gmn58t/KxOZ6BuAQUiVyX4In4XrQ5GBSt8OJHS1HHgbd2OUR2uw3DqdocN
 10bmtfrjhCBHE0OIK+dWbVqrbGZv+oz7cyzlSKvN3oJRD4exu+NbLscUdNaIEgCZTrpS
 ZaEY2Bghe3TTfwmXu/a0YJs5VvtuSe9mx/aUU7TtRSV3HHDODU+W75XAqVq8s1/8OCHu
 Jy+uXHGQt8YRbF/TpDAdAua+lWNBU1nCPjEt31Ngo7/ll/1zmB5g3mpFEIZx5kX10SjX
 ADCajgAqi1GzA+sGzbAyoZqNtKBJNCxqZFd8uhqBlGNWZ+teM6vaX9zHVrEgEv7DfXxl
 zKJQ==
X-Gm-Message-State: AJIora8DRxG4Mk73yU2M4f0EsZXJuIS0/HTWwN76EstaRchrN9oS87FE
 Qd9HkfQ8/GFq3Kns3xg2PxKfOA==
X-Google-Smtp-Source: AGRyM1tzLUjJTsjzxmN9nAUGOrChMCfCFRxIO+WCDnxX53yn2Of1UbeD0rdgyezMd7l2GLDtoswLaQ==
X-Received: by 2002:a05:600c:4e8f:b0:39c:89dd:ae3b with SMTP id
 f15-20020a05600c4e8f00b0039c89ddae3bmr2472844wmq.200.1656493624411; 
 Wed, 29 Jun 2022 02:07:04 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a5d530c000000b002185d79dc7fsm15993341wrv.75.2022.06.29.02.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 02:07:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: codecs: add WSA883x support
Date: Wed, 29 Jun 2022 10:06:40 +0100
Message-Id: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
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

This patchset adds support for WSA883x smart speaker amplifier codec
connected via SoundWire. This codec also has a temperature sensor used
for speaker protection, support for this is not added yet.

Most of the code is derived from Qualcomm downstream msm-5.10 kernel.
Thanks to Patrick Lai's Team.

This codec is tested on SM8450 MTP.

Thanks,
Srini

Srinivas Kandagatla (4):
  ASoC: dt-bindings: Add WSA883x bindings
  ASoC: codecs: add wsa883x amplifier support
  ASoC: codecs: wsa883x: add control, dapm widgets and map
  MAINTAINERS: add ASoC Qualcomm codecs

 .../bindings/sound/qcom,wsa883x.yaml          |   74 +
 MAINTAINERS                                   |    4 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa883x.c                    | 1498 +++++++++++++++++
 5 files changed, 1588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
 create mode 100644 sound/soc/codecs/wsa883x.c

-- 
2.25.1

