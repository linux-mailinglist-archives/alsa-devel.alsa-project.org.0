Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D58FB742958
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 793AA7F8;
	Thu, 29 Jun 2023 17:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 793AA7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688051993;
	bh=4yoZ/7GmuIjy0nueNl/1RmoY9HaOaSYbIdVn8hD2dS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t6AQfM/UDwHOvWQ0CI527JHhai2SqzTldWQN+yrdjBLcZ4tF4+OQcH8hxTDQdEWiu
	 715H0IEUPtmi1f3nQN85HPGoF1Ng3tAoP7N8vlPRUz/9YPZ8OxMX7afDt63RMwFibN
	 L1E29CogG+DGzq0SnMFzwT5Cja40b1fkiEJTKSEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C7EAF80431; Thu, 29 Jun 2023 17:19:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C09F80212;
	Thu, 29 Jun 2023 17:19:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0CC9F80246; Thu, 29 Jun 2023 17:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01955F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01955F80169
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7835e5fa459so32553439f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051932; x=1690643932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2F5panrQ9N51YbtKXEYqm4xFh86mMaEOlU/moUG6+Y=;
        b=HKC0D20ab34A+Fg4Tfj3eTNLZynKC1UmEzKrS3uFPWIN829hK8zKEZ3x6wcz+AWFcm
         rtiIkGoQ/pRclkluWFcYz9WlG5fzZbynVdxhWOldDeqhw4zpxWIpzMxPmiGmUxOmK1E7
         Yxlp0/V5BYAvvfa2nGUqIjtZDxPsRrqIy27+SyKUge/iXlsWBaocfjW+EcGgcUDUkH6h
         AVE1Yvj9AFcWSNy6Qnsc5Ew0NfrmG2MTpEcPynpReUcmEjztumYZe65ae4ye8PkAeE6w
         zOGY+zdupUKkVtNJmS+R+yUYJVO1HC6FkMmEwaFFyyn3aNCPEcXZ6rzL5UvjUpOaQUvU
         E+PQ==
X-Gm-Message-State: AC+VfDzYqgfmaZ+5cFkgaB+uxAXt/DP+T7dGop/laYjya2O35fppf/YR
	eD8aWwCSxSfdBF3RZ6Cj3Q==
X-Google-Smtp-Source: 
 ACHHUZ6s9Jdl5RFEqCdgdp0bwGY7cGwuE+P2Z34gk2rOEic26k/FpRgytM547mDniAnRHCO5gYxGXA==
X-Received: by 2002:a6b:d912:0:b0:786:2c7d:dd19 with SMTP id
 r18-20020a6bd912000000b007862c7ddd19mr3191265ioc.17.1688051932111;
        Thu, 29 Jun 2023 08:18:52 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a5d9ed6000000b0077e3566a801sm4430658ioe.29.2023.06.29.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:18:51 -0700 (PDT)
Received: (nullmailer pid 3053897 invoked by uid 1000);
	Thu, 29 Jun 2023 15:18:48 -0000
Date: Thu, 29 Jun 2023 09:18:48 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, iommu@lists.linux.dev,
	Konrad Dybcio <konradybcio@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, Zac Crosby <zac@squareup.com>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Shawn Guo <shawn.guo@linaro.org>, Joerg Roedel <joro@8bytes.org>,
	Andy Gross <andy.gross@linaro.org>, Jun Nie <jun.nie@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
	Leo Yan <leo.yan@linaro.org>, Lee Jones <lee@kernel.org>,
 Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, alsa-devel@alsa-project.org,
	Stephan Gerhold <stephan@gerhold.net>, linux-usb@vger.kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Max Chen <mchen@squareup.com>,
	Benjamin Li <benl@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
 James Willcox <jwillcox@squareup.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xu Yang <xu.yang_2@nxp.com>,
	Joseph Gates <jgates@squareup.com>, Mark Brown <broonie@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 05/11] dt-bindings: sound: Convert
 pm8916-wcd-analog-codec to YAML
Message-ID: <168805192771.3053849.17023496929175540009.robh@kernel.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-5-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-topic-more_bindings-v1-5-6b4b6cd081e5@linaro.org>
Message-ID-Hash: XFAKPYFDOPFWLUAMNKEBJLHWJ7WNACW5
X-Message-ID-Hash: XFAKPYFDOPFWLUAMNKEBJLHWJ7WNACW5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFAKPYFDOPFWLUAMNKEBJLHWJ7WNACW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 27 Jun 2023 18:24:21 +0200, Konrad Dybcio wrote:
> Convert the PM8916 analog WCD codec bindings to YAML.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/sound/qcom,msm8916-wcd-analog.txt     | 101 -------------
>  .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 160 +++++++++++++++++++++
>  2 files changed, 160 insertions(+), 101 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

