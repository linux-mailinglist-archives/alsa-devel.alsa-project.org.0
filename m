Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23256A5AD
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 16:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B773C1630;
	Thu,  7 Jul 2022 16:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B773C1630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657204878;
	bh=odnnmuwtg20WRYOKzqAndWB/Izqv49P47KW2EJhRoqs=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JA5Iskg+Yu5n8VPa5qf2AelNjZnsnwqw+8VUi1gamCHim8zoNQu+5XQkUMrxi15Og
	 /uiFABstcpZFiRZM67p/EndgW0/SR2nY8dudGwQCYt6Dm2MC/8ZCdOp3EP6NIgtcj8
	 zSJMIImWhxx1Tqs29c9VcInbq6XvEjEFMT9ON86o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E703F8028D;
	Thu,  7 Jul 2022 16:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C003F8016A; Thu,  7 Jul 2022 16:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODYSUB_1,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1220FF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 16:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1220FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OdyYpCiO"
Received: by mail-wr1-x42d.google.com with SMTP id v14so26650958wra.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:date:in-reply-to:message-id
 :mime-version:content-transfer-encoding;
 bh=7hDgGA6xF58M+skK5QIlnWLQGV+3ttaXAD+vkX6SQTM=;
 b=OdyYpCiOrG7tlyeD9SoTpDDuQKJBKKGA87S7R8V3Q+QJ6NDK+vvD0cs3jfGUf7UMH9
 lDhOJ2LadM95+PlfXuW7J6oHRmERFWaQmQAVWaiCGpuhOSfA08EwL+dBUYiT57caITab
 j9MXKxNQiATFITxDffnWSJXK5ecwjuSz1f5ZOkxuJnlrWHxJccAzdx1y+echUhgYECSV
 pKNZ80ClGqR9sXoB2jW9ocoAInVKc7fFJToX+qLHe9BNeBUQgmeNV9MuoaT9rD6Kmskk
 tVg4vH6ToLFRFNi4TQx348MPbnO5J/Qgb7t6dGQFpcnAZkGlsDIUiwikKjXH4f7sl+9h
 /Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7hDgGA6xF58M+skK5QIlnWLQGV+3ttaXAD+vkX6SQTM=;
 b=77eOmIMD5Vh0SU8tI7tifDSqq2mcCurJe9qJV08iyRWeEdUn+NM5F3iV4PFL6D0AcM
 wf/UyEJaBgWYvOeXi3BR1p8OprQPw1lbEw/LGGnP+tVSrsyrEDe5X7Qksi5AHIlQ1m8i
 VWlUBrDeuX6oiSFuVPE8yBWOQewBDGHANNOWOkDL87P3POfzwiGpGIpPVyQliHqL1D+v
 NgVtehBOHF6DIzocssCSIFDPM8K8eyL8sTza6ZjCb3qrCGFRq0nJaejmhiw7sPcwCoat
 gbhy2ppvI9tZiSaHUbtSIak9mQwuGy01xeRYmainZt1G6roPrzVFlEbhjdRxm3dn6teY
 u+rw==
X-Gm-Message-State: AJIora+jgEli1ah5FPWjFJ4yGj1gNAFKxa7b5azDYCLCOD/jKK2Nkj4U
 fkwmApch2/5uWlUnmeF/m18=
X-Google-Smtp-Source: AGRyM1sOSpUSUa6euRjRBfNV9zECcsAUzzpDfBRmqUBeQ0d4SlwF4Zobq3KK7HmgaZgVwAO86qi/ZA==
X-Received: by 2002:a5d:58cc:0:b0:21d:6919:7daf with SMTP id
 o12-20020a5d58cc000000b0021d69197dafmr22860158wrf.434.1657204808231; 
 Thu, 07 Jul 2022 07:40:08 -0700 (PDT)
Received: from localhost (92.40.203.175.threembb.co.uk. [92.40.203.175])
 by smtp.gmail.com with ESMTPSA id
 az42-20020a05600c602a00b003a1a02c6d7bsm14485822wmb.35.2022.07.07.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 07:40:07 -0700 (PDT)
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
 <20220706211330.120198-11-aidanmacdonald.0x0@gmail.com>
 <H4ANER.XJSSJIHNXTEA1@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE
 sample formats
Date: Thu, 07 Jul 2022 15:25:06 +0100
In-reply-to: <H4ANER.XJSSJIHNXTEA1@crapouillou.net>
Message-ID: <jp7AjR5Hus1i7prrsjVT3n5vI5jaszTk@localhost>
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

> Le mer., juil. 6 2022 at 22:13:29 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> The audio controller on JZ47xx SoCs supports 20- and 24-bit
>> samples coming from memory. Allow those formats to be used
>> with the I2S driver.
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>  sound/soc/jz4740/jz4740-i2s.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>> diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s=
.c
>> index 80b355d715ce..ee99c5e781ec 100644
>> --- a/sound/soc/jz4740/jz4740-i2s.c
>> +++ b/sound/soc/jz4740/jz4740-i2s.c
>> @@ -222,9 +222,15 @@ static int jz4740_i2s_hw_params(struct snd_pcm_subs=
tream
>> *substream,
>>  	case SNDRV_PCM_FORMAT_S8:
>>  		sample_size =3D 0;
>>  		break;
>> -	case SNDRV_PCM_FORMAT_S16:
>> +	case SNDRV_PCM_FORMAT_S16_LE:
>>  		sample_size =3D 1;
>>  		break;
>> +	case SNDRV_PCM_FORMAT_S20_LE:
>> +		sample_size =3D 3;
>> +		break;
>> +	case SNDRV_PCM_FORMAT_S24_LE:
>> +		sample_size =3D 4;
>> +		break;
>
> Did you test these? It is unclear to me, looking at the JZ4740 PM, if the
> 18-bit, 20-bit and 24-bit samples are in 4 bytes or 3 bytes.
>
> Cheers,
> -Paul
>

I was only able to test 24-bit -- in practice 20-bit seems pretty rare
and I'm finding it difficult to convert anything into that format with
standard tools like ffmpeg, sox, etc. so I can't really test it.

From what I understand, this is configuring the number of significant
bits in the FIFO and has nothing to do with the in-memory format. So
my commit message is a bit inaccurate.

DMA can only do 4-byte transfers so that's why only 4-byte formats are
usable. I suppose I could handle the 3-byte variants here, but there's
probably no point to doing that if DMA can't transfer them.

>>  	default:
>>  		return -EINVAL;
>>  	}
>> @@ -362,7 +368,9 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_o=
ps =3D
>> {
>>  };
>>  #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
>> -		SNDRV_PCM_FMTBIT_S16_LE)
>> +			 SNDRV_PCM_FMTBIT_S16_LE | \
>> +			 SNDRV_PCM_FMTBIT_S20_LE | \
>> +			 SNDRV_PCM_FMTBIT_S24_LE)
>>  static struct snd_soc_dai_driver jz4740_i2s_dai =3D {
>>  	.probe =3D jz4740_i2s_dai_probe,
>> --
>> 2.35.1
>>=20

