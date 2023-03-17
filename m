Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F66BEE94
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:40:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59AB8F01;
	Fri, 17 Mar 2023 17:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59AB8F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071230;
	bh=sCy2GeMZ6Ei+z2mMQDrkrhgUZq4eAI/Ar0GwMAyReaw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vw6SQ2Pon0cY1ZsVtemTC4q+Sg6sDnc1QkAC5R/4Oj7ZZKkng2aDqhZUPnCmQnPur
	 M9oa6iFEA4nTcuY+nJomUPuauxH5hXaY9sBrcGcrex5Bg60ZmciJBgAVkqiksPV1vL
	 EeyRgAifqHXoJDlR2POCtkUFwcJJyt3BexVvlcTY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4FBF80272;
	Fri, 17 Mar 2023 17:39:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C24DF8032D; Fri, 17 Mar 2023 17:39:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31738F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:39:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31738F80093
Received: by mail-il1-f174.google.com with SMTP id a13so3035353ilr.9
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 09:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679071168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rQ9+73jAySThgRPKY/ryRE52NlmKjzcQhegQNs/GA8=;
        b=LrYGMAE1WLhs+bno84BxX89I2werHzRU2YudRRn+ee184J/ogB2Q3G6/spjQWGemWq
         96Ma7z+2LfMvGkpZeodhpsA9CbvjsWVHoSOVdmGhZ+OGbJ8k1DRRhG4mJaYNtkGqHrsj
         wfifjhPbA531gBKPfokMstVWKvol+Rdm+0Zkp16YPORMjvMi7tH22vuicOt0jYDLncGD
         qPG8+H2jdhgLr1mrxqi5ycWIIrAo3K5Xt4Hs8lsoJc+ffFgvqQLhUOHh8O5UQpzZD8zx
         bzWrBnTIamjsuzQfOOpaMhH8Mami/3wve/njlfhFUsuHSXcOWrH6nLo4kGj1DKS5E41+
         /n0g==
X-Gm-Message-State: AO0yUKWY3xbM37YxKrhpOJPM7WTTRZktHOZdE4XKTcg6MPgcFIgI13pb
	kj7OZRlcdC7ku2mlNczEZ4nXuF8oEQ==
X-Google-Smtp-Source: 
 AK7set8tqb3CenL36/9i8/AcgfphQMdCeKnYV5PWRNq2NDqSod0zyh8pu4zKWA8sbkkpDnYFYB0EwQ==
X-Received: by 2002:a92:ce46:0:b0:317:9c05:e8e8 with SMTP id
 a6-20020a92ce46000000b003179c05e8e8mr52337ilr.10.1679071168365;
        Fri, 17 Mar 2023 09:39:28 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id
 t16-20020a02b190000000b003acfdc75a53sm825242jah.48.2023.03.17.09.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 09:39:28 -0700 (PDT)
Received: (nullmailer pid 2441539 invoked by uid 1000);
	Fri, 17 Mar 2023 16:39:26 -0000
Date: Fri, 17 Mar 2023 11:39:26 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/9] ASoC: dt-bindings: qcom,lpass-tx-macro: Add
 SM8550 TX macro
Message-ID: <167907116579.2441463.2409932591661486938.robh@kernel.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
 <20230313075445.17160-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313075445.17160-5-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: PQCLDKWNPG3ENCZW53VSORXEI3QMTQMP
X-Message-ID-Hash: PQCLDKWNPG3ENCZW53VSORXEI3QMTQMP
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQCLDKWNPG3ENCZW53VSORXEI3QMTQMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 13 Mar 2023 08:54:41 +0100, Krzysztof Kozlowski wrote:
> Add the TX macro codec on Qualcomm SM8550, which comes without NPL clock
> exposed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-tx-macro.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

