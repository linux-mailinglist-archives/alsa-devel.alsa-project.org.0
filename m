Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DE2AFCB2
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 02:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44B2179F;
	Thu, 12 Nov 2020 02:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44B2179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605145519;
	bh=Bazb0BOH8QSEa4wXLXKTKz1/idBwx8frmhMHZuov7C4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dDxcsMwRODrlpWrj87uGPVH/6o6zdp9v8khNHcsz5UPbbf1jZUaLA3J6tiFgDAxqB
	 k7D/wf4dNqhKx8NbZDS0MM8cnPdFRwSK7ISrcLP3H0hpVGlQoH472i/9M3vBJVdNE2
	 uk6Zvkfsk3IRgSn9hTPKXQ868U5HfaYVOsrQNBfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12753F8022B;
	Thu, 12 Nov 2020 02:43:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56D36F8020C; Thu, 12 Nov 2020 02:43:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0F02F80059
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 02:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0F02F80059
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.b="TZVudu4E"
Received: by mail-pg1-x532.google.com with SMTP id w4so2752726pgg.13
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7r8yua/nKCeK3vM5yetSQdGOYQSdaEZxJ+KcAFNDCGM=;
 b=TZVudu4Eom6x7eViMfrgwIEDTOwxuk2NwbzESK1osvd187h+LbGTwrmhIRjbga3l22
 KAR8+AStRi2/Tibs30YN0GLi7Pf862pd5ccdeLlUpB3Bp4BWCQPrlkdeMOUYOzn8oQdB
 Dgyky7EOJIFle0oRSOqIb9B0amhdlbHBFn9bpicdT/qN85/N2Gqx457Bxwip+etlgSNz
 32zuFh2WpV0C3UXX6SBQ+PReEDdctVNuOSgylG3X2iiHy3Y3rojlk0WUCOaJoLL22VxL
 lKxMn4BcJHF36botuq55UTLxM6JAJTfnp5klsBs4ATdtT47u/tKhX+M5DoG/UhBNr+S+
 oS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7r8yua/nKCeK3vM5yetSQdGOYQSdaEZxJ+KcAFNDCGM=;
 b=UGDByT3bnXcj2g4rzVpPJZaKNIpXWRmsZE1e0kEal4q+il5lmjOhm3YtazJQIN2e0z
 CApXBVaKURz/Hg+XsvD/tTcEwO0+8BnHQjJtz3W5ks2s/RbSSmocjc8YyKEJDAOgwG/w
 JWaTXiE0VrX6o4dTCjuskNf3+d6jJf0U0PrLrHLU1+N2IiZO9WfZPj7150wL/tXHmQLn
 lqwumdYJ/eBECaqHTd7U3MWVIcTcp5bwe6Ply4YeXTd50qn+UFs9/HgsuDuB1xZK3paB
 NI0gvd+R3sMwtKMl4tEq4z47odKHl1P0o3xBAa35WwxVe3IRMRKjum8+dj47jmSJBq6s
 T17A==
X-Gm-Message-State: AOAM532vvzV1V6PKCFxXUYUhogF2o3pPeZZMNxSdcSa6guEYY07AaE9S
 GRP2Y5GkTAJ5da/t3q4SI4Az
X-Google-Smtp-Source: ABdhPJy0uKYvQY8jkl612KCh1Ww+d03+vAxg6dCvii/4V/9/OB17X7zWDzjpThierTZKqDWSxvuwCQ==
X-Received: by 2002:a17:90a:ca91:: with SMTP id
 y17mr6205555pjt.205.1605145419473; 
 Wed, 11 Nov 2020 17:43:39 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id
 m6sm4062413pfa.61.2020.11.11.17.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 17:43:38 -0800 (PST)
From: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Support SC7180 sound card variation without headset
Date: Thu, 12 Nov 2020 09:43:26 +0800
Message-Id: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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

Use compatible string to let machine driver handle the case
where ALC5682 headset codec is replaced with ADAU7002 dmic codec

xuyuqing (2):
  ASoC: google: dt-bindings: add new compatible for sc7180-coachz
  ASoC: qcom: sc7180: Add machine driver for sound card

 .../bindings/sound/google,sc7180-trogdor.yaml |  4 +-
 sound/soc/qcom/Kconfig                        |  1 +
 sound/soc/qcom/sc7180.c                       | 86 ++++++++++++++++---
 3 files changed, 77 insertions(+), 14 deletions(-)

-- 
2.25.1

