Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6748DBC9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 17:30:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068E41FB4;
	Thu, 13 Jan 2022 17:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068E41FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642091453;
	bh=8LNQibxA1uGE4IDe51tUoqRNPZcYmMa2/epZbZcny/w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MTC8hWDKANKYtXJGxmwgy0TJFrkx+aeEMMxMF/+z9CkBYqz26XSMqX3PDqrbwcfMP
	 h3ZZM6ZqLAZ/4KkOouYxc+ibHdzbNTByxZssQ+jrAoA0K12MH8MAEvukTxEEEPDH9Z
	 grvdLTJLuDMPn/T1vvISjTM6CtOnIqTlsMeZ1rps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 611E7F80088;
	Thu, 13 Jan 2022 17:29:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A738BF8013F; Thu, 13 Jan 2022 17:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C437F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 17:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C437F80054
Received: by mail-oi1-f180.google.com with SMTP id s127so8402948oig.2
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 08:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=V3d/hILCp5fIw9k9NOmkPJsjVgyDwsccH/2QdR1VqC4=;
 b=e6J33xrfzPV98VjPjU9cDndsIhXRDFfyB67eNBdvPDd0ldS1FAO0WZ9RYdlNfDiCPh
 C//qqxhfzs0F3GSkiwjb28f36/ABHmbUV07B8gRSyNWwndp3PC4Q2dmmXVUO+lJOvJdo
 NYqqvfBvpK+n0//YMlNxBZ0S99PAPgk0TMQtzJe927TrQcELLdtZ2HvrBEOOY8mffSV4
 U/LiDWUhOxcR0SOc+5NzdyB6EhfPAU8drmIUhGjoVseLKEUEajodmI67oCS0V6UtTRFa
 zUWqwQSqcTGMACYoeH5G/Fip4CYUnqNtoUih1lbG2rqo9Etg0+kc3UPMjhgqcOOtJVjo
 9HEw==
X-Gm-Message-State: AOAM533uW/NU44+M+KKNSQfuvIfxDOVezDwNjYKSW64kGmUH1smxvS2R
 xHa08Kbhb346fAcs80BQBg==
X-Google-Smtp-Source: ABdhPJx+WdBeR9L7ggGsVpRxHTG4QcOu+1F01WaEvxC+JcemfuD0FySeENYbqDCyL9DMiten2OOBLQ==
X-Received: by 2002:a05:6808:1aa7:: with SMTP id
 bm39mr1545727oib.24.1642091375793; 
 Thu, 13 Jan 2022 08:29:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m26sm377867otp.13.2022.01.13.08.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 08:29:35 -0800 (PST)
Received: (nullmailer pid 3647182 invoked by uid 1000);
 Thu, 13 Jan 2022 16:29:34 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Beer <daniel.beer@igorinstitute.com>
In-Reply-To: <2eb938b60d232dfc48fcc53e3c87d1f773b3bf2d.1642063121.git.daniel.beer@igorinstitute.com>
References: <cover.1642063121.git.daniel.beer@igorinstitute.com>
 <2eb938b60d232dfc48fcc53e3c87d1f773b3bf2d.1642063121.git.daniel.beer@igorinstitute.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
Date: Thu, 13 Jan 2022 10:29:34 -0600
Message-Id: <1642091374.227294.3647181.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Liu <andy-liu@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

On Tue, 11 Jan 2022 13:00:09 +1300, Daniel Beer wrote:
> The TAS5805M is a class D speaker amplifier with integrated DSP. The
> example here includes a tested flat configuration for mono (PBTL)
> output.
> 
> Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
> ---
>  .../devicetree/bindings/sound/tas5805m.yaml   | 204 ++++++++++++++++++
>  1 file changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tas5805m.example.dt.yaml: tas5805m@2c: status:0: 'ok' is not one of ['okay', 'disabled', 'reserved']
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1579511

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

