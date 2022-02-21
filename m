Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A544BD9CA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:11:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95301696;
	Mon, 21 Feb 2022 14:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95301696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449113;
	bh=j8O98fIaBwImujfyKTkGpCBt03EBCrPK+Q+5mANRzdc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lTXxckHbSX0Vr2fUOIgSXemZSzANMqHUIauuclQsj55z0vL4DT1TUkxGlO81AdGIQ
	 DIv5dIuPmkNyp96XrjS5GHcJYXBx9a01QhRMB6ta1lAO1lqOV3DP/oHJjeHRYHr36G
	 JZI+w6oH283fbinNh7iyvJcN/bBfdeuu1m+8Hr3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3F4F80425;
	Mon, 21 Feb 2022 14:10:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B14A7F80149; Mon, 21 Feb 2022 14:10:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52591F80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52591F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qtMgF8es"
Received: by mail-wr1-x434.google.com with SMTP id d3so11352959wrf.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zmju7T8l5cjpjfMcYV9GyQ+faFiFa5fab7CyUuOg12E=;
 b=qtMgF8esbXrSOD1/RGSdSaMPZQBu6eqWm0IzOK1TFEEH9fqLGnbomg0E3DafC8rTAK
 ezivsrYSoEs02yuEDa4buWFnQQUybuVDfpwDoARvOo6KUJDuVkhr2XghRdsiR0oP6P58
 em8mZdfaJvXF7v96IHpgYeZ+1C0mDJUPx5KpNPhShAvLSqjTUUr5glb8vRBBPDXtaic3
 Aa1qeDx/ai+6UVZyAtXXblEORCgFzBKPh6TXJ53k4kxRPFQMEJ4/2LpwrmrZJP9VLA58
 NpkdeHm1MWkVZBlSYIBuWYeNHproxubOHGdzzIfc+XgCJokE1C4K9NgXXVPi/1H/LJ7d
 7s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zmju7T8l5cjpjfMcYV9GyQ+faFiFa5fab7CyUuOg12E=;
 b=b50Lk9VPwhzwbip2hjE2+wUw9aPpyI3w/qsGVBV4rfIi4eXY0CF4yONhfneMIS21Ct
 2+POa4li4xtfSjHDCPxoHn+dOXKTEQ8rNCXP9ohxPwnzFn/j8v7KnMhGjwd9HDT3StYI
 ONbjyWC+eD+q0LybBQKc+8Ju9u353FWzxH/RroTluz4mZbgLO9DBrXD568cSvIloBdnX
 a9McR4jGi139Jlg9fzd0G2yTkQojmztM4QILSLrwblqt0DkqMx2eM51ezisdyXF4t/zU
 +2uiKesMVJ3iiM1pMXgaadtlmfWSLtQQoILMwiiWWQMrq24EkFRF7dU5DCza3Aob8z3R
 LkDQ==
X-Gm-Message-State: AOAM532x9D4SjjkCBmw0qo43RHpOMXbEZgr2JEFLgK3F+Cb7nl+xqvJz
 CYtdvn4MT7fDr/YD/O4EODwArw==
X-Google-Smtp-Source: ABdhPJx+Nwif8L9DJPdvertRKu3XLrN1K3ocaB+yfSE5aF5k5X4RWp9aZfXRgvqFrTjjFL339yolrg==
X-Received: by 2002:adf:e8c5:0:b0:1e4:7c8a:21a7 with SMTP id
 k5-20020adfe8c5000000b001e47c8a21a7mr16004022wrn.516.1645449040742; 
 Mon, 21 Feb 2022 05:10:40 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 00/10] ASoC: codec: add pm runtime support for Qualcomm codecs
Date: Mon, 21 Feb 2022 13:10:27 +0000
Message-Id: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

This patchset adds support for runtime pm on tx/rx/wsa/wcd lpass macro, wsa881x
and wcd938x codecs that are wired up on SoundWire bus.
During pm testing it was also found that soundwire clks enabled by lpass macros
are not enabling all the required clocks correctly, so last 3 patches corrects them.

Tested this on SM8250 MTP along SoundWire In band Headset Button wakeup interrupts.

Srinivas Kandagatla (10):
  ASoC: codecs: va-macro: add runtime pm support
  ASoC: codecs: wsa-macro: add runtime pm support
  ASoC: codecs: rx-macro: add runtime pm support
  ASoC: codecs: tx-macro: add runtime pm support
  ASoC: codecs: wsa881x: add runtime pm support
  ASoC: codecs: wcd938x: add simple clk stop support
  ASoC: codecs: wcd-mbhc: add runtime pm support
  ASoC: codecs: wsa-macro: setup soundwire clks correctly
  ASoC: codecs: tx-macro: setup soundwire clks correctly
  ASoC: codecs: rx-macro: setup soundwire clks correctly

 sound/soc/codecs/lpass-rx-macro.c  | 49 +++++++++++++++++++++++++--
 sound/soc/codecs/lpass-tx-macro.c  | 45 ++++++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c  | 36 ++++++++++++++++++++
 sound/soc/codecs/lpass-wsa-macro.c | 43 +++++++++++++++++++++++-
 sound/soc/codecs/wcd-mbhc-v2.c     | 26 ++++++++++++++
 sound/soc/codecs/wcd938x-sdw.c     |  1 +
 sound/soc/codecs/wsa881x.c         | 54 ++++++++++++++++++++++++++++++
 7 files changed, 250 insertions(+), 4 deletions(-)

-- 
2.21.0

