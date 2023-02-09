Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52C690FE0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:04:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAF0E9C;
	Thu,  9 Feb 2023 19:03:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAF0E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675965879;
	bh=o4c5fbfp4Q6Jtv9fX5/Z9x6JMeIZIIJ4gxAp7xyYoqU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NIIHApJRMyBSx2MOFdFkxvZu+0UbdcYNzM9pEpVUH4ZT7BZghPXMv7QLiPqJpkpKY
	 kFNYsUZC2YdIsY7iJc1wSaunHJPku+8AE0QYcZS8F1DEMmIkGC9j3Cbf7KS/tu9HCf
	 nBBdiIZTSxQ6lv7Y6m8ywwCvzi5gaEx534ZDlDYg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D75F8021D;
	Thu,  9 Feb 2023 19:03:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BC67F8051F; Thu,  9 Feb 2023 19:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCC7BF80529
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC7BF80529
Received: by mail-oi1-f177.google.com with SMTP id bi19so2350993oib.2
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 10:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GWButciOdTQmPQNWu+absQxevMPXBHSKEIz/7eDRTw=;
        b=P/w0IouIV6x3eXftrnKRb/HXeQo50UriOp/gdd35dB+4WGwYx6zQXCafaHcsgVawYx
         1bSn4bsghcdFuHEv2yecdModQsP7whTcdM7VMwNaF3PJz1k/8c9nhDYj2+NyEut9Xi58
         6cxgoCbVM9XIFeQDBd1ygCcKfhtw8gQvqoqmywsMLlaGkxtitreM5caEmrOWB4C9qlxW
         F6hxitGnTEABTng288Zj4tAm+rADJyy271a9jHl0etg2hrq+yYW0d2igBcF+v9CjhaAL
         ogKsd3BbW82/ERWb7HLVnWz/BKr3y+QOAY8s+G2TNOvo3hw7oQc3Af1eve7mCzD7uYsn
         IfLQ==
X-Gm-Message-State: AO0yUKVUB6okUgKv1/kOJGTKoA4SLdPbq1nUTn7kwv64P07EUEK1muIB
	HPnbzGYzr3GSgA1tJlnvkw==
X-Google-Smtp-Source: 
 AK7set/roABBLCKcG2y9Jt/CeACCdwlHN9T2hjBxB2z+Euhp4uhhi4C/KEYPUGCu4QL1LGuhG/wqBQ==
X-Received: by 2002:a05:6808:3c8:b0:378:9d08:5d34 with SMTP id
 o8-20020a05680803c800b003789d085d34mr2756697oie.8.1675965780037;
        Thu, 09 Feb 2023 10:03:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 i126-20020acaea84000000b0037887ca2150sm1115203oih.22.2023.02.09.10.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:02:59 -0800 (PST)
Received: (nullmailer pid 574768 invoked by uid 1000);
	Thu, 09 Feb 2023 18:02:58 -0000
Date: Thu, 9 Feb 2023 12:02:58 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,glink-rpm-edge:
 convert to DT schema
Message-ID: <167596577843.574719.5700574756224769106.robh@kernel.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <20230208101545.45711-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208101545.45711-6-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: IWLBAPZRMHDEHEC3SPG24FEYHNSNXL3B
X-Message-ID-Hash: IWLBAPZRMHDEHEC3SPG24FEYHNSNXL3B
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, alsa-devel@alsa-project.org,
 linux-remoteproc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWLBAPZRMHDEHEC3SPG24FEYHNSNXL3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Feb 2023 11:15:44 +0100, Krzysztof Kozlowski wrote:
> Convert Qualcomm G-Link RPM edge binding to DT schema.  Move it to
> remoteproc as it better suits the purpose - communication channel with
> remote processor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. :: -> :
> 2. Correct qcom,intents type.
> 
> There are no strict dependencies on other patches, but the previous
> "qcom,apcs-kpss-global" should end up in the same cycle (or earlier) as
> this one.
> ---
>  .../remoteproc/qcom,glink-rpm-edge.yaml       | 99 +++++++++++++++++++
>  .../bindings/soc/qcom/qcom,glink.txt          | 94 ------------------
>  2 files changed, 99 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

