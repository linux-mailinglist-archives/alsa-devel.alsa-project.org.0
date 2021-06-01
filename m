Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C529F39727D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 13:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE1016CA;
	Tue,  1 Jun 2021 13:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE1016CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622547379;
	bh=AMt0xBj1NEYflFlOQ19KF0lXoGyNdCVCdLhs0++e0G0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kH2p7C6fCuseKdcEMj2lEKueSNEpT/+iDDniCmbNj9OyPWJZpmvXFc/JyTvhucIar
	 J5SHVO2Z7DJp4PpcUPJuR8C+T6ZV/E0ORLPOp5O9u0M5RR7/aLZkBkde9tXaHGI7HQ
	 E5SSSkeZ+cuvGFjnCsd5YHpm79/+x6r0vZBG02y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0D1F804BB;
	Tue,  1 Jun 2021 13:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF04F804B0; Tue,  1 Jun 2021 13:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 402B3F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 13:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 402B3F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aBxtyGNN"
Received: by mail-ed1-x533.google.com with SMTP id s6so16834313edu.10
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3z4f9OtSIbuNbOfZKzA5/qCGi7jD1UUm7qfZnJAs7+c=;
 b=aBxtyGNNDN2VF/9oG4s3CHhiR1NgayvyPXk61RGSRhhhcL22f9AchZhQKM7LjfQnpr
 ud7eaXUeLcfh3Mp8/XzfAboSobak4+iTzl7xSUjoChJopx0hbEtMBwF29H1CiqzqQH2x
 K+LFcKliXCNxosLn/RKZy9vIh0VzQTZzAhz/mIgPb5WCF7TPg1BIo0ravY9zCKN3I7lp
 1hoGXNJzRy7GJFl4rPRd/LXWxwlZK7FenE329G4ZIakdiOoXImygc3VbioeFdegT0i1W
 KwU1ioC/ldaGl9M0vCwfxdSc+LZIDUCDBlY7f9yOrp9zYMUiGiNYq0yPVnWTrN1eQW8U
 f3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3z4f9OtSIbuNbOfZKzA5/qCGi7jD1UUm7qfZnJAs7+c=;
 b=Gh2OBmPCPGQIGUB50R1coFCQhpU6JAfkrJUlxW/M3s1kao1ogpI30/wOOhOOMJCBtD
 u8/H9jwuB4A5Ci1+MUdoZZ8PY0Sf7LXUynqnPe3YEc0BvaLder/YV/Oc/gwHZY5N98kc
 orO0//n/a/zZCdCl4SnHgb/86eL1Nvi6+IxieqBLn7eR3K5t5JJlQFomaqzaFZESySN+
 f/vDUxmDWpF+Op6H33g8A8hzCNms7wV3S1kKAs5n7/1ep+vpwQKuhDrTcMt36RIYuyEZ
 k/pJgrY7M5T9cwWTaeKhpPS6RQcBK66lVmrwXTv/AB7lhM2gKMbPO0lbB0+CZ/7RLktA
 WhiA==
X-Gm-Message-State: AOAM532HjwXV79nWiaz2grnv1tF0KiSJC2+v6WJqF8yDbgTm2zUr1Q7a
 GSa1HWSP5mKht1WPmzWFRjn/Rw==
X-Google-Smtp-Source: ABdhPJzF5pFr9Bwg3mL0v55aEGXnwhGOjgGDv9bgvy6GHV/sknQiN/zVcpPVsS+iskX+kz16xT5RRQ==
X-Received: by 2002:a05:6402:543:: with SMTP id
 i3mr15827295edx.173.1622547275613; 
 Tue, 01 Jun 2021 04:34:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f10sm4729487edx.60.2021.06.01.04.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:34:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v8 0/9] ASoC: codecs: add wcd938x support
Date: Tue,  1 Jun 2021 12:31:49 +0100
Message-Id: <20210601113158.16085-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patchset adds support for Qualcomm WCD938X codec.

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs and MBHC.

Eventhough this device has two SoundWire devices, only tx device has
access to main codec Control/Status Registers!

For codec driver to be functional it would need both tx and rx Soundwire devices
to be up and this is taken care by using device component framework and device-links
are used to ensure proper pm dependencies. Ex tx does not enter suspend
before rx or codec is suspended.

This patchset along with other SoundWire patches on the list
have been tested on SM8250 MTP device.

Thanks,
srini

Changes since v7:
- Fixed errors reported by kernel test robot by moving SoundWire specific bits to sdw driver.

Srinivas Kandagatla (9):
  ASoC: dt-bindings: wcd938x: add bindings for wcd938x
  ASoC: codecs: wcd-clsh: add new version support
  ASoC: codecs: wcd938x: add basic driver
  ASoC: dt-bindings: wcd938x-sdw: add bindings for wcd938x-sdw
  ASoC: codecs: wcd938x-sdw: add SoundWire driver
  ASoC: codecs: wcd938x: add basic controls
  ASoC: codecs: wcd938x: add playback dapm widgets
  ASoC: codecs: wcd938x: add capture dapm widgets
  ASoC: codecs: wcd938x: add audio routing

 .../bindings/sound/qcom,wcd938x-sdw.yaml      |   70 +
 .../bindings/sound/qcom,wcd938x.yaml          |  146 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wcd-clsh-v2.c                |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  315 ++
 sound/soc/codecs/wcd938x.c                    | 3743 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  720 ++++
 9 files changed, 5365 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

