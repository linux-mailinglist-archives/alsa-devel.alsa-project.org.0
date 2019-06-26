Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3DC569A7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 14:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D46169D;
	Wed, 26 Jun 2019 14:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D46169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561553222;
	bh=C6WyNXCGQdIAWeJ1OUnIfMUTM/yEi85c0UF2HHUefcY=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtZobtMbL/0lQQtmX+QEYImKcz7PgCQ+eirCWJXtmkUEecln0H5i/ZcjOQsHxyye7
	 +Pxm1Bg5h2HNqx1CZNWGCTd2L2GEv9LkwJhG5jSLOpbl6EpK218nuY+io1f3JcQ8Dp
	 L7Pgd3R+MQ+qqwwt5jS7GWi/T34d3GHzIgYMBZlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E672EF806F0;
	Wed, 26 Jun 2019 14:45:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B571F896B9; Wed, 26 Jun 2019 14:45:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from submit-3.e-mind.com (submit-3.e-mind.com [188.94.192.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DDADF806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDADF806F0
Received: from localhost (unknown [127.0.0.1])
 by submit-3.e-mind.com (Postfix) with ESMTP id 6491284388E
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 12:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at emind.it
Received: from submit-3.e-mind.com ([127.0.0.1])
 by localhost (submit-3.e-mind.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHv38-3RjS9D for <alsa-devel@alsa-project.org>;
 Wed, 26 Jun 2019 14:45:12 +0200 (CEST)
Received: from qmail.e-mind.com (qmail34.e-mind.com [188.94.192.34])
 by submit-3.e-mind.com (Postfix) with SMTP id 1B4A7830F4B
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 14:45:12 +0200 (CEST)
Received: (qmail 31243 invoked by uid 0); 26 Jun 2019 12:45:12 -0000
Received: from unknown (HELO ?192.168.143.6?) (185.53.252.165)
 by 0 with SMTP; 26 Jun 2019 12:45:12 -0000
To: alsa-devel@alsa-project.org
References: <20190626104947.26547-1-codrin.ciubotariu@microchip.com>
From: gianluca <gianlucarenzi@eurek.it>
Message-ID: <49c769f6-f962-b863-454b-95dd44591ee3@eurek.it>
Date: Wed, 26 Jun 2019 14:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20190626104947.26547-1-codrin.ciubotariu@microchip.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: codecs: ad193x: Fix memory
 corruption on BE 64b systems
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/26/2019 12:49 PM, Codrin Ciubotariu wrote:
> Since change_bit() requires unsigned long*, making this cast on an
> unsigned int variable will change a wrong bit on BE platforms, causing
> memory corruption. Replace this function with a simple XOR.
>
> Fixes: 90f6e6803139 ("ASoC: codecs: ad193x: Fix frame polarity for DSP_A format")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  sound/soc/codecs/ad193x.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
> index 05f4514048e2..3ebc0524f4b2 100644
> --- a/sound/soc/codecs/ad193x.c
> +++ b/sound/soc/codecs/ad193x.c
> @@ -240,10 +240,8 @@ static int ad193x_set_dai_fmt(struct snd_soc_dai *codec_dai,
>  	}
>
>  	/* For DSP_*, LRCLK's polarity must be inverted */
> -	if (fmt & SND_SOC_DAIFMT_DSP_A) {
> -		change_bit(ffs(AD193X_DAC_LEFT_HIGH) - 1,
> -			   (unsigned long *)&dac_fmt);
> -	}
> +	if (fmt & SND_SOC_DAIFMT_DSP_A)
> +		dac_fmt ^= AD193X_DAC_LEFT_HIGH;
>

BigEndian RULEZ! ;-P


-- 
Eurek s.r.l.                          |
Electronic Engineering                | http://www.eurek.it
via Celletta 8/B, 40026 Imola, Italy  | Phone: +39-(0)542-609120
p.iva 00690621206 - c.f. 04020030377  | Fax:   +39-(0)542-609212
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
