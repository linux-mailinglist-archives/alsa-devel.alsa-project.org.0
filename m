Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87D69E3D9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 16:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D7F6DF5;
	Tue, 21 Feb 2023 16:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D7F6DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676994334;
	bh=e07fDGI52JL4p1V9HwsXIGpvTb08TfYbjRuTJekwbzc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QLuMBZC/73Kt8rQnOZuHtL3VCPVWbDVtYtoyrOlPxPK3IiRbE8g7e7BdfOcy9Bm4R
	 0HCt9yUxkcC5ujZlfquJcyJOokm1hzMmPSvhPEXFHMa9H5+FVpzWB3PEZmZyuJTnWI
	 q4yc1R5n1AMPGvcmYEH8hd+SCWEbVPt46ft2DZhc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D36F7F8025A;
	Tue, 21 Feb 2023 16:44:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DDA0F802DB; Tue, 21 Feb 2023 16:44:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F80F800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 16:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F80F800B6
Received: by mail-oo1-f50.google.com with SMTP id
 m39-20020a4a952a000000b00524f932a4baso171928ooi.13
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 07:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyjUBDRTJFgSJBaeyt3o+remUUUyICWdxS5ZUjwhQog=;
        b=LoHlfux7Go/kSy+pu7juj6C+FaQJl79/Yjajp6s/Uck3FdYyp7g8y3Veqm5w63JpHG
         g5IziVdhiqyPGPtFa4DNLyzKgBKwdLuguoYVyyN0ifNXFWNWS43ILyfH0w5uhUY13eAF
         4nY1Ql8DfqCpXI36JbEDlLyqEN2ZAm38bKgy+YFCwMCVzI4VcTZycz+0CFMbkX30CVf9
         g9ZNgwl4wn9bJ5xpKZwH1KN3Ff4zvFqvV689jP7Xa/gkJzbLP/Le3G2Xujx91hGzwkJd
         BP5uNiZ8mwF6GIiGuTykEdrtQ9b8fkn+Ci6pgtfVhqhmziMc615wAJQgml3szvgX5oWn
         2kYA==
X-Gm-Message-State: AO0yUKXp9pzuszeoW7MWuHdRpLf7gQlMoGC1k0WZnHBo5QjSpsDF9jVj
	/B7lg9DUtFwYkcG7IoT61A==
X-Google-Smtp-Source: 
 AK7set92GPefE/7yc/iStug370U3UzOpPZfYPp22CZw5Pdx0yRXD7P3iHKgEzUJ1Uo4CYwmzFkIFXw==
X-Received: by 2002:a4a:33c8:0:b0:51a:ac9:775 with SMTP id
 q191-20020a4a33c8000000b0051a0ac90775mr2557229ooq.6.1676994276376;
        Tue, 21 Feb 2023 07:44:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 q185-20020a4a33c2000000b0051a2a5c8ac6sm1303503ooq.36.2023.02.21.07.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:44:36 -0800 (PST)
Received: (nullmailer pid 2591444 invoked by uid 1000);
	Tue, 21 Feb 2023 15:44:35 -0000
Date: Tue, 21 Feb 2023 09:44:35 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: qcom,wcd9335: Convert to dtschema
Message-ID: <167699427490.2591405.11732576378747251832.robh@kernel.org>
References: <20230220095643.64898-1-krzysztof.kozlowski@linaro.org>
 <20230220095643.64898-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220095643.64898-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: N7NIE2ZMW4RHVD4KOGTZYF6MRS4RGG7M
X-Message-ID-Hash: N7NIE2ZMW4RHVD4KOGTZYF6MRS4RGG7M
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Bjorn Andersson <andersson@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7NIE2ZMW4RHVD4KOGTZYF6MRS4RGG7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 20 Feb 2023 10:56:43 +0100, Krzysztof Kozlowski wrote:
> Convert the Qualcomm WCD9335 audio codec binding to DT schema.
> 
> Changes against original binding:
> 1. Drop "mclk2" from clocks as neither Linux driver nor DTS uses it.
> 2. Do not require vdd-micbias-supply as several DTS do not provide it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Few DTS boards have incomplete WCD9335 node causing dtbs_check warnings.
> These are fixed here:
> https://lore.kernel.org/linux-arm-msm/42f7d53b-a922-760a-4be2-7498ea0d560a@linaro.org/T/#t
> ---
>  .../bindings/sound/qcom,wcd9335.txt           | 123 --------------
>  .../bindings/sound/qcom,wcd9335.yaml          | 156 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 123 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9335.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9335.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

