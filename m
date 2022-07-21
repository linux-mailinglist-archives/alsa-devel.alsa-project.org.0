Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC257C897
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F4817A8;
	Thu, 21 Jul 2022 12:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F4817A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658398175;
	bh=lRoaCftAynJHTVFv9JW1EcyOvx9gpuRMSyNf6HObrhU=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jl3tR1DUEHZ2hZ4yHFmzWOIKPTK9WRTltbihymxFXmaJuP2j9SeehClDQuJpGYNe2
	 ZaN3f+B+oUxi9B9LoXUDqZg8JorPekhImWtYCmFfq4q503geqH2Df12+WBlRT3XaEd
	 fwUKcI9EmIsCVByI/1yGRvS2j/YfL0OiKoDzBigw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C887CF80256;
	Thu, 21 Jul 2022 12:08:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0709DF8016D; Thu, 21 Jul 2022 12:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4B97F800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B97F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="4CWAPyjG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1658398105; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zr0w1O3lZ0yYDNjjfrSSdrZWx1dvMhV92UH4jm6Fo5I=;
 b=4CWAPyjGKsXTwOQ9CFMAFIJjwPH42tynqPn0HHDXMYCujBxsGSV4zyefky40XMaYyCR4zV
 d706479PBxSxyD29/rk7dj3bnBzbF5fM0HDnoc5aP23lwF4MwNcF3f6EprNlAxxTu/JdqD
 iK4bNfGv/4cuUE8UdQJ11M2U16X0wFA=
Date: Thu, 21 Jul 2022 11:08:14 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 01/11] ASoC: jz4740-i2s: Handle independent FIFO flush
 bits
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <Q58DFR.835FR3DH8BFV@crapouillou.net>
In-Reply-To: <KM3aQuHkqtNZOgfaFAVA54klqcIZBA4X@localhost>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-2-aidanmacdonald.0x0@gmail.com>
 <UXHBFR.6W2XPUNX040K1@crapouillou.net>
 <KM3aQuHkqtNZOgfaFAVA54klqcIZBA4X@localhost>
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

Hi Aidan,

Le mer., juil. 20 2022 at 15:43:06 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
>=20
> Paul Cercueil <paul@crapouillou.net> writes:
>=20
>>  Hi Aidan,
>>=20
>>  Le ven., juil. 8 2022 at 17:02:34 +0100, Aidan MacDonald
>>  <aidanmacdonald.0x0@gmail.com> a =E9crit :
>>>  On the JZ4740, there is a single bit that flushes (empties) both
>>>  the transmit and receive FIFO. Later SoCs have independent flush
>>>  bits for each FIFO, which allows us to flush the right FIFO when
>>>  starting up a stream.
>>>  This also fixes a bug: since we were only setting the JZ4740's
>>>  flush bit, which corresponds to the TX FIFO flush bit on other
>>>  SoCs, other SoCs were not having their RX FIFO flushed at all.
>>>  Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
>>>  Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>>>  ---
>>>   sound/soc/jz4740/jz4740-i2s.c | 33=20
>>> ++++++++++++++++++++++++++++++---
>>>   1 file changed, 30 insertions(+), 3 deletions(-)
>>>  diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
>>> b/sound/soc/jz4740/jz4740-i2s.c
>>>  index ecd8df70d39c..576f31f9d734 100644
>>>  --- a/sound/soc/jz4740/jz4740-i2s.c
>>>  +++ b/sound/soc/jz4740/jz4740-i2s.c
>>>  @@ -64,6 +64,9 @@
>>>   #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
>>>   #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
>>>  +#define JZ4760_AIC_CTRL_TFLUSH BIT(8)
>>>  +#define JZ4760_AIC_CTRL_RFLUSH BIT(7)
>>=20
>>  Just rename JZ_AIC_CTRL_FLUSH to JZ_AIC_CTRL_TFLUSH and introduce
>>  JZ_AIC_CTRL_RLUSH.
>>=20
>=20
> According to the JZ4740 programming manual JZ_AIC_CTRL_FLUSH flushes
> both FIFOs, so it's not equivalent JZ4760_AIC_CTRL_TFLUSH. I don't
> think it's a good idea to confuse the two, or we'd need comments to
> explain why JZ4740 uses TFLUSH but not RFLUSH.

