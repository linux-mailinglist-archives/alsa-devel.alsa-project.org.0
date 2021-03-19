Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E934186B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 10:33:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3332E167B;
	Fri, 19 Mar 2021 10:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3332E167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616146383;
	bh=p2qZOlz0X0oLG3WqX+/TA4AbUWIcftwTfug56+QYvGY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qaJi/qixnviyao4gAKQWLRjEKM/ZH0UD6fdl/nrdeNySOHJArKGqPA3LPHTjIGRIn
	 sSCe332ZzpyohLt0mRYBep/gWlOODi5+za/H3+D+mboac3p0SbST8YdddD/Y4vBblk
	 N8Y1HMPdzDdCq3EEhBxkhMd6THQt/YD4ZGWL/mQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B09CF80425;
	Fri, 19 Mar 2021 10:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AF0F80423; Fri, 19 Mar 2021 10:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE63F80254
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 10:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE63F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="B91xc1g1"
Received: by mail-wm1-x32d.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so8066469wma.0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 02:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h7Hm+ghwkLRDBAXMVNnrJw9KnhlIxQw5KKOJ32yVNwQ=;
 b=B91xc1g1F0dratEusEbJbkRCwWFgBHj6CI00wIY1FiNueZeWwbhdDux76Y05VbhH34
 6HANw5RONyLoVtsA7hFSiOpX8ncK/aJW0rfvVSsaZK0fBb1x21Nnk5ykZIbWGQiztLIF
 jZBcMME2jGhhv1LfeOept+9NYEKRGx471crt8i8/lozGOLQvX9UDom3UXlFCpKYNQZHo
 6Vv7PaMDOtX78JxdmUj2LIPmWydkwIJ3OXO1XrGaE2Ul4tHILN9J+JEQ1vZ6PVvep9o4
 mI+w/RyooZB523RBlknIrcOCWK+K/qvrx75BDZh27bKEEJkRnKEk3BvhRKOV9aQVs7St
 TU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h7Hm+ghwkLRDBAXMVNnrJw9KnhlIxQw5KKOJ32yVNwQ=;
 b=aaxlfC34MWy09jQZKJ/mEBGhKv3dFN9fMB2rPhMPVlFJO6KaTZAaoIakz6ScilIXXa
 kr4hWfjLm5m+8Kt5PlL8auvDEDEARwNl+4eWwPrYVSFWz+edhxiEiTZMyMaVNQ8yMTmd
 8XilZ09gd1pR7eWcJKrWdbuhKlyX6TjJZ5apFYePPIia6VumJNSdDO1nyQB2OTHH2sQp
 epQF3ZHqDn6YJ6TJrGWdvIPp1EHAKPWDlroMWNMOaf+JlyXObuowU2t2briZDe7g1Ul2
 hginR/1p7oEbbI5EtFKN7Te4ivCFNwGwimqDzNM7HcHnZkYp723SVnO5cocuROZNc66/
 FSyA==
X-Gm-Message-State: AOAM532u+vHcE0lQueiASJRYK2uQOGhfuoz4HT2gQoKgKh4xw20O2vpw
 1gUmkxY6spHcQh4Cg+i1GpADHg==
X-Google-Smtp-Source: ABdhPJwuN6X1S9bPZn0gh5KHG32FcDe6PvNMjiCNqgkQ05fhB+gQUu/EBFvYfuhbNDlPrgEME0nJhA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr2888475wmq.73.1616146203868; 
 Fri, 19 Mar 2021 02:30:03 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id p6sm6779058wru.2.2021.03.19.02.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:30:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 0/7] ASoC: codecs: add wcd938x support
Date: Fri, 19 Mar 2021 09:29:12 +0000
Message-Id: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
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

This patchset adds support for Qualcomm WCD938X codec.

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs and MBHC.

Even though this device has two SoundWire devices, only tx device has
access to main codec Control/Status Registers!

This patchset along with other SoundWire patches on the list
have been tested on SM8250 MTP device.

Am planning to send support for MBHC once this driver gets accepted!

Thanks,
srini

Many thanks for reviewing v2.


Changes since v2:
	- fixed dt_binding_check error


Srinivas Kandagatla (7):
  ASoC: dt-bindings: wcd938x: add bindings for wcd938x
  ASoC: codecs: wcd-clsh: add new version support
  ASoC: codecs: wcd938x: add basic driver
  ASoC: codecs: wcd938x: add basic controls
  ASoC: codecs: wcd938x: add playback dapm widgets
  ASoC: codecs: wcd938x: add capture dapm widgets
  ASoC: codecs: wcd938x: add audio routing

 .../bindings/sound/qcom,wcd938x.yaml          |  165 +
 sound/soc/codecs/Kconfig                      |    9 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd-clsh-v2.c                |  350 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  291 ++
 sound/soc/codecs/wcd938x.c                    | 3623 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  676 +++
 8 files changed, 5122 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

