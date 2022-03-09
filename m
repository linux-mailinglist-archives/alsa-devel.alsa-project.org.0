Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A338B4D30CD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 15:07:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D59A17BC;
	Wed,  9 Mar 2022 15:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D59A17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646834832;
	bh=LyqGzyl8O2pz79MdFs82ouUk0tF5deBaNbBjShpLHSs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OrUj5T0ZVR/8YpWkQ3upcHI2KDHifZBOyvrXCa4UqAHnPwSH0N/t6RBKOms6d1YTa
	 zrswQB5j6rFMbVC+5A5vRaqOArU9oXEczFuSQpyT6/WqYT7EJBhmfCI/Qovudt1I4F
	 I37RgQvGiB7KWZXDBrzuehDDaRPkUlwVzINE7lpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57515F80236;
	Wed,  9 Mar 2022 15:06:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A97CF8016C; Wed,  9 Mar 2022 15:06:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B582F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 15:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B582F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cu9kv0Kt"
Received: by mail-wm1-x331.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso2734426wms.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 06:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qAOoHj6pXfBEaK0pgqOpVtUmae2rVK+HUiENC7VtPo=;
 b=Cu9kv0KtKYA/7fzKJO1EF9fzAEDM9lsaVbE8iKKcXZV5FdHjCK+jvNM3uXzmTpcWNp
 fbtHPyUpra3lA3fKUEwkRS/yf/rh1d0DDdb5Ihb3Eil42NjYzll0/TwW9lq5gq7tfZ09
 xAq2EY7TJ4OxNBZBNJ0Hp3pnRGJ/yCt8tnPOg4ob5uxR0btb/mvsmPnTuRJyyF6GDNFO
 6Xstisheq/5Si/NcDKPx9PrULPWxyP016sRllXPfRbO6EYGIT2A3MHSscou/iq4tK/J0
 JkDwdwtV/CR7Lum5JO1AlI9b3E/GVZlbBtcAAUdZknV6JiQ5meUEU/pWx5bXtzxAiTx0
 JfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qAOoHj6pXfBEaK0pgqOpVtUmae2rVK+HUiENC7VtPo=;
 b=XRDIxACwmAFZAGBiFC+h/FMQd6dfDWDLmtKPsGbNMTklyYidq/mwuDr+EVtbQds8QK
 9GwpPMzlHEGLX26QJMezbJszEKsj7M1+aRnGNg9XLK1z3GLYgea4kGcG1aeqs2oyXCc5
 TJHraC0JVu5vytetCBX98lrQUKkggttnvHPGoyNpCTiSGyKt6joX7eg5Z5dQJOVOiRAv
 /nemLfa2z0gWWGrLKCFTcdrpzffwyAvfF2c+A8WhG27L4ZkhJWegWk0DTfCiBIHHPjm9
 kMT/hNNjY0uF4YhnKgntoqpT+zRoL1MZi0binPURQms2xVHlTfAKo9mE8RbTsnr93frx
 KgmA==
X-Gm-Message-State: AOAM5310FS7RWCOH6kxQ9IqdEguO1kWhZgXJwbWEvaajuRdgj1qveIX4
 hR404Ta5wq0YpsPXb+1uG8vQjQ==
X-Google-Smtp-Source: ABdhPJwyja8v3kq5xhmLrPkjUFLztuqnNmIl49Kx2XGkHxoP4LVB3mxhXu2PCUrUTfjrW7ByM8NClw==
X-Received: by 2002:a05:600c:589:b0:389:a59e:a53d with SMTP id
 o9-20020a05600c058900b00389a59ea53dmr7564018wmd.28.1646834755745; 
 Wed, 09 Mar 2022 06:05:55 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a7bc1ca000000b00389bc87db45sm1821323wmj.7.2022.03.09.06.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 06:05:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: qcom: fix Kconfig for SC7280
Date: Wed,  9 Mar 2022 14:05:52 +0000
Message-Id: <20220309140552.8065-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, pierre-louis.bossart@linux.intel.com,
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

select would force the symbol to value without checking the dependencies.
In this case selecting TX and RX MACROs directly without checking its
dependency on COMMON_CLK would break builds on platform which do no
set COMMON_CLK.
ex:
WARNING: unmet direct dependencies detected for SND_SOC_LPASS_RX_MACRO
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && COMMON_CLK [=n]
  Selected by [m]:
  - SND_SOC_SC7280 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] &&
	 SND_SOC_QCOM [=m] && I2C [=y] && SOUNDWIRE [=m]

move select to imply which should enforce symbol to be set to 'n' if any
dependencies are not resolved.

Fixes: 57350bd41c3a ("ASoC: qcom: SC7280: Add machine driver")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- rebased on sound-next

 sound/soc/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 82f5eafb2f6c..28d0dfb4033c 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -195,8 +195,8 @@ config SND_SOC_SC7280
 	select SND_SOC_MAX98357A
 	select SND_SOC_WCD938X_SDW
 	select SND_SOC_LPASS_MACRO_COMMON
-	select SND_SOC_LPASS_RX_MACRO
-	select SND_SOC_LPASS_TX_MACRO
+	imply SND_SOC_LPASS_RX_MACRO
+	imply SND_SOC_LPASS_TX_MACRO
 	help
 	  Add support for audio on Qualcomm Technologies Inc.
 	  SC7280 SoC-based systems.
-- 
2.21.0

