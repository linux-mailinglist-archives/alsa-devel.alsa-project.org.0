Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3282A91AF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8F2A165E;
	Fri,  6 Nov 2020 09:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8F2A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652289;
	bh=jrmVPaQ9m0dSbMFYreOdeQUbgzsKgy5PKfkL22djt6Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nSgc800h9gQi1CFR3/Jy2Pk7Z1ztH9oKBfZxq5bAyPJIHcEe4zJo2yQGIpVwqpcWw
	 pkBEq816DKiDl9cf7gcvSc2l31Szm+Q7I09Y7dHlUBHKcGarkckaM3ops8aiKB5AE7
	 2jgJfyv/MHaihCEBeB3GqWPi3ujMIP5ORDVyLdM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3222CF8023E;
	Fri,  6 Nov 2020 09:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23971F80234; Thu,  5 Nov 2020 02:32:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED7CDF8015A
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 02:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED7CDF8015A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.b="buWs2k7k"
Received: by mail-pf1-x436.google.com with SMTP id v12so18081pfm.13
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 17:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T5SfGlFWNsb9ADFXTTd5FC+rkmT/cTom2Bm7AcT+oF8=;
 b=buWs2k7kpsMviHovMKSpLCqDOs6SSspYr+POlCcZ7cQ0RLP2IcZQh/mchBoF1vIjqU
 XbH06BRnoY7cKLtxQlq8dSNJ4yD5PKQ+xklQQFL7fwTDAmlGFD7Pg4ta4/E6Sw7jOIru
 EgWTEGUlrtTVhQ9MZF/wxYJwD0hrKrVgr4NeKq86ZNSDFBkgvmCkxgYqL8pgk7wBigcZ
 De4Dw0XZupQqdecbHJ6kZIxKEoyEPfqJxQPBL25HtJ/1kT6LaFrvSx1p8oJkkFojkCpZ
 3N/udwjp1efpDw15cSw6FwxDBDucXtNpsunEx8pwKMpNkfCl/ifbG8nYaFsZAXAGr4T1
 zYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T5SfGlFWNsb9ADFXTTd5FC+rkmT/cTom2Bm7AcT+oF8=;
 b=mGAUqio5EqwKkyKRoq2kzHglDsbHvV35ZOSIQtf/NCXYfrXB6L1MBY+4OqJKvEgvbt
 mW2CpH/H6D7mSYhquwpn5FmsOReUaw04s7idk52ieJWlDf52n5NFyJF33xv7cXiKIPVv
 SZbv32Ftrlrv278nAlYRN0tU5MinaN0ZcHdztcJXBae6DxBTMtE6TPiTbo79DPPtU6tk
 hQEiWT0DAVTUaqdadyYQrdIWUbiG++DNhOwxOKUGoblekY5toQygSN1J3hrdyG+aNZmt
 oOS0goQzVo6ZVoAKfeeOEW+AZxIGWjGuj1roJfCrRo0szmRQnYrd1tDPBPfWLY/0AKaM
 /Zbg==
X-Gm-Message-State: AOAM532NTkk0FzrNYmdUK+WI54BvRs+8AXKpS7alxONXq8p+wuot+kew
 dhXOxBGF9RYbylKA9+GNmX0Q
X-Google-Smtp-Source: ABdhPJza8noyKK8dODD04Wm7xD5PY/AiLk1LSjeB9UKja7NAOYA1NN7BFuSWOkkkkCN+pBQTw5XSfg==
X-Received: by 2002:a62:8847:0:b029:15b:51c6:6a10 with SMTP id
 l68-20020a6288470000b029015b51c66a10mr207919pfd.69.1604539972308; 
 Wed, 04 Nov 2020 17:32:52 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id
 m13sm127817pjr.30.2020.11.04.17.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 17:32:51 -0800 (PST)
From: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Support SC7180 sound card variation without headset
Date: Thu,  5 Nov 2020 09:32:40 +0800
Message-Id: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:14 +0100
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

This series is based on patch

[v5,2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic

Use compatible string to let machine driver handle the case
where ALC5682 headset codec is replaced with ADAU7002 dmic codec

xuyuqing (2):
  ASoC: google: dt-bindings: add new compatible for sc7180-coachz
  ASoC: qcom: sc7180: Modify machine driver for adau7002

 .../bindings/sound/google,sc7180-trogdor.yaml |   4 +-
 sound/soc/qcom/Kconfig                        |   1 +
 sound/soc/qcom/sc7180.c                       | 119 ++++++++++++++++--
 3 files changed, 112 insertions(+), 12 deletions(-)

-- 
2.25.1

