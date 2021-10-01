Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807C41F56F
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 21:05:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED6C916D0;
	Fri,  1 Oct 2021 21:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED6C916D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633115109;
	bh=guVYK3rh1ggQFkPnlJlpU3CIomUHcOPrMR4dCIdMG2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcDrcaSxQael0EzOWifghiIh8X3i4LqQooa9RLoOzE27127eE1jz+1eIdwd1XJKXw
	 z1DRd7AdSM7uCYDIZFqQIxde0FUJZAvgulkx6O1nzRdzMwqUg16ff2WTaFwn6sE2XG
	 XI8QN0pDi1S1faaO9uciPXtfOR0IWBQHIv1xdNq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0A8F80245;
	Fri,  1 Oct 2021 21:03:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7809FF80245; Fri,  1 Oct 2021 21:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9416F801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 21:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9416F801F7
Received: by mail-oi1-f182.google.com with SMTP id s69so12592461oie.13
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 12:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=AaCeKJcib3FJiV3HX2sgMBrTcdReAxBxq1SITEI+C/0=;
 b=7U88vb6SRby18R3F75NbjshsHIDmG47kaoTns0ldvoHqtcgbdCnZrQzBPI4jY7cdxI
 T7qSQ6m6BEQd7vXJzbjDZ5W54rnTx8SeTF1rG0FU0PwwWabAa+q2d+QL1Iw3lAWUmwPg
 EhXW6UhPB2Gi75pN1BmpofLV73DAKcwujTqtXkBrIx8V4U16GD4ue3QypCxx6EgfJl03
 jHncrRqKIc/DIFkNsiBs+lesbnvHjJS6AKYcWCrvxAuq7vJco/CEQ+08dpGWtbYd1ZIB
 XAqy6/D5IsOAeGXZJ5qk1sI7+7YqusaCO6Hb6x/1NqDJIJmUwUixZ/pjWg84r8WKtJWb
 jgNQ==
X-Gm-Message-State: AOAM532Pk88o4LisYLFezRN474tIGaRc9M1ez51QKRFzh4Knl4860OLe
 kWqxh+1GA4zXEVrhTWxMgQ==
X-Google-Smtp-Source: ABdhPJzXM+LsFeHXSBeISyHVxuZDXoVUYnnKfozOL/f9TaZwO8L5uAzXQWnqiUUWxIbNabeOU0oUhg==
X-Received: by 2002:aca:2319:: with SMTP id e25mr5080076oie.175.1633115019612; 
 Fri, 01 Oct 2021 12:03:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l1sm396946oop.28.2021.10.01.12.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 12:03:39 -0700 (PDT)
Received: (nullmailer pid 4113071 invoked by uid 1000);
 Fri, 01 Oct 2021 19:03:37 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1633087292-1378-7-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
 <1633087292-1378-7-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH 6/8] ASoC: dt-bindings: Add SC7280 sound card bindings
Date: Fri, 01 Oct 2021 14:03:37 -0500
Message-Id: <1633115017.918117.4113070.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org
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

On Fri, 01 Oct 2021 16:51:30 +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: allOf:3:then:properties:interrupt-names:anyOf:2:items: 'anyOf' conditional failed, one must be fixed:
	[{'const': 'lpass-irq-lpaif'}, 'lpass-irq-vaif', 'lpass-irq-rxtxif', 'lpass-irq-hdmi'] is not of type 'object', 'boolean'
	'lpass-irq-vaif' is not of type 'object', 'boolean'
	'lpass-irq-rxtxif' is not of type 'object', 'boolean'
	'lpass-irq-hdmi' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: ignoring, error in schema: allOf: 3: then: properties: interrupt-names: anyOf: 2: items
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml:0:0: /example-0/soc/lpass@62d80000: failed to match any schema with compatible: ['qcom,sc7180-lpass-cpu']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535291

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

