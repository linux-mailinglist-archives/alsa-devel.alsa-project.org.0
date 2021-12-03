Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2074680A9
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 00:36:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F5424FA;
	Sat,  4 Dec 2021 00:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F5424FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638574595;
	bh=PLoQMOm6inWoo1CdsvnwlAXia9j1STizbX16hFgYOBc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gb8aiHTZQ+gTqY2JPXodp1IKVuj7ravymQ63Z2y7ish1XTSDFl+8dvhIc7C30fV2C
	 qBtbJms/UoGmop32Qa7dXhXxMehznR7dMtsDCIyi/jMCqoxpmZPgGH8M6YYgJ/724k
	 qw8nNYTbQtEh5CMglXHe4j7eN9Fn5coZ1G2JPly0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A462BF80085;
	Sat,  4 Dec 2021 00:34:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5AE6F804AA; Sat,  4 Dec 2021 00:34:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8572BF800A7
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8572BF800A7
Received: by mail-oi1-f174.google.com with SMTP id t23so8844610oiw.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=slc3RtjWJ70IyFjnYg6xCGKvBvcnCTAMFh09lWbkjek=;
 b=irMFCmrKm7o0t9qCDdUhzi2CqbSzlz1KrYuFtmE+sAS+/Ts2aXYXqQ8I4DIpuOeetj
 UOItaKzbgEWVzXnqpqyu2FUYmFiMt+iacrWlpRYiJc47JX3ZYEs74FxxY4K+tg9eBAzk
 WjwmABMkUrymQeCcdWZN5UBsomFlbPLZrUoFlXtbn6xTHKvM3/3fxESF8Wx2S06k1szT
 OVPZpH/emgl584nz3A6gyYBgIdzNlXabBmwZhn2WZRIqz9kukSltjm9FhHy6DEyz5E08
 Hxn3/69EmpSjOmx7E3XeNGSG7JLt215U8PdAKGUhebAaWJy7y0/+E5er95EiR3G6oTGI
 jXdw==
X-Gm-Message-State: AOAM530uQkmX2UE/C3RoWOuZktkT57dQ1Ft9ymg1XglQfmyr0pwuokYM
 fmBsJfVesOu/DrmLbry2aw==
X-Google-Smtp-Source: ABdhPJyBqKs2RECYaJ9RF6QpjpusBKfo+tfpB2ONa7QgO/1CXxO3kC9NItNo8IWqQhVntJqv6sGJxg==
X-Received: by 2002:aca:180c:: with SMTP id h12mr12700584oih.138.1638574465907; 
 Fri, 03 Dec 2021 15:34:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e16sm869290ook.38.2021.12.03.15.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:34:25 -0800 (PST)
Received: (nullmailer pid 1043009 invoked by uid 1000);
 Fri, 03 Dec 2021 23:34:15 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
In-Reply-To: <1638551345-24979-2-git-send-email-srivasam@codeaurora.com>
References: <1638551345-24979-1-git-send-email-srivasam@codeaurora.com>
 <1638551345-24979-2-git-send-email-srivasam@codeaurora.com>
Subject: Re: [PATCH v8 1/3] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Fri, 03 Dec 2021 17:34:15 -0600
Message-Id: <1638574455.258949.1043008.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, robh+dt@kernel.org, swboyd@chromium.org, agross@kernel.org,
 rohitkr@codeaurora.org, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

On Fri, 03 Dec 2021 22:39:03 +0530, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 171 +++++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@0: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@1: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@2: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@3: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml: sound: dai-link@5: 'sound-dai' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1563335

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

