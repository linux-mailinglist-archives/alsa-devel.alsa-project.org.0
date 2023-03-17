Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8B6BEE98
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB188F08;
	Fri, 17 Mar 2023 17:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB188F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071281;
	bh=2v5KGCsSgyMRHT6gNorCH55vojy/Wzdb3f7Rs7XmD3o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXRrc8sx2zVdrfzVnrMDDJ4e+e/ufXqtyavPSeioyHqM/dPzf4sYT8VYK81FMQUGm
	 hUT+CwtbMfauUCe4Riz0FgDkd/7JM9j7tf9cTzyhH5tBDZ+n4QtmdXLFsFjoFzSRYU
	 GZBP4BpmUeLo7PXDk23DyB0rxyLXWyShIvC2jPHg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DF38F80482;
	Fri, 17 Mar 2023 17:40:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C49E3F804B1; Fri, 17 Mar 2023 17:40:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50740F80425
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50740F80425
Received: by mail-il1-f180.google.com with SMTP id r4so3051122ila.2
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 09:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679071209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v33jTujTH/OFC+DJVoBM0tNLHgECUl0wsEd9HZhpYyc=;
        b=tjaMtW6bPmI4pMrjG3hQ66jz/KE9a8KOI6MtLMSj5rO75pYDhLgtV3McBGnWmCbseK
         zgnRw2bVIbJ7NPHEdVIUmw7doHN4ScVQ+Hj53tvBT/5qfC4miV/MbQw6YsRUgZ/yULIg
         RbgDx5y1XbuHamrR5q2NYDEfiWEjANZq+Vpj8Yu29RrpE9uEbSoDJNZ8gNHDwdEFZlPO
         H5iAUUrZHtU9ku+CZzrhzOW76nupwg1mN32Vkv/0R0Gg0xci63ZuxstKqB9VctIvjNva
         RWqHDVnTHPFRDIgKXpAuzEm+o3sYr5V4RpGNHdCEf9aL1G6wqd8xQKOTLTtn5GZFGex3
         5hig==
X-Gm-Message-State: AO0yUKWI/Vj4h8Wg/8AnVJSkjOySfF4xNXwm1L5IIEbI+JkowVe4gmE4
	p9GGW2t5gY7Ik874GNA8hg==
X-Google-Smtp-Source: 
 AK7set95yeMjd43ZHB4zet+gvJIkbO0gPEKt9Jexe55AqlrQLHHNTXz4/AEJcZr+bcE0kI7TXg9mgw==
X-Received: by 2002:a05:6e02:4c7:b0:315:498b:415a with SMTP id
 f7-20020a056e0204c700b00315498b415amr31499ils.18.1679071209632;
        Fri, 17 Mar 2023 09:40:09 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id
 r23-20020a02b117000000b00406328003a4sm815346jah.65.2023.03.17.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:40:09 -0700 (PDT)
Received: (nullmailer pid 2442436 invoked by uid 1000);
	Fri, 17 Mar 2023 16:40:07 -0000
Date: Fri, 17 Mar 2023 11:40:07 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 7/9] ASoC: dt-bindings: qcom,lpass-va-macro: Add
 SM8550 VA macro
Message-ID: <167907118259.2441907.2410899318611218643.robh@kernel.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
 <20230313075445.17160-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313075445.17160-7-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: O3UBL2SGRPSHVSHYISUQBVQLFK6H4WT2
X-Message-ID-Hash: O3UBL2SGRPSHVSHYISUQBVQLFK6H4WT2
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <andersson@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3UBL2SGRPSHVSHYISUQBVQLFK6H4WT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 13 Mar 2023 08:54:43 +0100, Krzysztof Kozlowski wrote:
> Add the VA macro codec on Qualcomm SM8550, which comes without NPL clock
> exposed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on:
> https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

