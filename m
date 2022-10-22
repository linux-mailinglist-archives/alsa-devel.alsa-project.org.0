Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C77D608EC5
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 19:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5339BDE9;
	Sat, 22 Oct 2022 19:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5339BDE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666458971;
	bh=OEdRsgVqCkcKz4eZ7jkOylFepk0zkXtGkfANql0O2yY=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kx/BCafbyPIfUF3w06B9zrTt5xPArm4oNf0+oOXVZbU+i9nveVSl4vwnAC3/nPi2s
	 S2Er6JUWnzsEb+cRcPysa83C0lXX/Bj2Zrk0GKSDD0MsLmSqQ+J367wLnnccPKRg8/
	 zocrCbsdwZ6yS5JMytNAWQKWNzmJPtbzwqBM0sEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49981F80130;
	Sat, 22 Oct 2022 19:15:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 801B2F80290; Sat, 22 Oct 2022 19:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A39FCF80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 19:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39FCF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eDHT+PdT"
Received: by mail-wr1-x42d.google.com with SMTP id a10so8920311wrm.12
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:from:to:cc:subject:date:message-id
 :reply-to; bh=OEdRsgVqCkcKz4eZ7jkOylFepk0zkXtGkfANql0O2yY=;
 b=eDHT+PdTkIpoA25cMakJH7LwzPhBP3+NLqYVcxGoKNV/kY/iRn4XvItq9CASOMKBhz
 8V/Q5Wqq6WzKuKE8ScZ+DAXjp+EBhgNKy7dKLvxM1kQG9BlY8NWyjzcvy0+cLXZgtnVb
 z7WxJ8m58IsjgXN3ijExpHHd2iUYYxS3AVmCfnLA2qPNV/Ybn9TlyKZ25+if9XxIaDKH
 UuFFNYliJYaaporq2xKqMbW8/5hRTL+LNUAkt2YxETG7l8Y1jVepQDxsJPVx7aRQ9WPq
 U613c1blBAGUs7IDXWZlxY9p+TMh3I3tFTTwNStYXmpiQmyY8tK8QmZg47xBDocB2COn
 RVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OEdRsgVqCkcKz4eZ7jkOylFepk0zkXtGkfANql0O2yY=;
 b=OaY7P9zbNDImx7VBvYNRjZ3bGWb2HTLorxjZrHxGBDYNI9ibIx6t/I3k62MkFqb7Fs
 hx01kCPVfOuutZqgXvaBsz9VFSjmHHNCanV4U/57LxmpZvHk5MDN8geztzCt506u/V+E
 gBRh8Fjpc/3Mhs3gIaeraxaq2CqSlvh18GmgBV8902EFnFJmTRCQ0KYmIS6Vv6nxpVS+
 BWUvTBzSPkhv9FqPnTSUcsPof/ciGSsTmRgo6X+Czje3znaqwbQnqvfdbwzQ1a74Q/WO
 8vRGHQuXsgwaliLofZBhX0TigKfzAT6j+HXdC+7lMoh9828eoGbVrPQqONQwwjr0Ahxy
 3XVg==
X-Gm-Message-State: ACrzQf1T2yIZH2LbBKT6cf8LlzB5LDlpu+wvYZBXRPD4SYk9ssD+ZH8a
 KEl88X3aAr5LRX/MVWuqK2LbGezt35c=
X-Google-Smtp-Source: AMsMyM5GACKMhemPzQfhXeK8J8ZeCfuB8vay27pyTEULvy/cKHgyGpAjBE0I36JUTkg7zlSZEqPa1w==
X-Received: by 2002:a5d:5142:0:b0:236:5d8d:6254 with SMTP id
 u2-20020a5d5142000000b002365d8d6254mr2649278wrt.514.1666458906363; 
 Sat, 22 Oct 2022 10:15:06 -0700 (PDT)
Received: from localhost (188.29.215.65.threembb.co.uk. [188.29.215.65])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b003b4a68645e9sm3341141wmg.34.2022.10.22.10.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 10:15:05 -0700 (PDT)
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-8-aidanmacdonald.0x0@gmail.com>
 <0269b850-f33a-7aa9-a3eb-83655bd4e19a@wanyeetech.com>
 <ROSYER.QTJF8J14H2YX1@crapouillou.net>
 <6f2c7a0b-b68b-fc42-1a82-2b69c114823f@wanyeetech.com>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Zhou Yanjie <zhouyu@wanyeetech.com>
Subject: Re: [PATCH v4 07/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
In-reply-to: <6f2c7a0b-b68b-fc42-1a82-2b69c114823f@wanyeetech.com>
Date: Sat, 22 Oct 2022 18:15:05 +0100
Message-ID: <UQ597w4FmzOT8p76tdRPhzECStUpFmYe@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 Paul Cercueil <paul@crapouillou.net>, broonie@kernel.org
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


Zhou Yanjie <zhouyu@wanyeetech.com> writes:

> Hi Paul,
>
> On 2022/7/13 =E4=B8=8B=E5=8D=8811:07, Paul Cercueil wrote:
>> Hi Zhou,
>>
>> Le mer., juil. 13 2022 at 22:33:44 +0800, Zhou Yanjie <zhouyu@wanyeetech=
.com>
>> a =C3=A9crit :
>>> Hi Aidan,
>>>
>>> On 2022/7/9 =E4=B8=8A=E5=8D=8812:02, Aidan MacDonald wrote:
>>>> @@ -400,6 +402,7 @@ static const struct i2s_soc_info jz4740_i2s_soc_in=
fo =3D
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .field_tx_fifo_thresh=C2=A0=C2=A0=C2=A0=
 =3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .field_i2sdiv_capture=C2=A0=C2=A0=C2=A0=
 =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .field_i2sdiv_playback=C2=A0=C2=A0=C2=
=A0 =3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>>> +=C2=A0=C2=A0=C2=A0 .pll_clk_name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "pll half",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .shared_fifo_flush=C2=A0=C2=A0=C2=A0 =
=3D true,
>>>> =C2=A0 };
>>>
>>>
>>> Since JZ4760, according to the description of the I2SCDR register,
>>> Ingenic SoCs no longer use PLL/2 clock, but directly use PLL clock,
>>> so it seems also inappropriate to use "pll half" for these SoCs.
>>
>> The device tree passes the clock as "pll half". So the driver should use=
 this
>> name as well...
>
>
> I see...
>
> It seems that the device tree of JZ4770 has used "pll half" already,
> but there is no "pll half" used anywhere in the device tree of JZ4780,
> maybe we can keep the pll_clk_name of JZ4770 as "pll half", and change
> the pll_clk_name of JZ4780 to a more reasonable name.
>
>
> Thanks and best regards!

Actually, the clock names in the DT are meaningless. The clk_get() call
matches only the clock's name in the CGU driver. So in fact the driver
is "broken" for jz4780. It seems jz4770 doesn't work correctly either,
it has no "pll half", and three possible parents for its "i2s" clock.

Since the driver only supports the internal codec, which requires the
"ext" clock, there isn't a problem in practice.

I'm just going to drop this patch and leave .set_sysclk() alone for now.
I think a better approach is to have the DT define an array of parent
clocks for .set_sysclk()'s use, instead of hardcoding parents in the
driver. If the parent array is missing the driver can default to using
"ext" so existing DTs will work.

Regards,
Aidan
