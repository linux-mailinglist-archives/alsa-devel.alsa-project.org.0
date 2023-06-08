Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B3729D55
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0721B83E;
	Fri,  9 Jun 2023 16:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0721B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322318;
	bh=/sVk8XE1y7GVscMGU9I2hJd5o8GQmQCrHXSe+UhZNlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fo2C5Wp9VL1NYeGeZ3dpzfjOjV7QoEZrwQkgPzmg2ztLDIWz8Gvj6GzyOU5kW8XMr
	 HL1xa1mKyxdHd67C/J5TDa7TnwR5ZoAjRt4Xthuro9q2gQ+9pmeq5Tb1ejb8rJrZQ/
	 UAFF5oFa4MhVXPxy86rsllolalmaUYPVOVnq27Ss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 778CBF805FB; Fri,  9 Jun 2023 16:47:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 838C1F8060B;
	Fri,  9 Jun 2023 16:47:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0743F80199; Thu,  8 Jun 2023 11:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C7F0F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 11:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7F0F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=WrlC02M0
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30af56f5f52so273780f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216891;
 x=1688808891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6orbtq17lQKjI9Icb5c6jZzUdG10XE40HYo5IhwyFNQ=;
        b=WrlC02M0T6mrZAv6GxmUy2UCBV9sf40gKGoNcw+gAKVsv+UVlMfBfPLqHGTgiUbUGA
         15Si5VnX3hMyAurhjup1Ff8JtS6/xS/zgwJ7AkOi//bMZ+Csu63ck6Uu80HkFVzMCPlq
         +mMi0PPRDhm2lzgAqfy47HkaqxRFnZk7cClWhBYDUANdyAdWU1oibYUQkw5+IgKyRh2g
         SitroCQ8lkHaw13o6uv/LW/hseTspMkBvei2ACbHKGFh9uKNsSklgUY4LDbRo2NSqctv
         SCBpxGRrBb56OSOrJGpKyEA+2YqMpw1JxQxHK79K97MkQ8YpobUgj4BNHSSnX9TCqtUH
         5Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216891; x=1688808891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6orbtq17lQKjI9Icb5c6jZzUdG10XE40HYo5IhwyFNQ=;
        b=PevVEKXXp60VhU1imfXYWa19ZRq0t4YAmxJpmpv+HSLbZp5ouseHL7kEF7gW4dn/Pp
         IMIa/+LIqw+vrLNYhBcKIjiXg4HR9Y/9M605PQ+qgt92SPk3uQ+mlxZPyqVsDkek40G1
         G0PSXOTnQ0WxdR7PeQedr9SgIfCb90afh4lR/MTolNcDM8dF3J7P852gSTK0DElE120A
         0wzumsHJVLnhY+fh69NRtBwIyB0Lu++5sxLsZCnPFeEIU8n8VrFwGX/F/lvMyD8iyb92
         PX7fkwL3x255iY5OMhmva310CuLVS50HoiJvbuckcESIekOpRIvc/LDRT6KbZT63E6U3
         l0Mw==
X-Gm-Message-State: AC+VfDzZq8Sknf987XSgi2SKxUj60pjMOJo02aDixra4r9tjCTdEq6RK
	vzDWKDpFrBMcWfOew6eGP9Yfxg==
X-Google-Smtp-Source: 
 ACHHUZ5UVQSczbkfardAghLYw8rGvYBCqD9G/YSIbOG+ijQ2ZPpGa/a32Zq9oHH2OrmLw0nLnbDPMA==
X-Received: by 2002:a5d:684e:0:b0:30e:5b63:7487 with SMTP id
 o14-20020a5d684e000000b0030e5b637487mr3188877wrw.58.1686216891475;
        Thu, 08 Jun 2023 02:34:51 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 bf3-20020a0560001cc300b003063a1cdaf2sm1025954wrb.48.2023.06.08.02.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:34:51 -0700 (PDT)
Message-ID: <578cc882-527f-5367-942a-d3d187786780@baylibre.com>
Date: Thu, 8 Jun 2023 11:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] ASoC: mediatek: mt8188-mt6359: Clean up log levels
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W3CVCQZSPYLVON2QE4WBEDZDWHWNCJWX
X-Message-ID-Hash: W3CVCQZSPYLVON2QE4WBEDZDWHWNCJWX
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3CVCQZSPYLVON2QE4WBEDZDWHWNCJWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Change some dev_info prints to dev_err() and some to dev_dbg(),
> depending on the actual severity of them.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

