Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5666E6F2
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 20:28:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867CC6D00;
	Tue, 17 Jan 2023 20:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867CC6D00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673983710;
	bh=p5DW/XjfgL3g6Jk4j/iR9BOD62DWkaVXgbeDZJq2kNM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uAqfiBXmZ+NP2YVv6yEdUSfJiqI1Ih5mXPoFqXQEQLn6G3UWc6ce+Bbl94Nb2qRmg
	 st3r1x7zBYMWLn2rF1/t6ShtLlJnRQCGeJofVuML8kcNHMtD+dMgQIEvWKBLLvOfjU
	 Szk5JEDMkn85/hLWeGI28S2zqMvymax0gCW99J50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 428AEF80083;
	Tue, 17 Jan 2023 20:27:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14B9DF8047B; Tue, 17 Jan 2023 20:27:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96AADF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 20:27:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96AADF80083
Received: by mail-ot1-f46.google.com with SMTP id
 t7-20020a05683014c700b006864760b1caso1723453otq.0
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 11:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BTquYHamd8yY9RObnEinrCsM0HQYTFZPUAO2Z2hiGw=;
 b=u2dH9WyOMZvavlQwoEVhDzcm55MhxXF4+kl3mYdSw5L5G9Pgy1z2Mip2bxPxCAhtBz
 Q+/01oTMHju80eMHAjwW+Eo0+kDU8kxqdL1Daun/d4cd+E+jV7DM+1S7eBysuRF6lO9R
 lr7Tb4iIILAoAFOHatKAC5TP/9q2rWfAQL958mbHiFKzeas8Dc0JkRD2tfRQVkPNGS+C
 dDUUyI/LV2P/qBdMrWZoyLEx0LtPPrK5QYHR8u7UiqOwlnihV6QYt5JDNv8nVkiya4q2
 JnEtwLCjHJFpqTv+O62VrflphrQ5r7qE+VZWVhFWI+b4NvXKcRl3Zvx/ChH6MoEgkFVI
 1CFA==
X-Gm-Message-State: AFqh2kq6BH18tfKUtzpdTvJzieKRSAK21nzi1MzqJhGDxZ3gQoK5fkAG
 IqlAQHIlRYWzP5ZFsezATmdH/oWF6g==
X-Google-Smtp-Source: AMrXdXup/GjCMKAAMwBR12RckeeuXA6GYe+ILgLNJSKyingY0Wtc71tweIPPGZAZ93TxKYSeH0rjMg==
X-Received: by 2002:a05:6830:150a:b0:670:69ac:bb49 with SMTP id
 k10-20020a056830150a00b0067069acbb49mr2069239otp.15.1673983645371; 
 Tue, 17 Jan 2023 11:27:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e4-20020a9d63c4000000b006864a3b00a8sm1310485otl.4.2023.01.17.11.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 11:27:25 -0800 (PST)
Received: (nullmailer pid 3496235 invoked by uid 1000);
 Tue, 17 Jan 2023 19:27:24 -0000
Date: Tue, 17 Jan 2023 13:27:24 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: qcom,wcd934x: Describe slim-ifc-dev
Message-ID: <20230117192724.GA3489389-robh@kernel.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
 <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023 at 05:22:13PM +0100, Krzysztof Kozlowski wrote:
> The "slim-ifc-dev" property should not be just "true", because it allows
> any type.

Yes, but it is common, so it should be in a common schema. Though 
there's only one other binding using it (wcd9335.txt).

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> index 184e8ccbdd13..39b27126cfc1 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
> @@ -28,7 +28,9 @@ properties:
>      description: GPIO spec for reset line to use
>      maxItems: 1
>  
> -  slim-ifc-dev: true
> +  slim-ifc-dev:
> +    description: IFC device interface
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    clocks:
>      maxItems: 1
> -- 
> 2.34.1
> 
