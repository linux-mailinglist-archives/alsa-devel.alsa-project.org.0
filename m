Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FD468D0C
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Dec 2021 20:46:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3B21FE9;
	Sun,  5 Dec 2021 20:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3B21FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638733585;
	bh=NbxBs+rLhz7DY+OHZvE0gMHQdrXXJ2h6K2MW0sO0NqQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVzxebN7xKFe3bzPgSZ7NFEWwlfixwphSyeejr1nnzS9w89Vb4cObO4cysp54N0Nu
	 rD2TdmJoAvStqaFm6YJUm0zC0W/F6vmCwqHD4RUao/Po9GL4aeQlqOjw+La9B0+559
	 ojh3nLlcvck9W/hC6N8d+Q7/C5iwBMfZcnJK3w+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD63F80259;
	Sun,  5 Dec 2021 20:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4BDAF80253; Sun,  5 Dec 2021 20:45:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A877F800D3
 for <alsa-devel@alsa-project.org>; Sun,  5 Dec 2021 20:44:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A877F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TWk7BWRP"
Received: by mail-ua1-x936.google.com with SMTP id y5so15655181ual.7
 for <alsa-devel@alsa-project.org>; Sun, 05 Dec 2021 11:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gtz/VzjjbhkToF0+6cC/2TR2vWW6aY++Pm5UStTAt9Q=;
 b=TWk7BWRPtzn6D1LaV9chGuFiPOJqclWlUXOg7rfrEL629L4X9lWy4rGoTIY+rByv2f
 vvjPyWb3Ea8YXLUu2lqVosWno+3+QPX25OWw7IRugaCop0M0mB6cNRhmr+JkqJWtdgIt
 z/2R1/LWhImFYiSGqbJTPSFT7dmqTbpyrnbPkIScBugrcAv4b+fl0G5rMRA3/pMAYBmp
 LXUrGEXVd8Dm/6TL/9NI59IjdzOG8s9gfkkJfOABNveea1nWzM9MBGRlHCzJUaDUF4QH
 SSVVJZX3oIzdITuAqESBqhJNCEZdyMDX/8b9WxK8thvKXWyAj66IDPbB5THthnALUaky
 D8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gtz/VzjjbhkToF0+6cC/2TR2vWW6aY++Pm5UStTAt9Q=;
 b=I1WbhSS6+U/B7ZBF5BEcQU534iTJDP/ix6OAd0+bvltjCg+Y3Lg8OPFFjBT2Vk6DDj
 P9yB5/7zaaaQVG2VZ+BeFXly53WSHZ2hRdJy+I4g4AwUJrOCk6eVEwzNzIwx4TRiO8Aj
 RTHm/MWg3vXqorVYpe4nOift74qD4iVqF7qwWiDmUObjOJwvOzCZt0MgGpcUBO//mlhi
 Lu2J9XTQNCyr0T7E539UXUdcXCLq4/p5VjD2okjQpn5tZpZe+5FP9eFtMmTJ6HJgL9nU
 FXXYucjSCmupoh3J8Gy9Jd2ytwync9XUSBJCLcysV7vbvyqyTonNaQYGKbUfRrnM1OWm
 IWsw==
X-Gm-Message-State: AOAM532aWcgy8HS3pLE2lFY1q0DFrBGYSLZzcVRtiQFXqnrXfXD2DlHA
 oV+4rYDm0uUO65/wtOA4fFA=
X-Google-Smtp-Source: ABdhPJxp8GScozvL46XQQm5tW6XjZEkboBEUIoqGE2TDwd+TM7QEGE2ZyLgN03vRJTZbGKaObnuNew==
X-Received: by 2002:a67:e114:: with SMTP id d20mr33380850vsl.5.1638733488967; 
 Sun, 05 Dec 2021 11:44:48 -0800 (PST)
Received: from geday ([2804:7f2:8006:7fbf:244a:c69a:867a:5798])
 by smtp.gmail.com with ESMTPSA id 186sm2813179vsd.30.2021.12.05.11.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 11:44:48 -0800 (PST)
Date: Sun, 5 Dec 2021 16:44:46 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
Message-ID: <Ya0WrrhpJ+NuAVTj@geday>
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

Hi, Martin,

Thanks for working on this!

I will give it a test and let you know.

Thanks,
Geraldo Nascimento

