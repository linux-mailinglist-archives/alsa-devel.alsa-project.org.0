Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A13608F80
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 22:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537D2A6B2;
	Sat, 22 Oct 2022 22:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537D2A6B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666469111;
	bh=nQc2tDpFCbaLmZWJBZc5XQ1LBclQxEh3buyX5WAYeUI=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXij5cHyvLL1bMEnyXngmKzkz6ug1jo1mccryNM+VmPJW8QXcr56stJliw4DPyYHd
	 +RmBnXQXvpKmPk77fXzh+JCfXjsDCgmUhowTsnRTISvc9MvOx4FCLwPZdU+KO5DlU6
	 sZ4Yhm9lWdJGn6vFpmgoDTBCPAyn+bjdnQ4hd9OI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C635BF80290;
	Sat, 22 Oct 2022 22:04:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB65CF80246; Sat, 22 Oct 2022 22:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC45F8013D
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 22:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC45F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="oDeXW44I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1666469043; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ukvabM0JPo9IzHCTJ8vCAUmN8porn4JU/9khjkkZ7s=;
 b=oDeXW44Ideo1j1JauRc5lpNfKboKV3kgSCbG2dm8u4ZQ7QcIjZDnFuK/nwXJPzkNiPWPtC
 4MrBNnXzTLFabC494eWkJ4Qvk9s+o1vpu+qhDN8xljYRcUspLCyZ4vnC3NmJEbsq0FDcjp
 5UY6Aa1ZEilhhMGXte5P97eKbDys+mo=
Date: Sat, 22 Oct 2022 21:03:53 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <HQ76KR.B1PM87E2GIYZ1@crapouillou.net>
In-Reply-To: <UQ597w4FmzOT8p76tdRPhzECStUpFmYe@localhost>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
 <0269b850-f33a-7aa9-a3eb-83655bd4e19a@wanyeetech.com>
 <ROSYER.QTJF8J14H2YX1@crapouillou.net>
 <6f2c7a0b-b68b-fc42-1a82-2b69c114823f@wanyeetech.com>
 <UQ597w4FmzOT8p76tdRPhzECStUpFmYe@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Zhou Yanjie <zhouyu@wanyeetech.com>,
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

Hi Aidan,

Le sam. 22 oct. 2022 =C3=A0 18:15:05 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>=20
> Zhou Yanjie <zhouyu@wanyeetech.com> writes:
>=20
>>  Hi Paul,
>>=20
>>  On 2022/7/13 =E4=B8=8B=E5=8D=8811:07, Paul Cercueil wrote:
>>>  Hi Zhou,
>>>=20
>>>  Le mer., juil. 13 2022 at 22:33:44 +0800, Zhou Yanjie=20
>>> <zhouyu@wanyeetech.com>
>>>  a =C3=A9crit :
>>>>  Hi Aidan,
>>>>=20
>>>>  On 2022/7/9 =E4=B8=8A=E5=8D=8812:02, Aidan MacDonald wrote:
>>>>>  @@ -400,6 +402,7 @@ static const struct i2s_soc_info=20
>>>>> jz4740_i2s_soc_info =3D
>>>>>  {
>>>>>        .field_tx_fifo_thresh    =3D REG_FIELD(JZ_REG_AIC_CONF, 8,=20
>>>>> 11),
>>>>>        .field_i2sdiv_capture    =3D REG_FIELD(JZ_REG_AIC_CLK_DIV,=20
>>>>> 0, 3),
>>>>>        .field_i2sdiv_playback    =3D REG_FIELD(JZ_REG_AIC_CLK_DIV,=20
>>>>> 0, 3),
>>>>>  +    .pll_clk_name        =3D "pll half",
>>>>>        .shared_fifo_flush    =3D true,
>>>>>    };
>>>>=20
>>>>=20
>>>>  Since JZ4760, according to the description of the I2SCDR register,
>>>>  Ingenic SoCs no longer use PLL/2 clock, but directly use PLL=20
>>>> clock,
>>>>  so it seems also inappropriate to use "pll half" for these SoCs.
>>>=20
>>>  The device tree passes the clock as "pll half". So the driver=20
>>> should use this
>>>  name as well...
>>=20
>>=20
>>  I see...
>>=20
>>  It seems that the device tree of JZ4770 has used "pll half" already,
>>  but there is no "pll half" used anywhere in the device tree of=20
>> JZ4780,
>>  maybe we can keep the pll_clk_name of JZ4770 as "pll half", and=20
>> change
>>  the pll_clk_name of JZ4780 to a more reasonable name.
>>=20
>>=20
>>  Thanks and best regards!
>=20
> Actually, the clock names in the DT are meaningless. The clk_get()=20
> call
> matches only the clock's name in the CGU driver. So in fact the driver
> is "broken" for jz4780. It seems jz4770 doesn't work correctly either,
> it has no "pll half", and three possible parents for its "i2s" clock.

That's not true. The clock names are matched via DT.

Only in the case where a corresponding clock cannot be found via DT=20
will it search for the clock name among the clock providers. I believe=20
this is a legacy mechanism and you absolutely shouldn't rely on it.

-Paul

> Since the driver only supports the internal codec, which requires the
> "ext" clock, there isn't a problem in practice.
>=20
> I'm just going to drop this patch and leave .set_sysclk() alone for=20
> now.
> I think a better approach is to have the DT define an array of parent
> clocks for .set_sysclk()'s use, instead of hardcoding parents in the
> driver. If the parent array is missing the driver can default to using
> "ext" so existing DTs will work.
>=20
> Regards,
> Aidan