"shared_fifo_flush" is pretty much self-explanatory though. It then=20
becomes obvious looking at the code that when this flag is set, TFLUSH=20
flushes both FIFOs.

If you prefer... you can #define JZ_AIC_CTRL_FLUSH JZ_AIC_CTRL_TFLUSH.=20
I don't like the JZ4760 prefix, this is in no way specific to the=20
JZ4760.

>=20
>>>  +
>>>   #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
>>>   #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
>>>  @@ -90,6 +93,8 @@ enum jz47xx_i2s_version {
>>>   struct i2s_soc_info {
>>>   	enum jz47xx_i2s_version version;
>>>   	struct snd_soc_dai_driver *dai;
>>>  +
>>>  +	bool shared_fifo_flush;
>>>   };
>>>   struct jz4740_i2s {
>>>  @@ -124,12 +129,33 @@ static int jz4740_i2s_startup(struct=20
>>> snd_pcm_substream
>>>  *substream,
>>>   	uint32_t conf, ctrl;
>>>   	int ret;
>>>  +	/*
>>>  +	 * When we can flush FIFOs independently, only flush the
>>>  +	 * FIFO that is starting up.
>>>  +	 */
>>>  +	if (!i2s->soc_info->shared_fifo_flush) {
>>>  +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>>>  +
>>>  +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>>>  +			ctrl |=3D JZ4760_AIC_CTRL_TFLUSH;
>>>  +		else
>>>  +			ctrl |=3D JZ4760_AIC_CTRL_RFLUSH;
>>>  +
>>>  +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>>>  +	}
>>=20
>>  Wouldn't it be simpler to do one single if/else? And hy is one=20
>> checked before
>>  the (snd_soc_dai_active(dai)) check, and the other is checked after?
>=20
> snd_soc_dai_active() is essentially checking if there's an active
> substream. Eg. if no streams are open and you start playback, then
> the DAI will be inactive. If you then start capture while playback is
> running, the DAI is already active.
>=20
> With a shared flush bit we can only flush if there are no other active
> substreams (because we don't want to disturb the active stream by
> flushing the FIFO) so it goes after the snd_soc_dai_active() check.
>=20
> When the FIFOs can be separately flushed, flushing can be done before
> the check because it won't disturb any active substream.

Ok. It makes sense then. Please add some info about this in the commit=20
message, because it really wasn't obvious to me.

You should maybe factorize the read-modify-write into its own function.=20
I know this gets eventually modified by [03/11], but this [01/11] is a=20
bugfix so it will be applied to older kernels, and I'd rather not have=20
duplicated code there.

Cheers,
-Paul

>=20
>>  You could do something like this:
>>=20
>>  ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>>=20
>>  if (i2s->soc_info->shared_fifo_flush ||
>>     substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>>     ctrl |=3D JZ_AIC_CTRL_TFLUSH;
>>  } else {
>>     ctrl |=3D JZ_AIC_CTRL_RFLUSH;
>>  }
>>=20
>>  jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>>=20
>>  Cheers,
>>  -Paul
>>=20
>=20
>>>  +
>>>   	if (snd_soc_dai_active(dai))
>>>   		return 0;
>>>  -	ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>>>  -	ctrl |=3D JZ_AIC_CTRL_FLUSH;
>>>  -	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>>>  +	/*
>>>  +	 * When there is a shared flush bit for both FIFOs we can
>>>  +	 * only flush the FIFOs if no other stream has started.
>>>  +	 */
>>>  +	if (i2s->soc_info->shared_fifo_flush) {
>>>  +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>>>  +		ctrl |=3D JZ_AIC_CTRL_FLUSH;
>>>  +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>>>  +	}
>>>   	ret =3D clk_prepare_enable(i2s->clk_i2s);
>>>   	if (ret)
>>>  @@ -444,6 +470,7 @@ static struct snd_soc_dai_driver=20
>>> jz4740_i2s_dai =3D {
>>>   static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
>>>   	.version =3D JZ_I2S_JZ4740,
>>>   	.dai =3D &jz4740_i2s_dai,
>>>  +	.shared_fifo_flush =3D true,
>>>   };
>>>   static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
>>>  --
>>>  2.35.1
>>>=20
>=20


