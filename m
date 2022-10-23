Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CDC6093A4
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 15:30:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAC7193D6;
	Sun, 23 Oct 2022 15:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAC7193D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666531832;
	bh=2HbRSoSoqM35heQd12TiP6yEcp4ByKbVylQf/04pa3w=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EpNqN6jRAAY6/JhxdfC63G//etLMQrUGyPmLJNXdEHp6glpJtZYJSJdkz5RFrGIJh
	 E4s5T9ZVC+d+pLV1Yn6Kc94vnX76ROfNh9etcLmgWhQ6DsYcg0tiPa+rXEM+Xco9tg
	 CKdrVpvLi6j2486MUywfQHfjeWwp4KBoYPy9tovs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BBEAF80430;
	Sun, 23 Oct 2022 15:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9649F8011C; Sun, 23 Oct 2022 15:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDE06F8011C
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 15:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDE06F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PJQ9kC8u"
Received: by mail-wm1-x329.google.com with SMTP id
 e20-20020a05600c449400b003cce0107a6fso789992wmo.0
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:from:to:cc:subject:date:message-id
 :reply-to; bh=Wjk9paJAodEfA6iF8JDXnM1/XG2uiqXrj86E+2FXF3Y=;
 b=PJQ9kC8uzMgvDNlpU0K2N+loBlb5Iwhwn4CyuY6wxv2iv/6RYLSzv907YDl9tNFKvN
 31Kdi5HH81/iv+mhl7v1VgGXbssWdVyBHvOynqEviUnM+Una4EnbPis/7tgm/M0NR/+l
 6UikMDNWPa38qhuX+YVdBDDTZGMc0ltRYvedc5Npnhb46ZRnmmGi252e3bg1etTsiUvZ
 DwgQqV6dw9SrlLkAtKuZgSxonKwgs7/+tHaP86t3n8Za+g5zarABEEOM4k2Ik24zivYe
 v4mNY1zJsEuZo3K0Nf1Rkmorsd0ULJWNP2ohlCa1Zb8yOILqMeyQ2fAVYy1Hd8XC479J
 /8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Wjk9paJAodEfA6iF8JDXnM1/XG2uiqXrj86E+2FXF3Y=;
 b=K2r2+9fEHZOQQ63KOvVbGZShXoIgO7/+K2akrsNRFSkNvXgsyxerliYONaaSscxCb5
 Y1w4USsSKn4petM20S2+KN0pXTpKAUTfYumocLTq/8E9BaMxC90n3TQLP7nHjWbe+WzJ
 Px+/++WtW1FPwwgXaq0iECP/eQysKUiae2URCz4IWfoJVFH9xKWKhbvTNKS7zY8lmV8h
 EBFD7pUu74fFR0DskKeYQaLUkYJkf7b/NBwS+S5OHFQB+l/QngKtXasenOe8j/BR+I8y
 rcF0dX0bEbHnc7PApZM27U4DACp51cb2ICvyp2mFomRQXinl2QAlHw93iW7gyZf+1CRs
 rpYA==
X-Gm-Message-State: ACrzQf00v68ClAMvdrB45zVbnL6jFKbSogaMTr1/gt93Wz6ANFDPp6Xw
 y9UMhzE8nN1PNenar5xqYU0=
X-Google-Smtp-Source: AMsMyM5Ld024gMXy41+tu+CPVYdHFXcJT+fli3pyPzL3OfSNwiQYWZvvR5LkPehlDHNae1KUQ0fXPQ==
X-Received: by 2002:a05:600c:3b97:b0:3cc:c287:46fe with SMTP id
 n23-20020a05600c3b9700b003ccc28746femr3434001wms.148.1666531765384; 
 Sun, 23 Oct 2022 06:29:25 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b003b4a68645e9sm5558141wmg.34.2022.10.23.06.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 06:29:24 -0700 (PDT)
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
 <0269b850-f33a-7aa9-a3eb-83655bd4e19a@wanyeetech.com>
 <ROSYER.QTJF8J14H2YX1@crapouillou.net>
 <6f2c7a0b-b68b-fc42-1a82-2b69c114823f@wanyeetech.com>
 <UQ597w4FmzOT8p76tdRPhzECStUpFmYe@localhost>
 <HQ76KR.B1PM87E2GIYZ1@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
