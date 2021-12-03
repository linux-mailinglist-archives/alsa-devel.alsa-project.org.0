Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474134680AB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 00:37:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41F42551;
	Sat,  4 Dec 2021 00:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41F42551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638574641;
	bh=0dHj4n5AvvSs6deeTAdsmALBRYJT3t7ILevipSepM7E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VW5m903by2CBZD/ok5eVhI7MEcSa0Tcmn9uFwxFqmpz235L9K57uvWFWmVlixyy0e
	 MPf3n/OjtXmCy/eS6zpISufEGCghy83U3EcJiq9PW58fXZBY/nTXlWAOszH7JEGlKG
	 0au3nzKbSZxjAVzjZEi7eRZ8eheyvN+041gC/9ng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41AAEF800A7;
	Sat,  4 Dec 2021 00:34:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA3C7F80506; Sat,  4 Dec 2021 00:34:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC8EF800A7
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC8EF800A7
Received: by mail-oi1-f172.google.com with SMTP id bf8so8817813oib.6
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eoZz1/dE2uVxxnzNEe6cyt2XRJa+hiTl6N5jptXjP3M=;
 b=fkIA+9sp3nRqMp6I3mZdk2zrGd8azkFNyM7Htf8pPouuvp6Jp57fBecIpQtWQeJ5op
 iiDbNnIdCh8KY684uvjRtEf97KhXVKnYBzSNkjoDDqpayLKfidDDBN6kk036tBy5uqfm
 Ujy3kCraff4tyfIfnZ3ouwWgZdidmzjW4fRVhV0LzdMJgbez3CrDtcT8sGyuOYmiUuwb
 Bp0SRpQFofEmqhU6kteQKh49iMzk2UjjGBO1wBHTKB0zMVL+zrQU1LOBmNM/1Ybyo1Bs
 dw0yp7Ime/IahgD4i8PIcXDGDL7wy99cAAJjnRpOXh4pvZ3d2hKm3TT6mdlA3O/X9nGQ
 L6Pg==
X-Gm-Message-State: AOAM531mj2sGel3a11m09J5GHgq+zcb9wJlO6qrKwXfg+tVTVbfypZq1
 WJdqx/6J3AxvCMRzksttEA==
X-Google-Smtp-Source: ABdhPJwDbeAXVAQZ2vLphcIxOo4mkEU5tjYPEpZZO3smEEfXMEv5SE51yep6JOTtmec1IaaZujuNXA==
X-Received: by 2002:a05:6808:23cb:: with SMTP id
 bq11mr12281951oib.2.1638574471549; 
 Fri, 03 Dec 2021 15:34:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k16sm877919otp.21.2021.12.03.15.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:34:31 -0800 (PST)
Received: (nullmailer pid 1043015 invoked by uid 1000);
 Fri, 03 Dec 2021 23:34:15 -0000
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20211203120243.24173-1-j-choudhary@ti.com>
References: <20211203120243.24173-1-j-choudhary@ti.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Date: Fri, 03 Dec 2021 17:34:15 -0600
Message-Id: <1638574455.292522.1043014.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, peter.ujfalusi@gmail.com
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

On Fri, 03 Dec 2021 17:32:43 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs from txt
> to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells' and 'port' which were missing from txt file.
> Removes properties 'sram-size-playback' and 'sram-size-capture'
> since they are not used.
> Adds 'dmas' and 'dma-names' in the example which were missing from
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> Changes 'op-mode', 'serial-dir' and 'tdm-slots' to optional properties
> as they are not needed if the McASP is used only as GPIO.
> 
> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
> INSTRUMENTS ASoC DRIVERS'
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v4:
> - changes the commit message
> - adds type and description to relevant properties
> - changes maxItems for 'serial-dir'
> - removes properties 'sram-size-playback' and 'sram-size-capture'
>   as they are not used
> - removes 'function-gpios'
> - removes 'num-serializer'
> - marks 'tdm-slots', 'serial-dir' and 'op-mode' as optional properties
> - adds the yaml file in MAINTAINERS
> 
> v3:
> - removes maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'ports' and 'num-serializer' as node properties
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 --------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 185 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 186 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1563206


mcasp@0: 'num-serializer' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-cm-t335.dt.yaml
	arch/arm/boot/dts/am335x-sbc-t335.dt.yaml

mcasp@0: 'rt-num-evt' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-wega-rdk.dt.yaml

