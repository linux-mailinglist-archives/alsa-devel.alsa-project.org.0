Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E163BF879
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C82D1690;
	Thu,  8 Jul 2021 12:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C82D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625740420;
	bh=mvi7lc+sDIJhxwJzKNV1FtuDVsAla1cx/OEyGDl4msY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i2d9DqRitQAyQHyHcDG6kTC4vUFcwvp2s3Wp8S+TH1dTCpZG/XcUmH7AXycVDeGHA
	 IkEBBesY4m6XVv+5xsbzN04oN6UIw0azcp8Pi1bvjlK1Hn3296mSYMjPl32wRei6D6
	 1xhhEoBorgK46CTQtcSxJOX/EFKfKXVRBQjBIBr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7E92F802BE;
	Thu,  8 Jul 2021 12:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F84DF80259; Thu,  8 Jul 2021 12:32:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C924F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 12:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C924F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KEJZIkI6"
Received: by mail-wr1-x42b.google.com with SMTP id q17so6892586wrv.2
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JjPqlc8azA5xqd54PpZaulfxwSTSSBIfxBmm684SVJA=;
 b=KEJZIkI6N6oHcxvOD+FGT3/QrZ3C1O9uOLa0KzTvSu1dwYoBN+Gc2UxNwXuIuULPeL
 /dD2XJXjbPyDY8Fj2fxiOMiqeghdqFWboqN99Gg1yhGPqV32A+pOsMIn0FMxM8q17hf0
 Cdd3rk2B2sqeGIDmM0Nf71tNfG13bP/AZFoo5z0Q0z4ypIRLWR5T32+y5goTUaZO+lhj
 NvpJp/+K2pn6WPqgCGoWs6/H2g+MsFMA3r/LjUm2c6GsMKwUi7SxyBlrXhqOgabcwpIj
 B/9wHAMlMODnbeapEbUhbey2dAhxfwXqTRquP/pA215TNK8xDvF4GP/A5Nk+4pFw8P1g
 R5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JjPqlc8azA5xqd54PpZaulfxwSTSSBIfxBmm684SVJA=;
 b=rtRddpMnWBorHF3Au4qM6J9uujnSTMoWVaYLPBmQ7YxQ3YWbQvfnljuQO4sh6RHa51
 8vD+etaxGrJSQVhQH4uIAOPSK7zQy5FYPmLLKJMWFctfYPirnAeJ4I9ZvQU/ckNQukHJ
 EmlM6mLx+G2qFvLMzT44Uap1JAfE9dr7Dn7x5X3glmxHpZcYiJhLc7b/YIUmORkEZ8Zj
 fbYB6FGIvspOJeE3/DGWucYn3J22q/RIj2460nyoBkkO/n/+fUxKyGKGXHWVcyH7FIJD
 6u5c09cH09RMZwz1p1/Y76IyLK5oGlhKSt3pNBpNJ7HL/2QkDs7l65CbLDMGda6dvfXI
 ENdA==
X-Gm-Message-State: AOAM532eBkIxdLp1dPKLIpk4+//+mWN6wk9weenuKSUrS6CeNEq0ds+O
 pYImtiuS614YxJggmDQvAE0=
X-Google-Smtp-Source: ABdhPJyhDiFpfc+O30tADU7f8YCrKYj7g4WvNZ68l3UgE2IHMftMEQd9YIMP58nJka/aV9c555OhUg==
X-Received: by 2002:adf:ef87:: with SMTP id d7mr33803739wro.204.1625740324114; 
 Thu, 08 Jul 2021 03:32:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f9sm1851897wrm.48.2021.07.08.03.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:32:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date: Thu,  8 Jul 2021 12:34:30 +0200
Message-Id: <20210708103432.1690385-1-thierry.reding@gmail.com>
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

Changes in v2:
- add backwards-compatibility fallback

Thierry

Thierry Reding (2):
  ASoC: tegra: Use ADMAIF component for DMA allocations
  arm64: tegra: Enable audio IOMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  4 ++++
 sound/soc/tegra/tegra_pcm.c              | 30 ++++++++++++++----------
 2 files changed, 22 insertions(+), 12 deletions(-)

-- 
2.32.0

