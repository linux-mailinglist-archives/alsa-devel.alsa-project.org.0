Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FC53B1A6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 04:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E161749;
	Thu,  2 Jun 2022 04:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E161749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654136005;
	bh=zfWnBsCpphEUOAd/bMtH899shOhmko7wvrzUwJJZjvY=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJLhafnUEbJHb+Eks7MqFV3K0VD4BPzRk+1bKddBQAJ0JkS2wro/PoM/zkfmWyNqx
	 hleRjhrjBaooHxphvd0NANtn6jP4a/zluPMeefD8s+hJG2NMQkfJKeFvrqnbsg+/p0
	 AgBex4AqVv8M81IV+uwY8wRWmECCL/vX/H7j3MqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECE22F80149;
	Thu,  2 Jun 2022 04:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB2D3F80236; Thu,  2 Jun 2022 04:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E40C7F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 04:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E40C7F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Wz0UvIBt"
Received: from [192.168.0.109] (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C74943F10B; 
 Thu,  2 Jun 2022 02:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654135937;
 bh=yDM/Dexw2A3CpIrWAR2wuVCIZtw6z04gxUCdUmDTxqA=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
 In-Reply-To:Content-Type;
 b=Wz0UvIBtistwWUeTfPhoOUwppYkDokQS691pmhXU0fYjBhbtvwl5a1sOQemk43+an
 klkYiQ/+w1VSHILL9d8coVaXEtOO3iXfQjC4JUY/xDTkl2MdZ3zPVO+iI7asKXFVwZ
 kjq0TcszL0FfVc0tQa42bBOaDdP+I0z0vQb2N5bWuaN+hLAlx3Y07DOabSNnh0/ZeY
 ggkNuQM1vfPD2CjHHB2KRHlk+bU6+mF7zAEMP1aYEvNVuFlSNFAUSU2TwQUTzWTBfG
 ZQUVhgB+zMrb8uZAx0ZDzx+D9SsbWJ3+ON/UWMJdGoYRU8a9ThPopDJMBJcHC5DU4j
 rRbRQpNwUVoxw==
Message-ID: <db674fa6-37cc-9dc6-ed87-f9fee681db9a@canonical.com>
Date: Thu, 2 Jun 2022 10:12:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ASoC: nau8822: Disable internal PLL if freq_out is
 zero
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-3-hui.wang@canonical.com>
In-Reply-To: <20220530040151.95221-3-hui.wang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: wtli@nuvoton.com, ctlin0@nuvoton.com, kchsu0@nuvoton.com,
 ctlin0.linux@gmail.com
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

Hi Mark,

I saw you merged the [PATCH 1/2], the [PATCH 2/2] is also needed. Please 
take a look.

Thanks,

Hui.

On 5/30/22 12:01, Hui Wang wrote:
> After finishing the playback or recording, the machine driver might
> call snd_soc_dai_set_pll(codec, pll_id, 0, 0, 0) to stop the internal
> PLL, but with the codec driver nau8822, it will print error as below:
>   nau8822 0-001a: Unsupported input clock 0
>   fsl-asoc-card sound-nau8822: failed to stop FLL: -22
>
> Refer to the function wm8962_set_fll() in the codec driver wm8962, if
> the freq_out is zero, turn off the internal PLL and return 0.
>
> Cc: David Lin <ctlin0@nuvoton.com>
> Cc: John Hsu <kchsu0@nuvoton.com>
> Cc: Seven Li <wtli@nuvoton.com>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   sound/soc/codecs/nau8822.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> index b436e532993d..4d3720c69f91 100644
> --- a/sound/soc/codecs/nau8822.c
> +++ b/sound/soc/codecs/nau8822.c
> @@ -726,6 +726,13 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
>   	struct nau8822_pll *pll_param = &nau8822->pll;
>   	int ret, fs;
>   
> +	if (freq_out == 0) {
> +		dev_dbg(component->dev, "PLL disabled\n");
> +		snd_soc_component_update_bits(component,
> +			NAU8822_REG_POWER_MANAGEMENT_1, NAU8822_PLL_EN_MASK, NAU8822_PLL_OFF);
> +		return 0;
> +	}
> +
>   	fs = freq_out / 256;
>   
>   	ret = nau8822_calc_pll(freq_in, fs, pll_param);
