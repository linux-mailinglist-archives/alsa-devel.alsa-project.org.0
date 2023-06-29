Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375874295F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15997F1;
	Thu, 29 Jun 2023 17:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15997F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688052021;
	bh=d4nv6EStYS4tUSpdhUEdzXfvNHEhe1Pek3hfB+S2a9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UsNPEMGnyJj23bbwGP1KroZsCt0AvezimlI10Aq8+TMgTmqLHy6ngM5xwcl18vgg6
	 N2jKbPzB1kzwXTley7DAJE4n9EU26Obbbe99/RxuKjCo9DsNGJrp9KRBGrijd5MqKm
	 AqCb6EFJEmQeOlI7GZyuy8Y9BOvOihwtnv6HBnc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E650F80563; Thu, 29 Jun 2023 17:19:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98308F80544;
	Thu, 29 Jun 2023 17:19:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B067EF80558; Thu, 29 Jun 2023 17:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE8E4F80544
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE8E4F80544
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7837329a00aso33345239f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051958; x=1690643958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nRe+VLQZebwwcwm/RXqyCDIRs/U83v9Vgel4a9NPr8=;
        b=Ml2DTRQ/Rp38mtBxn88yy6qCvIRwe0ZfOSmiF5yW0yZs9wuwAJiL2xO9JxdLMlc6lM
         Z1/QDTrITFftcjf2DPs3jXZH4gFQGsZsiYMNAnPRoPHXN/g7ALo8G7qBCe6PZ5+ccdDB
         JUkfN6t8fLf50ExTM9d1Y/x0AqGqbetCVSicF0QcCVxsYi01WkQcneoL6HrauSxDitb9
         pI40OH351P43LHax1SqQrW3rJFCl+FHasUe4/ZZsONd1hU6NvkqPJsOroZly+ZvtHGBn
         EfQ6DLMeMczU+ZXRIsIZB82XKsxjfVn1WTIKr/JgoP0eDuCY7wiLamgarYc3HvXleV0a
         N5/A==
X-Gm-Message-State: AC+VfDzMmHUNkZcwCDUq4sCENyTe+uUOIU8xokETOwkd8f+NwPalEdMR
	A8hV56MikvBw5GM0l7VYzQ==
X-Google-Smtp-Source: 
 ACHHUZ48KcznqwLkw6z0qAkjZFQO0MzxYQ3ANegEU7QUC+CxcohvQReTpyZ1G+rkUcOgPwM8WbHOAA==
X-Received: by 2002:a6b:d808:0:b0:783:491a:13fe with SMTP id
 y8-20020a6bd808000000b00783491a13femr15716563iob.5.1688051957784;
        Thu, 29 Jun 2023 08:19:17 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a056638168400b0042b05c1b702sm454549jat.12.2023.06.29.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:19:17 -0700 (PDT)
Received: (nullmailer pid 3054549 invoked by uid 1000);
	Thu, 29 Jun 2023 15:19:13 -0000
Date: Thu, 29 Jun 2023 09:19:13 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
	Andy Gross <agross@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zac Crosby <zac@squareup.com>,
	linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
	Robin Murphy <robin.murphy@arm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
	Stephan Gerhold <stephan@gerhold.net>, Andy Gross <andy.gross@linaro.org>,
 iommu@lists.linux.dev,
	James Willcox <jwillcox@squareup.com>, Joseph Gates <jgates@squareup.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Benjamin Li <benl@squareup.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>,
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	Max Chen <mchen@squareup.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Lee Jones <lee@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
 cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jun Nie <jun.nie@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 06/11] dt-bindings: mfd: qcom,spmi-pmic: Reference pm8916
 wcd analog codec schema
Message-ID: <168805195264.3054489.18382502326981278606.robh@kernel.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-6-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-topic-more_bindings-v1-6-6b4b6cd081e5@linaro.org>
Message-ID-Hash: QKRRCDB5GBSMSUBPICDYTUOQDMVNBPPP
X-Message-ID-Hash: QKRRCDB5GBSMSUBPICDYTUOQDMVNBPPP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKRRCDB5GBSMSUBPICDYTUOQDMVNBPPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 27 Jun 2023 18:24:22 +0200, Konrad Dybcio wrote:
> Now that it's been converted to YAML, reference the PM8916 wcd codec
> schema.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

