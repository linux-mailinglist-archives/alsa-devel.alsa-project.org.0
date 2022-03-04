Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CB84CD8A9
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E32716A9;
	Fri,  4 Mar 2022 17:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E32716A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646410278;
	bh=vhBroNnbAY0yoDg/C3iEBB3fwv59u0v9Xzj22j+KcGY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oybk0rxJZ5sTIy/Xa4u7CgnvoLRoJPS3deC8a5KzEvpfuTXrj0oetJa7zffinwTMh
	 hHHq+x0HseAS87go5wThAuLSfGT3YvadXYtNR7uubAxsyuMQOibdliKJ86X+LqMWt0
	 PFU8whsf/NJD1tz9LbUxqAOahzK1xFgYfxLrwot8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF64F80517;
	Fri,  4 Mar 2022 17:09:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF9AF800FA; Fri,  4 Mar 2022 17:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02DA8F80507
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02DA8F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rkdCrZjm"
Received: by mail-wr1-x42c.google.com with SMTP id p9so13369402wra.12
 for <alsa-devel@alsa-project.org>; Fri, 04 Mar 2022 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpcaFFM4Vlil9J8sKnIMDV3zVV5Y4u+XZLqTyb1B72k=;
 b=rkdCrZjmyS/RXcib6D6bM3pF7QZLt8bqrNCOt3MH3NGpjgzQNxvLEBsFXyfon8z7zT
 OGEJTdpnHH5Q0RVO4gKNmrXIvcA5xCNdRPNZHpJfeABZn/9VeC0UqkVFumhHce1fGjBD
 tlqjw3aasK96+a73ofc0GYsB44dTRHopnqC1HcwMBLUbmnVpwAtqDHkcYmS3GnOKT7Mv
 dPnOzmJECWkyDDds8fiUokCXgI0jA/KEGTAB8F1kyhjEd19fJZ3J/yrtPBZJ84fQWn+D
 B/6PPv+alt+3hW3wyAI0hpFI+oJYmFFRRC/ggKLBn/TWTRfqlaE7wU5Dc5r4E686eAMH
 MItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpcaFFM4Vlil9J8sKnIMDV3zVV5Y4u+XZLqTyb1B72k=;
 b=W86lAeVzwa0FPOHLh1nQIXzguCiEY1OkIxXZU0kFN0T4FpTHgBx7N6t+pZ2TwjAtVz
 666wiKVQzVIirVOonhUC91nilZdbHhsEtaTQVPl4toqq2x91pIGiPvLmCmXxNIhVLu2Q
 robmxP0QfJI+f29ZUs62ps9vqLn+u3R17Nr+fiaatRtyC880UFV7WGkucJSw8h7ZoIao
 CYvdFqkoI8nSEUEu/NuA++STpooTlYBBSYK74vcXV0+NiTLlu6OpeJ7B4NgiDoI+25bk
 81qVQlqgYEN1dcHs+3b1lO8WF8fZkJZpnyikQiMhx5He3lowlfxTokahdpGhlPayZEC7
 wZMg==
X-Gm-Message-State: AOAM532e4SWbnStxa6goRfJY3MEbjZZaIYFbFoIVrJwLvukeUraS0TPi
 Er8rB7xSBx/GxJsxkjP09uASaQ==
X-Google-Smtp-Source: ABdhPJyGwmzyIoQ9ro/TZ+vxg/5BiF5i9Kky2BCfEyUx0I0fCDIdJ2pVlz+q5Scz0R5Q4+qf1ka2nQ==
X-Received: by 2002:a05:6000:1b07:b0:1f0:248d:bc1d with SMTP id
 f7-20020a0560001b0700b001f0248dbc1dmr10801281wrz.534.1646410182680; 
 Fri, 04 Mar 2022 08:09:42 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c22cb00b00382a960b17csm10275145wmg.7.2022.03.04.08.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:09:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: select correct WCD938X config for SC7280
Date: Fri,  4 Mar 2022 16:09:34 +0000
Message-Id: <20220304160934.32010-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

SC7280 config selected WCD938X instead of WCD938X_SDW Soundwire codecs.
WCD938X_SDW actually selects WCD938X, so directly selecting WCD938X results
in unmet dependencies and below warning

WARNING: unmet direct dependencies detected for SND_SOC_WCD938X
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=m]
 && SND_SOC_WCD938X_SDW [=n] && (SOUNDWIRE [=n] || !SOUNDWIRE [=n])
  Selected by [m]:
  - SND_SOC_SC7280 [=m] && SOUND [=y] && !UML && SND [=y]
 && SND_SOC [=m] && SND_SOC_QCOM [=m] && (I2C [=y] && SOUNDWIRE [=n] ||
 COMPILE_TEST [=y])

Fix this issue by selecting WCD SoundWire codecs instead of component driver.

Fixes: 57350bd41c3a ("ASoC: qcom: SC7280: Add machine driver")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 0cd0dae5c545..82f5eafb2f6c 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -193,7 +193,7 @@ config SND_SOC_SC7280
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
-	select SND_SOC_WCD938X
+	select SND_SOC_WCD938X_SDW
 	select SND_SOC_LPASS_MACRO_COMMON
 	select SND_SOC_LPASS_RX_MACRO
 	select SND_SOC_LPASS_TX_MACRO
-- 
2.21.0

