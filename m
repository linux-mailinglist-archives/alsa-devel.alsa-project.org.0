Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0F5739C0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 17:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 934A81732;
	Wed, 13 Jul 2022 17:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 934A81732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657724943;
	bh=u2e8olZTy3BZ8loVLFAuJOmWO1MsaXcX6UUxe1fYb0A=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0nno6lydxv0nTpJ/SbXW8y1vorJX+141BmsIzx2TlXryf+Vf8E1a3SYhIB87qpm7
	 0hcbxuuHeejcwAZxvzzyPcGr52ixVL91LPvd7vfht8pNSKV95lknhGy7iXstbHTzK3
	 KWfLHkWbmcFA45axvOTI2LY6JbKPPXAjLkx3Aj7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C64FF80254;
	Wed, 13 Jul 2022 17:08:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90660F800AA; Wed, 13 Jul 2022 17:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66A8DF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 17:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A8DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="ZULgNyU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657724871; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0FfxSaCkfFkbBWXxE6Wzj1PxCYfgbtK0yTCw52GkdM=;
 b=ZULgNyU35WqdIvHIEYL59a8ZtT6EuCJEilRjnhRRn4LbomjagX+Mn7qdh9yyvLvPsXHqIz
 naSlIhmIFq3PK+8JIZjMYjKp/xk8mjGMYVdH/KO6wPIjlPm/cXxL/AYCkFiEBQ7gEHs6LM
 C7Qdhlq/jAbRJeQ+Lv3MJkaZtmiFsXw=
Date: Wed, 13 Jul 2022 16:07:39 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
To: Zhou Yanjie <zhouyu@wanyeetech.com>
Message-Id: <ROSYER.QTJF8J14H2YX1@crapouillou.net>
In-Reply-To: <0269b850-f33a-7aa9-a3eb-83655bd4e19a@wanyeetech.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
 <0269b850-f33a-7aa9-a3eb-83655bd4e19a@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-mips@vger.kernel.org, broonie@kernel.org
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

Hi Zhou,

Le mer., juil. 13 2022 at 22:33:44 +0800, Zhou Yanjie=20
<zhouyu@wanyeetech.com> a =C3=A9crit :
> Hi Aidan,
>=20
> On 2022/7/9 =E4=B8=8A=E5=8D=8812:02, Aidan MacDonald wrote:
>> On some Ingenic SoCs, such as the X1000, there is a programmable
>> divider used to generate the I2S system clock from a PLL, rather
>> than a fixed PLL/2 clock. It doesn't make much sense to call the
>> clock "pll half" on those SoCs, so the clock name should really be
>> a SoC-dependent value.
>>=20
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>   sound/soc/jz4740/jz4740-i2s.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
>> b/sound/soc/jz4740/jz4740-i2s.c
>> index 0dcc658b3784..a41398c24d0e 100644
>> --- a/sound/soc/jz4740/jz4740-i2s.c
>> +++ b/sound/soc/jz4740/jz4740-i2s.c
>> @@ -75,6 +75,8 @@ struct i2s_soc_info {
>>   	struct reg_field field_i2sdiv_capture;
>>   	struct reg_field field_i2sdiv_playback;
>>   =7F+	const char *pll_clk_name;
>> +
>>   	bool shared_fifo_flush;
>>   };
>>   =7F@@ -281,7 +283,7 @@ static int jz4740_i2s_set_sysclk(struct=20
>> snd_soc_dai *dai, int clk_id,
>>   		clk_set_parent(i2s->clk_i2s, parent);
>>   		break;
>>   	case JZ4740_I2S_CLKSRC_PLL:
>> -		parent =3D clk_get(NULL, "pll half");
>> +		parent =3D clk_get(NULL, i2s->soc_info->pll_clk_name);
>>   		if (IS_ERR(parent))
>>   			return PTR_ERR(parent);
>>   		clk_set_parent(i2s->clk_i2s, parent);
>> @@ -400,6 +402,7 @@ static const struct i2s_soc_info=20
>> jz4740_i2s_soc_info =3D {
>>   	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
>>   	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>   	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>   	.shared_fifo_flush	=3D true,
>>   };
>>   =7F@@ -409,6 +412,7 @@ static const struct i2s_soc_info=20
>> jz4760_i2s_soc_info =3D {
>>   	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>>   	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>   	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>   };
>=20
>=20
> Since JZ4760, according to the description of the I2SCDR register,
> Ingenic SoCs no longer use PLL/2 clock, but directly use PLL clock,
> so it seems also inappropriate to use "pll half" for these SoCs.

The device tree passes the clock as "pll half". So the driver should=20
use this name as well...

Cheers,
-Paul

>>   =7F  static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
>> @@ -435,6 +439,7 @@ static const struct i2s_soc_info=20
>> jz4770_i2s_soc_info =3D {
>>   	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>>   	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>>   	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>   };
>=20
>=20
> Same here.
>=20
>=20
>>   =7F  static const struct i2s_soc_info jz4780_i2s_soc_info =3D {
>> @@ -443,6 +448,7 @@ static const struct i2s_soc_info=20
>> jz4780_i2s_soc_info =3D {
>>   	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>>   	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>>   	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>   };
>>=20
>=20
> Same here.
>=20
>=20
> Thanks and best regards!
>=20
>=20
>>   static const struct snd_soc_component_driver jz4740_i2s_component=20
>> =3D {


