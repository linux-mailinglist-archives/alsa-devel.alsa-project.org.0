Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A45280055
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867CF1873;
	Thu,  1 Oct 2020 15:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867CF1873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601559722;
	bh=kocCE7/sL3zqYYMB9j3DFscW/pkqSVZBSOKjzj3rOlY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dyi9W+2CG8AXarSc9yU3l/Su3dNQiNg7c+tqPxmKa0gs3iKWg4xKg6yFUt67fWzzv
	 iCstroWZT6gInvfyslE7G4wYPRXHo9bpJAxslbuEpSSszkVoMvSXf8kuToNPT9u6IS
	 gsYrJJjL+5Mddb2yAkf7SkFs06N2Kc5pTzvUKovA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DE4F80273;
	Thu,  1 Oct 2020 15:40:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B330EF80228; Mon, 28 Sep 2020 08:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D72F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 08:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D72F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M/fOxg41"
Received: by mail-pg1-x541.google.com with SMTP id m34so7416398pgl.9
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0chtk5rr8XDTzC1Vz9PdERcVqFOmea/OCGt+6P6mjE=;
 b=M/fOxg41yJtwIweGfkUXKS4DhCzSmqY2kkbgvMY2OTdmDMRgkr6K7VKGmkzPx9128L
 5lhw4DYpVejne21gL5f3/OUDy279MdWqYeG0dEpng6IVhVk/t6YhS92dhsN17eHRwtB4
 myxZmB3Bs0kkOOTBjK3sYS+9+K6BpKP6gKFvCKSrttYPhYqT6Uk3vpdbftTym7bMA1jM
 lHTTa7lyZScNA1gLd76jTM4Rr4nNcIp6Z1i9Dr/ZMPZv1eJuijohynSMjEu5xLidIfrO
 E8cQ+6vAof+HbiNW2q+7H6EK0/zh4ZK+DryCYccV6Vr/OvXX8frUC6l/EyChq3Ddy/+Y
 xiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0chtk5rr8XDTzC1Vz9PdERcVqFOmea/OCGt+6P6mjE=;
 b=eHTzybKGaddt98QaJOL73ElNV4cHZ/lILGLcYJIn0yW+G/G79VgaawmpHO3kHCcAAI
 pVrtaT6EftaZ/e9LMk7H/bugtHNPUun9QDJGob2RQN0A+m8m68YQJKIeyit/MZIxciiN
 exd5rqqO95Re3wzzWYbx/ayVFZ7rpjYNxBhl5tn70dWDBixN4SVHO5wx0tRjcFHfctqe
 MLiZi4Af8XUqQO9AGPDh0/1pycuWyTN3BZz8mhURVoRHriUz5jZJFTX0P/3geDIju4OF
 GKh+hz9lIEljdaZaC0BLFVthOtOdUKF1vPlHID57P/4EuPjw3RRkPXkg5WW/B068S0ob
 69ew==
X-Gm-Message-State: AOAM533mtVqxVjgMy0Y/g9NTkoDD3YsznEvHeEsed16TraQFHBE9/aTG
 g85/PTFeWklJ1YPDU+7p7Sw=
X-Google-Smtp-Source: ABdhPJyj1jBgh+AJFzEXL5d8eOV13dyDzQzXUtModYjoFV8sYvwq0POiaz94Z4R+8E8xiDjHI1/+CQ==
X-Received: by 2002:a63:4854:: with SMTP id x20mr138642pgk.220.1601275080603; 
 Sun, 27 Sep 2020 23:38:00 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id g26sm192663pfr.105.2020.09.27.23.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:37:59 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Modify documentation and machine driver for SC7180
 sound card
Date: Mon, 28 Sep 2020 14:37:42 +0800
Message-Id: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:07 +0200
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
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
- This patch depends on this patch series 
 ASoC: qcom: dt-bindings: Add sc7180 machine bindings
 https://patchwork.kernel.org/patch/11773221/
 ASoC: qcom: sc7180: Add machine driver for sound card registration
 https://patchwork.kernel.org/patch/11773223/
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

Thanks for the review!

Ajye Huang (2):
  ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/qcom,sc7180.yaml           | 64 ++++++++++++++++++-
 sound/soc/qcom/sc7180.c                       | 60 +++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)

-- 
2.25.1

