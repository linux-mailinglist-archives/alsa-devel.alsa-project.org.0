Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A7651358
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 20:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989E42D24;
	Mon, 19 Dec 2022 20:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989E42D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671478537;
	bh=JRGh6/dJijfH08CnryvvlbINZp9TPPzJbpHifkBvc9M=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ns4tHtMqCSfzkOA7c//qC4AE3PytpVw6Oj1FoyGA6dtVNYn7gTgks1ZhrPZz0X2C9
	 uxWTgAU4bD+iyZ5jgxFlmEnqLRp0nzrDYY/DOMvCV6F22QD9mJ+htyuFBggq7gqjdL
	 2/7gd+NAHweH4lb2jSWGPE4DJfH5UlVOPB58yB4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F11F804B2;
	Mon, 19 Dec 2022 20:34:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C07E9F801C0; Mon, 19 Dec 2022 20:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ADC3F801C0
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 20:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ADC3F801C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=rNpb5lRt
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8693285310;
 Mon, 19 Dec 2022 20:34:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671478480;
 bh=1eLAR3fyef6lDX8EG3jsRJBXd0ojRiulbUxgMKisOgc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rNpb5lRt6bLTuGkmtV8YG+XKeafcrTIhKvhjl+27/ewzmxaEIGqoD6cLZ581JOOUg
 tKi2s8zrO4QdJCYY/x9QVid8CrkUX8yybj65Ht6RUrYGCneD+Rv0xU0on6sJuDWsgq
 3DawhmO8s6okuOIdDUgJsl4jxre35Vim3huTOkkZUGXNdtWu1BEZZe9ZWlQ+Ah50/m
 m3nNZUrsxnbZ6XJ1FFJJ0OvroO4qOofgOWs8RWyQRjUlnTor0PBMSVfasYEA7c+YSr
 4bd5ARN3o/AvWZA77MMsXrw+UM28YxqGGluYKrxo0oEpg8KiUCDv5YXcgifu92QRJ1
 znf48pEay/wdw==
Message-ID: <80d63371-46b7-7638-cf2c-77136edba149@denx.de>
Date: Mon, 19 Dec 2022 20:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] ASoC: fsl_sai: Export transmitter MCLK as clock
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <20221211024109.671538-1-marex@denx.de>
 <20221211024109.671538-2-marex@denx.de>
 <CAA+D8AOVkboaPD3JfL2NcP+hsVec9oHvx9rBjkwgMBYnuZj7mA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8AOVkboaPD3JfL2NcP+hsVec9oHvx9rBjkwgMBYnuZj7mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/19/22 10:18, Shengjiu Wang wrote:

[...]

>> +       if (tx_keep_tere) {
>> +               regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &tcsr);
>> +               tcsr &= FSL_SAI_CSR_TERE;
>> +       }
>>
>>          if (tx)
>> -               regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
>> FSL_SAI_CSR_SR);
>> +               regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
>> FSL_SAI_CSR_SR | tcsr);
>>          if (rx)
>> -               regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
>> FSL_SAI_CSR_SR);
>> +               regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
>> FSL_SAI_CSR_SR | rcsr);
>>          usleep_range(1000, 2000);
>>
> 
> Not sure if you have test your patch.

On the hardware I have available, MX8MNano EVK is not one of them.

> there is kernel dump for "scheduling while atomic"

Is it still there if you replace the usleep_range() with udelay() ?

> [  248.778590] BUG: scheduling while atomic: swapper/0/0/0x00010003
> [  248.784618] Modules linked in:
> [  248.787677] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 6.1.0-rc6-00014-gf2b129b4c056-dirty #136

[...]

>> @@ -1295,6 +1356,13 @@ static int fsl_sai_probe(struct platform_device
>> *pdev)
>>          int irq, ret, i;
>>          int index;
>>          u32 dmas[4];
>> +       const char *mclk_parent_names[FSL_SAI_MCLK_MAX];
>> +       const char *mclk_rxtx_names[2] = { "mclk_rx", "mclk_tx" };
>>
> 
> please consider multi sai instance case, this name will duplicate
> that cause sai probe issue.

What kind of issue ? Details please.

[...]
