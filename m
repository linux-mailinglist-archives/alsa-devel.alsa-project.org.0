Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA52A8F5D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 07:16:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B610165D;
	Fri,  6 Nov 2020 07:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B610165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604643386;
	bh=KpEHiEvjtihbyY7eFw+8FHMtRDxMAMv7YvApPhVeM+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UwqYUisOKhX0ChPYFo4oTTwP+/cYBKvjd7v4xGOaI84QTOa0Fldrf0NJMxNz9eN4y
	 98qnzPV6cCCkFtnajjnlriA51K2SuE9EWvcTvNOHFvPGecDfR4ubRJoP1FS5Gibd7t
	 ouT5WUffhdA2dFsbAT7zEFYNbkK/UHpXBgLNtb+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A083BF80234;
	Fri,  6 Nov 2020 07:14:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 271A3F80234; Fri,  6 Nov 2020 07:14:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6887EF80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 07:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6887EF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uzq0KYoj"
Received: by mail-pl1-x642.google.com with SMTP id w11so186042pll.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 22:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlXKKq4DGEFjUy+nOWMktAH/V5heZC0/6ILxLCieIBI=;
 b=uzq0KYojkUs4t+Q4y3YBqX0rQNXV7pH3WlTA04d9xfT2HzTtRS3Ey60ivElLdbiQ6C
 zFVX81uumdUT5FV4Zja3UM60O36+C4AYkDG9oUsJKhIOf7gEmd434azZmqvFrOjlZg4t
 UPBURLWtRU0ibF94bPAoRqrwQ4fKKP46UwIGQ/DND6ZD2NmUYAgOY8Y7FxC2mmjPnHFV
 qMtxbD4JZ0jT563EdP6MPHQ0wU3XON48XbuLpy0CQPufsvMGSUpvOsGZn2qDAgVwPAaI
 AFCfj9D21WFd9CS5UDuTQ3IgCDOlQ1pTCoc9Um/ZEV22ml05J6IGPqssKSUR9n8JSZI2
 0PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZlXKKq4DGEFjUy+nOWMktAH/V5heZC0/6ILxLCieIBI=;
 b=PUIVLNApA/J4EH3CU04s76u6XaX8i/0hMxoqlQ6r2Xx/N3d0RgLyKU41JK1CSU4TgE
 ksVUFiErla4DqBJmdWc99uzEV1WDKknUY5T35X7pkgVuYRTkJG9pUG8kRX3WKByY/TnK
 bBTS80ZLJOll03vzNem1CcqqJkYGy7XLghDA4EzdIJxCYW7hR6KUPZ1fUkeZrlRKFY8r
 p++4PUHdyNIiFNcNSTntzu2BKKvIgbM2/BAG3qHoYv0qnKIHc8UdifkbOcepCPS0n4U4
 lUD6wrMGVTRdE8L24iVmllFKKWvXnIh1pQplopQemqC1Hvv8bK0j0suchrAfxs+D1H9I
 DRmQ==
X-Gm-Message-State: AOAM533ii1Ytcq9H0Rowg7QVaazPEkDD7XxCwM2mrlTLnTamLtiLJNxs
 c/3xwkcneG7R2v4bdPU11QY=
X-Google-Smtp-Source: ABdhPJyroxk5j3uozX4q/49k3ilXtr3HfELI1nHsLBO+uoSc7N38F15qJ9kCIb5kPorMtxomgTZJxQ==
X-Received: by 2002:a17:902:8a97:b029:d4:d3f4:d209 with SMTP id
 p23-20020a1709028a97b02900d4d3f4d209mr500321plo.35.1604643279370; 
 Thu, 05 Nov 2020 22:14:39 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id y5sm620227pfc.165.2020.11.05.22.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 22:14:38 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] Modify documentation and machine driver for SC7180
 sound card
Date: Fri,  6 Nov 2020 14:14:31 +0800
Message-Id: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, robh@kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, srinivas.kandagatla@linaro.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
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

Note:
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

v6:
- Documentation: Addressed suggestions from Rob Herring.
  - Define "maxItems: 1" in dmic-gpios property.
  - Only keep one example and add dmic-gpios property in.
v5:
- Machine driver:
  - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
    detailed info at https://lore.kernel.org/patchwork/patch/1331087/

v4:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Remove redundant judgments in dmic_set() and dmic_get().
  - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).

v3:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
  - Remove redundant judgments in dmic_set().

v2:
- Documentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.

Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml |  8 ++-
 sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.25.1

