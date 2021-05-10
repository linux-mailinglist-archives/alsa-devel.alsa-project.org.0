Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E03780F9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 12:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7463016AA;
	Mon, 10 May 2021 12:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7463016AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620641626;
	bh=WQMsFll1dCiHSVkvMZXM707wsEmZwA06K7ny+58gTWU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vqd1zxkhzp0Tipe4wL3mWCLnFxEa5DEe/8Oxlhe/74iQcXbY1IvwBYh5sdxdDBWRO
	 9H9d3ywVYMyMQbrJdf5Z/OYZqMCo6ULLbgPUidAO44e1vaWSSY0gQp9ndWsBmX1byd
	 P6NLrgyd5yYGTWSJXoB7TajHAwJy5oIVVpiVGXMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D888CF800E9;
	Mon, 10 May 2021 12:12:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A35BF8026B; Mon, 10 May 2021 12:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EED0F8020C
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 12:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EED0F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OOjlV0Qh"
Received: by mail-wm1-x336.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so8542687wmv.1
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hku4IdX9XsHriOdVJku9o6pIDQa3wzykYMRftLXwsqA=;
 b=OOjlV0QhNCDkbKahaFUChHiKPQ3Mfv9KIuZb0iUPiJHQZ0KzHHgP/3Qia91d0h2nwP
 t2RzZm7GiXLLrJOCRWT18mL6OrsUP3uqCs3M0dYeipPcjgWRJgnziZ8qa72WP43wLKZ5
 SBVrsP4Sd6WWhY6yGk6IdhbsC2fkNFl2HkoGA8m+dW0jWl57k7lYFvIxvRw2RZYLpjnj
 lp2dLaRQzFWCd9D+CdWeArEUHCKRtbvZ1GH8s3Fy9Ql3zhDaRzGtk7HHuQmr7yE9iqBw
 RcWd6dh0DbvJuyVkt7gQSwcTlD+P9kZF521nJWdAPr420mci8gfgcTfJbyvrdMpRr+u1
 rEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hku4IdX9XsHriOdVJku9o6pIDQa3wzykYMRftLXwsqA=;
 b=aKFEX+Gn0iVBAeMiHWoxx95k2BXMD/Ag5uiHUYP7+/MQPnoh/1SHXhDZzDPx/m2uWd
 0DAWFAvSd51f8HYeutl6++z62mz00AjNtzrApCtFjheLRVWAvTg/zReYm2f3WNbbToX3
 27fhbgkpNo5O8Mqm4WQdfmcak0JGgz7PU4AnyD7HS8ZeoXNA5qgPWXe1X3Jkeoj+hEEQ
 edAM7ppGnIXvmnf9dUgJ2/G/4JMGIaQJjDonTUEMgXvmDVZoL7lmOQDSEJ6SsXhz+hkR
 PoIzwBfgsXBS83u0OJ8yEl/YeRw50XDbeqL7HbyHg3Bj6EZ5e6yze6AnqQ5+MDhqKtYQ
 gQpQ==
X-Gm-Message-State: AOAM533ns/L3iPfP+5LCOnuOrBheC5ueIF6h6GJ9FO8jqzHmYs9VKCpf
 hNj9+WfL7Jcwgw6l8qUqRO7RPQ==
X-Google-Smtp-Source: ABdhPJwFfk++/wPHzBoH7orUTH/DOUBPwpgy703BNGlvAsYNjUb5Vcg5xdtGGW7VF+KMhuyBY03cHA==
X-Received: by 2002:a1c:6757:: with SMTP id b84mr25395424wmc.58.1620641532999; 
 Mon, 10 May 2021 03:12:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm22072109wri.83.2021.05.10.03.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 03:12:12 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: codecs: wcd934x: add Headset and button detection
 support
Date: Mon, 10 May 2021 11:11:57 +0100
Message-Id: <20210510101201.7281-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, lee.jones@linaro.org
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

This patchset

thanks,
srini


Srinivas Kandagatla (4):
  ASoC: dt-bindings: wcd934x: add bindings for Headset Button detection
  ASoC: codecs: wcd: add multi button Headset detection support
  ASoC: codecs: wcd934x: add mbhc support
  ASoC: qcom: sdm845: add jack support for WCD934x

 .../bindings/sound/qcom,wcd934x.yaml          |   65 +
 include/linux/mfd/wcd934x/registers.h         |   57 +
 sound/soc/codecs/Kconfig                      |    4 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd-mbhc-v2.c                | 1463 +++++++++++++++++
 sound/soc/codecs/wcd-mbhc-v2.h                |  340 ++++
 sound/soc/codecs/wcd934x.c                    |  885 +++++++++-
 sound/soc/qcom/sdm845.c                       |    8 +
 8 files changed, 2809 insertions(+), 15 deletions(-)
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.c
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.h

-- 
2.21.0

