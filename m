Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E51613AADD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:25:36 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F5A17AD;
	Mon, 13 Jan 2020 14:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F5A17AD
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE48F801F7;
	Mon, 13 Jan 2020 14:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A5F2F801F7; Mon, 13 Jan 2020 14:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88692F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 14:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88692F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZkykLhU+"
Received: by mail-wr1-x444.google.com with SMTP id z3so8551312wru.3
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8OvYQMaM+qpSXl2Z3EMu15jl+wVMWjq32vRPQAxhLSk=;
 b=ZkykLhU+OsnUN1GehXkbcpCYyeCOdnKd6x/WUPP3MD7JgzvICS+iQxO5b8v3hai3el
 6csFmPQpBEG5gLRECVAbPYdSQWgHWJV4mx3muHf2Di63wKiTAtxdTkpaSK8oaS91gqgL
 xVjlm/ZHg1TCJn2v5LcMNBB5Fy3uhp03mZkWQX9FAslcngPp5JdivcZWcMbMnhJH4iQn
 4ro3iEPaHKYI6XUuzEezt4ZvlcsU2I632TQcFZte2y6dk9i4XmRSwL+CCKqynPSQprmQ
 av7iDcqh4ZD8Gv6Lq3yZQwaKREtwAUy5NDSi/iYXGgntSp/t32wlkcj2cgy96neiOxas
 yBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8OvYQMaM+qpSXl2Z3EMu15jl+wVMWjq32vRPQAxhLSk=;
 b=TycCG47oqErCTsxKBdDDMs0gRm+GdRJh6WuVwN444uDvD1QXGkOExaTDV0vccE8m7G
 h88veqP5/fdoTOhq7hAe1YZyGxcFLsIvJRfxQsqVKHSOTCDvSuk2snM3xI8//wmF17rC
 vcqL+VSUilqqX+HNvwPDXgQeUA/47IgF9sdB2TDbYBfT/AR/sHmP+v+Z3na4yQ1rQByz
 +6ekvCUz8Cq5VfInf4yaUpHzT9uUYOnFRU2rw2GC0dgiQhDFFe9IhKgAvq29t4xPeWyT
 TvV4Aq/CaKxasZMvHqo6VdgyQxqJYnEEpM1+Em/pBEp/V2rQU+EQai6ePIduBNQgOilU
 vKOA==
X-Gm-Message-State: APjAAAU3JXCmXnA2e1mT4WM5AYj1N9L8EEqf7BFwDYwNnJp7+4KwnIAi
 ztLimCEVt/kLkthXKMssYTLYAA==
X-Google-Smtp-Source: APXvYqxdcQ2PDL0YCpFyVPDf3ql9zwKH6H5+6A68p38o4+HfpXHoYJM/8izNu9mByQSMjK7151oWMQ==
X-Received: by 2002:adf:ebc1:: with SMTP id v1mr18140793wrn.351.1578921725612; 
 Mon, 13 Jan 2020 05:22:05 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id u18sm14692987wrt.26.2020.01.13.05.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 05:22:04 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Mon, 13 Jan 2020 13:21:51 +0000
Message-Id: <20200113132153.27239-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 0/2] soundwire: Add support to Qualcomm
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

Thanks for reviewing the v5 patchset.
Here is new patchset addressing all the comments from v5

This patchset adds support for Qualcomm SoundWire Master Controller
found in most of Qualcomm SoCs and WCD audio codecs.

This driver along with WCD934x codec and WSA881x Class-D Smart Speaker
Amplifier drivers is tested on on DragonBoard DB845c based of SDM845
SoC and Lenovo YOGA C630 Laptop based on SDM850.

SoundWire controller on SDM845 is integrated in WCD934x audio codec via
SlimBus interface.

Currently this driver is very minimal and only supports PDM.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
	Test and add PCM support.

Thanks,
srini

Changes since v5:
	-No code changes.
	-Add extra comment in interrupt handler as suggested by Pierre

Srinivas Kandagatla (2):
  dt-bindings: soundwire: add bindings for Qcom controller
  soundwire: qcom: add support for SoundWire controller

 .../bindings/soundwire/qcom,sdw.txt           | 167 ++++
 drivers/soundwire/Kconfig                     |   9 +
 drivers/soundwire/Makefile                    |   4 +
 drivers/soundwire/qcom.c                      | 861 ++++++++++++++++++
 4 files changed, 1041 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
 create mode 100644 drivers/soundwire/qcom.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
