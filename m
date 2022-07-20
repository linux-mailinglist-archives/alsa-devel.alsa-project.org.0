Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F257B5C5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 13:45:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8CEC171A;
	Wed, 20 Jul 2022 13:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8CEC171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658317549;
	bh=u2W79I+sNR0o7m3N2djAIybLT4iWXcVJf/XZOANa9WM=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mT/18z5+G4ATC5JRPjlaJ7jX5Ij4UIinFmjnmpIYyKhPlvjtfO0jAaENEpCoKbca5
	 2f1vXH24DiYGWScQ+MMg5T+odoRFyJp3R+1STl1P58lk7YZd0IPBMGxVeZimqhnetT
	 z6QvcnBneZr16uxzECb1BE//awl9cMtTlCvlZBNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55A03F8025D;
	Wed, 20 Jul 2022 13:44:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FC80F80169; Wed, 20 Jul 2022 13:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ECC8F80139
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 13:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ECC8F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="pmPNW73S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1658317473; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfVrDHEaoRWXZN/HPQzTExDiPVvqkM20tNaJY4XTG7k=;
 b=pmPNW73SsabPhfkXe2GuaO61RJcyuQJkm6+2r6XRpoftHet7iBhMA/kK6MoZm71fxlgAqU
 GtJSNQlvwU5zitRxPk770YVdDWy26wAit7edFN6EJ6fQhXOtoXPD/pxCN9T9+D+VzSatGd
 rMYf2pWJsnKmQbjXbACt4m9i6azetrM=
Date: Wed, 20 Jul 2022 12:44:18 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 01/11] ASoC: jz4740-i2s: Handle independent FIFO flush
 bits
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Message-Id: <UXHBFR.6W2XPUNX040K1@crapouillou.net>
In-Reply-To: <20220708160244.21933-2-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-2-aidanmacdonald.0x0@gmail.com>
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

Le ven., juil. 8 2022 at 17:02:34 +0100, Aidan MacDonald=20
<aidanmacdonald.0x0@gmail.com> a =E9crit :
> On the JZ4740, there is a single bit that flushes (empties) both
> the transmit and receive FIFO. Later SoCs have independent flush
> bits for each FIFO, which allows us to flush the right FIFO when
> starting up a stream.
>=20
> This also fixes a bug: since we were only setting the JZ4740's
> flush bit, which corresponds to the TX FIFO flush bit on other
> SoCs, other SoCs were not having their RX FIFO flushed at all.
>=20
> Fixes: 967beb2e8777 ("ASoC: jz4740: Add jz4780 support")
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  sound/soc/jz4740/jz4740-i2s.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/jz4740/jz4740-i2s.c=20
> b/sound/soc/jz4740/jz4740-i2s.c
> index ecd8df70d39c..576f31f9d734 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -64,6 +64,9 @@
>  #define JZ_AIC_CTRL_ENABLE_PLAYBACK BIT(1)
>  #define JZ_AIC_CTRL_ENABLE_CAPTURE BIT(0)
>=20
> +#define JZ4760_AIC_CTRL_TFLUSH BIT(8)
> +#define JZ4760_AIC_CTRL_RFLUSH BIT(7)

Just rename JZ_AIC_CTRL_FLUSH to JZ_AIC_CTRL_TFLUSH and introduce=20
JZ_AIC_CTRL_RLUSH.

> +
>  #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
>  #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
>=20
> @@ -90,6 +93,8 @@ enum jz47xx_i2s_version {
>  struct i2s_soc_info {
>  	enum jz47xx_i2s_version version;
>  	struct snd_soc_dai_driver *dai;
> +
> +	bool shared_fifo_flush;
>  };
>=20
>  struct jz4740_i2s {
> @@ -124,12 +129,33 @@ static int jz4740_i2s_startup(struct=20
> snd_pcm_substream *substream,
>  	uint32_t conf, ctrl;
>  	int ret;
>=20
> +	/*
> +	 * When we can flush FIFOs independently, only flush the
> +	 * FIFO that is starting up.
> +	 */
> +	if (!i2s->soc_info->shared_fifo_flush) {
> +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
> +
> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +			ctrl |=3D JZ4760_AIC_CTRL_TFLUSH;
> +		else
> +			ctrl |=3D JZ4760_AIC_CTRL_RFLUSH;
> +
> +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
> +	}

Wouldn't it be simpler to do one single if/else? And hy is one checked=20
before the (snd_soc_dai_active(dai)) check, and the other is checked=20
after?

You could do something like this:

ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);

if (i2s->soc_info->shared_fifo_flush ||
    substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
    ctrl |=3D JZ_AIC_CTRL_TFLUSH;
} else {
    ctrl |=3D JZ_AIC_CTRL_RFLUSH;
}

jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);

Cheers,
-Paul

> +
>  	if (snd_soc_dai_active(dai))
>  		return 0;
>=20
> -	ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
> -	ctrl |=3D JZ_AIC_CTRL_FLUSH;
> -	jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
> +	/*
> +	 * When there is a shared flush bit for both FIFOs we can
> +	 * only flush the FIFOs if no other stream has started.
> +	 */
> +	if (i2s->soc_info->shared_fifo_flush) {
> +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
> +		ctrl |=3D JZ_AIC_CTRL_FLUSH;
> +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
> +	}
>=20
>  	ret =3D clk_prepare_enable(i2s->clk_i2s);
>  	if (ret)
> @@ -444,6 +470,7 @@ static struct snd_soc_dai_driver jz4740_i2s_dai =3D=20
> {
>  static const struct i2s_soc_info jz4740_i2s_soc_info =3D {
>  	.version =3D JZ_I2S_JZ4740,
>  	.dai =3D &jz4740_i2s_dai,
> +	.shared_fifo_flush =3D true,
>  };
>=20
>  static const struct i2s_soc_info jz4760_i2s_soc_info =3D {
> --
> 2.35.1
>=20


