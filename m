Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA5742989
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0211F1;
	Thu, 29 Jun 2023 17:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0211F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688052325;
	bh=eg/F8V0zNW8QOVwLvj4reDBwcXb5+dUKBqKA7oi27kY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n+u2A/vJoGVrKYkVy5PFWqxX3OgC44W2UHk56R/4ltz2EHEivafnE7PKSQFP8TTKI
	 Qt7E2hVSXFbUvFogSFS1VhToLmdWmKS7eGYfuFOcNdJ7nrM7xKWpaKC3KwGLlTgIbf
	 pGPfiZ68FQAGWdJinOZPgG4TL7za9NmxhEyruY8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06B1FF80557; Thu, 29 Jun 2023 17:24:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70834F80246;
	Thu, 29 Jun 2023 17:24:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A340EF80544; Thu, 29 Jun 2023 17:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B0A6F80246
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B0A6F80246
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso33324139f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052246; x=1690644246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqOrbkrApUMBf/IMLW4pZSn/5D8w3VaUXsE+FOQe8nA=;
        b=XhF12SV5fVUyJWdpulUD/UmFQ+bXzeA2xQ3yDgwNrvWE1NHQELAE0TfUg//nfG2vL4
         ZdYuAOKOof8e2BqXDof2Yk4CR2GE7J4W7Hnc4wBcsXqltoYnVmcaUKtiuJ5HYw6D6ZAr
         PhNpdky/mpKgk+GOvG5Q4hAvOJs9ojOGJkQhw2IFz61GY9SfeZw4r8o+H1jO2TO4LrSk
         ZqV42cFD+v+PXA+P0UCKSxT3ezD03cOSi4uUz4N8xDxQdn4Z7VogmGXo/DoEDTh4yyg4
         87O3V8cKXh8HlWUqxXvVjrrICPaYdhAyo+TeK3JG5TJKcvMjuOiiLYMkosQUXVNNC2OT
         ugRA==
X-Gm-Message-State: AC+VfDzDjHiSScUCxvUFEYGHKxBtKEGJBlOcoQUcOYbiLWa+yTzas2C/
	B8oBBD1M+R3lHTiWu7Wnzg==
X-Google-Smtp-Source: 
 ACHHUZ5pbxnXCzp2MEXm/J9Ni9E/P2BCRXI4zVDiAbDqngY6/EOJYBBbjy9gNYs39w0iASDYHMGIww==
X-Received: by 2002:a5e:d908:0:b0:785:ff35:f340 with SMTP id
 n8-20020a5ed908000000b00785ff35f340mr5661463iop.14.1688052246225;
        Thu, 29 Jun 2023 08:24:06 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a02b611000000b0041d73d0a412sm3955608jam.19.2023.06.29.08.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:24:05 -0700 (PDT)
Received: (nullmailer pid 3061241 invoked by uid 1000);
	Thu, 29 Jun 2023 15:24:02 -0000
Date: Thu, 29 Jun 2023 09:24:02 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
	devicetree@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>,
	alsa-devel@alsa-project.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Max Chen <mchen@squareup.com>, Andy Gross <andy.gross@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jun Nie <jun.nie@linaro.org>,
	Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
	Christian Marangi <ansuelsmth@gmail.com>, Joseph Gates <jgates@squareup.com>,
	Shawn Guo <shawn.guo@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>,
	Banajit Goswami <bgoswami@quicinc.com>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
	Peng Fan <peng.fan@nxp.com>, Zac Crosby <zac@squareup.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Leo Yan <leo.yan@linaro.org>,
 Xu Yang <xu.yang_2@nxp.com>,
	iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
	cros-qcom-dts-watchers@chromium.org, Lee Jones <lee@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 09/11] dt-bindings: arm: msm: kpss-acc: Make the optional
 reg truly optional
Message-ID: <168805224161.3061187.9426822881905540470.robh@kernel.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-9-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-topic-more_bindings-v1-9-6b4b6cd081e5@linaro.org>
Message-ID-Hash: ULRBNHKTWVNDJ42IZ3G7ZEDKULSQ2M4J
X-Message-ID-Hash: ULRBNHKTWVNDJ42IZ3G7ZEDKULSQ2M4J
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULRBNHKTWVNDJ42IZ3G7ZEDKULSQ2M4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 27 Jun 2023 18:24:25 +0200, Konrad Dybcio wrote:
> The description of reg[1] says that register is optional. Adjust
> minItems to make it truly optional.
> 
> Fixes: 12f40018b6a9 ("dt-bindings: arm: msm: Convert kpss-acc driver Documentation to yaml")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

