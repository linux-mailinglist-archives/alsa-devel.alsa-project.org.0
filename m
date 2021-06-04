Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB739B87A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 13:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15C411715;
	Fri,  4 Jun 2021 13:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15C411715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622807655;
	bh=9v1NtO3+naXIg5qk1iRVVw/oGIt5h1TrcnuRUm3jLMg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=csNcjq9fSsGONK7tsp1CUf6VFRrt0W8r2NCpQsT+7b2LPRLvtruL+dLAFo+MmWQrL
	 r4vc6fwC7i+l4iiZiZ+49MC00yGwxZH7kiqpfxD976tfLTcyszosQQN+fJxOQzvz53
	 iLPQfZVnoSCJWJ0HCgMll/4bZ5Emxj3prPWLQIyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6C2F80424;
	Fri,  4 Jun 2021 13:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B313F80424; Fri,  4 Jun 2021 13:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85039F800CC
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 13:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85039F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fXd5Y1hU"
Received: by mail-ej1-x633.google.com with SMTP id ce15so14062178ejb.4
 for <alsa-devel@alsa-project.org>; Fri, 04 Jun 2021 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SPjeFhzMyUmAM1Nea2hQ46d2ZnRzhfJiBQSpu2RFObo=;
 b=fXd5Y1hUr4hLV6bBzFtyvxRyyOjdjd5kkSkjkcsFJ+J5Xx+xC2JKJqYuNz1sNNnpg6
 w6cX/KXLzVoDUJQ6cd9xFwUJt6WUevaH+/AA2zbMsFbYYMzMZiYPxfihVg1/X1WUiPhT
 RsNFlAWCYIyNW24oUbriszit4G3lDOrxMfhDS1eM1WxEMYEge7gaC0svVwa96ut9z7Zc
 DO6UtXoRAceRYCtjfyiSfYx36AdZKo1OYnS72wiuwX267GYy5ktb0+M1jJJ3KQl3L14F
 v7qOfuMHWllIkVrvFfRIz8pJVyEI8gMRRVEwFRdGdorvsOkc/VBlKucgVClOqNnbucKz
 B9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SPjeFhzMyUmAM1Nea2hQ46d2ZnRzhfJiBQSpu2RFObo=;
 b=Bdh7oc0RG3yoM/1rp5aIQrdLm/BtkLC5tywu1rsSzU9LYPECk80gooRBL6NrHeVFwG
 mrLdUHdXlPj9TJwPgCru8OT9GNDt6D/eWaGAt1TU9LZqUL8tvez7/6gLSDTVQ99WQd3r
 FotrlJYqNGKRpIc5qRBIuRCbqvA0paI25ONjnbJGfPDwSGG5111yJnk/ASHx7OgmNhf1
 tL3c7v6h6Uz5k/HWtq10Yin70rsGaL/HAtI0JNerMFa/7DDrc5c8Tpu4Kv5FrS0aXHMl
 qathuD3VU/bQuB9g4jE9Lvig1Sqf1U/x2raTsjc3JZ8hHMwSsOFr+qsZLydTuwyuhMH2
 bbFg==
X-Gm-Message-State: AOAM5309QpQ7wrIjCi62wQWeOfSo7YPKhz/tz0rklY6AWoFGkBJ0nYo1
 iiPpFoENq3ZqhTBZuGDuB7yqQA==
X-Google-Smtp-Source: ABdhPJwFZiuFGPt59sSw/mqaiwnlJug7UBVio3Kww9j06BRd94gIbIgZdypZr+1i1GYFkzzB7POFsg==
X-Received: by 2002:a17:906:1986:: with SMTP id
 g6mr3751164ejd.265.1622807556621; 
 Fri, 04 Jun 2021 04:52:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x9sm2805527eje.64.2021.06.04.04.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 04:52:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 0/4] ASoC: codecs: wcd934x: add Headset and button
 detection support
Date: Fri,  4 Jun 2021 12:52:26 +0100
Message-Id: <20210604115230.23259-1-srinivas.kandagatla@linaro.org>
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

This patchset adds support to MBHC(Multi Button Headset Control) block found in
Qualcomm WCD codecs. MBHC support headset type detection, both Mechanical and
electrical insert/removal detection along with 8 buttons detection,
Over current interrupts on HPHL/R, Impedance Measurements on HPHL/R.

Eventhough MBHC block supports things like OverCurrent detection, Currently its
reported as a kernel debug message. Should this be reported as an uevent to
userspace? like the way USB reports? 
Any suggestions?

First patch adds a common mbhc driver and the second one wcd934x specific driver
changes along with sdm845 soundcard related changes.

Common wcd-mbhc-v2 driver should be reusable across multiple codecs like
WCD9335, WCD934x, WCD937x and WCD938x.

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

Changes since v2:
- switched to EXPORT_SYMBOL_GPL from EXPORT_SYMBOL 
- converted one of the if else to switch case.

Srinivas Kandagatla (4):
  ASoC: dt-bindings: wcd934x: add bindings for Headset Button detection
  ASoC: codecs: wcd: add multi button Headset detection support
  ASoC: codecs: wcd934x: add mbhc support
  ASoC: qcom: sdm845: add jack support for WCD934x

 .../bindings/sound/qcom,wcd934x.yaml          |   30 +
 include/linux/mfd/wcd934x/registers.h         |   57 +
 sound/soc/codecs/Kconfig                      |    4 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd-mbhc-v2.c                | 1475 +++++++++++++++++
 sound/soc/codecs/wcd-mbhc-v2.h                |  340 ++++
 sound/soc/codecs/wcd934x.c                    |  884 +++++++++-
 sound/soc/qcom/sdm845.c                       |    8 +
 8 files changed, 2785 insertions(+), 15 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.c
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.h

-- 
2.21.0

