Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD05752F4
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0F417D5;
	Thu, 14 Jul 2022 18:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0F417D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816726;
	bh=43er0SzHgOBLOaCcmzAlLO1btJfcNzjqBlaN4UIxc8w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkubpLo0vlX9GhPSOXl8lg0IzW9Jz79onZH+fkwxYVWLlJTG43sDt1qSKkBBOnNU5
	 LlYGuwzkCgB84Cerg2I4Om52WoqO5f9DAN3XzrnYcrPYiGEPwNg34wqpy5YeJ1/+zS
	 OAMLnihqVTtrBM0wbAGwZsIN1qrHTgF24nUEppDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F45CF805A0;
	Thu, 14 Jul 2022 18:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5490F80249; Wed, 13 Jul 2022 16:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com
 [115.124.28.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E08F6F800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E08F6F800AA
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07781884|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00565203-0.000234054-0.994114;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhouyu@wanyeetech.com; NM=1;
 PH=DS; RN=9; RT=9; SR=0; TI=SMTPD_---.ORke3Uw_1657722824; 
Received: from 192.168.10.152(mailfrom:zhouyu@wanyeetech.com
 fp:SMTPD_---.ORke3Uw_1657722824) by smtp.aliyun-inc.com;
 Wed, 13 Jul 2022 22:33:45 +0800
Subject: Re: [PATCH v4 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, paul@crapouillou.net,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
From: Zhou Yanjie <zhouyu@wanyeetech.com>
Message-ID: <0269b850-f33a-7aa9-a3eb-83655bd4e19a@wanyeetech.com>
Date: Wed, 13 Jul 2022 22:33:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Aidan,

On 2022/7/9 上午12:02, Aidan MacDonald wrote:
> On some Ingenic SoCs, such as the X1000, there is a programmable
> divider used to generate the I2S system clock from a PLL, rather
> than a fixed PLL/2 clock. It doesn't make much sense to call the
> clock "pll half" on those SoCs, so the clock name should really be
> a SoC-dependent value.
>
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>   sound/soc/jz4740/jz4740-i2s.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
> index 0dcc658b3784..a41398c24d0e 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -75,6 +75,8 @@ struct i2s_soc_info {
>   	struct reg_field field_i2sdiv_capture;
>   	struct reg_field field_i2sdiv_playback;
>   
> +	const char *pll_clk_name;
> +
>   	bool shared_fifo_flush;
>   };
>   
> @@ -281,7 +283,7 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>   		clk_set_parent(i2s->clk_i2s, parent);
>   		break;
>   	case JZ4740_I2S_CLKSRC_PLL:
> -		parent = clk_get(NULL, "pll half");
> +		parent = clk_get(NULL, i2s->soc_info->pll_clk_name);
>   		if (IS_ERR(parent))
>   			return PTR_ERR(parent);
>   		clk_set_parent(i2s->clk_i2s, parent);
> @@ -400,6 +402,7 @@ static const struct i2s_soc_info jz4740_i2s_soc_info = {
>   	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
>   	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>   	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		= "pll half",
>   	.shared_fifo_flush	= true,
>   };
>   
> @@ -409,6 +412,7 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
>   	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>   	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>   	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		= "pll half",
>   };


Since JZ4760, according to the description of the I2SCDR register,
Ingenic SoCs no longer use PLL/2 clock, but directly use PLL clock,
so it seems also inappropriate to use "pll half" for these SoCs.


>   
>   static struct snd_soc_dai_driver jz4770_i2s_dai = {
> @@ -435,6 +439,7 @@ static const struct i2s_soc_info jz4770_i2s_soc_info = {
>   	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>   	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>   	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		= "pll half",
>   };


Same here.


>   
>   static const struct i2s_soc_info jz4780_i2s_soc_info = {
> @@ -443,6 +448,7 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
>   	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>   	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>   	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
> +	.pll_clk_name		= "pll half",
>   };
>   


Same here.


Thanks and best regards!


>   static const struct snd_soc_component_driver jz4740_i2s_component = {
