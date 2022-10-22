Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A431608E26
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 17:44:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80CC983F;
	Sat, 22 Oct 2022 17:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80CC983F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666453457;
	bh=6cQXFRW8w7r2tCng8VrXWZ2oA+F715EeFOQfsVzD/3s=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OS7j4cJjB4+t1EXS9P5TQc60W7E0D/D9D27FGZCShYY0DctHKOx0Wk2jVMJvZ0lj7
	 LLkqOdUmOpplIJ7dBKjqiODWXyqMWT85Br30P9yqgxtiLI0csNVM4ABnNCkyinS25S
	 PA8aMVnKww65lGK1L2dKErfBT7whZrW6ZKh9rMNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61259F8012A;
	Sat, 22 Oct 2022 17:43:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B2A8F80290; Sat, 22 Oct 2022 17:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66BE6F8012A
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 17:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66BE6F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Atb6QXoy"
Received: by mail-wm1-x334.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so5125622wms.1
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:from:to:cc:subject:date:message-id
 :reply-to; bh=J9r+aFR8+2XwprKP6aUwtuqR0EdoHS149XwjTsHXczI=;
 b=Atb6QXoy2zOIgecKnjLHwUEN2heu9wkTpFNqI8supYptdMcuxInUr5HAJsJM80Tj9o
 VkZR8XeUlyty0Zml/N24OsUr9roqXdpVPeAcHpUNC9RYC92hHPDmKq0O27MhYDy3Bi+o
 TlHP7GqbwSeFqznULI4mlMmDBnBSCjeMRUnIYWf0VSVRDHQJ8MIquwCbNmskwbwRm1P8
 8chIjVgV5rcEdeTMXwXLkkQsFYeOgSl1G+7xDn/uY5/NfdaD+fZdUDqe/0O7NuhcCp0k
 aYJtHUDUxVSOWklZXvD7n9IdCWnp/9NF9Y/2A1zMHxGSjBiNxcF99n8Lk4qjf+kVgq9O
 XO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=J9r+aFR8+2XwprKP6aUwtuqR0EdoHS149XwjTsHXczI=;
 b=YRlr32iKUEoWTjpYT6cyEDGq31/imjF7UrwZptRQBgc5oUd1jLkmP5EvQw8KiYd5IV
 plxDLSIZz5Ky5bEuGoJkq7bcWS33m+AuG3eAfb2f1ZVVXRnA7jrWDHuZHti534JgkGNy
 jJOAGb+fGxzGPVdHDlZZnRp3wDaPj0tO206a4+0Cmdw5P4VL7EXVpozU3O0tpNAn51xg
 qeJprgLySo2heN6fJ/kCj76Q827uNWMcEcJmrwanu0Q7DDM1pOHAl51sWgvyarGanV9F
 nW52j2rm0JQPF+vP7znyKonuHZim1B9KbQnJArP4/2fn5VLMivrmz0bJHNadvBD261Ic
 NrVA==
X-Gm-Message-State: ACrzQf2YFlROoCK9752rp3ETHoj8HLVErxyiNQPMILPhl/a6P0/KjgJ1
 pBsZtU62KmCu7XqigXIN0ns=
X-Google-Smtp-Source: AMsMyM4wj9mhNf9PgnbhTN3dPvQmxmMTj72Z5wjcRTJ2hsR5qKS78V2WVXT1/5o5i4agdnM9lTTQVw==
X-Received: by 2002:a05:600c:4588:b0:3c6:f645:dad0 with SMTP id
 r8-20020a05600c458800b003c6f645dad0mr17700663wmo.114.1666453392376; 
 Sat, 22 Oct 2022 08:43:12 -0700 (PDT)
Received: from localhost (94.197.3.61.threembb.co.uk. [94.197.3.61])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c2d0300b003a2f2bb72d5sm3403926wmf.45.2022.10.22.08.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:43:11 -0700 (PDT)
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
 <20220708160244.21933-2-aidanmacdonald.0x0@gmail.com>
 <UXHBFR.6W2XPUNX040K1@crapouillou.net>
 <KM3aQuHkqtNZOgfaFAVA54klqcIZBA4X@localhost>
 <Q58DFR.835FR3DH8BFV@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 01/11] ASoC: jz4740-i2s: Handle independent FIFO
 flush bits
