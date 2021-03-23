Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B70346571
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 17:38:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8524B1677;
	Tue, 23 Mar 2021 17:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8524B1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616517498;
	bh=xfG78nh6Eyv5N0I+GLGE5h53SWzTvP1Vm24d2LbGCiU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ALLlPpspHv/RQB59W3bieRbq4JlD2KxJ5rEgMufG1adrQ6Jdkl3xWaf++Fs1Wk86H
	 XpFL4lbVL15Sq5RED9RfeE1R6vb7mDQrUnkiXvgKpM5yHz5H2wlsRr5lHToKnU54Z+
	 Zyp32b3j3DaDTy/SAc6r8aBh2lJhCtKrFgVMoOc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6022F80104;
	Tue, 23 Mar 2021 17:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A923F8026D; Tue, 23 Mar 2021 17:36:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C86CF80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 17:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C86CF80104
Received: by mail-io1-f42.google.com with SMTP id n198so18347788iod.0
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 09:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=541LKQ57D+BvmUsaoliHNppqzLoXCmsKVD7T7MlJimQ=;
 b=HMnoGgKPDqvmCP9/gCVOsopLyjQOElYmsDFuf1Vky2dYwbuAHVIR4GKoUvUvGywPNJ
 KSmI9+5s0usI+ZL+A69gJtgFkF+R1RUeoNaWlCsZXld9waOEqm6JocgeN7pJwsXO9gDn
 UJ0qH3kSOF49Zs5MqE/tGUnOv9paf5k9nq0hFe0p62uErcZTZXlBolz7IqUqUq2Tkzt5
 WzPKWRiSW91ejOVS/YoF7OtCqmLiSISuMnGgn9IvgLsP8aOkAWMhJi7huA5ooFCg3ljT
 scqHncVZvSuGV7L3ArqjKIGc6qjocmLG51lgs6KtO34lTezdUIc1IhGXiK1QwQ0C3Qp4
 X++Q==
X-Gm-Message-State: AOAM5301dlFyzjrHLMRbNYG0j3KtB9JaXQFR9bozCxbUs8UUXFRQ0Ujv
 gUUsz6FwP9llGGaUtJMMWw==
X-Google-Smtp-Source: ABdhPJzR+wm/3d7iE9OkgZDgKyWi2DrqnKcHW2ercCH72t76IuuS7N0iQNoI+0NwhAVjeDhFDK1lMQ==
X-Received: by 2002:a02:7419:: with SMTP id o25mr5241097jac.100.1616517399087; 
 Tue, 23 Mar 2021 09:36:39 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id r18sm9771268ilj.86.2021.03.23.09.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:36:37 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: dt-bindings: Rework audio-graph-port schema
Date: Tue, 23 Mar 2021 10:36:31 -0600
Message-Id: <20210323163634.877511-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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

This series refactors the audio-graph-port.yaml schema moving the
'port' node out of the schema and updating to use graph.yaml schema.
This allows users to define what each 'port' node is like other graph
binding users.

Rob

Cc: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Brown <broonie@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>

Rob Herring (3):
  ASoC: dt-bindings: Move port/ports properties out of
    audio-graph-port.yaml
  ASoC: dt-bindings: Use OF graph schema
  ASoC: dt-bindings: socionext: Use audio-graph-port schema

 .../bindings/sound/audio-graph-port.yaml      | 104 ++++++++----------
 .../bindings/sound/marvell,mmp-sspa.yaml      |   6 +-
 .../bindings/sound/nvidia,tegra186-dspk.yaml  |  11 +-
 .../sound/nvidia,tegra210-admaif.yaml         |  11 +-
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |  11 +-
 .../bindings/sound/nvidia,tegra210-dmic.yaml  |  11 +-
 .../bindings/sound/nvidia,tegra210-i2s.yaml   |  11 +-
 .../bindings/sound/renesas,rsnd.yaml          |   5 +-
 .../sound/socionext,uniphier-aio.yaml         |   8 +-
 .../sound/socionext,uniphier-evea.yaml        |   8 +-
 10 files changed, 89 insertions(+), 97 deletions(-)

-- 
2.27.0

