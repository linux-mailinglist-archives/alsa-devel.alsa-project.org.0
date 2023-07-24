Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717675EECC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 11:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503FE7F4;
	Mon, 24 Jul 2023 11:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503FE7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690190018;
	bh=wz3bTrUNMqokyUiP1XN6QbRVv0hbnaVJdbcU9j9Sy0M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NP5JOY1u5cx4tc87UdN5UQRCOU69d/JGe4HTedCfdXP+1rlpMufOKZ7cgFmxYVi/N
	 02okdpbwlZf6LSLyfTdPW2ubqb4NhKwyXknQ5V7HIP5Y03XBjJ8ToouWk96uh8gwri
	 ysb4WklzNA9sT/Jtv/WT+xivnfR6IxZA7FtgGeCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F464F80535; Mon, 24 Jul 2023 11:12:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5961BF80163;
	Mon, 24 Jul 2023 11:12:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3CB1F8019B; Mon, 24 Jul 2023 11:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C5CAF800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 11:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5CAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k7sd9ry9
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-993d1f899d7so727243666b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Jul 2023 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690189954; x=1690794754;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fh4EDpkUKXX0i2jSGB1PBtJy0KS6P9QG8sx5m74zofM=;
        b=k7sd9ry9f7KEkVokM1xv+AAbCPIUgxP9XVqzO2oMvoiFvG/KjABl32DheQa3U+CUC4
         FiNKfOU4mjEp9GJcI0Im9xwYFtPAIZbXJzoxBZ/rr6RF5MlQJ0kJAVrUTUTeDxI9XkQy
         qWGaACOxgXzHWqRKbhJnXkE+kOdZMIe41i0vCaZUNjm760cbJH+6w5Ty3z/OHyDLnvEN
         0EPDsV6gNixv/DBpu2SVDzffU4PrMSt6DhSna0c1zR0eAOASjDQZI/BWq7g2AcuTy7jr
         2bgX4+HoikeVPH6/aaWveSXFCU0WTMON9pJ61shYVBFC1X5Oxw9lu+khduMMptAw9RbC
         lGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690189954; x=1690794754;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh4EDpkUKXX0i2jSGB1PBtJy0KS6P9QG8sx5m74zofM=;
        b=NbQSSaNLTlaSf5YrQDYoYPyxquFgiYpIlu1j9Zqv8TVjEDZ/ZrnEdb30onuyB3Fp8f
         QyFr2Lp08AJJx2wOjT5pXbgeoOdTYvcy9VAC8BIWBv8uH5jqJp9oaqrF2WIDd/JIegqp
         yGuHVM7CMzG05FxbcwOTNPGgXZ8eM2EW/jZijlbGJUOZyiyMm742G3NaG/P40xl7voqI
         VPCw4i5oOv55rfaPvQZAuV8RSYxwdcAN4P3LgrxjNtcdaaqdJlOKL5KaKsAo8DZnNHnA
         FKELoZGRGV6DZHREIQ5Qtt+Mxm5z67bwSvdrg91Kd4rfzV/99SI7UpplO6BxR3A5lR4u
         eauA==
X-Gm-Message-State: ABy/qLaG3q0eWEl5mpxNo6OpGQHUMHyr0A82n68X+4BM9e9oh3RGkdb4
	saNQ8ZaGoMP3H+R6mFVgtLtMEg==
X-Google-Smtp-Source: 
 APBJJlFyiqbyrtae4oPoU8c9essn66hxwhB/tZ54efWazcZSBJL34UATeiWbByL1xXKVtIQgz5XF7Q==
X-Received: by 2002:a17:906:64d2:b0:993:d6a7:13b with SMTP id
 p18-20020a17090664d200b00993d6a7013bmr10019595ejn.22.1690189954456;
        Mon, 24 Jul 2023 02:12:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 j15-20020a170906254f00b00992d122af63sm6445656ejb.89.2023.07.24.02.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:12:33 -0700 (PDT)
Message-ID: <4d8143bc-03db-4f6b-9833-44cbaf95ecac@linaro.org>
Date: Mon, 24 Jul 2023 11:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 09/11] dt-bindings: arm: msm: kpss-acc: Make the optional
 reg truly optional
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Joseph Gates <jgates@squareup.com>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Shawn Guo <shawn.guo@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-9-6b4b6cd081e5@linaro.org>
 <c52ee94f-f60b-f8f0-f93c-221beec0224a@linaro.org>
Content-Language: en-US
In-Reply-To: <c52ee94f-f60b-f8f0-f93c-221beec0224a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KALYNSLZAJJTA6GTZJZYEPDDKI2QNKQK
X-Message-ID-Hash: KALYNSLZAJJTA6GTZJZYEPDDKI2QNKQK
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KALYNSLZAJJTA6GTZJZYEPDDKI2QNKQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/07/2023 11:05, Krzysztof Kozlowski wrote:
> On 27/06/2023 18:24, Konrad Dybcio wrote:
>> The description of reg[1] says that register is optional. Adjust
>> minItems to make it truly optional.
>>
>> Fixes: 12f40018b6a9 ("dt-bindings: arm: msm: Convert kpss-acc driver Documentation to yaml")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
> 
> This patch does not make sense. It wasn't also tested. The code
> (minItems) is already there.


What's more - there is no such commit as 12f40018b6a9!

Bjorn,
You might find this useful (fake Fixes tag should be detected):
https://github.com/krzk/tools/blob/master/linux/git-hooks-post-commit

Best regards,
Krzysztof

