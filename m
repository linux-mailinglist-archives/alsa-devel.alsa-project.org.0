Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD4E3B6817
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 20:10:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72ACA167D;
	Mon, 28 Jun 2021 20:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72ACA167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624903851;
	bh=Qzemk5GQhDnxfl329dXgjVq0nFWNHIhOni9rZ99xDzA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dYy3bEZqNmhTK0j/zuUYxEKXZxt8qAkZw6lVg0l1ym7NHm6EU4A+NirmNOUdAxlU3
	 S+MYC8NIweylIZiUkM0ezhRSeKXAU162VTYcW2Wl56bjtQTsKzb9qMfgQwdzAiTqVE
	 duuHWSeaqDk+WbXgkRbCG8EHi63PTdmQqRB+iZ9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C782FF80229;
	Mon, 28 Jun 2021 20:09:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B688F8012A; Mon, 28 Jun 2021 20:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030D5F8012A
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 20:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030D5F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hwaGLCED"
Received: by mail-wr1-x429.google.com with SMTP id y3so2944208wrq.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5PPwvIqoEMAWQO+bsBzWSD46fvy9+pFCdpISpP5frs=;
 b=hwaGLCEDvCIbSPK25alLYTWfzMt5h+iS1lF5FDFUxfbtt7gNx26I42MSrnm9iqlu0j
 qM31Dq4MTncem1U3iVMW1ljwSvxBfwJA5MqYU5+5vHTbK7KbfTMlY6rF8QO62AJyOU4V
 eeYOO2Iy6jJ9KPMRD8erVh1AkzE3H1ujTkzn8U1UrdpiM7LmxencnKJ4QnCxks6jqoGx
 lpG62UiW/RanNYo/KnrlB+tTMHYxy2Z2dybOqAaO4WMbz1Wn8kdC5FisXkFQYpNvm4g5
 wmS+DI3NPhi4GVUseXz2hb+miGU3qUNvD3JmIQQaKcMt5wrZMLyfFERSieijTH4/5+yH
 fYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5PPwvIqoEMAWQO+bsBzWSD46fvy9+pFCdpISpP5frs=;
 b=lrXRv/Nt6/oHE6gSLMQkroPEpCgBpTHMDYQleE2Z43FVLg8k9sIRQxiExL1GswdhYp
 9l4MegAc5ullyNGtmCUskMASox1LWfJaqE/xh0eIcfZC/nATtA72R/1h0Ts2kq3wP8oo
 8iySc5EW0B9tR2ubAKvxEErW2Hr0hLb3CqRRLYdmAC6SrgwI+pMhLtM47vOXhjSu0ws4
 UhNsfL3Dez/whp3HWbgPj7wj1D3BfbUEfcP1cbUI1dK8BZBTSEiaLSkPn02AoXxCyJq2
 +gWR0ikKYHqL+ScvF3dAGJp77guil9H7lxsgctih1Hpk6pNvV+7C5FCrEEaMQYWSP3AB
 WvSw==
X-Gm-Message-State: AOAM5337HMw4qNkKuxMxBHBRMlisQrjuUoKdsSM+fonU6/IbBIZftUZQ
 +h1ao/FFsWpl6EpzGu/tmYU=
X-Google-Smtp-Source: ABdhPJyMi2zHzK/ZSwv8LoaqOCoCXNjIv6Wby0gRqvWrTn2pmpIKTsa+90HML9AGahEP83Nym3frpg==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr24403213wri.10.1624903750618; 
 Mon, 28 Jun 2021 11:09:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r12sm16081681wrn.2.2021.06.28.11.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:09:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date: Mon, 28 Jun 2021 20:11:16 +0200
Message-Id: <20210628181118.2295007-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
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

From: Thierry Reding <treding@nvidia.com>

This small series addresses a minor issue with how IOMMU support is
wired up on various Tegra generations. Currently the virtual "card"
device is used to allocate DMA memory for, but since that device does
not actually exist, the path to memory cannot be correctly described.

To address this, this series moves to using the ADMAIF as the DMA device
for audio. This is a real device that can have a proper DMA mask set and
with which a stream ID can be associated with in the SMMU. The memory
accesses technically originate from the ADMA controller (that the ADMAIF
uses), but DMA channel are dynamically allocated at runtime while DMA
memory is allocated at driver load time, drivers won't have access to
the ADMA device yet.

Further patches will be required to correct this issue on Tegra186 and
Tegra210, but I wanted to get feedback on this approach first.

Thierry

Thierry Reding (2):
  ASoC: tegra: Use ADMAIF component for DMA allocations
  arm64: tegra: Enable audio IOMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  4 ++++
 sound/soc/tegra/tegra_pcm.c              | 21 +++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.32.0

