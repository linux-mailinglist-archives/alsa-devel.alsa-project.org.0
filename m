Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA37401B0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9765386E;
	Tue, 27 Jun 2023 18:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9765386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687884792;
	bh=lV82tCrrn9UySs60pasMUP9rHmcru9pENYaTQ/7N9VU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=spCTf0evg5CgHR6tf2IDTDzxyAE9FwxqAtvrDm4W3l+ec5INXp7LkQoQtgmCUoUje
	 YARxH5FZyTRusBxTEZo45bM2fHHOUpG0LMvyuQScdGAyqB0HcAztiMUxtw7rFfKoE2
	 F3Yjm1caFOwlDvs4HYkNwStadgD/D9lz138SbgtA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0717CF80549; Tue, 27 Jun 2023 18:52:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A1BFF80544;
	Tue, 27 Jun 2023 18:52:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04FBBF80548; Tue, 27 Jun 2023 18:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E162F80246
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E162F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VCEcHabY
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbac8b01b3so361845e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687884725; x=1690476725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USpfAI1OKAg8OpDqtpnMJgq7elMP7uvf2P1RNsX/vYg=;
        b=VCEcHabYJExfQZ7CA8MPuO3bSHxPfDkhJbqqsgoW90ItGkyxpjKJq3RwuR4QWaC8Rk
         Ux6k0efVo6+a8hy349Y9sc0pksQnocG8ivXecX5sQld1JVwZn990ZlZS1m/RQhKW5cwF
         uLXraEdi7OpiRo7ko9nYwtI2/LSZyixWKWMRMUsRLi9BidBYT9izlLb8GXJuue1A/05D
         lOWyRvA/kPQ62xDISbHsTcf0pwi2cEIR7Kt0veehL4qotFA2kiqA2kST0PcSTh7Pgfgr
         HSN7irvJhu6qI6ciVrLaq6Be653ViZQ4a3JxgLHxwZjyjGs5U1+Vlzh9j5A+EEMxojAi
         5HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687884725; x=1690476725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USpfAI1OKAg8OpDqtpnMJgq7elMP7uvf2P1RNsX/vYg=;
        b=SdiBCWR6sbmoKUtZjmVj2DBnPwhhy03tmNUgKiXWAp7fzEMA+rGc1Vs4yB9kV6AgLV
         JAoKkvht8abnhQsW7CsqVHuDlUba0XuuxloJQGSv4IA6nP97T3sBlshzWe4S6v310w3p
         0k13RgARz53dVy9m8rup79YyybeHoGPrPh+QGeIlOdGuOcDHX8UspmJQQaQ0VpWsTwP8
         hoMXB0OmIuAjndJOjlPocBCV9ZYT8aVBKA3VRC8Mjd22EnYRnDzV4yNLpU7WlwyYlfcH
         GpT4enhvRzN4opD6WiLg81a5O3QKbLt3nDM4aMQt6A3D3/bAwnmRoaqx0Rvixl7sm3P4
         hnIQ==
X-Gm-Message-State: AC+VfDy3XH9JkIf4offOVO4cHd1Tyoh87Si8H2xJ76nuLMITMrSNTgCc
	N/RYwvBPRRW7Dm6V35M/l9Ijsw==
X-Google-Smtp-Source: 
 ACHHUZ7LzkqGsxsFpbadxBUX52EaujfQ1jgOJSmKZ8dsh0QhDuIh6RbbYX2hBZyk83iG9EWVNZLyAg==
X-Received: by 2002:a05:600c:2215:b0:3fb:416d:7324 with SMTP id
 z21-20020a05600c221500b003fb416d7324mr3786608wml.6.1687884725311;
        Tue, 27 Jun 2023 09:52:05 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b003f90067880esm14251778wmk.47.2023.06.27.09.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:52:04 -0700 (PDT)
Message-ID: <aee6e901-01b7-048a-ffe1-57a8895edda2@linaro.org>
Date: Tue, 27 Jun 2023 17:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/11] arm64: dts: qcom: msm8939: Add missing
 'cache-unified' to L2
Content-Language: en-US
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
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-3-6b4b6cd081e5@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-3-6b4b6cd081e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: M7E6ZC4TLL4WNM3CCPGMBLXULE5QIIH3
X-Message-ID-Hash: M7E6ZC4TLL4WNM3CCPGMBLXULE5QIIH3
X-MailFrom: bryan.odonoghue@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7E6ZC4TLL4WNM3CCPGMBLXULE5QIIH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/06/2023 17:24, Konrad Dybcio wrote:
> Add the missing property to fix the dt checker warning:
> 
> qcom/apq8039-t2.dtb: l2-cache: 'cache-unified' is a required property
> 
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

