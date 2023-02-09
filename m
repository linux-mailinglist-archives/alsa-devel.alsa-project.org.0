Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F3690FDE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4037EE88;
	Thu,  9 Feb 2023 19:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4037EE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675965849;
	bh=gM/FXvqee77LjWHk9Na57up4PkQnHTbTvs1wy2+jLHA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CUH5wH4uHFvlE6taAQowzrTXGi+VRJpErSlW+oW03WA8beDAegnLamQxk/ihw5fpI
	 spZw2AioZNbCMnPpBAKXoWT1v4u2LEztYKODDAqM4cz25WOcGp3p6EAzIVy+ASpMez
	 yZcp4DbsWA1+eGia6JyWkF26AA7GmQzqds5k3L3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BABF804F2;
	Thu,  9 Feb 2023 19:03:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60DDAF804F2; Thu,  9 Feb 2023 19:03:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B506F80269
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B506F80269
Received: by mail-oi1-f169.google.com with SMTP id n132so2326955oih.7
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 10:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA1BMgoBUMPK4Fv3/YkttuqvtmSbXk4QpQvMxXNCVt4=;
        b=mXBPcZssXjY3pouT1N46Llp1B/pfB8EdxlembtZz4OBAGyDpaltsfW1K1X9mouucvD
         vVtPoVy7Q5Ul+7FC/dfMZ1z0qhQD5LAQqfKP9UBloqhq8XDFJdWGkTo2bMTRhwVy3vTT
         oLbLmzkA5eEpZjA7xTddM5nf4Sefnhs5a7wv/WW+p1U7Ne1XuIRCCAxaZW00p1FNJtfn
         yKWKOSIcRHeeVjn/t5zbi7u63VLJmFRb2EIbITJZ8VwtC2dlX4Bwut7r//xu0hZQF9Qx
         Q5wQlOuHMS3aMAADiPhn0E7vt9p6BVEhMzzflhFiQexK3sWebRmdIwd2OUbxJFeMVkOO
         moNA==
X-Gm-Message-State: AO0yUKV214+nQAZYUNdZEcDNVrjrE/z1MtyTmEsHpaleR9p/kYg6PeNe
	CaCYeH207C0Wq9e8mFIc7Q==
X-Google-Smtp-Source: 
 AK7set8/+orLwLC0A2fdfoIW91wVKgjaxIZt554CgMzROCCxAQMHvSVN0rT+gmq8t0cm9l0/2tROrw==
X-Received: by 2002:a05:6808:404a:b0:378:7dbd:6da7 with SMTP id
 cz10-20020a056808404a00b003787dbd6da7mr2354980oib.29.1675965751187;
        Thu, 09 Feb 2023 10:02:31 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 p206-20020aca5bd7000000b0037b364fae4bsm1113691oib.46.2023.02.09.10.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:02:30 -0800 (PST)
Received: (nullmailer pid 574139 invoked by uid 1000);
	Thu, 09 Feb 2023 18:02:29 -0000
Date: Thu, 9 Feb 2023 12:02:29 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: soc: qcom,apr: correct qcom,intents
 type
Message-ID: <167596574944.574100.7128831798483239165.robh@kernel.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <20230208101545.45711-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208101545.45711-5-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: KKWM5WDDBQ4DGYSA6HY2QGBCVRR3DPTM
X-Message-ID-Hash: KKWM5WDDBQ4DGYSA6HY2QGBCVRR3DPTM
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKWM5WDDBQ4DGYSA6HY2QGBCVRR3DPTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Feb 2023 11:15:43 +0100, Krzysztof Kozlowski wrote:
> The qcom,intents property is a list of pairs, thus it should be defined
> as uint32-matrix.
> 
> Fixes: b2d7616e13c4 ("dt-bindings: soc: qcom: apr: add missing properties")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

