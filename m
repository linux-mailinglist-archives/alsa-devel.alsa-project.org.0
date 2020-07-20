Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85122261EC
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 16:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2789F1615;
	Mon, 20 Jul 2020 16:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2789F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595254958;
	bh=Vib6dxAx8u3DoTSWJXH5KMkq3799ypAVfeuWMkW6Hj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4+Msme+YPgH/Nj+AuxaUKq3IXHO4rbYjsqoTwNZpV1J/2q9poonvPbm6ryYB3wt2
	 cFMalbtGgOXDbgQjQU5i0Wy56ZVIUsAvHOzq+/9ilKpIAiBvndDDybTlsMMAoPhr8m
	 YxsJglhI+du2utW1/ojzsKTVcj3ojiBRjfe0uGu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B5CF80125;
	Mon, 20 Jul 2020 16:20:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA397F800F5; Mon, 20 Jul 2020 16:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39CD7F800C1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 16:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39CD7F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y+GBWxSj"
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A974020B1F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595254841;
 bh=Vib6dxAx8u3DoTSWJXH5KMkq3799ypAVfeuWMkW6Hj8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y+GBWxSjbTxcsL9FTO8DgCDwnf9G9i9jJLGRzjbIbJbnfc/p3SWainC3JOFWzl6Cg
 tBHe3qPnv2X+MrorxWay6AqVOd7lyzKu4NOxYI1QLVEVp10EF8yFfC7aHWL2x20SU+
 jiSfuE5OwnT2P+CSRXld82tpVBQxGuMdwC+oFpLE=
Received: by mail-ot1-f51.google.com with SMTP id 95so12298470otw.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 07:20:41 -0700 (PDT)
X-Gm-Message-State: AOAM530mEr8tNE7AgCUQEInPXHS/ujnskI8lV/tosr0a18Ewe2viunNc
 Jzz7pQgVD8dVOIVEyi0czDR182fydSdd1iUF0A==
X-Google-Smtp-Source: ABdhPJwHTembEjVuQTsjX9Y4lVbdIElrObkCp3VjWe/eZu4PcW+QH4GExQ6U+8YWt1byxEkCF1wg9PXj+VhOMp2l8VE=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr775393otc.192.1595254841027;
 Mon, 20 Jul 2020 07:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <1595134890-16470-2-git-send-email-spujar@nvidia.com>
In-Reply-To: <1595134890-16470-2-git-send-email-spujar@nvidia.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 20 Jul 2020 08:20:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+HBBLkUY=ODo+TmV_MhO40r9sfB=k1j64j7m67GUoSaQ@mail.gmail.com>
Message-ID: <CAL_Jsq+HBBLkUY=ODo+TmV_MhO40r9sfB=k1j64j7m67GUoSaQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: tegra: Add DT bindings for
 Tegra210
To: Sameer Pujar <spujar@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Jon Hunter <jonathanh@nvidia.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, atalambedu@nvidia.com,
 Stephen Warren <swarren@nvidia.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nwartikar@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, viswanathl@nvidia.com, sharadg@nvidia.com,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

On Sat, Jul 18, 2020 at 11:01 PM Sameer Pujar <spujar@nvidia.com> wrote:
>
> This patch adds YAML schema for DT binding of AHUB and few of its
> following components. These devices will be registered as ASoC
> components and binding will be used on Tegra210 and later chips.
>  * ADMAIF
>  * I2S
>  * DMIC
>  * DSPK
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
>         t=1595134894; bh=DX96zRQRNplPikN828HbAfbjGumAn9IgtktrsenKjgk=;
>         h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
>          In-Reply-To:References:X-NVConfidentiality:MIME-Version:
>          Content-Type;
>         b=IhfGFjMxsnRHso1Ku2GEGC+mtLCy3AbRKPfgTS56XGqEWquUr/1s8n9tFpriqF7a+
>          tJGrTN9mKhRQGrwdey/AHsMY4Tbm4fKEWxIASgAV/lFPCfgP3BnVjEdHclc7FdBaB0
>          Qvd3zs8HFsgoIzksLrtHNMrUepkeZajn0/XnC7nghGDRim4+6Hauupr5kj/KVlihsS
>          KS1YQ2Zz9TZzLaC5QXALiHj3ATLvBFrmIf6Vj19q7hePt0menTZVzQNy+y3h4xZfLH
>          +OvBCsLgHGGhq+iM9rm64D+S5Op2vCslwq3Q/42TnYZ0vDbD7aA9nTAQzfYeI6HK6b
>          vi7eYbryzCTSg==
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra186-dspk.yaml       |  83 +++++++++++++
>  .../bindings/sound/nvidia,tegra210-admaif.yaml     | 111 +++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 136 +++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-dmic.yaml       |  83 +++++++++++++
>  .../bindings/sound/nvidia,tegra210-i2s.yaml        | 101 +++++++++++++++
>  5 files changed, 514 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml

Use get_maintainers.pl and send to the correct lists if you want this reviewed.

Rob
