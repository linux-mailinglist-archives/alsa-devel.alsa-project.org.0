Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4945A829
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 17:36:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FE81685;
	Tue, 23 Nov 2021 17:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FE81685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637685416;
	bh=cWV3XS6kpitEv1mhZz8h4RPIvZmv/WjQdwxMNzqMDRU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfJlywnBh5tF75tS8b+0V35pDmCd7PukOEUesfpqfQfzMqaP2luhk//DaNB19EkvH
	 D1HpKkPpTl2WHWMzDtLvnsyPMdoneuyFRhWE990033StrYZZmjYBd7qTc8YBezRdK7
	 SDZEmgKuiksf90o3iRBCI97NNE34ZVQpNngpaCA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC43FF804BC;
	Tue, 23 Nov 2021 17:35:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31158F804B1; Tue, 23 Nov 2021 17:35:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83A0CF80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:35:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83A0CF80087
Received: by mail-io1-f51.google.com with SMTP id f9so28499372ioo.11
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 08:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=D6T/kSJ9srFChgFgIRsLj0E0OrT4xnoVPNKL7Xh9JN4=;
 b=TBSKNB1rhJrXtoNr1LJil33VZ3T3hNsqZVWut3mCCuFWHGVHlQhOyt+7iCmFOqTqGn
 4v5DHKsECj1SVf2YgBc6+Ptqq34pzfaXN44hEQUG8T9Zwd7vLFuKFjKmKiRMGqcWHcBl
 9rQH/8Or8Eu7454d+Dqsa289KKxTQlPGZ+6K6HlrSwQEeJCjhpF3851WonJE66YYgArJ
 jTpbwp2aLtBg2t3FLoNZcDIzJrQ37rIN8CznUzSrMYybSxfjiXyCrkMvlrHpryGowJFV
 WINe4kiEo/uZPj+I7fgC+ofkcjnfDW4UyZUNiJHCx/b6jbm4pAY47Sk+5bzLv8kh3ZaE
 LB5A==
X-Gm-Message-State: AOAM5300siw+v1L3aTPfIaQcPELG/VZVn0dpsmRHZuYDh9OrKdN5kJSt
 esTTY8g4yq+5PxD1t5Sev8w4zim7rQ==
X-Google-Smtp-Source: ABdhPJxRUIRmOhuAJyjr0WFtSMk8x/c97hGhx+pkyvVMetgFjebYdZNJ0ZQRHk7wLwVxAUZ0Wp9bgw==
X-Received: by 2002:a02:ab8f:: with SMTP id t15mr8110328jan.147.1637685312081; 
 Tue, 23 Nov 2021 08:35:12 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id y21sm6846548ioj.41.2021.11.23.08.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 08:35:11 -0800 (PST)
Received: (nullmailer pid 3442930 invoked by uid 1000);
 Tue, 23 Nov 2021 16:34:29 -0000
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20211122091525.2290-1-j-choudhary@ti.com>
References: <20211122091525.2290-1-j-choudhary@ti.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: convert McASP bindings
 to yaml schema
Date: Tue, 23 Nov 2021 09:34:29 -0700
Message-Id: <1637685269.740254.3442929.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

On Mon, 22 Nov 2021 14:45:25 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs
> from txt to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains'
> and '#sound-dai-cells' which were not there in txt file.
> Adds 'dmas' and 'dma-names' in the example which were not there in
> txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 ----------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 161 ++++++++++++++++++
>  2 files changed, 161 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1557927


mcasp@0: clock-names: Additional items are not allowed ('ahclkx', 'ahclkr' were unexpected)
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clock-names: Additional items are not allowed ('ahclkx' was unexpected)
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clock-names: ['fck', 'ahclkx', 'ahclkr'] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clock-names: ['fck', 'ahclkx'] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[155, 0, 0], [155, 0, 24], [155, 0, 28]] is too long
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml

mcasp@0: clocks: [[156, 0, 0], [156, 0, 24], [156, 0, 28]] is too long
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[157, 0, 0], [157, 0, 24], [157, 0, 28]] is too long
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra76-evm.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[158, 0, 0], [158, 0, 24], [158, 0, 28]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml

mcasp@0: clocks: [[91, 340, 0], [156, 0, 24], [91, 340, 28]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[91, 348, 0], [91, 348, 24]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[91, 364, 0], [91, 364, 24]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[91, 388, 0], [91, 388, 24]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[91, 396, 0], [91, 396, 24]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[91, 504, 0], [91, 504, 24]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[91, 508, 0], [91, 508, 24]] is too long
	arch/arm/boot/dts/dra71-evm.dt.yaml

mcasp@0: clocks: [[92, 340, 0], [155, 0, 24], [92, 340, 28]] is too long
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml

mcasp@0: clocks: [[92, 340, 0], [156, 0, 24], [92, 340, 28]] is too long
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml

mcasp@0: clocks: [[92, 340, 0], [157, 0, 24], [92, 340, 28]] is too long
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[92, 340, 0], [158, 0, 24], [92, 340, 28]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml

