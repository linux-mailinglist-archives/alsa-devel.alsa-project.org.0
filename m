Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CF56A550
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 16:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07CFE12;
	Thu,  7 Jul 2022 16:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07CFE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657203896;
	bh=xxndTHAFfTpDMKzO8Dbf+C87V0cmpRR26d49Qz/ltmQ=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lKAj5DsvM2q4ZBHyRPBQ8a+bunjD2YZgMYJlJldhUDMCD/uzVVKocGOFdiIXLEney
	 4rl5LlwcvA9wxKaJ+4jpSqOBkuHCNJvftuHNkEw23MOl+SZ/l0ip1aqqW60axgsHBn
	 blcsHT8bsVsRT2Bzbp12wB4zLX6JFCKIbPGHSgt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 452BCF80104;
	Thu,  7 Jul 2022 16:23:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F02A5F80104; Thu,  7 Jul 2022 16:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992E3F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 16:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992E3F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ebmq4wsr"
Received: by mail-wr1-x429.google.com with SMTP id o4so26569092wrh.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NUHMqETelgKBMcAu+0SqzcDlAwUOK8yrepUxvvqttSY=;
 b=ebmq4wsrTY7n81CmTuWPBXuy4+uRkMUymgPTu0tKIVyN3L5u8nQrKnWTVjCaLhDc0w
 q7F6sxxzi2FkCeK1lP1JWVi5yr59dT5rzsbmiraV7gwO9+wnvKoRo3Ka9gynQfMjM2S3
 41mn87tBr98ibvSQfvdtmdIpkx4a4avfL5VsWRTJc1cmdEIegImJ9ypk3Dl2lR/fIMzL
 DRyWfUOyasTKkbhrEdHHsrjoNC6crbz/7XeKhlXevNx7unwyCBxegVMv/LdxBwGwKqjS
 aHZ/6K3NoiNbaCVSA5Qt4EPsekOnrYvbmnVkr3p6fES4TxvdTVHrinPHSPaLte2C2LQB
 x0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=NUHMqETelgKBMcAu+0SqzcDlAwUOK8yrepUxvvqttSY=;
 b=pVWf2bKt0nfVUuYiY4xWkJV15TTiKqmWQLrXsvljSnxWIgG6W7aX3wG29/7mbFa9JI
 Vlbmgc9ayaiCIKNfB5yqdHwssM64qaLsIG78ou+miuQ/r++KueaCbtERxFS1SOyjl3WP
 MaXer92fGrp3+LK0/FtaiIlemNGNia3O9PPl3LmYxX6dUiV3t+vLSttizYnGgXVJigRb
 dmmoyOUOVi1PxwzVput7cXe8ieg03VyJXdrmnTr2Jw2ENXe3qReRD58TiRcuDmyit/Zb
 llKp3VGU2kNqFcSAKVfyVh4t171ZnITYnGqj5IZr+tNW4OQdBxL18c2vkxNYcSEdvF7X
 Zw1w==
X-Gm-Message-State: AJIora+plmG48SnzZPVvNuKfr3LvWohE8ecbEB1wbe/1I7lxMRHnlH8u
 m/9YrLKLvGNP8iYFpEwZBlk=
X-Google-Smtp-Source: AGRyM1vc0Rv/d4m30UdfyxezbdL00+nDaA1k0pzbL7Tp7PXXN6jWmgpXSBJiOt5Y38DOzQCsYh8kug==
X-Received: by 2002:a5d:6da3:0:b0:21b:aaf5:b814 with SMTP id
 u3-20020a5d6da3000000b0021baaf5b814mr42352435wrs.140.1657203824787; 
 Thu, 07 Jul 2022 07:23:44 -0700 (PDT)
Received: from localhost (92.40.203.179.threembb.co.uk. [92.40.203.179])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm28717513wmg.4.2022.07.07.07.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 07:23:44 -0700 (PDT)
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-10-aidanmacdonald.0x0@gmail.com>
 <HU9NER.25VYXWS2PRRL2@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 09/11] ASoC: jz4740-i2s: Make the PLL clock name
 SoC-specific
In-reply-to: <HU9NER.25VYXWS2PRRL2@crapouillou.net>
Date: Thu, 07 Jul 2022 15:24:52 +0100
Message-ID: <rQqB9wAMTrydT1hKl1pUshBKW82RHbiR@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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


Paul Cercueil <paul@crapouillou.net> writes:

> Le mer., juil. 6 2022 at 22:13:28 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> On some Ingenic SoCs, such as the X1000, there is a programmable
>> divider used to generate the I2S system clock from a PLL, rather
>> than a fixed PLL/2 clock. It doesn't make much sense to call the
>> clock "pll half" on those SoCs, so the clock name should really be
>> a SoC-dependent value.
>
> Do you really need the .set_sysclk() callback? I've never seen it used on=
 any
> of the Ingenic boards I have, so to me it's pretty much dead code. Unless=
 you
> do use this callback, I'd suggest to drop this patch until you do need it.
>
> Cheers,
> -Paul
>

Yes, one of my boards has an external codec (AK4376) that needs the
sysclock and I've patched simple-card to be able to set a non-zero
sysclock ID.

>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>  sound/soc/jz4740/jz4740-i2s.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s=
.c
>> index 3a21ee9d34d1..80b355d715ce 100644
>> --- a/sound/soc/jz4740/jz4740-i2s.c
>> +++ b/sound/soc/jz4740/jz4740-i2s.c
>> @@ -71,6 +71,8 @@ struct i2s_soc_info {
>>  	struct reg_field field_tx_fifo_thresh;
>>  	struct reg_field field_i2sdiv_capture;
>>  	struct reg_field field_i2sdiv_playback;
>> +
>> +	const char *pll_clk_name;
>>  };
>>  struct jz4740_i2s {
>> @@ -265,7 +267,7 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai =
*dai,
>> int clk_id,
>>  		clk_set_parent(i2s->clk_i2s, parent);
>>  		break;
>>  	case JZ4740_I2S_CLKSRC_PLL:
>> -		parent =3D clk_get(NULL, "pll half");
>> +		parent =3D clk_get(NULL, i2s->soc_info->pll_clk_name);
>>  		if (IS_ERR(parent))
>>  			return PTR_ERR(parent);
>>  		clk_set_parent(i2s->clk_i2s, parent);
>> @@ -387,6 +389,7 @@ static const struct i2s_soc_info jz4740_i2s_soc_info=
 =3D {
>>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
>>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>  };
>>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
>> @@ -395,6 +398,7 @@ static const struct i2s_soc_info jz4760_i2s_soc_info=
 =3D {
>>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>  };
>>  static struct snd_soc_dai_driver jz4770_i2s_dai =3D {
>> @@ -421,6 +425,7 @@ static const struct i2s_soc_info jz4770_i2s_soc_info=
 =3D {
>>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>  };
>>  static const struct i2s_soc_info jz4780_i2s_soc_info =3D {
>> @@ -429,6 +434,7 @@ static const struct i2s_soc_info jz4780_i2s_soc_info=
 =3D {
>>  	.field_tx_fifo_thresh	=3D REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
>>  	.field_i2sdiv_capture	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
>>  	.field_i2sdiv_playback	=3D REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
>> +	.pll_clk_name		=3D "pll half",
>>  };
>>  static const struct snd_soc_component_driver jz4740_i2s_component =3D {
>> --
>> 2.35.1
>>=20

