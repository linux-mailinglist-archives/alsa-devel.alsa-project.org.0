Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA765A612D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 12:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0814E16A3;
	Tue, 30 Aug 2022 12:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0814E16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661856740;
	bh=OiWGjbcMrLaljXT97nd4i5hwDeDun543BOzUIHrYryg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpDLwkvtdW2z/wCposATsqd0Sj0AZmQvSjsh4hvEqQ612TIKOyyrf2dKifZmuDhfO
	 v0xLRTGcKR3KGpzH0j+oYFdbBBsxF+4jGsVpvLiHiTRCCUF6WBo2YGLapT/0jcYSJ8
	 IgYzEZwYlxQKCj3m77SZKUXVHRGX7rZecnzqVS3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 754ADF8023A;
	Tue, 30 Aug 2022 12:51:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB3F9F8023A; Tue, 30 Aug 2022 12:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35C71F8016B
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 12:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C71F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sFhnzPlI"
Received: by mail-lj1-x230.google.com with SMTP id k18so4512624lji.13
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=e1hN6u3b87oGXUwDtR5NW7sGRX93ClE7I6RCTP747nA=;
 b=sFhnzPlIb+FancITooLULAVcUz2hglMvTCtBdqmvF6tRXgvAEbWlhSrvThObhZU2q2
 jJSlV7xiDXzCi1OhH+CbH2oX4NSQaBosZUrZH8OZXRkh6wQvT0GsN99m1WeGZDqlUbxC
 v7nhR8BT/K7bZDNBZAsViBbsXje9xPNjOhbHyvAdxl1tt3WR4k45pW9nInvcotXVin/C
 hPBZwrfhcIzfj2WLJGIJMLhjsMiIsmlH61Ya+/bfKBbFvvew6B549EjXqLoIY7ajmlj5
 who8iAH3DWXRqaHIInSE1WPuEIR4XFood7iCMz1HSYmHpj5E9RG1jhh3iPRy3hC9Danm
 oANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=e1hN6u3b87oGXUwDtR5NW7sGRX93ClE7I6RCTP747nA=;
 b=QEsQUbBavFeRCvu99Y3pr8yrR/imzqAynkIwA+fapIVqeurFxOdET2olfi8oGM1mm3
 EsHt+G3rHsOR7aKFLgrx5Cf27YYHpHHaipYQrjrBqWhmAcZo+w8DaE977wB3nc8RXOKV
 jIzrq6LRGuxhWHyqvFBOAVBSWXNM0ZIxWSsd0tgDWRes8AmcDSHQuZd7vYk/ovQnDUiK
 dza3kAsODwmQefxTFVR/HckZpfMZKSDyfXH+9tq8lcu+/ODlBa/umPvRYR7TGDC0HAQv
 ejstK51rAVUkFmL0K6MsL5Vede1RNOSiuBk4A9zmol/u7RlasI0USvTo4Z0K5nkLS9oe
 oDOQ==
X-Gm-Message-State: ACgBeo3rFwGHnPtpRFfLJUHlCxShg6DJ9uXMoVS72lCjfqZWZGDuEOUI
 BlPDAsEoKh1ErcuX0NRwFZmD/pZQWlSh82L6scE=
X-Google-Smtp-Source: AA6agR5v0PT16Rdmu1bSg98MXyeZl7RNSOvY0CUjkIpj4W8Ea2EcduQQvevDfM4Dpo6TfmHeijnijA==
X-Received: by 2002:a05:651c:105a:b0:267:5d3d:2b25 with SMTP id
 x26-20020a05651c105a00b002675d3d2b25mr823185ljm.370.1661856678233; 
 Tue, 30 Aug 2022 03:51:18 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056512368800b004946bec4e61sm684730lfs.140.2022.08.30.03.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 03:51:17 -0700 (PDT)
Message-ID: <34fd836d-56f1-3d88-0571-349aef95fe96@linaro.org>
Date: Tue, 30 Aug 2022 13:51:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ASoC: codecs: allow compile testing without MFD drivers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
 <YwkSi1IIRsW2Hc/u@sirena.org.uk>
 <a5266af6-af19-48f9-8bc6-94c171ba6d0c@linaro.org>
 <Yw3oA6pVp3PMxfA3@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yw3oA6pVp3PMxfA3@sirena.org.uk>
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

On 30/08/2022 13:35, Mark Brown wrote:
> On Sat, Aug 27, 2022 at 12:02:39PM +0300, Krzysztof Kozlowski wrote:
> 
>> True, it's not the same build coverage need as subsystem/interface
>> dependencies, but still:
>> 1. Drivers can be built independently, so why not?
>> 2. There is no drawback in allowing to building them independently
>> (compile test).
>> 3. The parent MFD device could also depend on something (RK817 and
>> MFD_LOCHNAGAR depends on I2C and OF; CPCAP on SPI), so it's not always
>> the case of just enabling parent. IOW, you can compile test codecs
>> without I2C and SPI which is valuable itself.
> 
>> I find the last reason actually quite valid and applicable here. If you
>> wish I can add it to the commit msg.
> 
> You've already found one case where there's a dependency being
> pulled in by the parent, I suspect there's more.  There's a
> tradeoff between getting coverage and having to deal with the
> noise from randconfigs.

Yeah, that was my mistake because did not spot it has "select
REGMAP_I2C". For such cases the benefit is indeed gone.

Best regards,
Krzysztof
