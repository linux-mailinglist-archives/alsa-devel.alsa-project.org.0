Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB145E267
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 22:27:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6D318E3;
	Thu, 25 Nov 2021 22:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6D318E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637875662;
	bh=UkzdxWtRbXWwRzSMeExs9dwcLOftMNn6Q0z3cMCm0aU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWz2P1GqsKyRGhZeHU1ijFCVfcVKWmgT1oTP2rzisq6/qMOlzJEC19Wx0fNiJRhAL
	 ysjVUw0Ki8RpUlA4/gEhj0jJLDlvx6K5d2DDD5K8KT5EbPujIa8/XpdXuzPuqd/j9/
	 Yq3sJ8nfAJ6A7XJCcBzPPWOtmd69CHWHYK9XU2mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A481DF80302;
	Thu, 25 Nov 2021 22:26:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C884F8049E; Thu, 25 Nov 2021 22:26:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D400F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 22:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D400F80302
Received: by mail-ot1-f42.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso11131056otj.11
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K9sBfhhvh3TyySdJ4+kH3HFS2nUgK5mo6oF+b8evIIw=;
 b=QsY+RyX+1h/rtjoYAOZD0sJqj+p6UO7HbsYhk6vm/yXNhBQjOw9M0BS/m2fkfRK5C7
 xaVGU7UYungJ3XKXFDL8sTNwGzDfCqHnEn+4mwt0F6GR7pZ88dqvfadvDAAVuMaJ4e52
 GNhzUoPOShkLPMqNcv4NQ1JTOj+mq5hXckI939IaX7N7jUsuT7IY3mUgqGEWkh2CPOvd
 Rxy+uxEkZWpC2b4qDcqfG74XVS0o3dVa5vZoiXb6mKpkhoW4f074VubYAd197QKEzz/V
 SJ5uJXJO646tAg7Dv6SkSozAszwfo/lSQSi0WXNrRN6Qzl5xK2dr9/Q7vxitq2ehLmWR
 Q4gw==
X-Gm-Message-State: AOAM5304L6IAbOsvNCROYaGRCmkyyCqlQ4Rkfe7SuWF2bBXSo3guv6x4
 HoQH8BMQlt0i7FrgZPvJ7A==
X-Google-Smtp-Source: ABdhPJzzt0Csr7okspWgSLe+I1n4SZvDhCX1LyaO2Mr9NAGUFau59mr2FaZq2piH3W6tpFyYwBeH1w==
X-Received: by 2002:a9d:6c54:: with SMTP id g20mr24876267otq.30.1637875571987; 
 Thu, 25 Nov 2021 13:26:11 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w19sm870433oih.44.2021.11.25.13.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 13:26:11 -0800 (PST)
Received: (nullmailer pid 2858311 invoked by uid 1000);
 Thu, 25 Nov 2021 21:26:02 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20211124220057.15763-3-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-3-digetx@gmail.com>
Subject: Re: [PATCH v1 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date: Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.276093.2858310.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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

On Thu, 25 Nov 2021 01:00:39 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 I2S binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.example.dt.yaml: i2s@70002800: 'clock-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1559387

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

