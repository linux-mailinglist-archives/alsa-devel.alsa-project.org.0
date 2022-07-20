Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC257B8B0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 16:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB8B17A2;
	Wed, 20 Jul 2022 16:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB8B17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658328189;
	bh=0eg0trFr98q8BHd7YfksGhu+wYIUW7kH8DTn9CSYXmI=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RW3yi28gwp93CiH4M7P3i9M8MGV5+hLBAwAt9wlrfDI7+EjyG0Vr6C55LF8PKxLXN
	 mTNCJNTH9EvXbFOKMY4I0NYn15SMFDBpUiGDt85OcETxnUNUSSs3q8b6OdX/BmMPA2
	 qpMsZ5I+KaFFkupCpcArMsRYNsL/f1kgOWCNvDO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09956F800BA;
	Wed, 20 Jul 2022 16:42:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F4E4F80169; Wed, 20 Jul 2022 16:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DC07F800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 16:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DC07F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IwQ7xMGJ"
Received: by mail-wr1-x436.google.com with SMTP id b26so26451996wrc.2
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pmQh8wJ3rGOyskLRKw3GBidQJ3GYaUH4Sf2DdWGq4sA=;
 b=IwQ7xMGJH9hbQNGwL26KWu6TnEsH/DFR2NYp+KoJqhsfbXwh25rvNG2C3eBFsY90Gj
 x67YC2EVFMpdPktx7wptxhRMj3AbKXR6t64vD/f8PRQ7VZFp2btgHKu23QDXGgPX8i7K
 YOuqbpkpM34IT2FR5xL04/LtbBlfnlGBynGP0PZP19h6s11gAGaj98V9uzvfTfI7Ghxd
 W0yy6WPhS93h+NVdxkE51ezx+S/WjvLDGFHX5x/DSNCtpyibgBhMwDN3PX1kRbqBq7tf
 fpGX+WkqY1ngjLiDWcEFM9t2/VpBCQmK0sZKg1INu76InRBenbC4zt4w7OezAcqXRf0t
 jgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=pmQh8wJ3rGOyskLRKw3GBidQJ3GYaUH4Sf2DdWGq4sA=;
 b=2eN8uHL5d/nKyyvKwNCU2OTcT/Ae6iKago4wf8/wRUqevRffaOGUB29zG+duSMixiS
 lopNip0Qw732dd+5ys1Gh5g9M1lmDjmO0BPj86kRyrLVwePd/w9LLYF7cKGc7vjxxcHp
 aXj6oSHIRFufSbOfuwjHFSdE6z7ZTw0ZFDdLgW9h5+aGjKIM2b+zbSKUm9dDPnd87fKw
 Zro+ZqUnMEtY2MgaxOwAkreXl54XBYxrFIycq4h4ZnPzqfyZ6cNFcJz8GzkfSYgubxsY
 6mRnYj9jqGXH6URdEHWJATILaq7aadEwNeTezjvoQZR+BZTtDoCljp4M9eXiha6nyWSw
 k8Iw==
X-Gm-Message-State: AJIora/JtonibTYg5lrqsTjfOKYlhBnWGzCg/u+weetIQZYa7tuu1nil
 Fqu2LQCCBMkTaa7R6wOhPyQ=
X-Google-Smtp-Source: AGRyM1u8peSbDCPQD4pilAW2W4aTHPMOVo5SYnm6jIVyGgpq+8SaeL+2JrcT50gIumK0HO8Dg7b0Cw==
X-Received: by 2002:a05:6000:702:b0:21d:7f65:f1b5 with SMTP id
 bs2-20020a056000070200b0021d7f65f1b5mr30722788wrb.555.1658328117483; 
 Wed, 20 Jul 2022 07:41:57 -0700 (PDT)
Received: from localhost (92.40.203.135.threembb.co.uk. [92.40.203.135])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003a32167b8d4sm2714699wmm.13.2022.07.20.07.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 07:41:56 -0700 (PDT)
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-2-aidanmacdonald.0x0@gmail.com>
 <UXHBFR.6W2XPUNX040K1@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 01/11] ASoC: jz4740-i2s: Handle independent FIFO
 flush bits
In-reply-to: <UXHBFR.6W2XPUNX040K1@crapouillou.net>
Date: Wed, 20 Jul 2022 15:43:06 +0100
Message-ID: <KM3aQuHkqtNZOgfaFAVA54klqcIZBA4X@localhost>
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

