Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBB227D7A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8212116BA;
	Tue, 21 Jul 2020 12:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8212116BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595328388;
	bh=WTu1pHjgFIy+x453hv9GM33yKkOWRSKYeDPtItx5Wkk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P/xVWZ4T6MJh8ca5Z7pZe9cAlUO6BlWoADZA4UCNGZ1+706SXfckdjfaNyN1bm6gV
	 BpfzmdPYAhVuoGgs15y65EZD50PFz5dsGakArLvkfN1PGkRvWv90hG7CojdUmKtT82
	 6reOyXqiRdh2HJvC+WPWwGAXjCxrMF/vdij4Gxl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA675F80212;
	Tue, 21 Jul 2020 12:44:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E5D4F8024A; Tue, 21 Jul 2020 12:44:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49D99F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 12:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D99F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="L0n56T0u"
Received: by mail-pf1-x441.google.com with SMTP id a24so10535398pfc.10
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8pM7diVPVUVJFnX3JjthYlLq7pi8+2tPknNxtkHGEeQ=;
 b=L0n56T0u0TCfGUJhqs+tOv0+E29UAk68lxsMUas0btDkL7VxqLaMePegD1U5OC8nno
 Ufk6lSh8gA3i20rKPPgGpr1btdFqGU+9E0bww5FML2mTRWsNs62RXKjQ41tcaiDh5zTV
 UVmuBzuV0OdGni0S5W083vx/ir3+oauHfKFFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8pM7diVPVUVJFnX3JjthYlLq7pi8+2tPknNxtkHGEeQ=;
 b=kXx0Z9v64n7Ab6cImrRd40OemQA1kU0lJuRzuXod99GfdqZZUrTyf8pYT8f2sQCdBm
 P2N/9B39fecIFxT7iAuoxcyJbObD4RHMo+VBFxXG2Abo9bRRmI0L76C9uo79yRE0uuCU
 70w8/crygRmpxpFqZNe/X5y02jViy/0rbnvE3ibTp1wijVFUWbj+/tzrfWFu4tKxVhyo
 PEoOeIuYsJfelCya0+yPW8GZbhBvxEiP0GOSZjc1Wcnzp/gISfo0HK+AMeGWI2yP38XK
 hz+KY+ZMQXqaA/kQHbcLRtrP8L7UENGpAtBHE+3HGEmMULpyVUg8lhdicLap8hq+LvaP
 FPyQ==
X-Gm-Message-State: AOAM530Jf1zEiwoRVCVWkA50lSf/kihUMoS3DWrEMr/TTn2rNW7JwnT+
 AT6bB2t5IKr7TlognsmjcjcHzA==
X-Google-Smtp-Source: ABdhPJzy2moU0arh3d1mHwle0rJ308kLKTkUSW99cDkJO2LHlDdkXjoTTq2PTxatNoI6fR9XCGpFeg==
X-Received: by 2002:a63:69c6:: with SMTP id
 e189mr21665505pgc.170.1595328271521; 
 Tue, 21 Jul 2020 03:44:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id 129sm19419441pfv.161.2020.07.21.03.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 03:44:30 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add documentation and machine driver for SC7180 sound
 card
Date: Tue, 21 Jul 2020 18:44:20 +0800
Message-Id: <20200721104422.369368-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 dianders@chromium.org, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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
- The machine driver patch depends on LPASS patch series so it is not ready to be merged now.
  ASoC: qcom: Add support for SC7180 lpass variant https://patchwork.kernel.org/cover/11650649/
- The machine driver patch is made by the collaboration of
  Cheng-Yi Chiang <cychiang@chromium.org>
  Rohit kumar <rohitkr@codeaurora.org>
  Ajit Pandey <ajitp@codeaurora.org>
  But Ajit has left codeaurora.

Changes from v1 to v2:
- Ducumentation: Addressed all suggestions from Doug.
- Machine driver:
  - Fix comment style for license.
  - Sort includes.
  - Remove sc7180_snd_hw_params.
  - Remove sc7180_dai_init and use aux device instead for headset jack registration.
  - Statically define format for Primary MI2S.
  - Atomic is not a concern because there is mutex in card to make sure
    startup and shutdown happen sequentially.
  - Fix missing return -EINVAL in startup.
  - Use static sound card.
  - Use devm_kzalloc to avoid kfree.

Thanks for the review!

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++
 sound/soc/qcom/Kconfig                        |  11 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 380 ++++++++++++++++++
 4 files changed, 523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.rc0.105.gf9edc3c819-goog