mcasp@0: clocks: [[92, 348, 0], [92, 348, 24]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[92, 364, 0], [92, 364, 24]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[92, 388, 0], [92, 388, 24]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[92, 396, 0], [92, 396, 24]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[92, 504, 0], [92, 504, 24]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[92, 508, 0], [92, 508, 24]] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am5729-beagleboneai.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml
	arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml
	arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml
	arch/arm/boot/dts/dra72-evm.dt.yaml
	arch/arm/boot/dts/dra72-evm-revc.dt.yaml
	arch/arm/boot/dts/dra7-evm.dt.yaml

mcasp@0: clocks: [[94, 340, 0], [157, 0, 24], [94, 340, 28]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: clocks: [[94, 348, 0], [94, 348, 24]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: clocks: [[94, 364, 0], [94, 364, 24]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: clocks: [[94, 388, 0], [94, 388, 24]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: clocks: [[94, 396, 0], [94, 396, 24]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: clocks: [[94, 504, 0], [94, 504, 24]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: clocks: [[94, 508, 0], [94, 508, 24]] is too long
	arch/arm/boot/dts/dra76-evm.dt.yaml

mcasp@0: dma-names: ['tx'] is too short
	arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml
	arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml
	arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml
	arch/arm/boot/dts/omap4-kc1.dt.yaml
	arch/arm/boot/dts/omap4-panda-a4.dt.yaml
	arch/arm/boot/dts/omap4-panda.dt.yaml
	arch/arm/boot/dts/omap4-panda-es.dt.yaml
	arch/arm/boot/dts/omap4-sdp.dt.yaml
	arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
	arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml
	arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml

mcasp@0: dmas: [[119, 8]] is too short
	arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml
	arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml
	arch/arm/boot/dts/omap4-kc1.dt.yaml

mcasp@0: dmas: [[124, 8]] is too short
	arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml

mcasp@0: dmas: [[127, 8]] is too short
	arch/arm/boot/dts/omap4-panda-a4.dt.yaml
	arch/arm/boot/dts/omap4-panda.dt.yaml
	arch/arm/boot/dts/omap4-sdp.dt.yaml
	arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml

mcasp@0: dmas: [[130, 8]] is too short
	arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml
	arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml

mcasp@0: dmas: [[132, 8]] is too short
	arch/arm/boot/dts/omap4-panda-es.dt.yaml

mcasp@0: interrupt-names: ['tx'] is too short
	arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml
	arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml
	arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml
	arch/arm/boot/dts/omap4-kc1.dt.yaml
	arch/arm/boot/dts/omap4-panda-a4.dt.yaml
	arch/arm/boot/dts/omap4-panda.dt.yaml
	arch/arm/boot/dts/omap4-panda-es.dt.yaml
	arch/arm/boot/dts/omap4-sdp.dt.yaml
	arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
	arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml
	arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml

mcasp@0: interrupts: [[0, 109, 4]] is too short
	arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml
	arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml
	arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml
	arch/arm/boot/dts/omap4-kc1.dt.yaml
	arch/arm/boot/dts/omap4-panda-a4.dt.yaml
	arch/arm/boot/dts/omap4-panda.dt.yaml
	arch/arm/boot/dts/omap4-panda-es.dt.yaml
	arch/arm/boot/dts/omap4-sdp.dt.yaml
	arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
	arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml
	arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml

mcasp@0: 'num-serializer' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-cm-t335.dt.yaml
	arch/arm/boot/dts/am335x-sbc-t335.dt.yaml

mcasp@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-sl50.dt.yaml

mcasp@0: 'rt-num-evt' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-wega-rdk.dt.yaml

mcasp@100000: interrupt-names:0: 'tx' was expected
	arch/arm/boot/dts/da850-enbw-cmc.dt.yaml
	arch/arm/boot/dts/da850-evm.dt.yaml
	arch/arm/boot/dts/da850-lcdk.dt.yaml
	arch/arm/boot/dts/da850-lego-ev3.dt.yaml

mcasp@100000: interrupt-names: ['common'] is too short
	arch/arm/boot/dts/da850-enbw-cmc.dt.yaml
	arch/arm/boot/dts/da850-evm.dt.yaml
	arch/arm/boot/dts/da850-lcdk.dt.yaml
	arch/arm/boot/dts/da850-lego-ev3.dt.yaml

mcasp@100000: interrupts: [[54]] is too short
	arch/arm/boot/dts/da850-enbw-cmc.dt.yaml
	arch/arm/boot/dts/da850-evm.dt.yaml
	arch/arm/boot/dts/da850-lcdk.dt.yaml
	arch/arm/boot/dts/da850-lego-ev3.dt.yaml

mcasp@2b00000: 'op-mode' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b00000: 'serial-dir' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b00000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'op-mode' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'serial-dir' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'op-mode' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'serial-dir' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