> Hi Aidan,
>
> Le ven., juil. 8 2022 at 17:02:34 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> On the JZ4740, there is a single bit that flushes (empties) both
>> the transmit and receive FIFO. Later SoCs have independent flush
>> bits for each FIFO, which allows us to flush the right FIFO when
>> starting up a stream.
>> This also fixes a bug: since we were only setting the JZ4740's
>> flush bit, which corresponds to the TX FIFO flush bit on other
>> SoCs, other SoCs were not having their RX FIFO flushed at all.
>> Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>  sound/soc/jz4740/jz4740-i2s.c | 33 ++++++++++++++++++++++++++++++---
>>  1 file changed, 30 insertions(+), 3 deletions(-)
>> diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s=
.c
>> index ecd8df70d39c..576f31f9d734 100644
>> --- a/sound/soc/jz4740/jz4740-i2s.c
>> +++ b/sound/soc/jz4740/jz4740-i2s.c
>> @@ -64,6 +64,9 @@
>>  #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
>>  #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
>> +#define JZ4760_AIC_CTRL_TFLUSH BIT(8)
>> +#define JZ4760_AIC_CTRL_RFLUSH BIT(7)
>
> Just rename JZ_AIC_CTRL_FLUSH to JZ_AIC_CTRL_TFLUSH and introduce
> JZ_AIC_CTRL_RLUSH.
>

According to the JZ4740 programming manual JZ_AIC_CTRL_FLUSH flushes
both FIFOs, so it's not equivalent JZ4760_AIC_CTRL_TFLUSH. I don't
think it's a good idea to confuse the two, or we'd need comments to
explain why JZ4740 uses TFLUSH but not RFLUSH.

>> +
>>  #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
>>  #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
>> @@ -90,6 +93,8 @@ enum jz47xx_i2s_version {
>>  struct i2s_soc_info {
>>  	enum jz47xx_i2s_version version;
>>  	struct snd_soc_dai_driver *dai;
>> +
>> +	bool shared_fifo_flush;
>>  };
>>  struct jz4740_i2s {
>> @@ -124,12 +129,33 @@ static int jz4740_i2s_startup(struct snd_pcm_subst=
ream
>> *substream,
>>  	uint32_t conf, ctrl;
>>  	int ret;
>> +	/*
>> +	 * When we can flush FIFOs independently, only flush the
>> +	 * FIFO that is starting up.
>> +	 */
>> +	if (!i2s->soc_info->shared_fifo_flush) {
>> +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>> +
>> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>> +			ctrl |=3D JZ4760_AIC_CTRL_TFLUSH;
>> +		else
>> +			ctrl |=3D JZ4760_AIC_CTRL_RFLUSH;
>> +
>> +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>> +	}
>
> Wouldn't it be simpler to do one single if/else? And hy is one checked be=
fore
> the (snd_soc_dai_active(dai)) check, and the other is checked after?

snd_soc_dai_active() is essentially checking if there's an active
substream. Eg. if no streams are open and you start playback, then
the DAI will be inactive. If you then start capture while playback is
running, the DAI is already active.

With a shared flush bit we can only flush if there are no other active
substreams (because we don't want to disturb the active stream by
flushing the FIFO) so it goes after the snd_soc_dai_active() check.

When the FIFOs can be separately flushed, flushing can be done before
the check because it won't disturb any active substream.

> You could do something like this:
>
> ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>
> if (i2s->soc_info->shared_fifo_flush ||
>    substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>    ctrl |=3D JZ_AIC_CTRL_TFLUSH;
> } else {
>    ctrl |=3D JZ_AIC_CTRL_RFLUSH;
> }
>
> jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>
> Cheers,
> -Paul
>

>> +
>>  	if (snd_soc_dai_active(dai))
>>  		return 0;
>> -	ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>> -	ctrl |=3D JZ_AIC_CTRL_FLUSH;
>> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>> +	/*
>> +	 * When there is a shared flush bit for both FIFOs we can
>> +	 * only flush the FIFOs if no other stream has started.
>> +	 */
>> +	if (i2s->soc_info->shared_fifo_flush) {
>> +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>> +		ctrl |=3D JZ_AIC_CTRL_FLUSH;
>> +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>> +	}
>>  	ret =3D clk_prepare_enable(i2s->clk_i2s);
>>  	if (ret)
>> @@ -444,6 +470,7 @@ static struct snd_soc_dai_driver jz4740_i2s_dai =3D {
>>  static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
>>  	.version =3D JZ_I2S_JZ4740,
>>  	.dai =3D &jz4740_i2s_dai,
>> +	.shared_fifo_flush =3D true,
>>  };
>>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
>> --
>> 2.35.1
>>=20

