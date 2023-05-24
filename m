Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6BE7125C9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A1874C;
	Fri, 26 May 2023 13:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A1874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101442;
	bh=xw34ADe1C7BJWgt8A/Ju5SRLZMkoQuGWKZLmJBBu72w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LnUi9oJRGsiS7IKnlRZi8+WPgppfNmwM0QDJ0shaSgFwBle7NhQaaAcPsyMYHGSPm
	 wsbf2liea6yTeqfMYu6muSL0dWs9SZbIxlAetC0z+jBqzmkUoaW7/GwiuLelfL3zC9
	 kUWgTHFJAJIct7u8VVHAFI1qyeNmKVm3M0ELqYgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D39F80558; Fri, 26 May 2023 13:42:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0228DF80549;
	Fri, 26 May 2023 13:42:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF9FEF8024E; Wed, 24 May 2023 15:35:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EDD0F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 15:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EDD0F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=SO63kmKt
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-309438004a6so570654f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684935315;
 x=1687527315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uljV3lePHX2dT1PWNMh/ljjLSAl+kOPIh8cm/LkNac=;
        b=SO63kmKtSJT+rMuOzFfavtHtUqylLnOJdFFicK5cp/eceA89/zf3PQyUFaH5Rs63cz
         Pzm3JQnfxT3+MD7uHfDR/yLU+U7Gus5FSM9tHP9+ZSaIBDkq7XNwTso4yaPGZ2wllepE
         8f2xSrMVugmNS8uSy9Xxzu1Y+Soi4C+n56BPnZmw2VBq1j0GfYnWQtoNo+vDlNMMcodH
         JAG66GqoBj/9ugfDnaBciDx9Sy8+uZF4SM79v+Wyf5ADftBvUlHrLVB+2zv4q2hOVLSs
         xeSHkWEaN0XiPEOEbWMW344h9yvsp89mo7ke0mBbrLS8FhyqVQTXksnBIplcSe6w+D7u
         UwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684935315; x=1687527315;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uljV3lePHX2dT1PWNMh/ljjLSAl+kOPIh8cm/LkNac=;
        b=HlfKr594sY/t5bIpZGGGRRycoA5s/zmPrky/vNswExeabVWZAlveCojyRbWUbjqFdj
         c/jCEdBHwOcy1l2WmwQLCC3k4i32MuIO4EfIBCNIYhL+N4Qw8JiwWEuWXSHniVANo/eJ
         RTt5gkxf43uNYtHMy5WOk2lMGshVc/+5QKAGJII8kWRI/dXQLQINCvc6K0PWc5riKkU4
         aL/HG33TQyL72lE6R6gfZC0xmeh1US7iNHZoqJiRf7L7yAA9e3zz9MreJsYijeT5Jz1F
         ID/Lr0EfTzqeX9WX7cgRPLoidkilQds99/TDk7GBt+TiV1aQa3y9MDVP5LLq/Ltpx9ye
         Dq7w==
X-Gm-Message-State: AC+VfDy4Yvu0PYfQ+akeoXa7Ln8QugVbzNHVwFPV4R7jP6U6sVScjmZX
	fn8/vA2asnHdtaXD8kbEiEeVfQ==
X-Google-Smtp-Source: 
 ACHHUZ5RZ7Bo5fpNypNWTBFfgonGWh7gKVvBN1SdijZkeoUQ8x/A+0ydKs+34LVC2FAgeWHBgFnIfw==
X-Received: by 2002:a5d:45c4:0:b0:306:39a8:6fa2 with SMTP id
 b4-20020a5d45c4000000b0030639a86fa2mr13135682wrs.61.1684935315016;
        Wed, 24 May 2023 06:35:15 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 a2-20020a056000100200b0030903d44dbcsm14555695wrx.33.2023.05.24.06.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 06:35:14 -0700 (PDT)
Message-ID: <1ee72aae-46ec-dfad-f68e-f9189c84d148@baylibre.com>
Date: Wed, 24 May 2023 15:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/7] ASoC: mediatek: mt8188-mt6359: register hdmi/dp
 jack pins
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-4-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UCRUZLMXTSC7UIW2BDANL5KFE7UW44IH
X-Message-ID-Hash: UCRUZLMXTSC7UIW2BDANL5KFE7UW44IH
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCRUZLMXTSC7UIW2BDANL5KFE7UW44IH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/05/2023 04:19, Trevor Wu wrote:
> Some userspace applications need jack control events, so register hdmi
> and dp jack pins to activate jack control events.
> 
> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

