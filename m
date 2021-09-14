Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F184240B413
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 18:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511A81816;
	Tue, 14 Sep 2021 18:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511A81816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631635361;
	bh=gGkY0LNqQY6YkV+gtI51G4hP4Y3VSjMFLi6eUZ19vcA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pj4PPxhC1predPMVILpdlOVRHZhu5iCsVdhqcYInpbbLm9ZRiJ02ygy4btBXWxiG8
	 CGHi/OvktgewYtJKsHsa7iLDku4jRaniy2u28Rz0dwSOvTWIhnJzQraMzADeAGIo16
	 lqg0U6JoO3+nmZSF2teWvnfMCdwjP6RnOSsmqMZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B31F804AE;
	Tue, 14 Sep 2021 18:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 479E4F80271; Tue, 14 Sep 2021 18:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8F9F80271
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 18:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8F9F80271
Received: by mail-oo1-f41.google.com with SMTP id
 v20-20020a4a2554000000b0028f8cc17378so4830634ooe.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 09:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cn+CaUamIV5ffSEiSxIWSxmoRy7kzAqNfsOsKH/+GQE=;
 b=sLoq8TpvpJc6bDbbmYaEghdPpZMA47zh7EpdWvalJYrPNi43vQ3uDJ92dLD7jULjM+
 AP+eE5oYrLg9OZPvgDOeYtHEATYVMAD9zNcvU/mDsjr0QrDAU1pxn0qWMDPRJ1XXoOtg
 S2xsJ+jEGI/1Kgns/D4sn+ohk1KISmN6+c6jBTu9tHFVdpN1jORLO3Xv+jXZ2UrJDL9Q
 zw4oWWwbfqQ4X1fPfZZ6gIVb/d84FvsevxODqrC1Scby0hCo2gbEQf126WBrnHn4Og55
 iL5K8aVHhZA0jEhl9hgDHApIgLqTGI0sA48Lxu0XNfyhA/qwu6eapAls5VTo4Y/Mn/Yz
 LkTg==
X-Gm-Message-State: AOAM531tEYr0lJhWmnwTUF/ATOrbJYR5jQ+AYrXm3/EtFCrJMDmd+2p6
 HqDTkK/dYQSkIDr0xWcSeA==
X-Google-Smtp-Source: ABdhPJydrZcnWbcyYKEf8iOzboFIcQrfjb0myBlumYE/rSjF7jHXY0LUIuBgPpEAXCxHWNbxHZjqcw==
X-Received: by 2002:a4a:a58e:: with SMTP id d14mr14800526oom.28.1631635278934; 
 Tue, 14 Sep 2021 09:01:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x4sm2757875ood.2.2021.09.14.09.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 09:01:17 -0700 (PDT)
Received: (nullmailer pid 3475829 invoked by uid 1000);
 Tue, 14 Sep 2021 16:01:16 -0000
Date: Tue, 14 Sep 2021 11:01:16 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 04/13] ASoC: dt-bindings: tegra: Few more Tegra210
 AHUB modules
Message-ID: <YUDHTHU3GBaISmHw@robh.at.kernel.org>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631551342-25469-5-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 catalin.marinas@arm.com, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, 13 Sep 2021 22:12:12 +0530, Sameer Pujar wrote:
> This patch adds YAML schema for DT bindings of few AHUB modules.
> These devices will be registered as ASoC components and bindings
> will be used on Tegra210 and later chips. The bindings for below
> mentioned modules are added:
> 
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  .../bindings/sound/nvidia,tegra210-adx.yaml        | 76 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 20 ++++++
>  .../bindings/sound/nvidia,tegra210-amx.yaml        | 76 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-mixer.yaml      | 74 +++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-mvc.yaml        | 76 ++++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-sfc.yaml        | 73 +++++++++++++++++++++
>  6 files changed, 395 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-adx.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-amx.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mixer.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mvc.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-sfc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
