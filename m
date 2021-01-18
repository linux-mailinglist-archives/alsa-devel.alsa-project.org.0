Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207142FA699
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B351842;
	Mon, 18 Jan 2021 17:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B351842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610988456;
	bh=Ape9bN8W/zdsOw4UJxsAgW4kff0Eb7p7/DWB22oRtfY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uq2ArzuDxKltReCn2PEicUUZ3GnbMtAe1P0ho7JQDILHpueGhLrCoeWuCNm1+hRL7
	 bESYn4g875JiVcfhu25IkHWsfQP5PX2Rm8JakaLves4Z5Y34ch2Cib3S9MNf0XZP0e
	 Bql8sWazM2xQo/xznRElJDbMID8sEQF6C1KiQqZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E1A1F8016E;
	Mon, 18 Jan 2021 17:46:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB952F8016E; Mon, 18 Jan 2021 17:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E93FF800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:45:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E93FF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x7ob97xa"
Received: by mail-wm1-x32a.google.com with SMTP id v184so10127383wma.1
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+7g8YFQJtfBeQPKEZuecauHU9iyxul3YYBInpK07BI=;
 b=x7ob97xaWfVr/1IQ6c+PWwJfImuoHRjXMQLQQoTYhWxJqeSdRkkn0wYtWgUadc8mHs
 CaBWUlMmO4b7mWghHifI99Pn/AK319pPlC8qKIEQuUL+m7ZFEUzS75735MXPCVyOuXBu
 5bpR9QxK/qMEXEGfxbxZq2ZELi9lW8uvb5Z9qm52aDZTVYApMBhWKxMqAUhEJaLrMuSe
 WvT/tdP1Hq4oXRP+TJ/mtL6NzbCflIZ8XNy5nST5Yb+0TCmSool7adB52ge55uiUO9sT
 pMR/PMMV1rNeB39jWmAm8m1UplYvz2cRvfq7P5iC6eidP8N+CYkvhDhFVnXzW8lshJ6u
 aPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+7g8YFQJtfBeQPKEZuecauHU9iyxul3YYBInpK07BI=;
 b=fB15jDv9ZHqJLkAp4pk0FlJQRyzEL7zQ2VMlQ6nKkBdM06oOgQsVYa7o82Ip4mKgVw
 6vnQgiVS9c6ZnQjK6FpVn3caTLz7ecCbnfA3hYN/tNnOLTSU0oZHI6Y02CXb02fa7oTh
 4x2iTn6ShLpthIxnrMtIthcUtGc4x45eG6MytyzilyEvZHOQfoFVnYSa3tr5/uT3ikDQ
 LVleDTmjwEMSBJcu9Acl/UmUuHPs6hBS4RTvsakZc1QinzjaOUZnwWKiceLwS8/Xo1AB
 wf2HThldito0kC/pP605eHbSbZTN0zy3U/FmkTHlr2JtUkFuq77ziup7WD8eFaW7Vb7J
 y9PQ==
X-Gm-Message-State: AOAM530Ue7DVlEIgBtimdTHCXETbdHR9XSm4nqzw4if2RUXzMn2uwMo4
 58OpZ0Ph5lTA6Lg2bpHlDbHdRw==
X-Google-Smtp-Source: ABdhPJy6z9aCuNNe2h9BgqAIY14sXitnO8j42xyfayCte7ziDMBJTpu88o759Wt20KFV6rpxFwMNBQ==
X-Received: by 2002:a1c:40d6:: with SMTP id n205mr281675wma.0.1610988356091;
 Mon, 18 Jan 2021 08:45:56 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t25sm21247218wmj.39.2021.01.18.08.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 08:45:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: qcom: Fix broken lpass driver
Date: Mon, 18 Jan 2021 16:45:07 +0000
Message-Id: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, stephan@gerhold.net, lgirdwood@gmail.com,
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

LPASS driver is partially broken on DragonBoard DB410c on 5.10 and
its totally broken on other Supported Qualcomm SoCs.

This was due to DAI ids being over written by the SoC specific header files
in the dt-bindings.

Idea of having SoC specific headers is not doable when we are dealing with
a common driver. So this patchset attempts to fix this properly by creating
a common dt-bindings header for lpass which can be updated with new entries
if required. This patchset also add an simple of_xlate function to resolve
the dai names and different SoCs might not have 1:1 mapping for the
dai_driver array with dai ids.

Srinivas Kandagatla (2):
  ASoC: dt-bindings: lpass: Fix and common up lpass dai ids
  ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY

 include/dt-bindings/sound/apq8016-lpass.h |  7 +++----
 include/dt-bindings/sound/qcom,lpass.h    | 15 +++++++++++++++
 include/dt-bindings/sound/sc7180-lpass.h  |  6 ++----
 sound/soc/qcom/lpass-cpu.c                | 22 ++++++++++++++++++++++
 sound/soc/qcom/lpass-platform.c           | 12 ++++++++++++
 sound/soc/qcom/lpass-sc7180.c             |  6 +++---
 sound/soc/qcom/lpass.h                    |  2 +-
 7 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100644 include/dt-bindings/sound/qcom,lpass.h

-- 
2.21.0

