Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF545622BF4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 13:56:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47C3E82C;
	Wed,  9 Nov 2022 13:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47C3E82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667998561;
	bh=uWzX1BXuxng/Tru2HX1P8/7DV2EM1E7fd6emjv2DXGw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hMkZWMfBSI8R3FSUeaa32opioNbWMoJG+fIPq4Q7siJ94Nb58a2my4Uukwh+Z3Q3z
	 aCAAlWpNWVECwwJIUNTywRCf000m+aesj1FXNlcaF90CjIagmQzjHoDNVVMDcDDjm1
	 FBTwY8Af/GXCnrX/yLNBLvWmJCtfHrz+pkCkgEQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0A8F8023B;
	Wed,  9 Nov 2022 13:55:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50A4EF80217; Wed,  9 Nov 2022 13:55:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A34CEF80114
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 13:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34CEF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="FhwdS55f"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BCD2284FE8;
 Wed,  9 Nov 2022 13:54:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667998500;
 bh=ntvJuaH/z37Of6KcTp5JrJWfzFxrW8j05Lt4rDfmM54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FhwdS55f5JqM+AOCzTfnP1CAB/F0yR3uHGNGU5KnjpPBlXN5o8Zaly8bYjRLcI+oD
 dtvVys65xdVGSpzp6eVfICm5AAviwpggyC//X/dr+p1W00ib+x8dwgxyd4ZeymdEU7
 STm6hDZnwF7RSp2zYwOB5fVG+TGUTDfDLSX5wvtBvysX0TdyH2iht658ZextPhfllX
 jBV0F3nJGMj5IsTbIx5JedEbOXltFvWAKNLKL1ZsBxqvXaMGLFtR50DCpBfJZsJwNC
 1pro3yfed0fRQascQOVLKpgwMZazAaF2Png8EajfrQscaOoq2BIYD7jwbPDc0Kjj7k
 1is2xrMbN7ktA==
Message-ID: <654da7a3-20fa-e84d-9050-5c6fcb7d6f3b@denx.de>
Date: Wed, 9 Nov 2022 13:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] ASoC: fsl_sai: Enable transmitter when generating MCLK
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <20221107215201.434212-1-marex@denx.de>
 <CAA+D8AOCqfeVVPwJjLeniWSWeOZjL-64Hktsa===1fs7j96oYw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8AOCqfeVVPwJjLeniWSWeOZjL-64Hktsa===1fs7j96oYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
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

On 11/9/22 10:30, Shengjiu Wang wrote:

[...]

>> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
>> index 1c9be8a5dcb13..98c62027e5799 100644
>> --- a/sound/soc/fsl/fsl_sai.c
>> +++ b/sound/soc/fsl/fsl_sai.c
>> @@ -503,6 +503,10 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai,
>> bool tx, u32 freq)
>>                  /* SAI is in master mode at this point, so enable MCLK */
>>                  regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>>                                     FSL_SAI_MCTL_MCLK_EN,
>> FSL_SAI_MCTL_MCLK_EN);
>> +
>> +               /* Transmitter must be enabled to generate MCLK on pad */
>> +               regmap_update_bits(sai->regmap, FSL_SAI_xCSR(1, ofs),
>> +                                  FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
>>
> 
> No need to fix the transmitter,   FSL_SAI_xCSR(tx, ofs) should work also.

That's probably not a good idea, since this could also enable the 
RE(receiver) part . We always need to enable the TE(transmitter) to 
generate MCLK.

>>          }
>>
>>          return 0;
>> @@ -1445,6 +1449,11 @@ static int fsl_sai_probe(struct platform_device
>> *pdev)
>>              sai->soc_data->max_register >= FSL_SAI_MCTL) {
>>                  regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
>>                                     FSL_SAI_MCTL_MCLK_EN,
>> FSL_SAI_MCTL_MCLK_EN);
>> +
>> +               /* Transmitter must be enabled to generate MCLK on pad */
>> +               regmap_update_bits(sai->regmap,
>> +                                  FSL_SAI_xCSR(1,
>> sai->soc_data->reg_offset),
>> +                                  FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
>>
> 
> After one time playback or recording,  the TERE is disabled, so this changes
> in probe() only for the first time.  There is the same issue for the second
> time.

So what would you suggest to keep the MCLK clock generated always ?

I was almost tempted to turn the SAI into a clock provider, so that the 
codec could become its clock consumer and enable the MCLK on demand, but 
that seems to be a rather invasive change.
