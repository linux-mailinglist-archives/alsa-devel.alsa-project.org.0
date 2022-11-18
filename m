Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2662EE35
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 08:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8C716B1;
	Fri, 18 Nov 2022 08:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8C716B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668755997;
	bh=7BpRXZkAMGKvMw8dnnKL90LNZenrW54YhCJ3+f+BMwU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ATG+Xv2rVR3hC8Pu1R4Th2SnUURsOH1LrPse4MAHyH6PB+ZuxmhFJwbjn4jhJ/ju/
	 k+x3AHWAIkNFo0Mi6H6SlutA8QklwgpeRJuwIeE2v9XqhlGsUcUaAvz9cmZUWiDG7V
	 X7UOVHx8707UbKhrEBSdzE2beQ516b3wp57Bngks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A621DF8028B;
	Fri, 18 Nov 2022 08:19:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D41C4F800B8; Fri, 18 Nov 2022 08:18:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 345C7F800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 08:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 345C7F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NhCBoaaF"
Received: by mail-wr1-x434.google.com with SMTP id w14so7891206wru.8
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 23:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KUOY4nIS+EPdm5b8Vs0He3SW90+YwQyay5PCgjl6fNQ=;
 b=NhCBoaaFAGjIcjypiwHh6dFfOC00sazPIPE9Yb+GqeKx4XxPy4uBkiyRW84HLKh/HM
 1LQSOKyCbYHASM1zpustxdMf3xTQ+mW6ToVAs6kRbKcXlUOAJJHqYi+pwu2jchJeUeVY
 AndnsUFUkecvCUjCOCgap0keY70racw/SUXYHzjBO3BidmK7xtyJsGeuCQs0XW0IBkTa
 cDJXwj1kqgjnXbhkNK0u+546hXejgAcoJIwm+w0G3D2yQBxPP5IP/KTJ7fweDlDW+b73
 vXn03Bsvfj24kVsDeKurPTEuf5e8ldvG2xKjAdZM+mZwzO+KwZa39DMlrGoee+S3s0tI
 43qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KUOY4nIS+EPdm5b8Vs0He3SW90+YwQyay5PCgjl6fNQ=;
 b=Phxx4blm7iGqI3YByL/P934yM/K+qcyhsmhaEPyJFU6Fe06cgJeoxCAtMjoESy97O7
 TV6STXh6FzgGPnQwDWaJkluzV99ZMiKfi/uQwZwS5bGSAZ2/R1RxV0hg2mrrEdCPL2Lw
 r30NUOSku/XywHmdUw8H63Ghw4PMtWX+J2badUAsg0TmyuKDo1ckDpD4vVAdGcX/ran5
 k8alC/at750vbMxua8zuTkFs7Ddjw8w1cgMEahYW6ngLMnsyREN3sVKpMFPWfrfOmH21
 99UAHlCoc7It590xWVgYdzj65SPlYiBDAeEU8ASCmPuxT9C9AieXTOcOxk3jEWEu/Jty
 Asaw==
X-Gm-Message-State: ANoB5pkSHZW2us+UKgJHaAcYdyh8QM2XkYiwihWFkVPszyXcgMne2k22
 8oZBbAkmfY/fOOhDpzKoBNJLEQ==
X-Google-Smtp-Source: AA0mqf4tJJ/aCkkczRMd8JCBaBzvq8aqeQFCciORAez9qokL4gjxye7DEB5zL8xkfk/VUWMi1ygHTQ==
X-Received: by 2002:a5d:4538:0:b0:236:5270:8f17 with SMTP id
 j24-20020a5d4538000000b0023652708f17mr3700494wra.358.1668755934296; 
 Thu, 17 Nov 2022 23:18:54 -0800 (PST)
Received: from localhost.localdomain ([167.98.215.174])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adff010000000b002302dc43d77sm2754349wro.115.2022.11.17.23.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 23:18:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/2] ASoC: codec: lpass-va: add npl clock support
Date: Fri, 18 Nov 2022 07:18:47 +0000
Message-Id: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org
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

New versions of VA Macro has soundwire integrated, so handle the soundwire npl
clock correctly in the codec driver and add related bindings.

Changes since v1:
	- updated bindings as per Kryz comments.
	- added error handling during npl and mclk enable.

Srinivas Kandagatla (2):
  ASoC: dt-bindings: lpass-va: add npl clock for new VA macro
  ASoC: codecs: va-macro: add npl clk

 .../bindings/sound/qcom,lpass-va-macro.yaml   | 63 ++++++++++++++++---
 sound/soc/codecs/lpass-va-macro.c             | 46 ++++++++++++++
 2 files changed, 101 insertions(+), 8 deletions(-)

-- 
2.25.1

