Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4A8B2A3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 10:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B8C1665;
	Tue, 13 Aug 2019 10:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B8C1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565685465;
	bh=15Vwuebqm2w1l0AMJXZXTkK9OJn+VYAdcfTQxBIVXP4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dWw2o3HFi2MZvowhLicVEV/QZkkaWuvMWuh2tnU5AYAtQFSxGfjHPOUmbmlkU1CQ5
	 K6qWJNlppnSnTKhLKy8ZUH5fQrRaBuFkOC89Q/PPqoq6Hhqvbv+IueRM9mWQzqKBbQ
	 lpdV2m6++L9t/SdR/5mkS8OUMj1nAPsBIFYB7B48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C36E5F8015A;
	Tue, 13 Aug 2019 10:36:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA52F80274; Tue, 13 Aug 2019 10:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87440F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87440F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oUiDtvrD"
Received: by mail-wm1-x341.google.com with SMTP id l2so701268wmg.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gf8oMUZD9BuH1tA5WiPMc3a88iyFztlGdMksig5IF5U=;
 b=oUiDtvrDAjvg9ztkMAJkZpYGsIowQdXup3NVYcaeYbQ8jEbkayG7R9N4CjqmQO4Kr5
 X5zCuTrRM6491pBfc5NrTZYz/5KRoRSIlTcqmz0TY0WtZlywAomKwVO0fiZYd7UagbOh
 B5csnV3iwxXsQCojKDVaxEBBLVpi+G9Sw5WKVAUs4iO11IPsLFC51wCAYhZOlZNXk8yH
 A6vdzWk+nUtYIki63Y6P0jvBht+OzbVl0A0sIx7NxmUZc9oIyup//bWkAJJoIUTazaeo
 NKrD/2NjfGFDbwU04mefMhPaxiceHZDD1SmdiPXXLJHAT5EaWQAHOE3de7m7oY8xuzue
 6Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gf8oMUZD9BuH1tA5WiPMc3a88iyFztlGdMksig5IF5U=;
 b=H++LCZE2hOCSNQDjzgFVLcolSGQg0u0VAzxhtsr2wAFYE2f2jrDw94b2zOMP4gPrU8
 LBRb09WQROmOq+HNykFXAJlXhJaNHtKdV0cGLk2pzu4QdsGvLJeb11WKNDsM/QndthJx
 idbetX5FJgc1oVRRgn0oDEiLD1ulM+g8WuGqIMkGkNFPneZCxnLzx8Z0SlkzZLT77uy0
 h71RYg/zbsPpjiYJum2fLP82Zkcmnl+sM0Kt9b+8a3k3zXN/DJFNq2XiH+tjTAj1W1gj
 NnYaerkEcxfvzw8FmGQVaO9C5IBbCJ5RoN0ukwpVZGwTsEGAjByqNSvAejS5dyR+wX7d
 wzOw==
X-Gm-Message-State: APjAAAVXHOhghta7WHl2cv1kUeNR8VRsdkuteEXetvUxnabQDC71CxlY
 4OzGFOT/5RKcZ7LvYg3i2DbZOw==
X-Google-Smtp-Source: APXvYqz+ArjE/b8LuqDHeWnFSPWhCxhwZjmprL6QzONacS3RLaBmL8Zvrs6NzQ4qdiW32u562cRerg==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr1714803wmb.119.1565685354389; 
 Tue, 13 Aug 2019 01:35:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o11sm8651822wrw.19.2019.08.13.01.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 01:35:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Tue, 13 Aug 2019 09:35:45 +0100
Message-Id: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: [alsa-devel] [PATCH v2 0/5] soundwire: Add support to Qualcomm
	SoundWire master
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

Thanks for reviewing the RFC patchset.
Here is new patchset addressing all the comments from RFC.

This patchset adds support for Qualcomm SoundWire Master Controller
found in most of Qualcomm SoCs and WCD audio codecs.

This driver along with WCD934x codec and WSA881x Class-D Smart Speaker Amplifier
drivers is on DragonBoard DB845c based of SDM845 SoC.
WCD934x and WSA881x patches will be posted soon.

SoundWire controller on SDM845 is integrated in WCD934x audio codec via
SlimBus interface.

Currently this driver is very minimal and only supports PDM.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
	Test and add PCM support.

Thanks,
srini

Changes since RFC:
- updated bindings as suggested to take care of more bus parameters.
- fixed error code of snd_soc_dai_get_sdw_stream() dummy function.
- Cleaned up driver to handle read/writes in same way without special casing.
- removed unused defines

Srinivas Kandagatla (4):
  soundwire: stream: make stream name a const pointer
  ASoC: core: add support to snd_soc_dai_get_sdw_stream()
  dt-bindings: soundwire: add bindings for Qcom controller
  soundwire: qcom: add support for SoundWire controller

Vinod Koul (1):
  soundwire: Add compute_params callback

 .../bindings/soundwire/qcom,sdw.txt           | 167 ++++
 drivers/soundwire/Kconfig                     |   9 +
 drivers/soundwire/Makefile                    |   4 +
 drivers/soundwire/qcom.c                      | 919 ++++++++++++++++++
 drivers/soundwire/stream.c                    |  12 +-
 include/linux/soundwire/sdw.h                 |   6 +-
 include/sound/soc-dai.h                       |  10 +
 7 files changed, 1124 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
 create mode 100644 drivers/soundwire/qcom.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
