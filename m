Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE33367E16
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 11:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08EB31679;
	Thu, 22 Apr 2021 11:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08EB31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619084861;
	bh=CaTEzbbbeefQXYEt574eh+VIFyRZ2B/OwuhIezaGvmo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ot0wp446Nl9qF/MNME63dRIJbRDWNHcHtDdeXbmNv3mIqLDjUtzlxhdwIWMiVVR2C
	 Mq9l8rZzEEvJbk66Bsj7On3xFa5KsEangXniauwcZMRVgJ6OsmYUHLVaDxOuFed/Aw
	 0NmPaNzrg7Jla18IMg3vHnNGy4GkGylBuDYagX7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD569F80273;
	Thu, 22 Apr 2021 11:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C053BF80253; Thu, 22 Apr 2021 11:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0068BF80134
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 11:46:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7FFB8A003F;
 Thu, 22 Apr 2021 11:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7FFB8A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1619084766; bh=ItBe+4EUtt0t7GHhD5n5IHorl069ou06FjKZ/aUIwgw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=4B4O7hKCS+k4dtKyxK2BwmTYJyx+10OpxdWHq5UswqRfQk+km9GjmVdc0QsC8CNZE
 xZTYB9keS8KI2mV7Hcsat34D7m01NPdxURVcHppIkMQH7/NzAru+sGjGi0y52r+7k3
 1J69ri6tlNYpIknXjfkK3KTFpjoaTHYeHModTh/U=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 22 Apr 2021 11:45:55 +0200 (CEST)
Subject: Re: [PATCH] ASoC: rt711-sdca: add the notification when volume changed
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20210422090855.2971-1-shumingf@realtek.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fd140a1d-d1cf-1894-5925-ff63da347d09@perex.cz>
Date: Thu, 22 Apr 2021 11:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422090855.2971-1-shumingf@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, libin.yang@intel.com, derek.fang@realtek.com,
 flove@realtek.com
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

Dne 22. 04. 21 v 11:08 shumingf@realtek.com napsal(a):
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds the return value when the volume settings were changed.
> The userspace application might monitor the kcontrols to check which control changed.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  sound/soc/codecs/rt711-sdca.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
> index 3ab9048b4ea3..98b26bd69e19 100644
> --- a/sound/soc/codecs/rt711-sdca.c
> +++ b/sound/soc/codecs/rt711-sdca.c
> @@ -509,12 +509,16 @@ static int rt711_sdca_set_gain_put(struct snd_kcontrol *kcontrol,
>  		(struct soc_mixer_control *)kcontrol->private_value;
>  	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
>  	unsigned int read_l, read_r, gain_l_val, gain_r_val;
> -	unsigned int i, adc_vol_flag = 0;
> +	unsigned int i, adc_vol_flag = 0, changed = 0;
> +	unsigned int lvalue, rvalue;
>  
>  	if (strstr(ucontrol->id.name, "FU1E Capture Volume") ||
>  		strstr(ucontrol->id.name, "FU0F Capture Volume"))
>  		adc_vol_flag = 1;
>  
> +	regmap_read(rt711->mbq_regmap, mc->reg, &lvalue);
> +	regmap_read(rt711->mbq_regmap, mc->rreg, &rvalue);
> +
>  	/* control value to 2's complement value */
>  	/* L Channel */
>  	gain_l_val = ucontrol->value.integer.value[0];
> @@ -560,6 +564,9 @@ static int rt711_sdca_set_gain_put(struct snd_kcontrol *kcontrol,
>  		gain_r_val &= 0xffff;
>  	}
>  
> +	if (lvalue != gain_l_val || rvalue != gain_r_val)
> +		changed = 1;

I think that it's safe to return early with the zero return value here? Why to
rewrite the identical value in the hw registers?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
