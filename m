Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E112B58D5B0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 10:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 884BD847;
	Tue,  9 Aug 2022 10:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 884BD847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660034944;
	bh=lX+lmB2bOCIHIG6V9Xjug1gYAZT+S3Rv8iJmJjEUzZU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ooouavsDuuNgeYID2ZwU3uFh/zZoC6tFdw0Ha52g3Mv/GQycWZwMhUGVmz0kzF1mr
	 eRgo9U+WDVT2ti7Zc1f6p7ELQAntugouNz0Tps80rxIUtajGBtd4SO6+y42mOB80wv
	 b9EzBWghdnhaAY6lw6yIU7wvunnwsY1wKDtO3WMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26FA6F8016C;
	Tue,  9 Aug 2022 10:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 212DCF8049C; Tue,  9 Aug 2022 10:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71803F8016C
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 10:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71803F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e/vdzEJt"
Received: by mail-lf1-x12f.google.com with SMTP id f20so16032145lfc.10
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5ZRqoSrGd+BoiYjAKUkI728rotE5kN9fSo4lEQOI+8g=;
 b=e/vdzEJtB1SxPZDhfRGHx30J19/pApV7RI9Lxl4m7eRLimeRmgkEdJtwR7BdT3fM+x
 oDBNdrUKj8TMdURTdwOe4eh9buM5Ow196l0vHWvk//YSyj2pH1Yknob9RfDH/WMimZEK
 BByitWQFDuKFJljHKxEirForcLNpkBSNdM0H00Ov4sQR1swxmH/bR8b0wuMs+G/fQ0hv
 NBb0vYl8GmBq8pDqqncy8CFfCy7hcTiDsEu9hwEo+YRHDsgv+pPNvTyKG9oBS1lcSM/T
 a4/x7RvfqdUgD29yEhrwneZgtIpiImnRa9yS2umOHlVBtnQWXFEZb4kOL1HIUHebCsSz
 N96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5ZRqoSrGd+BoiYjAKUkI728rotE5kN9fSo4lEQOI+8g=;
 b=UekQJlHLhOHMPmnhZlJMWUw4vwtXbPNtSuiBd/58T8qH/uFzGY8OFcmYgPrUMOzhGJ
 eH1NSxPoNXkZdjnVrxc1pE0A6BwC4Ywt7u8Iwzotc7xfimH0byQMT9rWtQUq0Ky/nDtJ
 r076DODogAMu1Me+mZOEidivUdvRfOQdv5RrZB4ZaIvD16vGoE4dd1WG3g5gHdMFo4Wx
 GdJywWXMfbA2ogKcuQqtgcx/g2vy3r4eweTTVBu0szfEgsh08o5ZX3i/Lh5JnDaIvWpL
 ubFgxSlKOtAn/yGUKGEpMMJIkXxrBc51dPuSolNc4CSDU6Iyuuu/vuxV6cJRinmdnVLi
 rDlg==
X-Gm-Message-State: ACgBeo1gYlLOMVJRXAqIdUzrbTLTlKQ57nmjV2l1Df1kjXpZSBorYByk
 1es2qcpS8ojtM4QzDM0ZEP+H2A==
X-Google-Smtp-Source: AA6agR57Vn8Xw6JF+3882osCvRfCsBG2iGD79k+lEHgjvxuNyg827VQ/Js1yrlfXCIevi5KIpnLazg==
X-Received: by 2002:a05:6512:3b8e:b0:48b:23c6:9b0 with SMTP id
 g14-20020a0565123b8e00b0048b23c609b0mr8176669lfv.470.1660034866470; 
 Tue, 09 Aug 2022 01:47:46 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a197416000000b0048ad4c718f3sm1687682lfe.30.2022.08.09.01.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 01:47:45 -0700 (PDT)
Message-ID: <cbe80ae1-3ae8-eccf-89f7-4506e3f44ca7@linaro.org>
Date: Tue, 9 Aug 2022 11:47:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-2-povik+lin@cutebit.org>
 <8ce59940-f559-35cb-5f86-37399da166a1@linaro.org>
 <DCBCB694-F5A3-4E76-9518-89E9A1A4AB55@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DCBCB694-F5A3-4E76-9518-89E9A1A4AB55@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 09/08/2022 11:40, Martin Povišer wrote:
>> Describe the items because otherwise you allow any order. The list will
>> be unfortunately quite long, but still readable enough.
> 
> Well, I would assume the ‘dmas’ property as described above has an implicit
> natural order, and the dma-names are tied to it. You order it like the other
> per-cluster properties, and then within the cluster the order is fixed to
> 'TXA, RXA, TXB, RXB’ (maybe the word ‘respectively’ thrown into the description
> would have made it clearer).
> 
> Anyway that’s just discussing my assumptions. I can roll out the items list
> for ‘dma-names’, if that’s what you mean. Or do you mean explicitly describing
> the items in ‘dmas’ too?

The text description of 'dmas' does not mean it will be followed by DTS
author. In current bindings DTS author can therefore put any order of
dmas/dma-names. Unrolling the dma-names forces this order to be fixed
and validated by dtschema.

> 
>>> +    description: |
>>> +      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
>>> +      based on the associated SERDES unit.
>>> +
> 
> (...)
> 
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    mca: mca@9b600000 {
>>
>> You called it I2S transceiver but isn't it also actually I2S controller?
>> If yes, then the node name should be probably "i2s".
> 
> It’s a peripheral you use to transmit and receive samples over I2S, frankly
> I don't know the nomenclature.

Looking at other devices, it's i2s.

Best regards,
Krzysztof
