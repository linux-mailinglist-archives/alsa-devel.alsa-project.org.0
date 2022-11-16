Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724362C17F
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:56:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93446168F;
	Wed, 16 Nov 2022 15:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93446168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668610577;
	bh=Jb3DWkNS2A3pat/x/AMAEfnq/JA7NCNQR24oVFgtVEk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WPfZGlJ9Qq/6Mlu4mFhyWSnO3KPINopsNAXtgLdeIzWJsBayCUh721NTr3n4sIKxZ
	 4sJDLx7BOoo90BR791KKK2Uj1dJhBu7EYs3Fl0Ipzc1hTN7wYo+M/oeUk7Z8CEj65R
	 8javs9H18jx4PsXSrMoICY4ph/FQb9Nuljf5et1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29EC1F800B5;
	Wed, 16 Nov 2022 15:55:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4376F80169; Wed, 16 Nov 2022 15:55:20 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id E5BD2F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BD2F800B8
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso20391099fac.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8zAenYPukXRa6WH1FuI7zU9MyK95VuVbiFaqQ0TR08s=;
 b=Eg3AkyeTMEZOqgMmq6hdOoqSZcZfPm/II/2mZBr4m1FBeCIkm6GPtk0G2PNQg4oXoe
 QmlLeZ4rQSCFRT5/JRQyxoBVXkYACb9wgJFZd0ujffLYhT18fxpQGBrSz25rIimlaNaX
 M3TAsWsbwUpgB+zuM3tn2QBWmHzfjA2y5ghrP9cGzTKfqTsuPndmxScaB00PQX5b3hjV
 ywdO/+C3BSohivvceLpH8UJzKMamTeKrQKk5Q/idmRuAu5Re2grUR9ZSLCcmNU1AvgqK
 GQluC3i7/CjO9Wk5Mq5YW9ztbi75PR6UDu2ZcQqxzvkaJvQ+vi0mN9PMfTgvyoivTaXl
 GLMQ==
X-Gm-Message-State: ANoB5pl4b6xpg6oHgFGDfnD9zfCZlUbnlMKT+tIWPux2Sm12FPC2GF6d
 YVajgvNRq31ZIQlzutxnJg==
X-Google-Smtp-Source: AA0mqf7escxT2CNeYstvMXHT5yuoqZ3X8aVm6oVk8h7yhvc/q0jTKxEFAhHiMSNzAvSsDAliZPgxew==
X-Received: by 2002:a05:6870:e412:b0:13c:d709:204 with SMTP id
 n18-20020a056870e41200b0013cd7090204mr1829034oag.125.1668610512903; 
 Wed, 16 Nov 2022 06:55:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t26-20020a9d749a000000b0066c44b4f2d6sm6763094otk.43.2022.11.16.06.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:55:12 -0800 (PST)
Received: (nullmailer pid 3836759 invoked by uid 1000);
 Wed, 16 Nov 2022 14:55:14 -0000
Date: Wed, 16 Nov 2022 08:55:14 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 08/11] ASoC: dt-bindings: qcom,q6prm: Split to
 separate schema
Message-ID: <166861051295.3836684.17078819887827826854.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-9-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Andy Gross <agross@kernel.org>, quic_plai@quicinc.com,
 quic_srivasam@quicinc.com
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


On Tue, 15 Nov 2022 13:02:32 +0100, Krzysztof Kozlowski wrote:
> The APR/GPR bindings with services got complicated so move out the Q6PRM
> service to its own binding.  Previously the compatible was documented in
> qcom,apr.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: quic_srivasam@quicinc.com
> Cc: quic_plai@quicinc.com
> ---
>  .../devicetree/bindings/sound/qcom,q6prm.yaml | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
