Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595806093B9
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 15:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44D2BDC4;
	Sun, 23 Oct 2022 15:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44D2BDC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666532780;
	bh=H06D7Jbo+cfWHwpQY4iNXNVs/t8oY1r966uHNB4tNcc=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XgNERdRI9iUOqfcHT1hk34CaLH6NI2PFgtkOgsj6/bs4YYYtbm3F4qqsJYUfSe8F7
	 EOZu0MFnXp8v8voB+fhodYnNG7DWul4PiqFE0Lv7yMUiPQomPrGTR1ugdmE8wa/C6i
	 Kb1MzEZK5H9xVCdYELG+MoxbP15cmiQRejBG+Bis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E82F801D5;
	Sun, 23 Oct 2022 15:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CABAF8026D; Sun, 23 Oct 2022 15:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC62CF801D5
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 15:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC62CF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VBDSQpQL"
Received: by mail-wm1-x335.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so5001705wmb.2
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:from:to:cc:subject:date:message-id
 :reply-to; bh=epP8M80VvnoS5tqdYkmq04F3KD2QIPCUAZQOWP+SmjE=;
 b=VBDSQpQLjZs994aSc4OML2O5M3KZ0cv7EnUxlVaeGtbYSwLvKfpi2Ov0S6NMlJhjT0
 USOb2kVIPyTjPHo+oCqg2wIZiV5wFrTDW+6dwQFX2KgpA/q8cu5ItbuB8iGOtAGo6/Ye
 6th06X6Y96NLW3qb1bCCioyE1QHS/jzzuyA1YWF9zn+HFtlWU13ZgyG85JGwmZVcqaU3
 z4bXdym2gMMSIhoJ1Mwmd+S4NK2r3hqjAPc9vnLfVIazjEgYOawjGO1uCBSQdhyXF2Oa
 qwmEjRN3y1C7h5Spo6tlb1UW5IlpX/P9BKBASiDbyIBDoqxzmSMEf80DuT25m1uvSLCQ
 ixZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=epP8M80VvnoS5tqdYkmq04F3KD2QIPCUAZQOWP+SmjE=;
 b=3KryKJg2Lfek7SudUZkrozU9SZs3eX1GUDEaGfv2mxORsxRB1JcNklMjOml5GjZXaY
 LI2taHHeEszNZyCfU5BRqO4qIlAK20f64/kTfjqY4zzov5r/aJidUwgyCwLmbvsE3VmX
 TJyoPUB08NnBZJe/oOmjzXF0I4osGWNvgqy/IjnQl8oEI4zFstjrISJv1o2i3wWeYn0b
 Vf0cVvwe2btIus4Qa9xJsflqneS4X6sJqeBShfjnbcbJrkvN/b/Hd+cCuJpHcVxmyd2M
 a+18qJHyNumPoQ/bh63hwDwDQet8NFo3fCwFZTPBR7H0ARdRq1lLPVOfc647o8w3AlxX
 9SWg==
X-Gm-Message-State: ACrzQf0WME0OE/2dPIrc98aOR0yuimrH6lktJOJ5DUYB+3QyLCAPEl/e
 epGd9Q2EWyaBC7OonQ8aht8=
X-Google-Smtp-Source: AMsMyM7ew5rY2o5sFyAigiQLrwo0WFIN3A74MyBDnVGZenApR6lfBR7HI+lQT1jI0KwXoJoCofQupg==
X-Received: by 2002:a05:600c:1e89:b0:3c7:1e:acc2 with SMTP id
 be9-20020a05600c1e8900b003c7001eacc2mr18329812wmb.44.1666532715862; 
 Sun, 23 Oct 2022 06:45:15 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d6309000000b0022afcc11f65sm23645695wru.47.2022.10.23.06.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 06:45:15 -0700 (PDT)
References: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
 <20221022191308.82348-2-aidanmacdonald.0x0@gmail.com>
 <P076KR.VI33CVGCD2OG3@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/9] ASoC: jz4740-i2s: Handle independent FIFO flush
 bits
In-reply-to: <P076KR.VI33CVGCD2OG3@crapouillou.net>
Date: Sun, 23 Oct 2022 14:45:15 +0100
Message-ID: <C8ST2VJT1fllse8qckGmOAh4wCjnjIkE@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, zhouyu@wanyeetech.com, lgirdwood@gmail.com,
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

