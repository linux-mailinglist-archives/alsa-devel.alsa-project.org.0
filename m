Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC74569EC8
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B276F166A;
	Thu,  7 Jul 2022 11:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B276F166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657187048;
	bh=YpVDHgTn4irsxYuskX3QF9HTHfVWYWcpVcQD6F8bfpY=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qu+DHeDtKjJNGYhStavzMR0CKiCvTkeLA73r/Nz3v+XQl58Gia9lUS2PrMwd/X9xG
	 u0HuAIhTATlS8KaBL31e8AUlLfFivmM9q2a2oVr7HQzVr1q+aLcY+OeM64Ssfei1C0
	 SK+vAx+MSQchju6QIVr+2w3Veszzjk5yKQKzo4qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C842F800C5;
	Thu,  7 Jul 2022 11:43:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 816B1F80537; Thu,  7 Jul 2022 11:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CA0F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CA0F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="4SIGlYDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657186985; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8p03/aknxZm4ISCg5osm/QCfwD06OLWvg98PIGVA6k=;
 b=4SIGlYDYz6ZeZwMrdFwcHjdodvrTphUWQoqLzkb/6LkauADFI0vWu+8mpxaajfTFhrYj87
 UHht/fC++I9qD2m9Mw2oNxWMBu2R3rOFRIB8frxKvS5vDhiJiRJAgBjkfneTYy4BzHYz+t
 BaW4ijYk24naRuCXPWWhsdjRcMj/ph4=
Date: Thu, 07 Jul 2022 10:42:55 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 08/11] ASoC: jz4740-i2s: Align macro values and sort
 includes
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <JN9NER.N2JY086JY5VK2@crapouillou.net>
In-Reply-To: <20220706211330.120198-9-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-9-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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



Le mer., juil. 6 2022 at 22:13:27 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> Some purely cosmetic changes: line up all the macro values to
> make things easier to read and sort the includes alphabetically.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  sound/soc/jz4740/jz4740-i2s.c | 66=20
> +++++++++++++++++------------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index b8d2723c5f90..3a21ee9d34d1 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -4,6 +4,9 @@
>   */
>=20
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -13,11 +16,6 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>=20
> -#include <linux/clk.h>
> -#include <linux/delay.h>
> -
> -#include <linux/dma-mapping.h>
> -
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -35,36 +33,36 @@
>  #define JZ_REG_AIC_CLK_DIV	0x30
>  #define JZ_REG_AIC_FIFO		0x34
>=20
> -#define JZ_AIC_CONF_OVERFLOW_PLAY_LAST BIT(6)
> -#define JZ_AIC_CONF_INTERNAL_CODEC BIT(5)
> -#define JZ_AIC_CONF_I2S BIT(4)
> -#define JZ_AIC_CONF_RESET BIT(3)
> -#define JZ_AIC_CONF_BIT_CLK_MASTER BIT(2)
> -#define JZ_AIC_CONF_SYNC_CLK_MASTER BIT(1)
> -#define JZ_AIC_CONF_ENABLE BIT(0)
> -
> -#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE GENMASK(21, 19)
> -#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE GENMASK(18, 16)
> -#define JZ_AIC_CTRL_ENABLE_RX_DMA BIT(15)
> -#define JZ_AIC_CTRL_ENABLE_TX_DMA BIT(14)
> -#define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
> -#define JZ_AIC_CTRL_SWITCH_ENDIANNESS BIT(10)
> -#define JZ_AIC_CTRL_SIGNED_TO_UNSIGNED BIT(9)
> +#define JZ_AIC_CONF_OVERFLOW_PLAY_LAST	BIT(6)
> +#define JZ_AIC_CONF_INTERNAL_CODEC	BIT(5)
> +#define JZ_AIC_CONF_I2S			BIT(4)
> +#define JZ_AIC_CONF_RESET		BIT(3)
> +#define JZ_AIC_CONF_BIT_CLK_MASTER	BIT(2)
> +#define JZ_AIC_CONF_SYNC_CLK_MASTER	BIT(1)
> +#define JZ_AIC_CONF_ENABLE		BIT(0)
> +
> +#define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE	GENMASK(21, 19)
> +#define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE	GENMASK(18, 16)
> +#define JZ_AIC_CTRL_ENABLE_RX_DMA	BIT(15)
> +#define JZ_AIC_CTRL_ENABLE_TX_DMA	BIT(14)
> +#define JZ_AIC_CTRL_MONO_TO_STEREO	BIT(11)
> +#define JZ_AIC_CTRL_SWITCH_ENDIANNESS	BIT(10)
> +#define JZ_AIC_CTRL_SIGNED_TO_UNSIGNED	BIT(9)
>  #define JZ_AIC_CTRL_FLUSH		BIT(8)
> -#define JZ_AIC_CTRL_ENABLE_ROR_INT BIT(6)
> -#define JZ_AIC_CTRL_ENABLE_TUR_INT BIT(5)
> -#define JZ_AIC_CTRL_ENABLE_RFS_INT BIT(4)
> -#define JZ_AIC_CTRL_ENABLE_TFS_INT BIT(3)
> -#define JZ_AIC_CTRL_ENABLE_LOOPBACK BIT(2)
> -#define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
> -#define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
> -
> -#define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK BIT(12)
> -#define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK BIT(13)
> -#define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK BIT(4)
> -#define JZ_AIC_I2S_FMT_MSB BIT(0)
> -
> -#define JZ_AIC_I2S_STATUS_BUSY BIT(2)
> +#define JZ_AIC_CTRL_ENABLE_ROR_INT	BIT(6)
> +#define JZ_AIC_CTRL_ENABLE_TUR_INT	BIT(5)
> +#define JZ_AIC_CTRL_ENABLE_RFS_INT	BIT(4)
> +#define JZ_AIC_CTRL_ENABLE_TFS_INT	BIT(3)
> +#define JZ_AIC_CTRL_ENABLE_LOOPBACK	BIT(2)
> +#define JZ_AIC_CTRL_ENABLE_PLAYBACK	BIT(1)
> +#define JZ_AIC_CTRL_ENABLE_CAPTURE	BIT(0)
> +
> +#define JZ_AIC_I2S_FMT_DISABLE_BIT_CLK	BIT(12)
> +#define JZ_AIC_I2S_FMT_DISABLE_BIT_ICLK	BIT(13)
> +#define JZ_AIC_I2S_FMT_ENABLE_SYS_CLK	BIT(4)
> +#define JZ_AIC_I2S_FMT_MSB		BIT(0)
> +
> +#define JZ_AIC_I2S_STATUS_BUSY		BIT(2)
>=20
>  struct i2s_soc_info {
>  	struct snd_soc_dai_driver *dai;
> --
> 2.35.1
>=20


