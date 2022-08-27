Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637155A3624
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 11:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2CB486E;
	Sat, 27 Aug 2022 11:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2CB486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661591030;
	bh=r/+1ogrb9Vk+5s9aHppq9+q4GoJlTXN2+ZCjOeg8X/8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgCZVmn4cSdJjFGpCn8xS2WJWYgimYB/d09UjbR/vUQQGJjmg+qxT4i57rNeqvn2S
	 A3SCztaIdeKUcod0sAh2zumhNlPQz5/RNSspryxCtT6BAc93fmWKTPrNN0X6MJyGXV
	 9J9B2HGzG2alyuoKDLFsG/TmUbwP+4lpDpbR/Zp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EBEF8021D;
	Sat, 27 Aug 2022 11:02:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 868E6F80132; Sat, 27 Aug 2022 11:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0AFEF8012F
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 11:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AFEF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZuHqxfOw"
Received: by mail-lf1-x135.google.com with SMTP id z25so4834599lfr.2
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=tSaAKzb5w2T65/FdcCDzvyichDzNAon3GE1pC83jdZw=;
 b=ZuHqxfOwCkZJccxT0l2+1PQB9D2ShACtEkwkvAlIMBiKEretjxfkSm23NhSBLPElSO
 B+rS8g7boSspb0ecSDz0Zmzh2G5ymNIxDtCLQ2+U0KWCQZr3aXRyvovfelhSb+5e0whg
 RSLSh6y5FVe4SM1fknKno8wTjeUXZoKKluwztePVJDdbwfSIBTsHsxexv7hCxt3qPhbm
 JKFjcaM7/4OEdpt4KjUjXuU4pm42B/FLD2GL/elgXmPHY12wAm3dYP/oP58rZY4basrX
 yrX3bog1/3kCD5IGmYOFNfW6Sufs2wWUKxh9IvPtP7TDPl2dZsmaZXMOigzIsjUOHmre
 guSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=tSaAKzb5w2T65/FdcCDzvyichDzNAon3GE1pC83jdZw=;
 b=4sFrB2SDPi4CExFWBkY7+y4qtsowFclO2ENEE8ccwGLKtJ59JqOWO5pgS4J83zxmty
 lWwZUqZo5l0QRnlCkxdiVeVrhIgZblfcpqne8M/KehA56I+7HLV3RpCcWMbhOhwTaGMW
 fXFS1Pp+WFcf7BBgbFiZ19EZ5kh3wK65Sd7G5nt1ZIjZM4D50+57TDSAzT/XIplAc/zx
 tVG9Hvw4FY8N4ZCBIooowSxf5SePjz9hwpI85oBHPLqAPgDp0OELpZee8Xw1Wa0UmSih
 LgQ4Dx0t1GXTN1aaiKjasq7TxCgdITpvkqokJ4RsQIsmAZ01SkqVtMrJBzxteraS0z/1
 Z7Vg==
X-Gm-Message-State: ACgBeo3igFL2nVjBlHVWDd3R1q0c6+F3cQnTdqwoWlTkcegtvnL/NhsD
 qhLfwm3VemnJpbSWDsBi4SMk1Q==
X-Google-Smtp-Source: AA6agR6avMqu4paaaH5+k+RySA/u2b4JKe9lR72DOYOCmGAfXBduDProOI0ZX5APHtMKUGMpWcAGYg==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id
 e9-20020a056512090900b0048b954c8e23mr4023915lft.670.1661590964241; 
 Sat, 27 Aug 2022 02:02:44 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a0565120c0e00b00491ee1bf301sm618807lfu.39.2022.08.27.02.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 02:02:43 -0700 (PDT)
Message-ID: <a5266af6-af19-48f9-8bc6-94c171ba6d0c@linaro.org>
Date: Sat, 27 Aug 2022 12:02:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ASoC: codecs: allow compile testing without MFD drivers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
 <YwkSi1IIRsW2Hc/u@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YwkSi1IIRsW2Hc/u@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26/08/2022 21:35, Mark Brown wrote:
> On Fri, Aug 26, 2022 at 12:36:59PM +0300, Krzysztof Kozlowski wrote:
>> Motorola CPCAP, Lochnagar Sound, Rockchip RK817 and Qualcomm
>> WCD9340/WCD9341 do not depend on parent MFD driver in build time and can
>> be compile tested without respective MFD part for increased build
>> coverage.
> 
> Although generally it's easy enough to just turn on the MFDs
> themselves, it's not the same base platform issue as the firmware
> interfaces can be.

True, it's not the same build coverage need as subsystem/interface
dependencies, but still:
1. Drivers can be built independently, so why not?
2. There is no drawback in allowing to building them independently
(compile test).
3. The parent MFD device could also depend on something (RK817 and
MFD_LOCHNAGAR depends on I2C and OF; CPCAP on SPI), so it's not always
the case of just enabling parent. IOW, you can compile test codecs
without I2C and SPI which is valuable itself.

I find the last reason actually quite valid and applicable here. If you
wish I can add it to the commit msg.


Best regards,
Krzysztof
