Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43F74298B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B60F847;
	Thu, 29 Jun 2023 17:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B60F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688052334;
	bh=CXhVv0kXlmQv6hMXdvNriAI+CQCTG+SwaaX1OAcS2C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GACiCbuQqARSrnXiq2/CJXweu8V8a+YxgnBqhARDvGWnbeLqJRZoC4PkeAX698BSx
	 rl+QDrACa8KtmUOhshvjE9b3BpN/hxzveB1uNrzbBToDgeAMv9zhvVChR2J0lMPA//
	 RNL2eBk7n0DsRC5z3HwTwpaXk9LlcD3l4uPwWR/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C09BF80558; Thu, 29 Jun 2023 17:24:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6245F80246;
	Thu, 29 Jun 2023 17:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBA57F80553; Thu, 29 Jun 2023 17:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F4BCF80549
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F4BCF80549
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-341ff6251f2so3289845ab.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 08:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052273; x=1690644273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eQgcjG/JNZBQYsHaOaghoEHW/pYFGXm2Ot9OAjBn+I=;
        b=gWH98XjGQ7is9AbEHN6dVKRMIhgrr2sy+wrkBeNk6P8lIKCRPm7kdGf5U7BFZ/HOlO
         qZdPRncSHh1aReZSs5o3Bn0RSi9HCD4s+lW5AbWxCuH5ZxeJCpGn3oyimVy7lTQRLYWk
         ahL5v5/KCQj9YbbzKD+nKJz/1ckLyCIKhzvP792T+voFSfM1ux3uKi9E04z0iuFEdk51
         Q7L6c4kgrBwdPC16fu/ij0d5MBIAvAzP9v+eABFTyuW1NBMyY0seb6vUF1tm6KWyHKrs
         oHR1vrXBL4BiBsMij7QVgh8YMWbKjhvkg7EOvzdEVogGY+E7hAFMRWwzfNP3jexfAU6/
         0DPA==
X-Gm-Message-State: AC+VfDyREyr0HEGrOzdp3g9wmysZdEQNsSwvPUhI6M5tKlItinUIX7/r
	HVrVozpsPsBNTFQx+xiC4A==
X-Google-Smtp-Source: 
 ACHHUZ6aWR2cNKLqqna8mhpYMU4KBK1rHsg3TJ2zE4I+ravgqHborA0R3NbQyITNWdKK9jJT6CE9HA==
X-Received: by 2002:a92:c802:0:b0:33d:8720:7d98 with SMTP id
 v2-20020a92c802000000b0033d87207d98mr31008278iln.13.1688052273202;
        Thu, 29 Jun 2023 08:24:33 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 o13-20020a92c04d000000b0033a50ad8176sm4232350ilf.18.2023.06.29.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 08:24:32 -0700 (PDT)
Received: (nullmailer pid 3061956 invoked by uid 1000);
	Thu, 29 Jun 2023 15:24:29 -0000
Date: Thu, 29 Jun 2023 09:24:29 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, iommu@lists.linux.dev,
 Will Deacon <will@kernel.org>,
	Jun Nie <jun.nie@linaro.org>, alsa-devel@alsa-project.org,
	Andy Gross <andy.gross@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
	Christian Marangi <ansuelsmth@gmail.com>, Max Chen <mchen@squareup.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	James Willcox <jwillcox@squareup.com>, Andy Gross <agross@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benjamin Li <benl@squareup.com>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Zac Crosby <zac@squareup.com>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawn.guo@linaro.org>,
	Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Joseph Gates <jgates@squareup.com>, linux-kernel@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephan Gerhold <stephan@gerhold.net>,
	Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 10/11] dt-bindings: usb: dwc3: Allow just 1 interrupt for
 MSM8996
Message-ID: <168805226868.3061904.18194272296816895150.robh@kernel.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-10-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-topic-more_bindings-v1-10-6b4b6cd081e5@linaro.org>
Message-ID-Hash: MMKAJMUEK3IV5IMBVIFUJQ23EFCWQUF2
X-Message-ID-Hash: MMKAJMUEK3IV5IMBVIFUJQ23EFCWQUF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMKAJMUEK3IV5IMBVIFUJQ23EFCWQUF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 27 Jun 2023 18:24:26 +0200, Konrad Dybcio wrote:
> MSM8996, similarly to SDM660 has two DWC3 controllers: one for SS and
> another one for HS operation. Allow just specifying the HS interrupt
> in the latter case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

