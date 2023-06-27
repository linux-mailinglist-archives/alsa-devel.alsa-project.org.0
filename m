Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE717401A6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 18:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 025B4850;
	Tue, 27 Jun 2023 18:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 025B4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687884742;
	bh=RSK9/RIJs7yXjaI4o/5o0tO6H7qHai4SI+oLqKCJuOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PNZ53dUAoQhwyn0WDwHyubFD7PkIbdBjDQpY8AjTpt3yVefUgfwCe1uLFVT8ARr5E
	 b14/y6aD2+DlrCt8cAkYUCl3bUCswlaYudqdXgAQqD8zTrtiir5yj+iS4U+voNidZc
	 tloRyoE6pAwo3JIypk/QYmoNK0s8PHtw1ykIK7tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D8AF80124; Tue, 27 Jun 2023 18:51:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2387EF80212;
	Tue, 27 Jun 2023 18:51:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAE8AF80246; Tue, 27 Jun 2023 18:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47694F80093
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 18:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47694F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YN8xqJyC
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fa94ea1caaso464035e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687884682; x=1690476682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+ghELfAbO0R2iBEq1LRki0jyaslOJziYlRqk/abt60=;
        b=YN8xqJyCcfIsFN5ItLxMYi7S50o/mbnKJLTAsU5g1qeod6zCgluQd/7dt6sYI9Iaj3
         sZHXPNaZM+LiJPVTh/kam3Wutv9Se+HqE688ZfC421r7kBGkJSGQP0kvSZz3pDnY6v53
         lwS9i6vb112cH/GyHfwIznBUFSj39UXa0racgSbxDqu2TXt1PM5Vfo80I+2VKS9s41Ly
         WBp9mirzJ5sAXh+bOBxsp3zH2XwrTFg/mO/izcyBqnzuZuebZ72l9ff3on747H4U2SpW
         1E7Kddd40pzYz248nakUcPwqrOczJ4QrwNTHe8XvcwLTOc0XYYsxF9/DjigUZZbt8wpc
         /6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687884682; x=1690476682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+ghELfAbO0R2iBEq1LRki0jyaslOJziYlRqk/abt60=;
        b=VpHXiM07WygN58Qh7Yd2fcxxQ+tFXiJWxIdMeaWoVb0UZry1Bc2Y7vDHf9JkcubJfw
         MXLOAYV8/mjlYJNqRysLtKX9A0SauX4vm7Mbbo3Nl/Du37ATC1AIBvU8DdGMtx66khq8
         oZMCFx4WjtyAcbnD9GmPo6WF0N2CGOJ6tfMDdPLoM02lb5DNN2sYqeUDn6GXTmE9zBad
         ZTJk0xmfZHcKWMqvh0mVnMIuJIHwZ8uio2hiBNFNbRcrEmliwne/jl8tYTsDVTd7dlN5
         qBN9cqx6bvG0oB41g8wAXCyjWaQPOTgdyQPgsevlAEKOAj/agsi/F+83hZqsXvi+i3/w
         F0sA==
X-Gm-Message-State: AC+VfDwrvmfG3BUcVA388VETdSs2vYdj4vJtkoi7k9df+uBrWLolQWgZ
	msqfwbMTUuDAUYfniYURSks4Pg==
X-Google-Smtp-Source: 
 ACHHUZ5TeYUj7/7HDBAlPldZyXIYBI7vmCrqF9hOAg0Jk1yTzlA3HVAZWU6tAaOodr2QXV3fBfGLFQ==
X-Received: by 2002:a05:600c:511f:b0:3fa:9996:8e03 with SMTP id
 o31-20020a05600c511f00b003fa99968e03mr5802169wms.10.1687884682415;
        Tue, 27 Jun 2023 09:51:22 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id
 24-20020a05600c229800b003fa98908014sm5986545wmf.8.2023.06.27.09.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:51:21 -0700 (PDT)
Message-ID: <88cdfdec-b498-ad1d-6f87-a5595ffcdc5c@linaro.org>
Date: Tue, 27 Jun 2023 17:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/11] arm64: dts: qcom: apq8039-t2: Drop inexistent
 property
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
 <20230627-topic-more_bindings-v1-4-6b4b6cd081e5@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-4-6b4b6cd081e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OBFUFRGZJUOIOIO7TADYUVMT2GKXLW2A
X-Message-ID-Hash: OBFUFRGZJUOIOIO7TADYUVMT2GKXLW2A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBFUFRGZJUOIOIO7TADYUVMT2GKXLW2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/06/2023 17:24, Konrad Dybcio wrote:
> 'pin-switch-delay-us' is not used anywhere in the mainline kernel.
> Drop it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
