Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88139742961
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10B484D;
	Thu, 29 Jun 2023 17:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10B484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688052049;
	bh=JuJvJZEmrIcA4Q2VrtaVatFpahLNGayBnjsL97N8xCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SgS5zNriaj8r7UuN+xXmwyeW7jwPBbrMOF1nlDMddVlmjNHJ0eS1UA5ORAU98nt0s
	 hYsUe4V0CEknQgcmu9/wiXkyvDbAZ1CaardZHvrcBCilOAk3bkiQTI2/gqalrHjc2J
	 38TDGr62/2D+9Dha7zqwH07nASVUPUOvYuZaX7M8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0679F80212; Thu, 29 Jun 2023 17:19:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48BB5F80212;
	Thu, 29 Jun 2023 17:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2521AF80246; Thu, 29 Jun 2023 17:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BAB1F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAB1F80169
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7837329a00aso33373939f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688051991; x=1690643991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blNjDhPR65WgulG05Ac/jsdyPBHD4bO3KAhnWSq5dEY=;
        b=l/5T0uJKcGJviRzMH2RUxsO/kNi90cPhy/u7BvercRWE38VBY4N78HsYs3KlQQphBT
         pKcUZ0yWx2OKSj5CRZVzWVuJrrfsXE5EZgrBesFr4fc5q8vfgdcG+d7yg9B0yxCWK/z1
         Q/TttUbyC1tjXfhEt2nYyMluFtYbqbGtcmYrez8ZNGKEcZVoVDiVqYGey6NlDIDPXPcW
         ACP1zsPSaP3E5j+BnTc2VCHIP5ZegK70a+9lBFzz15qfkQGRDL8/HzTPZJgXrQBtGEaX
         J+LxqvWWULcVzoS7rjwT5DIYFOQw4o+hefa+56bCfRAhcodw9sxphbxqY7hC2V6G4/st
         3Jnw==
X-Gm-Message-State: AC+VfDxXrt3cZe4xDLy5r05JcIfJcmJx1DfHvDoPnq1cNSyzeM5vuF6j
	gdmEAVqyNsQFYOpwfdQ2yw==
X-Google-Smtp-Source: 
 ACHHUZ59kmFHq1B7LvOcwOCer+K8x3ClmeCwbxyRPdlMfA5CYMemTP6T11UDwDiVATlIKwta/nogpQ==
X-Received: by 2002:a6b:d808:0:b0:783:491a:13fe with SMTP id
 y8-20020a6bd808000000b00783491a13femr15718132iob.5.1688051991594;
        Thu, 29 Jun 2023 08:19:51 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a02cf38000000b0040908cbbc5asm3892004jar.68.2023.06.29.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:19:50 -0700 (PDT)
Received: (nullmailer pid 3055405 invoked by uid 1000);
	Thu, 29 Jun 2023 15:19:47 -0000
Date: Thu, 29 Jun 2023 09:19:47 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Joseph Gates <jgates@squareup.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 James Willcox <jwillcox@squareup.com>,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>,
 alsa-devel@alsa-project.org,
	Conor Dooley <conor+dt@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
 iommu@lists.linux.dev,
	Stephan Gerhold <stephan@gerhold.net>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Lee Jones <lee@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
	Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawn.guo@linaro.org>,
 Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
	Benjamin Li <benl@squareup.com>, Max Chen <mchen@squareup.com>,
 linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
	Zac Crosby <zac@squareup.com>, Bjorn Andersson <andersson@kernel.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>, Joerg Roedel <joro@8bytes.org>,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/11] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Message-ID: <168805198676.3055346.17759635264123087851.robh@kernel.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org>
Message-ID-Hash: 7OAAM5CRQWPROYPT3VOANSI76CYOFQ2T
X-Message-ID-Hash: 7OAAM5CRQWPROYPT3VOANSI76CYOFQ2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OAAM5CRQWPROYPT3VOANSI76CYOFQ2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 27 Jun 2023 18:24:23 +0200, Konrad Dybcio wrote:
> Some IOMMUs on some platforms (there doesn't seem to be a good denominator
> for this) require the presence of a third clock, specifically for
> accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