In-reply-to: <Q58DFR.835FR3DH8BFV@crapouillou.net>
Date: Sat, 22 Oct 2022 16:43:07 +0100
Message-ID: <xDY1t3w8XLey5GcrHHg3gEH9kOIC7xq6@localhost>
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
> Le mer., juil. 20 2022 at 15:43:06 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> Paul Cercueil <paul@crapouillou.net> writes:
>>
>> According to the JZ4740 programming manual JZ_AIC_CTRL_FLUSH flushes
>> both FIFOs, so it's not equivalent JZ4760_AIC_CTRL_TFLUSH. I don't
>> think it's a good idea to confuse the two, or we'd need comments to
>> explain why JZ4740 uses TFLUSH but not RFLUSH.
>
> "shared_fifo_flush" is pretty much self-explanatory though. It then becom=
es
> obvious looking at the code that when this flag is set, TFLUSH flushes bo=
th
> FIFOs.
>
> If you prefer... you can #define JZ_AIC_CTRL_FLUSH JZ_AIC_CTRL_TFLUSH. I =
don't
> like the JZ4760 prefix, this is in no way specific to the JZ4760.
>

Makes sense, I'll stick with TFLUSH / RFLUSH only.

>>
>>>>  +
>>>>   #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_OFFSET 19
>>>>   #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_OFFSET  16
>>>>  @@ -90,6 +93,8 @@ enum jz47xx_i2s_version {
>>>>   struct i2s_soc_info {
>>>>   	enum jz47xx_i2s_version version;
>>>>   	struct snd_soc_dai_driver *dai;
>>>>  +
>>>>  +	bool shared_fifo_flush;
>>>>   };
>>>>   struct jz4740_i2s {
>>>>  @@ -124,12 +129,33 @@ static int jz4740_i2s_startup(struct
>>>> snd_pcm_substream
>>>>  *substream,
>>>>   	uint32_t conf, ctrl;
>>>>   	int ret;
>>>>  +	/*
>>>>  +	 * When we can flush FIFOs independently, only flush the
>>>>  +	 * FIFO that is starting up.
>>>>  +	 */
>>>>  +	if (!i2s->soc_info->shared_fifo_flush) {
>>>>  +		ctrl =3D jz4740_i2s_read(i2s, JZ_REG_AIC_CTRL);
>>>>  +
>>>>  +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>>>>  +			ctrl |=3D JZ4760_AIC_CTRL_TFLUSH;
>>>>  +		else
>>>>  +			ctrl |=3D JZ4760_AIC_CTRL_RFLUSH;
>>>>  +
>>>>  +		jz4740_i2s_write(i2s, JZ_REG_AIC_CTRL, ctrl);
>>>>  +	}
>>>  Wouldn't it be simpler to do one single if/else? And hy is one checked
>>> before
>>>  the (snd_soc_dai_active(dai)) check, and the other is checked after?
>> snd_soc_dai_active() is essentially checking if there's an active
>> substream. Eg. if no streams are open and you start playback, then
>> the DAI will be inactive. If you then start capture while playback is
>> running, the DAI is already active.
>> With a shared flush bit we can only flush if there are no other active
>> substreams (because we don't want to disturb the active stream by
>> flushing the FIFO) so it goes after the snd_soc_dai_active() check.
>> When the FIFOs can be separately flushed, flushing can be done before
>> the check because it won't disturb any active substream.
>
> Ok. It makes sense then. Please add some info about this in the commit me=
ssage,
> because it really wasn't obvious to me.

It wasn't that obvious to me either :)

I've added code comments too since it seems likely to trip people up
if you're only taking a casual glance.

> You should maybe factorize the read-modify-write into its own function. I=
 know
> this gets eventually modified by [03/11], but this [01/11] is a bugfix so=
 it
> will be applied to older kernels, and I'd rather not have duplicated code
> there.
>
> Cheers,
> -Paul

And I've factored out the r-m-w helper as requested.

Regards,
Aidan
