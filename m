Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7029FF44
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 08:59:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ADFC15F9;
	Fri, 30 Oct 2020 08:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ADFC15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604044760;
	bh=9ILTeRYh0H39lPJgTtBhnazm8GOyLjVekbRkUT0Ltvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sY7El77UAbyhekoHiDhFAv2fOJixlf3qr49Y7DHlDs0zAvEZ1tC0K74oYsMAdzwz1
	 Y4lqjfPFydTfFd8W4jz8HQMSDwlGRhSahOQCl5Zgph6NZQB1iokMIVp7+2TqZeV3VH
	 nabN62sOQXhOjWEJL9tAlPA6ijH5TrzO5uKf+W3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEAADF80212;
	Fri, 30 Oct 2020 08:57:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F084AF80107; Fri, 30 Oct 2020 08:57:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95141F80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 08:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95141F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hw0FvShz"
Received: by mail-pf1-x433.google.com with SMTP id e7so4535872pfn.12
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vb6m+GtPCOAaRlHA7iQi9d/A/nU9vGONoKDqZKALL4=;
 b=Hw0FvShzQ10z5Mfp1Uq+GIfJp03i+3rFFtGa5DlmBczPupdV3qOV2geLAdIrXvVsc2
 JcnNopqWVAnoD4MlSfHX2FD2iPaaewVLnghRHO9jDQ+aXYY6jdKuAe7tmt/2u8L/LKJ9
 E+p3kL89fkSKTfA/iT3BTCLQUF1CXrHf1vttL9mchkQkVHApWmhPCMhWeSPqFhLdT4q6
 S9GPB416pGe8T1yp6kv1EXQ/U3tH0WaC1nbNYfdmoexUkCUsSiTdxfI+rb5I3DdjhPSg
 UvowSeX3lCovJCuVAjNwjqyqTYmPfzyc4fhkvqrsXYorrTuWQTpBOhxk4bBikqAW7uXv
 cVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vb6m+GtPCOAaRlHA7iQi9d/A/nU9vGONoKDqZKALL4=;
 b=msMbqtE2dffYIRRSoricVnawLS9L+O06D0rcku2G/KdiZQKHJZYQuI9qEKAkmOUqZ/
 huGzmP0eh7mPM7gG+73/HmXQNTk2+mgGBiKnAzd60VZfhAQlZlhXOvd72IxMJotrtRrO
 Ofh272JviMMbBewAhan+pBUDXgVw2kiGOiKXa/Ap0QYr1MAP3/OaZec4ZRggFv91dRcS
 KMBy/nWRnmPh/cttK4SbVaFOTeZL5uOCF7p0SwUlxN0t/kTNZyagBOLBEe5mxzTkK03o
 o4aUtntdYS0RkEK3Azue0MPIkhvMZFApn/9J6uiAmK8ORwaZ31P6jMRWMqd+IT6sAMtw
 ql5Q==
X-Gm-Message-State: AOAM532ycWJ1z1bPeC7we5LM8ouZU+as2F0Xh9yi4vEy7wFs0MbF+A1m
 Hp+w4lvvb0zVlCz3C/M4f+s=
X-Google-Smtp-Source: ABdhPJy4Oy2cf9uRsN+HTvti+TO90lHjvCcMcN31+n+9a2UFFKXw0iZ/MmkyYiUvvE/R4QmBWJ1Xsg==
X-Received: by 2002:a62:f20e:0:b029:15e:1332:63be with SMTP id
 m14-20020a62f20e0000b029015e133263bemr7667148pfh.72.1604044655103; 
 Fri, 30 Oct 2020 00:57:35 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id p188sm4638176pgp.65.2020.10.30.00.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 00:57:34 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Modify documentation and machine driver for SC7180
 sound card
Date: Fri, 30 Oct 2020 15:57:22 +0800
Message-Id: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

Changes from v1 to v2:
- Ducumentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.
  
Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 ++++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 59 +++++++++++++++++++
 2 files changed, 117 insertions(+)

-- 
2.25.1

