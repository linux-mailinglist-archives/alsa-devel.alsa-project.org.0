Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EABED65B4FE
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 17:21:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78650A14C;
	Mon,  2 Jan 2023 17:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78650A14C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672676472;
	bh=q3A8u/ZGvQ/u+zdMS+02ijfzhgqQE287Jcbfn2PLsGQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ag5KK6wbvuc2pFkcNJU1dm1ETr0I9Tqw8CfdTm7PF4h+W3ahsuEUloOQqFRowQt6F
	 tvt8BOOFsSPK+bYABPoBAgVbBs601M5XL7PCetVCzyvgylNyVV+lhF/JUHl683Gwij
	 /ZQw0jJrclTeInUZGhjTXMAavFd8j27s8NowKPfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FA2EF800D0;
	Mon,  2 Jan 2023 17:20:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCD21F80238; Mon,  2 Jan 2023 17:20:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75488F80238
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 17:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75488F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nsD1fDj9
Received: by mail-lf1-x12b.google.com with SMTP id b3so42171100lfv.2
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 08:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q3A8u/ZGvQ/u+zdMS+02ijfzhgqQE287Jcbfn2PLsGQ=;
 b=nsD1fDj9r8KfUFh6NXsi0K/iHf26iPOnFBnPk1q5gNFp5rh8g50KXmXNQ2R5AGnYZ3
 WQ58F2XqXuQRpE1bRd41laCI4AwErNQVTnvF8DAj52Hlm6r6dEuBFabHN130RNXxfKPA
 xDCDAnbPQuNxu4xa/qXt62R4S4vJ/eUFxS75HnRQ4u+nxoqwRPokye8bYohZr/AXlAt8
 UbcGOxld548ZSxrBbDNqBNvBUeFY50uyvZUDFF0+jF9pNGC4Y0jTAE0MGmi1vDAqcHig
 w6zLHKSULHPUcGi4eVXVbu51dm78bwsLRnho2sb40mJkcbM0KNmx7ovKlEgL2GX5X9HY
 9Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q3A8u/ZGvQ/u+zdMS+02ijfzhgqQE287Jcbfn2PLsGQ=;
 b=f6KkRxk5qhqbL293fMpfhPoQRYT6VE8plRQyuRp6HJo5nvVgOMXE6zt0sDniRpXg+0
 YG0dGqrdWjNFxvuj4ZFtNRm+ND5LkFBqLBxaA8xIh5A0KPS6C0So37I4/D/Q7bgBQX60
 oXRt5dVzDQfq0pXfdH7SkBEEcyEB9lMuBPlwhZ7PG0aRN0dk9qimltqsvTZdUjb1YQOG
 gJA3Hi/Fv7xQKXLAuOBtAk778UjxkHFZLWAxYG8mDFNAQV2Q37W70e4sFrCnacdXfugD
 YQ5ojD7XSqaGNwOEb9k/q+X9c0Xo6iXJ6eXow4ixeJMh0IpQvWeG8p0Hm3uPehYh7Ezm
 4jxg==
X-Gm-Message-State: AFqh2kqHW5JXTe3HpPuiH64OLcMr0e/wXljBWJDSDudCOry18I7WJZ7o
 bnQ63UXmzebCX1wb1zb2niJFTg==
X-Google-Smtp-Source: AMrXdXufChGyPfDAtZg7eDw3Y+8UbIrIoQtz8mcF7V8z/KPz0mOltbTDF2y7e5TD5DohAD8pZKcxTg==
X-Received: by 2002:a05:6512:3135:b0:4b6:fdbe:773d with SMTP id
 p21-20020a056512313500b004b6fdbe773dmr11657064lfd.43.1672676406353; 
 Mon, 02 Jan 2023 08:20:06 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q23-20020ac24a77000000b0048a982ad0a8sm4520838lfp.23.2023.01.02.08.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 08:20:05 -0800 (PST)
Message-ID: <43ee7ca8-de65-8c0a-20b4-e3cb5f10a3c8@linaro.org>
Date: Mon, 2 Jan 2023 17:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/13] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
 <20221230055443.16024-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230055443.16024-11-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/12/2022 06:54, Trevor Wu wrote:
> Add mt8188 audio afe document.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

This is still not fixed and you got comments about it. I am not going to
keep reviewing this patch. Implement the feedback.

Best regards,
Krzysztof

