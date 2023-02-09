Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F1690273
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:49:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A34684D;
	Thu,  9 Feb 2023 09:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A34684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675932546;
	bh=EbOmPi45Ij/MkEYclbv8O3LBvlHEeRZz4rGUmCeYCL8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SdTG9H7z0QpYYxiFYmStPyPnTz8F0zfgdO2NoFhbeGLZYuq/RgXfUZXqCqHADyz0y
	 C929uPsYhpnkIrX7wHRCFOl7IigeY4ebFutO5Ql35Qj8I7jbUwlDYejvOZWW2vxogS
	 CkfLFUxRb8a/V62sFlf3ONUv9545moMPwvm4n+Cw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A10C2F80269;
	Thu,  9 Feb 2023 09:47:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E72AF804F2; Thu,  9 Feb 2023 09:47:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66DEEF8021D
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66DEEF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wxOckj5z
Received: by mail-wm1-x336.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso919508wms.4
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaK+2qeKRokXWQl5mn437c6754IzjGrCTscudDsBbrM=;
        b=wxOckj5zk1jda4m5L7NCQQPLiv2S5SD379SS9t3jkT02N9Cm/kimOWl/SYUgBeORZ7
         MXFw/VUb6ETAVpIZ87vnYO5b+1g1NXoX/WFN0ZQD104/9SJKvdPf27zZiE5DS4JQyM9Q
         ucVDIUGWpURMQ6ITfYZx5xCQkax6DVgzDBomPAOxa7Qc78fKh3S5eJs0o1jhd4ddqtcY
         uxXX/CUqVIuJnPQEN1/q1PEWna3ZbU+MNCRafyu9ZjqSh/NzitLRoAF0jnnDxN2hfeKS
         L7j7IEcEVHkHT2/NNwf76SG+YbTIRomDhcQTPMw20R/JBjoLbOn3XohhPbKxNLr8vrX6
         jWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaK+2qeKRokXWQl5mn437c6754IzjGrCTscudDsBbrM=;
        b=n/YM23V+ccPBarP6GrP498UrST1UPRMNKm5/9Tce13ZbCt9xhRb/0rsX4Rtqhc35UG
         6kHfs/VYGBToQBrjHIIPgZWuccaKqQt5RspXkaarrAMjfYlcNBSXBX1idoRIsmmbcwbD
         lIDeVqzHzp795lXBVPDm35oyAgt2ongPcwwuJwIMiavTAaI8MQnTJq8ysOFUfHu+BpGk
         91CmLTnJjng0FJFgfVrLu1OUQq0QYXh4JscYLVHSvQ8+sWsm2YY9P/sd2lW9N2wimQvH
         Sfz642qbw8eRXXs9SkpNlj0ClGS7QYNJWKGwZjWRqhaAkpQWC5+9A6CKop8K4+6y4J7r
         EPLg==
X-Gm-Message-State: AO0yUKUQg/mvP9w9GTikSCGTNiEXB+nLZaP6o0MC2oj/F1yZGI4/Ooo+
	mLb2gbvfySVr8kaCuB7re+eEaw==
X-Google-Smtp-Source: 
 AK7set+S0UZDOh701Frc43HZorIIvziF7+E4y6qM8tus2tR2sCO3vpZzSVO5bjB/EyrFyZ6q8TkTxA==
X-Received: by 2002:a05:600c:2eca:b0:3e0:ffd4:bfab with SMTP id
 q10-20020a05600c2eca00b003e0ffd4bfabmr5360460wmn.13.1675932449684;
        Thu, 09 Feb 2023 00:47:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003d9aa76dc6asm4559029wmb.0.2023.02.09.00.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:47:29 -0800 (PST)
Message-ID: <d189ae55-b3f5-a3bd-f0ec-1ab326c9107f@linaro.org>
Date: Thu, 9 Feb 2023 09:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
 <87wn4rbplc.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87wn4rbplc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WDZOAH2KHMMZM346324PG5J3ZYRSAKR3
X-Message-ID-Hash: WDZOAH2KHMMZM346324PG5J3ZYRSAKR3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDZOAH2KHMMZM346324PG5J3ZYRSAKR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 02:21, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
> are not mandatory property. Drop these from rcar_sound,ssi's required:.
> See more details on Link

Still no improvements.

> 
> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Best regards,
Krzysztof

