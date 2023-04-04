Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641D6D6519
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 16:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C363A1FA;
	Tue,  4 Apr 2023 16:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C363A1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680618081;
	bh=Bo5a12c27m6TAp9L+MxXp6pu2IfZAoVnp6GpkKF1Grg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vbv9KJJM7KmtNIOlBhe7UDv7F0rx7jdkiUCdnog0nTtO9t94g4SVQEvWgrkmrHILw
	 ozikUYylUg2qqY4RR3T1BIqHruUacjTWYaaAAPp7OFFY8hGzjAMCPZZIof3f0kcxu5
	 kgLfHenwDOxIisxG5KIseFDQd6nxI1iP0xNMEJu8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D78F801C0;
	Tue,  4 Apr 2023 16:20:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9FAAF8024C; Tue,  4 Apr 2023 16:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3D4CF80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 16:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3D4CF80171
Received: by mail-oi1-f178.google.com with SMTP id w133so24314720oib.1
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 07:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcAGXMBU45kFzxoxh7X3M9oW7jjf/HL66IWJZzW7mH4=;
        b=QznRAE3beUGovSKZ/3PlA5uu/Jj49QtYR4hYE0xoLfk2bUjUCOGCrln88C2ka0ebLL
         nOavH7nP+z4u5SSyBEHVYLjZ30uLls+ASxFvsxXuometqMkP18cX8NcVdBIISAMP87sN
         weQVZrR/NUsTYtxbvUmvw/KAm/9zXSzYVtY7FjlEx07Olhj/+zPsqNHoT3zHFR52V8m2
         NOgYck1LnSvP9QHv3j9rehBqnC6eg/O00Ty6GRb8iG3Pg+6LbFuXWvV3m6ZjR/B24UTw
         DPzIDIKLHfsPA6vqVmNGwbJS+VSL6pzxGk3KQmu+DRRoDXf+g9Xgclq9usosm2v5lRe0
         u8bw==
X-Gm-Message-State: AAQBX9dg9cPvBYItN3iNO/1/rG3/cirrHQsWl5RDphjdnSLMXzViLYky
	ekvphguPVqHFqhv0Un9sBg==
X-Google-Smtp-Source: 
 AKy350YBYmU5p7k1/dLAQw/GIT1ClDRVqyc+yDM4YQ40tYSJ/eShdEmc8skMGTsngHvEGoknfiFrdA==
X-Received: by 2002:aca:240e:0:b0:386:ee34:afb9 with SMTP id
 n14-20020aca240e000000b00386ee34afb9mr1334132oic.11.1680618018649;
        Tue, 04 Apr 2023 07:20:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 u188-20020a4a57c5000000b00541269a2fcesm3318050ooa.25.2023.04.04.07.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:20:18 -0700 (PDT)
Received: (nullmailer pid 3827562 invoked by uid 1000);
	Tue, 04 Apr 2023 14:20:17 -0000
Date: Tue, 4 Apr 2023 09:20:17 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: soundwire: qcom: add Qualcomm
 Soundwire v2.0.0
Message-ID: <168061801694.3827523.18263616021970369926.robh@kernel.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403132503.62090-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: L6EU2XBH5T5DD3FK4OUWZUWQJRUJW2CW
X-Message-ID-Hash: L6EU2XBH5T5DD3FK4OUWZUWQJRUJW2CW
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org,
 Patrick Lai <quic_plai@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6EU2XBH5T5DD3FK4OUWZUWQJRUJW2CW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 03 Apr 2023 15:24:57 +0200, Krzysztof Kozlowski wrote:
> Add compatible for Qualcomm Soundwire v2.0.0 controller, which comes
> with several differences against v1.7.0 in register layout and more
> ports (thus increase maxItems of each port-related property to 16).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Increase maxItems to 16 for port-related properties.
> ---
>  .../bindings/soundwire/qcom,soundwire.yaml    | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

