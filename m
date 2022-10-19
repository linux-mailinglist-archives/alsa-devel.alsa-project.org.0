Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C0603A75
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 09:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A12AB80;
	Wed, 19 Oct 2022 09:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A12AB80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666163852;
	bh=PNz7uS1aj4ZKrQKIThk6c8Nr7eXMO0Gj7OJFtPYa1bU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2U4aarisih7ZdCImdImG92uA1uSUAVKkMfPpT3oQR2uPTq/5lQT2p9CA7BrnDphk
	 dKG5NoBVS2e7EaFJSHpUy5h0bVBAkGRKsW54AaCmynxF42I8t8ejaUFNJDTD021ndF
	 rSNqG/YGbbUmegMiTciVtd9AG3qfvmqohPIp0e50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30E72F804CC;
	Wed, 19 Oct 2022 09:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0370AF80166; Wed, 19 Oct 2022 09:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BACB9F804CC
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 09:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BACB9F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="CVe1tmmx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=5UtqZavdKpTg1FruydvA10Sn7lC8SdZCH7ZT7Um1HY0=; b=CVe1tmmxyiuv2se9MJNcky/8sZ
 aMQilixXg7sg+p8wxP8AFDAcgQjMs1RHlUCzHCH1/fguhTEngFJXBmcjHcPhpiYVAqhfnBga92abV
 khjwxXZpM9/V0JZK3YTFqpmCJhETlF14QYECPq4+BVEsMVkf9Ny3tv/gV40YZirmKYHD6sb1f7wz8
 XGQFAsvcKsTOjG1jIGQ5x3V88LE2+V3cLuByzSnC4hdmbyeOxN+/CQojMjTGXjLav6299SO1pPxXh
 /VZfQvZwkFVxaS/Lp2+OPkJoW6M5CKs21YfphE3lQlB/1cgvqqGOhf5yLKpbyshC7duTU+XUQ3XgN
 EWCQgYVQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <lars@metafoo.de>)
 id 1ol3JZ-000Fv7-RH; Wed, 19 Oct 2022 09:16:33 +0200
Received: from [2001:a61:2a91:5601:9e5c:8eff:fe01:8578]
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ol3JZ-0009TQ-Fo; Wed, 19 Oct 2022 09:16:33 +0200
Message-ID: <fbdd3785-af5b-66de-f882-a008c87642dd@metafoo.de>
Date: Wed, 19 Oct 2022 09:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][next] ASoC: codecs: jz4725b: Fix spelling mistake "Sourc"
 -> "Source"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20221019071508.1003680-1-colin.i.king@gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20221019071508.1003680-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26693/Tue Oct 18 10:02:42 2022)
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 10/19/22 09:15, Colin Ian King wrote:
> There is a spelling mistake in codec routing description. Fix it.
There is also "Routee" in the same string
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   sound/soc/codecs/jz4725b.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
> index 685ba1d3a644..64b14b1c74b9 100644
> --- a/sound/soc/codecs/jz4725b.c
> +++ b/sound/soc/codecs/jz4725b.c
> @@ -359,7 +359,7 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
>   
>   	{"Mixer to ADC", NULL, "Mixer"},
>   	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
> -	{"ADC Sourc Capture Routee", "Line In", "Line In"},
> +	{"ADC Source Capture Routee", "Line In", "Line In"},
>   	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
>   	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
>   	{"ADC", NULL, "ADC Source Capture Route"},


