Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FAB4C4F92
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2991F14;
	Fri, 25 Feb 2022 21:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2991F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645820541;
	bh=aDZZNxOIyVZZyJ1tcxuj5JFdDx1BCsfQi/D+2GBi7+U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObydQxnS1IHlUlQ6E6+BV166234apnNPvZXOzu7hEp/2xEkk0VInc2aPao1ICSAZ5
	 0xffnIFKSqGVA6vSDjbKykneSxRsno1shxgtg30BHb80G3ghWrZh/0K+ypII5MlV1Y
	 t6VURyGbYm6LbO3kTTIzvrEXs0rl1uONTgNx9e94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06DC5F800B6;
	Fri, 25 Feb 2022 21:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B43F80132; Fri, 25 Feb 2022 21:21:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 542A0F80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 542A0F80118
Received: by mail-oo1-f48.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so7800787oop.13
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 12:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cVQN4rhbQ0VOMwlW4HIOTs15wpfmF5Ue6t6aR8MNAkQ=;
 b=Tr5xvVbIFAwL1Jv6pAmf0x0NL5Vz2mwJjv3uSZYmyTXSuU4sAIfd3qZ5Q1olxYSwKO
 tE4PMtwfMZR2ny7J5ajoMOOPF1NiwCpPZxi/jpSb5BnqMQC6RZfYnYEB2Ke9adKQEtRy
 XPJtGQXiikn9Mo7bj5PWrY6nAE/74jFwITDQVvLq/IieEdWEZTkd1D1+1riFlXuH/2To
 OYowojKzRGgrquWL44zWoVpDbj95aFRcOvODIr2qDmmalpJEn8hIenHJFNEWeeTapP3V
 BbpPhaz4PtVmG8pM0q7YdjwvxLbn4PanQOC7B5zcWaMg8/gpvQoUIVfKxKXzz6rajtSk
 3kKA==
X-Gm-Message-State: AOAM533FmzoDsx9bhJaT3Oz7dVsyPVqYmU9qRAmODsLr5CXQ2PLncs6M
 MnVtsHlPwy0f9pG8DHZheQ==
X-Google-Smtp-Source: ABdhPJx8Y+SLyadWMmRFoYqEtYcO0Fuazi2wPPSrB7KFEXUBA6VreCaYupIKMIMx/c3Yt/sE+8pjYg==
X-Received: by 2002:a05:6870:494e:b0:d1:4708:9247 with SMTP id
 fl14-20020a056870494e00b000d147089247mr2143738oab.160.1645820464751; 
 Fri, 25 Feb 2022 12:21:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l7-20020a9d4c07000000b005afa8981a42sm1578029otf.8.2022.02.25.12.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 12:21:03 -0800 (PST)
Received: (nullmailer pid 1367683 invoked by uid 1000);
 Fri, 25 Feb 2022 20:21:03 -0000
Date: Fri, 25 Feb 2022 14:21:03 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: soundwire: qcom: document optional
 wake irq
Message-ID: <Yhk6L+Z7cOs5z6hr@robh.at.kernel.org>
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
 <20220224133125.6674-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224133125.6674-3-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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

On Thu, Feb 24, 2022 at 01:31:24PM +0000, Srinivas Kandagatla wrote:
> Wake IRQ is optional interrupt that can be wired up on SoundWire controller
> instances like RX path along with MBHC(Multi Button Headset connection).
> Document this in bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> index b93a2b3e029d..bade68f429b0 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -22,7 +22,7 @@ board specific bus parameters.
>  - interrupts:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> -	Definition: should specify the SoundWire Controller IRQ
> +	Definition: should specify the SoundWire Controller and optional wake IRQ

What about 'wakeup-source' property?

>  
>  - clock-names:
>  	Usage: required
> -- 
> 2.21.0
> 
> 
