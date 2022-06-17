Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93054F050
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 06:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D491B54;
	Fri, 17 Jun 2022 06:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D491B54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655441046;
	bh=yUyeyf9eQ1NDFJY5OlT+CXMFDEouvC5pi5iBqx26Mww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=avq883q4fZw/QgThLg6nijysnqt0xMm04PcQPHg3duEhYwTelrulm9hDaIKRYUCyU
	 2ozslHG0a60F2cJpqBHSP9LbXj/tiJ0rX00/EAGRVpCxUCzRsnBnzq8PB5HhIGee0e
	 dwJ3GSlR4mMuBSK43UpqrR/BchiQ4sJDIs2DegWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26120F80159;
	Fri, 17 Jun 2022 06:43:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1DB9F80159; Fri, 17 Jun 2022 06:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38509F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 06:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38509F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dQmHVotL"
Received: by mail-pl1-x62c.google.com with SMTP id y6so2952241plg.0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 21:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4V37PzSSXKazOVmuV/1IU57ztToNtg94rlJAvJFD1sQ=;
 b=dQmHVotLw4IesOZ7luY0HR/iX+MrLDKT0ZKGWEPGigCk429QtveK90O7Q50azInkN2
 LdghawqCiFx8bDhHgYBUkHrRGvSpcMnMtmkWqO6MJh6vKH5PO9fTMMZEn4XjZGmOi7Gk
 UddI65vmRAWvgoqiD296wWV9lO1yfEKCTUmbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4V37PzSSXKazOVmuV/1IU57ztToNtg94rlJAvJFD1sQ=;
 b=gLDdL3hECP0O+ruR4G5NqhHRO5T3s4ouSsL4/1mvpBppX25kYLfjqTJF0kfvyR+wtH
 N3E90CiNySj+zyf/DWCnBcP/9i17b6NSWQKqhfRedu1pbGgnrfxTNTH7YCBPCpea/+EM
 //v4HH+yU5cafoy4uS1P0EjQSyQcG6RFnbh79oKO586HdXWTrrbTc92M0pFMyLCYe+v7
 9WZ0/ZVNvqvibibu270Vq5ERmrCEtCgCRjAcFJQxXgEB65Csqvmu7+DF47EFAcPJ7v3w
 lVshEPnoGwvSxa5gcgqvhx7v+YaTKOurpI54KWvuVJF0qMHGrZq0xd1oeYxuAecqm0i2
 sJlg==
X-Gm-Message-State: AJIora+iBISCLtcQ70F5Et25ixgZCEj7sWLl9cyUyZqBJ6SHtJquE2i4
 M1mOe+lXsfptbRq8M/xXzLZ7Hw==
X-Google-Smtp-Source: AGRyM1vSY638NYPK/58DYP7fId8cCruqCOjRTvP813l6kM7Fv/q2/SYgdJpIpHsRjUmSGDZua0Ht+A==
X-Received: by 2002:a17:90a:7841:b0:1ea:3f61:7673 with SMTP id
 y1-20020a17090a784100b001ea3f617673mr8761152pjl.110.1655440977740; 
 Thu, 16 Jun 2022 21:42:57 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a778800b001eab0a27d92sm4491030pjk.51.2022.06.16.21.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 21:42:56 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Fri, 17 Jun 2022 04:42:48 +0000
Message-Id: <20220617044251.4029697-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220616155836.3401420-1-judyhsiao@chromium.org>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

The patches series is to fix the unexpected large
DC output voltage of Max98357a to burn the speakers 
on rockchip platform when BCLK and SD_MODE are ON but LRCLK is OFF.

Changes Since V3:
    -- Fix indentation in the documentation.
    -- Put pinctrl-1 right after pinctrl-0 in dtsi.
    -- Fix indentation in the driver.
    -- Remove unnecessary dev_dbg() in the driver.
Changes Since V2:
    -- Add documents of i2s pinctrl-names.
    -- Fix dtsi syntax error.
    -- Include the dtsi change and the driver change in the same series.
    -- Ensure that driver gets both bclk_on and bclk_off states before using them.

Judy Hsiao (3):
  ASoC: rockchip: i2s: switch BCLK to GPIO
  arm64: dts: rk3399: i2s: switch BCLK to GPIO
  ASoC: dt-bindings: rockchip: Document pinctrl-names for i2s

 .../bindings/sound/rockchip-i2s.yaml          |   7 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  10 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  25 ++-
 sound/soc/rockchip/rockchip_i2s.c             | 167 +++++++++++++-----
 4 files changed, 162 insertions(+), 47 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

