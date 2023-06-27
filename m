Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4EB741017
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63D56857;
	Wed, 28 Jun 2023 13:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63D56857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687951876;
	bh=/6/6an5TkDFBlAGbmjXHGncp/QkR4CrgQGRMiV1+v8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=evZBFUNSM36n1ECmykKGi0HSXDG+8XZKuId80ooGz+PNxRKTW6m3Jk83MZNETqrwP
	 m//0T1/4xKeDTynAHDyrM85z07eRwfpzbVhdrUbNVWtG2vyZxP1yFBAU45JvMJ0Wpv
	 rBfwWpov82s8Ondy+8EnXW29542/APhY2Up3/ky8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2B15F805A0; Wed, 28 Jun 2023 13:29:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D74F8057E;
	Wed, 28 Jun 2023 13:29:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E570F80246; Tue, 27 Jun 2023 19:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCF71F800E3
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 19:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF71F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=squareup.com header.i=@squareup.com header.a=rsa-sha256
 header.s=google header.b=cVjtp8co
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so511144fac.2
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google; t=1687888500; x=1690480500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMDH1mlxwV2sLVWQuxFIR054U5xIxrFoM4b9Bswiao0=;
        b=cVjtp8co8rmddukZBlStGYs9L/uhr9S8Npcfei1pB6Q9BloGEVrzn8aVuzAZCEm1R1
         6uvMgdfwvYUkRonM+IlGd6UVKKQCCU9KA/dptRxbSYov5AurJm1CdRb/MqmglCvXoqLk
         tGMkIJGfqFEy1BYD2ALxd640YMX5mLOdnrg2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687888500; x=1690480500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMDH1mlxwV2sLVWQuxFIR054U5xIxrFoM4b9Bswiao0=;
        b=WVO/3JKnXKrTOVGaAX7ZKZuhBchCSX85viTGxhvyh4Tl84mQB4r9kwCPPGEjlrKsmt
         ybq87FlEUwR91WTF35Dk82b/uez+2j9a2a2AKAMWcW5j2ZoUlvP48NSzny8H7kwj4qks
         fyHow/AyTtTOi5TO4nczwmBhQyOzFjLsQQ22D2X0OquOVYkN2JmLfBrWNoZfYbzz3vOD
         QGCSBuFxZadjY+zJhqgWDcZN1AAkEK39YcEQH3KYtLyI7Vv2HbpiPT/QzEN1lg+EJmns
         97NWPctc0tpve3e/KRakiN+4174G1kq5jS7PvQvcmV1JTmgkj2FJtqup5gLLV9/m98KK
         dwbQ==
X-Gm-Message-State: AC+VfDw5f5ieaeUK4SZ5FUJimdS+gjeU37K2HvpA0f3tmwsjY0VTdk24
	Yg0EER4bg1dHq5JTL923jT67JQ==
X-Google-Smtp-Source: 
 ACHHUZ5128JJUpofvc84U9QEvguT6ylxK0NPBUtGocO3qCpVL4swAAl6Xq4iRqzHQOelQG16lCO4FA==
X-Received: by 2002:a05:6870:c812:b0:1ad:1ce0:c348 with SMTP id
 ee18-20020a056870c81200b001ad1ce0c348mr15263035oab.11.1687888499657;
        Tue, 27 Jun 2023 10:54:59 -0700 (PDT)
Received: from [10.96.32.61] (137-025-033-021.res.spectrum.com.
 [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id
 d88-20020a17090a6f6100b00253508d9145sm6879840pjk.46.2023.06.27.10.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 10:54:59 -0700 (PDT)
Message-ID: <30944ea8-d4aa-d0fd-7eaa-64b59e32eb6b@squareup.com>
Date: Tue, 27 Jun 2023 10:54:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] arm64: dts: qcom: msm8939: Drop
 "qcom,idle-state-spc" compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 James Willcox <jwillcox@squareup.com>, Joseph Gates <jgates@squareup.com>,
 Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>,
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-2-6b4b6cd081e5@linaro.org>
From: Benjamin Li <benl@squareup.com>
In-Reply-To: <20230627-topic-more_bindings-v1-2-6b4b6cd081e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: benl@squareup.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7WWFIOEWMCIXLM5WGX4ZSOSGQP4RLSSV
X-Message-ID-Hash: 7WWFIOEWMCIXLM5WGX4ZSOSGQP4RLSSV
X-Mailman-Approved-At: Wed, 28 Jun 2023 11:29:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WWFIOEWMCIXLM5WGX4ZSOSGQP4RLSSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/27/23 9:24 AM, Konrad Dybcio wrote:
> As of today, the only cool and legal way to get ARM64 SMP going is
> via PSCI (or spin tables). Sadly, not all chip and device vendors were
> considerate of this in the early days of arm64. Qualcomm, for example
> reused their tried-and-true spin-up method from MSM8974 and their Krait/
> arm32 Cortex designs.
> 
> MSM8916 supports SMP with its arm32 dt overlay, as probably could 8939.
> But the arm64 DT should not define non-PSCI SMP or CPUidle stuff.
> 
> Drop the qcom,idle-state-spc compatible (associated with Qualcomm-specific
> CPUIdle) to make the dt checker happy:
> 
> apq8039-t2.dtb: idle-states: cpu-sleep-0:compatible:
> ['qcom,idle-state-spc', 'arm,idle-state'] is too long
> 
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Benjamin Li <benl@squareup.com>
