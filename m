Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBD551FC9A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 14:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A9C18C9;
	Mon,  9 May 2022 14:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A9C18C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652098929;
	bh=/x8gFYA9JvH5OMc3bTKKg0za26oE5IvD+NDTv2lDhmc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDafkMHL6xZ2rJktUWu4LqF+DMar5HYHlukth6cMf/SE/YLRxg4xF1Wvnqi67C++7
	 ZXVGzS5kfrODAbLYhZd2OyjIy2JEAU9TArEQsw6ss5byz/3aN3ORdOVfI9iCUH1Zbb
	 ggDP9VzrmYWTDja0kELCFKFQmC1Utu7AQQwtHPnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 802E1F80269;
	Mon,  9 May 2022 14:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70D0DF8025D; Mon,  9 May 2022 14:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22364F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 14:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22364F800D3
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-e5e433d66dso14457600fac.5
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 05:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=A+PMCPJpBabuT56DKMS6KxZZ7tR5sfAfkb9qoZpWbRo=;
 b=d0LhwRC1ZkxKTotPESmjvNYi7Zf6+yCgLT3CM9eQo2gIDG33ZtXXsK0wNcsLBUQq7W
 59JMVnOIX3O2+GnEskHTdAey+E5SGHGUn+/iSqE3Opa5xk3wZgpuyynj/EdfOw/oGvso
 7tam8j3SwK/I4cdUM/fotMGv6zNaKbM803R8V7yOw1g0C2lufNppvpPKQA/oWj67Wk7w
 V7zU3mixbbKnnainvqwvDjW1nz1qyAey2+H0hh8GwV5A+PA8cLj5m8K44L1GFSixIkwv
 Q/Qrkj1rWneLXwEP4kwt0l5VfUZhwazhjpqmY8UwLRh1G9vbBx7MzrIcCvhv4WOzCHlz
 veMA==
X-Gm-Message-State: AOAM531rV2Ev4LvfB40R+N1i8UX9rccH7O525N/JTp2dJmGPfaB+TXMr
 m0/Tz4OY+BYWT9quPjApzw==
X-Google-Smtp-Source: ABdhPJwxnblgd/nHBwFUUtG14T0cNnLWsAa58m6NjD2fTRrptzHgHCtjQpUCWimSpGUcJlZ5vSyOEA==
X-Received: by 2002:a05:6870:524f:b0:ed:824:4238 with SMTP id
 o15-20020a056870524f00b000ed08244238mr6922488oai.113.1652098859945; 
 Mon, 09 May 2022 05:20:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05683033e700b00606a6c09a0csm14805otu.12.2022.05.09.05.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 05:20:59 -0700 (PDT)
Received: (nullmailer pid 3576226 invoked by uid 1000);
 Mon, 09 May 2022 12:20:58 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Kaehn <kaehndan@gmail.com>
In-Reply-To: <20220509032836.1116866-2-kaehndan@gmail.com>
References: <20220509032836.1116866-1-kaehndan@gmail.com>
 <20220509032836.1116866-2-kaehndan@gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: sound: Add generic serial MIDI device
Date: Mon, 09 May 2022 07:20:58 -0500
Message-Id: <1652098858.543235.3576225.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Sun, 08 May 2022 22:28:35 -0500, Daniel Kaehn wrote:
> Adds dt-binding for a Generic MIDI Interface using a serial device.
> 
> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/sound/serial-midi.yaml           | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/serial-midi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/serial-midi.example.dts:20.25-24.11: Warning (unit_address_vs_reg): /example-0/serial@7e201400: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/serial-midi.example.dts:25.25-30.11: Warning (unit_address_vs_reg): /example-0/serial@7e201600: node has a unit name, but no reg or ranges property

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

