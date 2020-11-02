Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3622A24C6
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 07:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 936C816E0;
	Mon,  2 Nov 2020 07:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 936C816E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604298364;
	bh=ARKg3LSFW3yLnvRlHcKzKpycDOdquWLPxBkO5DU71dY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PpRmirjUeGXGUtn+Vp8/CxjhZc0J0Z47mQ5hOu2G+LmLsucp+asYTj1aUc2sxTcpB
	 LmyocMrZLRP9bfBzyIfpd8wxVEKROhX3kMKdnBngZt3snMK2xEHKabiJthWY+k3Vf4
	 vPoxF7FTxcNl9Bz6FY38L5rZvcGOMvUPOAPgpwMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E8AF8023E;
	Mon,  2 Nov 2020 07:24:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9423F80083; Mon,  2 Nov 2020 07:24:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6296CF80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 07:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6296CF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mO35MAJo"
Received: by mail-pf1-x444.google.com with SMTP id 72so3496542pfv.7
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 22:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vAM5CT2KacUDjyxFo+2f/EVZL5xw2B882UgmQkCWM/0=;
 b=mO35MAJoGz0ZYzS2OL3cLsTGuXCQRXjKdYHgKdhFETYbWaDYSRqTXmftQogUUqIQJU
 D1uarZC2+esGZabr8GFsDh4XmOU3h1KttLKqWxnCNkgOZRdDsm5EWQnvfmLbTS4FweL4
 Pj62twAumJepNB4d+QtQVK3NN1sOxqR4Iw9p+TCpSjEqK5XobpJY+5V/g9fhAadB6yil
 tCLBtqRFK12pOhGxLnvxuIKKvfz/N++Ia9tG5Bj4NgW039LYqeMEsZ1gFMiN//zmTqSW
 MpqnvBpbLxpXnY0t8On/E/TrVUlXvojRUSbTagtQpeUNwaKZ1+dyq18SC95qVhSM8ldW
 084g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vAM5CT2KacUDjyxFo+2f/EVZL5xw2B882UgmQkCWM/0=;
 b=pZUhKBgvmqEw6ulgHUhQvOarCloUCpY/Tb6PfCZB1T+KQn18Lb0BWnKMOQCA45iBjd
 XjZwIgKIEE3KF9GBN9aWd2xUe0LNRJSFZoV9zi82mvjnjWJ9SxLD9dXr++jLUIu/WgUr
 GyezmtKh0lSmU3wtiUdevpT32WJOI5iPAeX/Cjl0Wf8H+TdMGoz9HEEfBHs87amY0BAF
 cZibPILekjGozeC8yjLbopYDfnXuonNZ15Ry38mu/PXr8Tgkb8Sittl0PFTRWCBluMIf
 LKH1P+oozSo452p/NZh+alD6Zub9fTBkagS2zYI54qTZZwXrFnV/ItgAO+qQgGaRbTtO
 hxeQ==
X-Gm-Message-State: AOAM533FIE7+8KQIJ5jaeAgjDgEoQe2yGocQQpa9cSIYjPY/vTG3k3BO
 qtQMWLq/nS4PpHbTgaYDlOQ=
X-Google-Smtp-Source: ABdhPJzvcRARwD+rcPvRxCml9bRA82oNKtrnY6PjzJYKl+AIVn9BUZndu8V5jaSEKb+VII6P6tC+7A==
X-Received: by 2002:a17:90a:f2c5:: with SMTP id
 gt5mr706151pjb.66.1604298258344; 
 Sun, 01 Nov 2020 22:24:18 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id b6sm10607015pjq.42.2020.11.01.22.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 22:24:17 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Modify documentation and machine driver for SC7180
 sound card
Date: Mon,  2 Nov 2020 14:24:06 +0800
Message-Id: <20201102062408.331572-1-ajye_huang@compal.corp-partner.google.com>
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

Changes from v2 to v3:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
  - Remove redundant judgments in dmic_set(). 
  
Thanks for the review!


Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++
 sound/soc/qcom/sc7180.c                       | 65 +++++++++++++++++++
 2 files changed, 123 insertions(+)

-- 
2.25.1

