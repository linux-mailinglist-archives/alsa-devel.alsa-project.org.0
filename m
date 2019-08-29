Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83430A1EDA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3411721;
	Thu, 29 Aug 2019 17:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3411721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567092204;
	bh=5k6FfIOOEQVWB1hHfGj/LA8Z2NIF6emBUVWS+6AHaLI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T151DZmjhgWZXlSo2yev6fNJqgpijn7N1JbSPgIb+lKoKEss1JATPF0bpd/EDNjFw
	 VL37Ia5Y3MsHTSqBgDxJoTHqSaKELfo2KFCPCMNIeu1PgvKEMwkOP0rQakjY/6KCqw
	 u2WX/nQ0+719iodRAWQuYGmK/oHvG7Jcob4l7NIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD910F8064C;
	Thu, 29 Aug 2019 16:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A62FF80638; Thu, 29 Aug 2019 16:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B549DF802BE
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B549DF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pQ+8uT/t"
Received: by mail-wr1-x444.google.com with SMTP id s18so3757577wrn.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwXrxO/TQ61wqw3wZNmwm6oyzfj05N2I5ILhprlnG2o=;
 b=pQ+8uT/trwOhHQVSHAJ+FOY4gXJrcYM60NNyUiKDJHKoG70UXFf7a5Y6LTCua6P963
 7hmqd9Eyitxds6vACpmRI8+JyJ3RwQAv/8V+7cPge/6ElIWaTwpfacr6hbNqn/F3/j5x
 ORr7UwGKwgwhj7I8S4CxWMsREWVFC1s70O6977oF9uZ3dU2Iby8DBpoknAyUhjRB2EBG
 RONyD94Wo88k8sYc2eH5VIW+i501J97tD2VLc5aYewB2KB21RhfHDPcAr/bQg8XFU5s7
 Op1JYXW5Q9hctMlXLa11rH3kQL/4NW0rdVc9Oxo5CkjVIqcDgqCNyvdAL2OcrkbaxCpq
 QXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TwXrxO/TQ61wqw3wZNmwm6oyzfj05N2I5ILhprlnG2o=;
 b=QD1ihdYPKwMVHLSAMONIeBCx/NT6yeVgjUQh1USMKHBLW9dIXE6flp93e+RCmSZ8fh
 DN0BWi3giDJER0RN6S0VS13YgQTZ9g8s3HXVV3LFCy8fQi+UDIc4Bj7ba0oioF34Xv4U
 Rhc+QW8VFEI4HTTcAy95OkIyVYAynoj88XVntQRYs9KDNkYFwIFIZ5r+PHKGLCymMTD3
 kFgXDXY1XNEuqong/T4VV6DDhvveVe4wvlB92UVij5n8+bLBBXbfrZK1AS16NXTccUMX
 Xweqy8i+G87PgmO3dqBw00VE9SxNl905bZSv4+VtKSceOSPRou8qfcYgPq7seH1a15vN
 tirw==
X-Gm-Message-State: APjAAAWfSABvtrQ/CoxENHfyOmY5Jd7VCabIHgMRYRsLxMyx2N8qcqr6
 HNbgIYX43NVUErFrt/TQPRUZTA==
X-Google-Smtp-Source: APXvYqz+5HAeKpiR9RKwsFji3DKygPY+X6WMUZszfH18n9skP2CEoN5QEEcl6qGstCGbFw1iu2iwWg==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr2051005wrx.220.1567089899507; 
 Thu, 29 Aug 2019 07:44:59 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p7sm3923492wmh.38.2019.08.29.07.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:44:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 15:44:38 +0100
Message-Id: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v5 0/4] ASoC: codecs: Add WSA881x Smart Speaker
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

Thanks for reviewing v4 patchset, here is v5 with addressing the comments in v4

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

Changes since v4:
 - updated slave bindings according to Rob's and Pierre Suggestion.
 - fixup warnings from make dt_binding_check

Srinivas Kandagatla (4):
  dt-bindings: soundwire: add slave bindings
  soundwire: core: add device tree support for slave devices
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   41 +
 .../soundwire/soundwire-controller.yaml       |   72 ++
 drivers/soundwire/bus.c                       |    2 +
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   52 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1134 +++++++++++++++++
 8 files changed, 1314 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
