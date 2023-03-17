Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3D6BEE89
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9A0F0C;
	Fri, 17 Mar 2023 17:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9A0F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071123;
	bh=k8AgEc/CfMw1z1+QUZvFi4sk6r1naatlQuvb69QUhoM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uG1l0z7zVs8VvgEyfAP+dZqS1PzRLhK4KY8smd85Cpde3RO6sRENRmATSU47U4Y2L
	 BYBlczD0bDVap0r0tZm7NybIEakuAtisdLnD1rfJWa/X+GadaqGDg6AfYmci/Witqg
	 yYtHI77Lg6KN6ejLRvQkQCOLerd87t7s9VmFR8mU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B1BDF80423;
	Fri, 17 Mar 2023 17:37:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33018F8051B; Fri, 17 Mar 2023 17:37:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73142F800C9
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73142F800C9
Received: by mail-il1-f169.google.com with SMTP id i19so3030502ila.10
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 09:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679071067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Tkw3eaII1y3pgHphXAwlzh2YeiwPP3mszw5UTrgdvY=;
        b=DO7e5W3UzTzRwQnldhftOyx31MsrHRJoXeDmX2AzyyAfAua3gzhyUcMwZqWwx3tzl1
         uYN0L/g2U+3orNJzDdp/6+wiVbIp3UsXDFU5BXS+r9+w3d/zvE3qnTGdgUHxBDMXsTko
         lGurUIO+jAd3K+c6ymLf+7fLGSVKWLBHc2eVmU8/qqqSHvLZ7+qn8ft8rNPz5H7j0u2u
         wq4vyJWcNttlLJYLPwr51HJmGKX2LyrpmW10it+E9g7QOh4BuJOALyAZn+8J9ytirOfW
         sbRV9MD+aA4geT3v/LSvR6WRubYbPeUQ48CFr/9BYz80AbIhThuinGims0YsAvy36pk7
         LgZw==
X-Gm-Message-State: AO0yUKWK4JQj+yjhO40MIEdrV1386NPLfzEu7qBv0XFalt4hBhyKnAwe
	nhcfm8xdVarIUvm9L+aQYQ==
X-Google-Smtp-Source: 
 AK7set+ImpsTlNG013ORftCG4IbkX7jpPoBLc9bfDARkDdM2Om2CplQwBGBj55LNnI5HAJNdL5D3Zg==
X-Received: by 2002:a92:6909:0:b0:323:d3ab:8f3c with SMTP id
 e9-20020a926909000000b00323d3ab8f3cmr27476ilc.17.1679071066833;
        Fri, 17 Mar 2023 09:37:46 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id
 r3-20020a02aa03000000b004061d3cce02sm838838jam.67.2023.03.17.09.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:37:46 -0700 (PDT)
Received: (nullmailer pid 2439494 invoked by uid 1000);
	Fri, 17 Mar 2023 16:37:45 -0000
Date: Fri, 17 Mar 2023 11:37:45 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/9] ASoC: dt-bindings: qcom,lpass-tx-macro: narrow
 clocks per variants
Message-ID: <167907106400.2439419.6123316767501705730.robh@kernel.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
 <20230313075445.17160-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313075445.17160-4-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: IK6XXRH6JDJ76TCJOUPLTCF4DS6LHQC2
X-Message-ID-Hash: IK6XXRH6JDJ76TCJOUPLTCF4DS6LHQC2
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IK6XXRH6JDJ76TCJOUPLTCF4DS6LHQC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 13 Mar 2023 08:54:40 +0100, Krzysztof Kozlowski wrote:
> Currently the Qualcomm TX macro codec binding allows two different clock
> setups - with (for ADSP) and without macro/dcodec entries (for ADSP
> bypassed).  With more devices coming soon, this will keep growing, thus
> rework the clocks/clock-names to be specific for each binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   | 63 ++++++++++++++-----
>  1 file changed, 46 insertions(+), 17 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

