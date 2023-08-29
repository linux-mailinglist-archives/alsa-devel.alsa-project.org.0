Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A910E78E7DB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FB473E8;
	Thu, 31 Aug 2023 10:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FB473E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470279;
	bh=uiHTcKZ/pzf5OeOaygIiOjKX327QpjyeGPXLdRHQCmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N5DBsfrnRLxuN4vMsRVyq0/5+e9dpBlf3h2vcjahA93UhPD0b1CWGxUYWaum3y1jH
	 kUYp8hSAT2UxGwdNhD947oegdlz6o8KgJHojD/JMwQBcxLPdDWahQoEYQRliyTlxL0
	 +WY/h/M/ns8t1Kh1L4sUOIq4P/tANWzRNZXNgtK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF2FEF804F3; Thu, 31 Aug 2023 10:23:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E3CF800F5;
	Thu, 31 Aug 2023 10:23:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D54F80236; Tue, 29 Aug 2023 20:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B291F80155
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 20:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B291F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=M7jKN5n3
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50087d47d4dso7612505e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693334187; x=1693938987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7WlyYzqen5MI4P1iAbKBmvgwbKop0nGPA7AULKnw6o=;
        b=M7jKN5n3mbxOj6lToXlIBhPfrGvC6yd0H/btRqbTG5GN77QQEHXEnWUgB/u9h37HEM
         aQ3Yh0h+zDVLmyJK1+FIDzgTteH8rmbZviHp/ff61hTQgrTcyy0nUiodskPcy/wcBh5n
         NIuaedyS4vgw2lhchhMUJW5L3lUOqkq8ajWK5jlq3m2SAdam1bwzA4e90x5TL4aZpkSM
         YWobFR2JHrACTFmlppIlFi7ZjN29jj0Mal8JFRUSPqudgAs54EYml17nc/0bF0TlJu6K
         124Lf8rCO4uKn9XVkhJWCryQagTVCb81ZFN8UFsc7Vzw1IrjJXssjEykqsPrreIM0fBF
         8CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693334187; x=1693938987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7WlyYzqen5MI4P1iAbKBmvgwbKop0nGPA7AULKnw6o=;
        b=XV5il6RsQ4ilb4Unh1Kz16NDh+yO7WLs7emu1cNQvZYF4FIzSj6WeBJlzSE//7pmFn
         k8TXc2bQhrnxQM+b/op6LgV8SD2ITxwHxloEOdyNUBwFc9bsE9kOdwHT+AF7JmzgCjRE
         AH1FoRUgSTZhtiu+dpGCXtfji9r2XaNE/8QmQ2NSZ6PDw0fEWOG+nrMDqjthBioLQIb0
         jOd3XONVAO363SPj+uaq9CCPZpM4p6SqUT/33ONwJSjCVqqBxccs53PHVBwy72gcEypM
         b5jaMO+5ZTpkU6igVfGwpwhQiMSOFy9I4INvbMp/eGKL76c7ixzzD6dkCGy83KXo6fu1
         Uj3w==
X-Gm-Message-State: AOJu0YwdlFvRI+Cpq6UNA8LV+QFNRfMEvMC/4dMg2gThvfG3yRjbH5mV
	HZgWDQitcy+jLDWT7/Qfng==
X-Google-Smtp-Source: 
 AGHT+IEjZeDr07xYkGFW1xI0KR3jmlLbN0sEkoa4/s1YsvQ7klaZ7CTwLESdDc6wxza92JGAV/2Zkg==
X-Received: by 2002:a05:6512:282c:b0:4ff:8f29:4411 with SMTP id
 cf44-20020a056512282c00b004ff8f294411mr23976106lfb.9.1693334186618;
        Tue, 29 Aug 2023 11:36:26 -0700 (PDT)
Received: from ?IPV6:2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8?
 ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 p22-20020a05640210d600b00525683f9b2fsm5961948edu.5.2023.08.29.11.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 11:36:25 -0700 (PDT)
Message-ID: <9954d57c-d864-0215-2efc-67440ce86563@gmail.com>
Date: Tue, 29 Aug 2023 20:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/31] clk: rockchip: rk3128: Fix aclk_peri_src parent
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-6-knaerzche@gmail.com>
 <dc2f32d3-001c-746f-6dc5-58a2a6a4a8e6@linaro.org>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <dc2f32d3-001c-746f-6dc5-58a2a6a4a8e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: knaerzche@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MPX2DQJXSNJ3LT3WJUXZUJQM6AZJZBSM
X-Message-ID-Hash: MPX2DQJXSNJ3LT3WJUXZUJQM6AZJZBSM
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:22:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPX2DQJXSNJ3LT3WJUXZUJQM6AZJZBSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

thanks for your quick feedback.

You're right: This series mixes up too many things. I'll split up and 
re-send.

(And fix my typos, indeed)

Best Regards,

Alex

Am 29.08.23 um 19:40 schrieb Krzysztof Kozlowski:
> On 29/08/2023 19:16, Alex Bee wrote:
>> From: Finley Xiao <finley.xiao@rock-chips.com>
>>
>> According to the TRM there are no specific cpll_peri, gpll_div2_peri or
>> gpll_div3_peri gates, but a single clk_peri_src gate and the peri mux
>> directly connects to the plls respectivly the pll divider clocks.
>> Fix this by creating a single gated composite.
>>
>> Also rename all occurrences of "aclk_peri_src*" to clk_peri_src, since it
>> is the parent for both peri aclks and hclks and that also matches the
>> naming in the TRM.
>>
>> Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>> [renamed aclk_peri_src -> clk_peri_src and added commit message]
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Please send fixes as separate patchset. Don't mix it with other work and
> definitely it should not be in the middle of the patchset.
>
> Best regards,
> Krzysztof
>