In-reply-to: <HQ76KR.B1PM87E2GIYZ1@crapouillou.net>
Date: Sun, 23 Oct 2022 14:29:24 +0100
Message-ID: <JRrsX7Q4m5FUeeBs2yKTRMe5Ihaso8gi@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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


Paul Cercueil <paul@crapouillou.net> writes:

> Hi Aidan,
>
> Le sam. 22 oct. 2022 =C3=A0 18:15:05 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> Zhou Yanjie <zhouyu@wanyeetech.com> writes:
>>
>>>  Hi Paul,
>>>  On 2022/7/13 =E4=B8=8B=E5=8D=8811:07, Paul Cercueil wrote:
>>>>  Hi Zhou,
>>>>  Le mer., juil. 13 2022 at 22:33:44 +0800, Zhou Yanjie
>>>> <zhouyu@wanyeetech.com>
>>>>  a =C3=A9crit :
>>>>>  Hi Aidan,
>>>>>  On 2022/7/9 =E4=B8=8A=E5=8D=8812:02, Aidan MacDonald wrote:
>>>>>>  @@ -400,6 +402,7 @@ static const struct i2s_soc_info jz4740_i2s_soc=
_info
>>>>>> =3D
>>>>>>  {
>>>>>>        .field_tx_fifo_thresh    =3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11=
),
>>>>>>        .field_i2sdiv_capture    =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0,=
 3),
>>>>>>        .field_i2sdiv_playback    =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0=
, 3),
>>>>>>  +    .pll_clk_name        =3D "pll half",
>>>>>>        .shared_fifo_flush    =3D true,
>>>>>>    };
>>>>>  Since JZ4760, according to the description of the I2SCDR register,
>>>>>  Ingenic SoCs no longer use PLL/2 clock, but directly use PLL clock,
>>>>>  so it seems also inappropriate to use "pll half" for these SoCs.
>>>>  The device tree passes the clock as "pll half". So the driver should =
use
>>>> this
>>>>  name as well...
>>>  I see...
>>>  It seems that the device tree of JZ4770 has used "pll half" already,
>>>  but there is no "pll half" used anywhere in the device tree of JZ4780,
>>>  maybe we can keep the pll_clk_name of JZ4770 as "pll half", and change
>>>  the pll_clk_name of JZ4780 to a more reasonable name.
>>>  Thanks and best regards!
>> Actually, the clock names in the DT are meaningless. The clk_get() call
>> matches only the clock's name in the CGU driver. So in fact the driver
>> is "broken" for jz4780. It seems jz4770 doesn't work correctly either,
>> it has no "pll half", and three possible parents for its "i2s" clock.
>
> That's not true. The clock names are matched via DT.
>
> Only in the case where a corresponding clock cannot be found via DT will =
it
> search for the clock name among the clock providers. I believe this is a =
legacy
> mechanism and you absolutely shouldn't rely on it.
>
> -Paul
>

What you say is only true for clk_get() with a device argument. When the
device argument is NULL -- which is the case in .set_sysclk() -- then
the DT name is not matched. Check drivers/clk/clkdev.c, in clk_find().
When the dev_id is NULL, it will not match any lookup entries with a
non-null dev_id, and I believe dev_id is the mechanism that implements
DT clock lookup. Only the wildcard entries from the CGU driver will be
matched if dev_id is NULL, so the DT is being ignored.

If you don't believe me, try changing "pll half" in the device tree and
the I2S driver to something else. I have done this, and it doesn't work.
That proves the name in the device tree is not being used.

I agree we shouldn't rely on this, it's a legacy behavior, but the fact
is that's how the driver already works. I'm dropping this patch because
the driver is wrong and needs a different fix...

>> I think a better approach is to have the DT define an array of parent
>> clocks for .set_sysclk()'s use, instead of hardcoding parents in the
>> driver. If the parent array is missing the driver can default to using
>> "ext" so existing DTs will work.

As much as I like this idea there doesn't seem to be a mechanism for
handling a free-floating array of clocks in the DT. Everything has
to be put in the main "clocks" array. That makes it pretty hard to
figure out which ones are meant to be the parent clocks.

Do you know of any way to do this generically from the DT? If there's
no way to get away from a hardcoded array of names in the driver, I can
at least add a device argument to clk_get() so it'll use the DT names.

Regards,
Aidan
