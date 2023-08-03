Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85576DFAD
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 07:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440603E7;
	Thu,  3 Aug 2023 07:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440603E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691040012;
	bh=keigDe5hEC8UxtMg2WTzvJh/lfDGurmHnIJKp0fxYrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YNlqoHBA+1aXDIykubQ9gafRfL6cjrgtdN839LQQiDFvVCiPEkXyufRL/ao72x2jm
	 JLN9CcUaJ4GgFF2w7xpSVO/bLWpp/EZSpXthVso7UJWDHY4unCu5KaqJuMXVzU/IiV
	 O8rbkhbnxQiUlRBteBYDZdJD1aSvuxkbdbozaDO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3355F80425; Thu,  3 Aug 2023 07:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 271E4F801D5;
	Thu,  3 Aug 2023 07:19:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5513F80551; Thu,  3 Aug 2023 07:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 733EBF80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 07:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 733EBF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Nv4h/ZLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=7SF+07K71ohh0WDQNef5po3x/ysEktiM4oUVhWKFpQ4=;
	t=1691039773;x=1691129773;
	b=Nv4h/ZLRM2Uyd2vM2G3r5dEtWvEIC0DYcjZ9FPJkZegJi8JPPEDbY1V5EOSP1NIqzk5uL4TIOAwg0D3hZb+xShkljmHHDpEsOUE1+gPhWb9NC7bTN7x5A9UJ8BzE5z/g1nRJphW05t7F9PzgnrGo4OKWSZY2DNcbD5dyU/I0JxRG+9M/B614gcIS9bHRpZafO0aP+Octvpbkp4ZnpBn4AGLNaVGHwf5f//aIvF8mD+bykbBl2zi61dGDoD277oLwkH5cM+TyFtZhVLEz4LKjqla58+PLVBqfNeIMh70PxZ/qbEqrmHB1cinFNlGxkQjivqYmgMVmTE6PTI//0mWAQg==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qRQgx-0003YR-Rj; Thu, 03 Aug 2023 08:16:09 +0300
Message-ID: <fdd771cc-9354-208b-e8be-50d2ec6a40c9@inbox.ru>
Date: Thu, 3 Aug 2023 08:16:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 3/5] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-4-xingyu.wu@starfivetech.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230802084301.134122-4-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 
 4F1203BC0FB41BD93761F2630DFFAF419FF9F36511838303579425D3053CF375182A05F538085040A43AEB9EE471BF590BA4D0903507B565CF94DF8359E0D3D1F5C007C0E5B44D8E
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BBC4AF2A01A27A06EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371E4BC0E00C009995EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBA926EDEA9C8C4A220F6A49BED6FC8378E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FA18204E546F3947C7AE820D2C17D0E56F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637990DCC27F6719F98389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73557739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 
 0D63561A33F958A568B3C69D00CF7EA59AFF425838D6083DF6F5AD3B11D1C70CF87CCE6106E1FC07E67D4AC08A07B9B0AD0E433DBF1FBFA3CB5012B2E24CD356
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF047F6813025EDDE9D08033DDC88F3ED78B8B6229CDE5AA3EA12E2341A1FE79787D7FE2FA29F577878553022043D0BC9A5D4881C73C9D659B10E80BB90F46987DE4EB81C25D25832B4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojcir52QaMQ83GZmVOKMR6Fw==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986BABA8A15A10676D7D60F49567370C77E298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: AEE47TEMB7OJZ6HKIN2U3DDYXCUJDZPT
X-Message-ID-Hash: AEE47TEMB7OJZ6HKIN2U3DDYXCUJDZPT
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEE47TEMB7OJZ6HKIN2U3DDYXCUJDZPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 02.08.2023 11:42, Xingyu Wu wrote:

> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index c076090a9864..4dfbd8ddbcf5 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -16,6 +16,7 @@
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/reset.h>
>   #include <linux/slab.h>
> @@ -198,7 +199,7 @@ static void i2s_start(struct dw_i2s_dev *dev,
>   	else
>   		i2s_write_reg(dev->i2s_base, IRER, 1);
>   
> -	if (dev->use_pio)
> +	if (dev->use_pio || dev->is_jh7110)
>   		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
>   	else
>   		i2s_enable_dma(dev, substream->stream);
> @@ -216,7 +217,7 @@ static void i2s_stop(struct dw_i2s_dev *dev,
>   	else
>   		i2s_write_reg(dev->i2s_base, IRER, 0);
>   
> -	if (dev->use_pio)
> +	if (dev->use_pio || dev->is_jh7110)
>   		i2s_disable_irqs(dev, substream->stream, 8);
>   	else
>   		i2s_disable_dma(dev, substream->stream);

Why do we need to enable interrupts for DMA mode?

> @@ -227,6 +228,21 @@ static void i2s_stop(struct dw_i2s_dev *dev,
>   	}
>   }
>   
> +static int dw_i2s_startup(struct snd_pcm_substream *substream,
> +			  struct snd_soc_dai *cpu_dai)
> +{
> +	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
> +
> +	if (dev->is_jh7110) {
> +		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +		struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +
> +		dai_link->trigger_stop = SND_SOC_TRIGGER_ORDER_LDC;
> +	}
> +
> +	return 0;
> +}
> +
>   static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
>   {
>   	u32 ch_reg;
> @@ -267,6 +283,11 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
>   		config->data_width = 16;
>   		dev->ccr = 0x00;
>   		dev->xfer_resolution = 0x02;
> +		/* Set DMA buswidth on JH7110 */
> +		if (dev->is_jh7110) {
> +			dev->play_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +			dev->capture_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +		}

Not needed.
See: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20230802&id=6f80197f40515853814d0f22e5209d53f899ab91
Proper bus width calculations is performed by 
snd_hwparams_to_dma_slave_config()

>   		break;
>   
>   	case SNDRV_PCM_FORMAT_S24_LE:
> @@ -279,6 +300,11 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
>   		config->data_width = 32;
>   		dev->ccr = 0x10;
>   		dev->xfer_resolution = 0x05;
> +		/* Set DMA buswidth on JH7110 */
> +		if (dev->is_jh7110) {
> +			dev->play_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +			dev->capture_dma_data.dt.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		}

Not needed.

