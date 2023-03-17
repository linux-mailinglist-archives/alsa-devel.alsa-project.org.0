Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C366BE397
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 09:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9CDF7B;
	Fri, 17 Mar 2023 09:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9CDF7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679041971;
	bh=HRw4qRhITsHQVJK+hI4QTuch00sIFBbXNLzY4NaI8sg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lf+d6KfcKcHLM61ilRuhV4XfyGexNlJPRsnGRQiDadsyBc0XBxhZVwqbfoskcCMvj
	 MHF+iD1t/3pN4Nt+Xs44zV/LRrjz2dz0s0ajJq5Oa4DpigjhgkRyrVEXEwz0oOKLLC
	 XHlN+GZGv88Oz5dx7qIZyH/bu7L0k6h5z7S0wOMs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E4E6F8032D;
	Fri, 17 Mar 2023 09:32:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A7DF80423; Fri, 17 Mar 2023 09:31:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0690F80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 09:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0690F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aWHmZxuy
Received: by mail-ed1-x52e.google.com with SMTP id ek18so17353222edb.6
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679041907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F22xKzaXQ16zz1R+nPdvOmBcImJHM2RC64dPlAyscLI=;
        b=aWHmZxuyjKoQeJE36fh5yBR6stqa3XOEzB1SVT5U3CDiWrUEUqd2msGm72CQst+RK/
         Vkvm0winBTSa9GH01ItcF++wZbeu9Ca1O3OtCD+slaX2sfyNvwLNaP1kIkpF3YZUMRQn
         HfvmrKvHVhT+8utKUDchex+GgFH/jLaIYm4bbhg36sw75vbB0yaziDmmZIytqIRMJ/g7
         is+q5vtZXQM8KHDf43TQvE+c6zwdlCIA18cenpVd/XaOf8fvgq8Nh1BPceGza5/jL5BR
         uck6vWW5VahlzU7RL2fq2660WI4kK3wtWgp/dcDhr9zyW0GxJp9pXvMbmxOhPThJ0YhX
         8BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679041907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F22xKzaXQ16zz1R+nPdvOmBcImJHM2RC64dPlAyscLI=;
        b=wy2/CkG9XCtcBks9s/ngMoMVXEgeHk3bJuTT73byixrSAeSocSIAY+69yUso4qI5zv
         3BEYO3ZOwcEc2+r+3g5Lqp7bjn9JS2SlY5wtIhJfMNJcgDlQm08wErDVfdmZO3/NUj7I
         OtrKLxm241w9om+ZZT46vW9vZXtuSMjsBRwN+jl3/NQImW2hKPAH37CyD9M7NiPUrctw
         E39okTjpAI1z5tYc5KBxZrKAqwXrXyeBI7Jy4c4l1BmGEQSrDgzzIBmkAAbimprkgdQa
         KHBvzSYSkkK3V6ULagQcNEj/QVIxqaogTJrrnjDr7MJ4nqC+bTt6z1ERuoJOM+VBUp4V
         gLGA==
X-Gm-Message-State: AO0yUKWqExvOLbfqdbZAflJl3RFosZs/CeK7PCDNMzfzvv1uiKEGl3nY
	zic/HiyUtuwftT/tDtia9eOXDA==
X-Google-Smtp-Source: 
 AK7set9P1SuFct7TKYsl2uFH88M5Njs8psB88aLuEx8C2MfAzct4blZqPVjveqZ3ledMk3g6rAb+8Q==
X-Received: by 2002:a17:907:6eab:b0:932:3942:f28f with SMTP id
 sh43-20020a1709076eab00b009323942f28fmr618319ejc.61.1679041907355;
        Fri, 17 Mar 2023 01:31:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 e18-20020a170906845200b009222eec8097sm692325ejy.75.2023.03.17.01.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:31:46 -0700 (PDT)
Message-ID: <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
Date: Fri, 17 Mar 2023 09:31:45 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ORVINOHIL5G2CDYYZ3VMWTBHQEKN7QWY
X-Message-ID-Hash: ORVINOHIL5G2CDYYZ3VMWTBHQEKN7QWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ORVINOHIL5G2CDYYZ3VMWTBHQEKN7QWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwiner
> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
> the reverse of what a different board expects:
> 
>   rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> 
> A quick and incomplete check shows the inconsistency is present in many
> other DT files:

Why not fixing the DTS? The properties should have fixed order.

Best regards,
Krzysztof