> Hi Aidan,
>
> Le sam. 22 oct. 2022 =C3=A0 20:13:00 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> On the JZ4740, there is a single bit that flushes (empties) both
>> the transmit and receive FIFO. Later SoCs have independent flush
>> bits for each FIFO.
>> Independent FIFOs can be flushed before the snd_soc_dai_active()
>> check because it won't disturb other active streams. This ensures
>> that the FIFO we're about to use is always flushed before starting
>> up. With shared FIFOs we can't do that because if another substream
>> is active, flushing its FIFO would cause underrun errors.
>> This also fixes a bug: since we were only setting the JZ4740's
>> flush bit, which corresponds to the TX FIFO flush bit on other
>> SoCs, other SoCs were not having their RX FIFO flushed at all.
>> Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>
> If you have a Fixes: tag you need to Cc linux-stable as well.
> See "option 1" of
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Then I'll resend with Cc: stable.

> Also, a cover letter with a description of the changes is good, but you s=
hould
> still add a changelog per patch (below the --- line so that it doesn't en=
d up
> in the commit message). That makes it much easier to review.

Thank you, I'll keep that in mind next time.

> With the Cc line added:
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>
> Cheers,
> -Paul
>
>> ---
>>  sound/soc/jz4740/jz4740-i2s.c | 39 ++++++++++++++++++++++++++++++-----
>>  1 file changed, 34 insertions(+), 5 deletions(-)
>> diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s=
.c
>> index c4c1e89b47c1..83cb81999c6f 100644
>> --- a/sound/soc/jz4740/jz4740-i2s.c
>> +++ b/sound/soc/jz4740/jz4740-i2s.c
>> @@ -55,7 +55,8 @@
>>  #define JZ_AIC_CTRL_MONO_TO_STEREO BIT(11)
>>  #define JZ_AIC_CTRL_SWITCH_ENDIANNESS BIT(10)
>>  #define JZ_AIC_CTRL_SIGNED_TO_UNSIGNED BIT(9)
>> -#define JZ_AIC_CTRL_FLUSH		BIT(8)
>> +#define JZ_AIC_CTRL_TFLUSH		BIT(8)
>> +#define JZ_AIC_CTRL_RFLUSH		BIT(7)
>>  #define JZ_AIC_CTRL_ENABLE_ROR_INT BIT(6)
>>  #define JZ_AIC_CTRL_ENABLE_TUR_INT BIT(5)
>>  #define JZ_AIC_CTRL_ENABLE_RFS_INT BIT(4)
>> @@ -90,6 +91,8 @@ enum jz47xx_i2s_version {
>>  struct i2s_soc_info {
>>  	enum jz47xx_i2s_version version;
>>  	struct snd_soc_dai_driver *dai;
>> +
>> +	bool shared_fifo_flush;
>>  };
>>  struct jz4740_i2s {
>> @@ -116,19 +119,44 @@ static inline void jz4740_i2s_write(const struct
>> jz4740_i2s *i2s,
>>  	writel(value, i2s->base + reg);
>>  }
>> +static inline void jz4740_i2s_set_bits(const struct jz4740_i2s *i2s,
>> +	unsigned int reg, uint32_t bits)
>> +{
>> +	uint32_t value =3D jz4740_i2s_read(i2s, reg);
>> +	value |=3D bits;
>> +	jz4740_i2s_write(i2s, reg, value);
>> +}
>> +
>>  static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
>>  	struct snd_soc_dai *dai)
>>  {
>>  	struct jz4740_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
>> -	uint32_t conf, ctrl;
>> +	uint32_t conf;
>>  	int ret;
>> +	/*
>> +	 * When we can flush FIFOs independently, only flush the FIFO
>> +	 * that is starting up. We can do this when the DAI is active
>> +	 * because it does not disturb other active substreams.
>> +	 */
>> +	if (!i2s->soc_info->shared_fifo_flush) {
>> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>> +			jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
>> +		else
>> +			jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_RFLUSH);
>> +	}
>> +
>>  	if (snd_soc_dai_active(dai))
>>  		return 0;
>> -	ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>> -	ctrl |=3D JZ_AIC_CTRL_FLUSH;
>> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>> +	/*
>> +	 * When there is a shared flush bit for both FIFOs, the TFLUSH
>> +	 * bit flushes both FIFOs. Flushing while the DAI is active would
>> +	 * cause FIFO underruns in other active substreams so we have to
>> +	 * guard this behind the snd_soc_dai_active() check.
>> +	 */
>> +	if (i2s->soc_info->shared_fifo_flush)
>> +		jz4740_i2s_set_bits(i2s, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
>>  	ret =3D clk_prepare_enable(i2s->clk_i2s);
>>  	if (ret)
>> @@ -443,6 +471,7 @@ static struct snd_soc_dai_driver jz4740_i2s_dai =3D {
>>  static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
>>  	.version =3D JZ_I2S_JZ4740,
>>  	.dai =3D &jz4740_i2s_dai,
>> +	.shared_fifo_flush =3D true,
>>  };
>>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
>> --
>> 2.38.1
>>
