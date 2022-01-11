Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A83B48A5A7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 03:30:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD6618A6;
	Tue, 11 Jan 2022 03:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD6618A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641868217;
	bh=DY7ydjH9yuzR7u2+fPUzkUM0bOAZmfHlyd6m+4428pM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhbG8t6nJpMPmTLDKzW+2lN9wxDAAuuo9ejrLCQnwl7R/7+gx/EZdtk56GTbcIn8D
	 SIMzuauWpPkE5Glp0Wu4TbvIt2xWi5h7QUSTv6LHwaD3RhPfBDALqMGOhhK4TGesFp
	 sklR/O/zv1E7ukFwyJMpkKtzZGj8211ayYKu1514=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7219CF80430;
	Tue, 11 Jan 2022 03:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DD74F80302; Tue, 11 Jan 2022 03:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B36F6F80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 03:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B36F6F80118
Received: by mail-oi1-f193.google.com with SMTP id v124so13873125oie.0
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 18:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MXIaIsWWEUQYqFn1KRmQY2r7PRSAKIBrP5Pdb7uhVuo=;
 b=A6kmnk193I8k09kZLZivnvCffducfCfUsTlE5dY7Wtfvxr4dG8x78T9hYtRYuHhWlQ
 AnRR+rLVTFBQS1nK6v+woVDgSAprji8cpJixrjNWatiuXRWL9gpxlVu3rwhacGkK5BUh
 0AZHMeHXgBurPqyZzfa/UspoDWYBNd9VNd3B+u709CXzW9/WtXBD/vzcf1XKQLJD56Y2
 c6o8vOr5//kr1X4KeszLR1wGbHca3aH+L58DHawKEpxfhhiyIpLRyVLrhnybjGHr7bIe
 xzprTq4y98nK+hCK68Ngrx+LgOEeTHzRQIywVsFFGDjqrzti1hMAaUz8yv1+/M70FkiV
 UyNg==
X-Gm-Message-State: AOAM533jA4UIGOcQw+TWg1V0lXdayG1eyIiGx3EgH1yI7wknZeYGBeg1
 MVZYpDe4qTdJu946+ZytTw==
X-Google-Smtp-Source: ABdhPJxkI3oMGK2yHbgQ8hKosNWiPtlRTLOK9JgTyo4rMSbn5AjGqaFK85cFTVC/CO1SluiGNLCV1A==
X-Received: by 2002:a05:6808:1147:: with SMTP id
 u7mr442549oiu.117.1641868129893; 
 Mon, 10 Jan 2022 18:28:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w1sm1672399oop.23.2022.01.10.18.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 18:28:49 -0800 (PST)
Received: (nullmailer pid 2019363 invoked by uid 1000);
 Tue, 11 Jan 2022 02:28:48 -0000
Date: Mon, 10 Jan 2022 20:28:48 -0600
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Message-ID: <YdzrYNG85uoiY2P7@robh.at.kernel.org>
References: <20220103074427.4233-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103074427.4233-1-j-choudhary@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 peter.ujfalusi@gmail.com
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

On Mon, 03 Jan 2022 13:14:27 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs from txt
> to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells' and 'port' which were missing from the txt file.
> Removes properties 'sram-size-playback' and 'sram-size-capture'
> since they are not used.
> Adds 'dmas' and 'dma-names' in the example which were missing from
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> Changes 'op-modes', 'serial-dir' to optional properties as they are
> not needed if the McASP is used only as GPIO.
> Changes 'tdm-slots' to required property only for I2S operation mode.
> 
> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
> INSTRUMENTS ASoC DRIVERS'
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v5:
> - changes the commit message
> - changes description for 'reg', 'op-mode', 'tx-num-evt',
>   'rx-num-evt' and 'interrupts'
> - adds minimum and maximum for 'tdm-slots'
> - removes default from 'serial-dir'
> - removes maxItems from 'tdm-slots', 'tx-num-evt', 'rx-num-evt' and
>   'auxclk-fs-ratio' as they are of type uint32
> - adds 'tdm-slots' as conditionally required property for I2S mode
>   of operation
> 
> v4:
> - changes the commit message
> - adds type and description to relevant properties
> - changes maxItems for 'serial-dir'
> - removes properties 'sram-size-playback' and 'sram-size-capture'
>   as they are not used
> - removes 'function-gpios'
> - removes 'num-serializer'
> - marks 'tdm-slots', 'op-mode' and 'serial-dir' as optional properties
> - adds the yaml file in MAINTAINERS
> 
> v3:
> - remove maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'ports' and 'num-serializer' as node properties
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 --------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 201 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 202 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
