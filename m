Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 670176BED64
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 16:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71233ECF;
	Fri, 17 Mar 2023 16:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71233ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679068556;
	bh=3U604+fuqF+FG/uaXBR8oOENgI6wzpBxD1TLFn8jgYg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2wc7UWrS3Nz/ClmB9DOocPTb3P2A457VGGepwI1FOjlVekUT5iW8XFrUtOjJCiiI
	 t4JeVMHOujnHPK+RMzDO6bha/qpZZwTdr10U8jduaG8/iOfUwRPyhoAxUCgowukiJe
	 gvpsoLg9nTcruK191vn1Y3b2/qX/KRkYF8Ff5C+c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7900F8032D;
	Fri, 17 Mar 2023 16:55:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BDBF80272; Fri, 17 Mar 2023 16:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 113FCF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 16:54:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 113FCF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J3OI5NGj
Received: by mail-ed1-x52f.google.com with SMTP id x3so22131652edb.10
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679068490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6MfDM7+OPKEruVq5Qw+tL9foQplTG2gH4LeyrZ6K0I=;
        b=J3OI5NGj9npu+foP+NF4EKylYoqNwBGWTTFoaBFl/rtJptvgmBqbgaaNwy0O7xtBZV
         OoRN0BmTI0Vf421lNAAHbcxY37muIyEDCYlutZBnnT5RsycZvFq/PuFUBlELpOocRsuJ
         K0xbCzcc3REibeoG9AcCeLCc+b1sQocdX11eHVM8JkPs4x/rdJcow6Ii+OL2asqAn6zf
         rFPh/33gn2hrfP6UFSb8aYJBRoSxMyXd5IrQNX/xxa37k91f2ZMBbsDpnJJM7Oepr39r
         v3SYngKEeCsRngXiYqXXSOEwTxlT71jNY/ehg8AgbVg5CxUKjNiBr60b6cJpnHThX7pf
         CoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679068490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6MfDM7+OPKEruVq5Qw+tL9foQplTG2gH4LeyrZ6K0I=;
        b=CwF5y5yJuLxtjNc7VEVVJjvqaK/GpktlLtnD3Qss2T6QvRuQlj88Ael2YtHYse92tH
         uY8h8bBiRaEgEr09QbmZAlH51bD6aGYhUq8ciVcC1KIdWE/jkJ+MNknm3wrd+jvDAIpM
         zoeIhEdQuYavWWm4KxdsCdCTnUAsrCXWdSymnfPT2ZOwtmeQ18m/cJBrASuyL+l1bFP1
         I7JGw/2DGNLMJfHYJZerClpNQVkr25QIBC8Z+AfrT5VVubobHUJRhgVDIjxpPZ0S1p4K
         8CN2iPKjg/36LcipLNS9wkLOGtFhxAYgtytT5URMQ2cOyQ66fU5IPDl38fwv5eDDe2sx
         bVgw==
X-Gm-Message-State: AO0yUKWp9X9dlJwDI1FeeZgoFyXVCTMiODJeX8N+vZeSvjQwb79twIMy
	WgYFoPmk0OpiYwMKtLrrm7hDQQ==
X-Google-Smtp-Source: 
 AK7set+MZ5pmlFpN+w8RxZMV5gSssYKuD9NQ8ZrDbPdbH6ontcivRAhcm8upFtI00t/Upa7xjOUp1Q==
X-Received: by 2002:a17:907:cf88:b0:92f:7c42:8631 with SMTP id
 ux8-20020a170907cf8800b0092f7c428631mr10502230ejc.16.1679068489976;
        Fri, 17 Mar 2023 08:54:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d013:3eeb:7658:cec?
 ([2a02:810d:15c0:828:d013:3eeb:7658:cec])
        by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0091fdd2ee44bsm1112929ejc.197.2023.03.17.08.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 08:54:49 -0700 (PDT)
Message-ID: <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
Date: Fri, 17 Mar 2023 16:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2CATRAIGFOWIDAAT7GAUAND4AVK7W27C
X-Message-ID-Hash: 2CATRAIGFOWIDAAT7GAUAND4AVK7W27C
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CATRAIGFOWIDAAT7GAUAND4AVK7W27C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/03/2023 11:21, Cristian Ciocaltea wrote:
> On 3/17/23 10:31, Krzysztof Kozlowski wrote:
>> On 15/03/2023 12:47, Cristian Ciocaltea wrote:
>>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
>>> dma-names properties") documented dma-names property to handle Allwiner
>>> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
>>> the reverse of what a different board expects:
>>>
>>>    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
>>>
>>> A quick and incomplete check shows the inconsistency is present in many
>>> other DT files:
>>
>> Why not fixing the DTS? The properties should have fixed order.
> 
> I was initially concerned about the risk of a potential ABI breakage, 
> but I think that's not really a problem since dma-names is not directly 
> accessed in the driver and DT Kernel API doesn't rely on a particular order.
> 
> If there are no objections, I would switch the order in the binding to 
> tx->rx, since that's what most of the DTS use, and fix the remaining ones.

Since we added the order recently, I rather assume it is the correct or
preferred one.

Best regards,
Krzysztof