On Sun, Dec 05, 2021 at 07:08:16PM +0100, Martin Blumenstingl wrote:
> The out-of-tree vendor driver uses the following approach to set the
> AIU_I2S_MISC register:
> 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
> 2) configure AIU_I2S_MUTE_SWAP[15:0]
> 3) write AIU_MEM_I2S_END_PTR
> 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
>    mode")
> 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
>    stays at 1 while for older drivers this bit is unset in step 4)
> 6) set AIU_I2S_MISC[2] to 0
> 7) write AIU_MEM_I2S_MASKS
> 8) toggle AIU_MEM_I2S_CONTROL[0]
> 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
> 
> Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
> interrupts are generated anymore. The way this bit is managed by the
> vendor driver as well as not getting any interrupts can mean that it's
> related to the FIFO and not the encoder.
> 
> Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
> closer resembles the flow in the vendor kernel. While here also
> configure AIU_I2S_MISC[4] (documented as: "force each audio data to
> left or right according to the bit attached with the audio data")
> similar to how the vendor driver does this. This fixes the infamous and
> long-standing "machine gun noise" issue (a buffer underrun issue).
> 
> Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
>  sound/soc/meson/aiu-fifo-i2s.c    | 12 +++++++++++
>  2 files changed, 12 insertions(+), 33 deletions(-)
> 
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 932224552146..67729de41a73 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -18,7 +18,6 @@
>  #define AIU_RST_SOFT_I2S_FAST		BIT(0)
>  
>  #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
> -#define AIU_I2S_MISC_HOLD_EN		BIT(2)
>  #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
>  #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
>  #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
> @@ -36,37 +35,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
>  				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
>  }
>  
> -static void aiu_encoder_i2s_hold(struct snd_soc_component *component,
> -				 bool enable)
> -{
> -	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> -				      AIU_I2S_MISC_HOLD_EN,
> -				      enable ? AIU_I2S_MISC_HOLD_EN : 0);
> -}
> -
> -static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
> -				   struct snd_soc_dai *dai)
> -{
> -	struct snd_soc_component *component = dai->component;
> -
> -	switch (cmd) {
> -	case SNDRV_PCM_TRIGGER_START:
> -	case SNDRV_PCM_TRIGGER_RESUME:
> -	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		aiu_encoder_i2s_hold(component, false);
> -		return 0;
> -
> -	case SNDRV_PCM_TRIGGER_STOP:
> -	case SNDRV_PCM_TRIGGER_SUSPEND:
> -	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		aiu_encoder_i2s_hold(component, true);
> -		return 0;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
>  static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
>  				      struct snd_pcm_hw_params *params)
>  {
> @@ -353,7 +321,6 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>  }
>  
>  const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
> -	.trigger	= aiu_encoder_i2s_trigger,
>  	.hw_params	= aiu_encoder_i2s_hw_params,
>  	.hw_free	= aiu_encoder_i2s_hw_free,
>  	.set_fmt	= aiu_encoder_i2s_set_fmt,
> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
> index 2388a2d0b3a6..d0a1090d6465 100644
> --- a/sound/soc/meson/aiu-fifo-i2s.c
> +++ b/sound/soc/meson/aiu-fifo-i2s.c
> @@ -20,6 +20,8 @@
>  #define AIU_MEM_I2S_CONTROL_MODE_16BIT	BIT(6)
>  #define AIU_MEM_I2S_BUF_CNTL_INIT	BIT(0)
>  #define AIU_RST_SOFT_I2S_FAST		BIT(0)
> +#define AIU_I2S_MISC_HOLD_EN		BIT(2)
> +#define AIU_I2S_MISC_FORCE_LEFT_RIGHT	BIT(4)
>  
>  #define AIU_FIFO_I2S_BLOCK		256
>  
> @@ -90,6 +92,10 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
>  	unsigned int val;
>  	int ret;
>  
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_HOLD_EN,
> +				      AIU_I2S_MISC_HOLD_EN);
> +
>  	ret = aiu_fifo_hw_params(substream, params, dai);
>  	if (ret)
>  		return ret;
> @@ -117,6 +123,12 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
>  	snd_soc_component_update_bits(component, AIU_MEM_I2S_MASKS,
>  				      AIU_MEM_I2S_MASKS_IRQ_BLOCK, val);
>  
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_FORCE_LEFT_RIGHT,
> +				      AIU_I2S_MISC_FORCE_LEFT_RIGHT);
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_HOLD_EN, 0);
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
