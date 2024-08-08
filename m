Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A664594B9B4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 11:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173C1839;
	Thu,  8 Aug 2024 11:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173C1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723109498;
	bh=Dn37q0zxK+IzrlVlGi41Gx+dbyz8wiLjnCD5TZ2BVHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wkj0LFem+Ii0DFchHn4h374/vCnfJ986Rqbg/yfvP26077dnnKNPF+fC5qVRLTcbL
	 n4D/igQhL+A9sEbuQWT6+jQfqLR5QYExVg/QQDfJYg3/cg6w0Qh5brtx/XTbK6J59H
	 Coh4bIbjQhUJJZiKS29JXXNxdQr3tl8BvOAZ65NM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3854AF805B0; Thu,  8 Aug 2024 11:31:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86139F805AE;
	Thu,  8 Aug 2024 11:31:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75263F802DB; Thu,  8 Aug 2024 11:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 435B0F80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 11:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 435B0F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YiS72LDp
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-39b27935379so3089645ab.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Aug 2024 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723108685; x=1723713485;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REVFtsd7kP8SZQgw0r+/fGQwfeWNPXAh6Qw7M45oeOc=;
        b=YiS72LDppjWNRREHt0ix4tdedTm23vpXJPTTTRQbXVH4C4Q634PJOfVtwVFTm0/7bL
         r4nDqolfAfaL/7x/iIvQxyG12qpUoESdvvyE8KeKr0hapXFuQjbXiZckuiVUL3GnGmSX
         3PQwsdFjdH7KBormqYiUt1uF+lg1qzBGym9UvOI3+EmEmXz7f9xuywqrHuS8ZPp6ZBHj
         v3+Gx0jF2GOug0pmE9JUHgRZ58KyI8FkjJv+q2w6kQB/4dWc7GVMoSc2o6Ly0dIvxFu5
         1a70GrJbG3/hgFsu3+V/YW7oDz6fr96expFi4zqRAsZZhtNoJ/Yreyq5NczfpyAUb7xL
         jUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723108685; x=1723713485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REVFtsd7kP8SZQgw0r+/fGQwfeWNPXAh6Qw7M45oeOc=;
        b=A3SDk02LVqTEu/ADVO5elE3sp445JOh2/5xBRZ2ewZJ4qDorvXZH58bUr7oLUeH+u3
         ljgvmsMegEarZ/Zajeq5LC5TNqsKlop7945foKhMPVxlZKf6HIv/92lelDVfTaZy8tCJ
         pEy0zcfS80h1VgViyo6hv88SgXVUchnQ0bxSMlaX3NIsO07mbln+i6xY9mfwoKNbnpNw
         DVd7QCHQonFsOwOiXCIEcKx9EfVqaZqz+qE+JE0fQ8aEoA8krG0ksrpbMDn1YnXbEDIg
         Zb/wtybeTCW29VnDsAtty3EzytLie/I3rSVxauBQAHjckK2lwYtwz6VGlZ1J+anGpT69
         mxXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6+P45yWNVtg7jolqdvnsR3x+m8ygl6cuGGz+kyFe4EVEIYMlQP9bitA9aO+cgCZB7v4pM2bIlkt1HrN1wVAuMIVRDY6f4X2R0C4E=
X-Gm-Message-State: AOJu0YxyFzMKjpQyh4rajJAweqnryS9hREvTuvfwUEbd84ZRJGR9kgDs
	VhT6xA4susPcGPL+eyQlvFj9itQM2mKonba7bsl77Z4vG5nyFCngCCW9eMh8J4dCCEwNI95o8YU
	9gnBsF4rwWxTkBi5Pbl1uI/R1fgY=
X-Google-Smtp-Source: 
 AGHT+IEjn7a01cBmdtTZmS2Jngj4iwhQXD0sAvy+xjfVRnfVk+u+mV1GNclk46ZWlpryZJLGRifYGzNADxyjfJHrItA=
X-Received: by 2002:a05:6e02:154c:b0:397:2918:6f52 with SMTP id
 e9e14a558f8ab-39b5ed4a0e4mr12415825ab.25.1723108684958; Thu, 08 Aug 2024
 02:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
In-Reply-To: <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 8 Aug 2024 17:17:53 +0800
Message-ID: 
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5FS646LCIVTCG6XAIJRDXMBKS3MXG4NJ
X-Message-ID-Hash: 5FS646LCIVTCG6XAIJRDXMBKS3MXG4NJ
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FS646LCIVTCG6XAIJRDXMBKS3MXG4NJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 6, 2024 at 7:25=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 8/6/24 12:26, Shengjiu Wang wrote:
> > Add Sample Rate Converter(SRC) codec support, define the output
> > format and rate for SRC.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  include/uapi/sound/compress_offload.h | 2 ++
> >  include/uapi/sound/compress_params.h  | 9 ++++++++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound=
/compress_offload.h
> > index 98772b0cbcb7..8b2b72f94e26 100644
> > --- a/include/uapi/sound/compress_offload.h
> > +++ b/include/uapi/sound/compress_offload.h
> > @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
> >   * end of the track
> >   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encode=
r at the
> >   * beginning of the track
> > + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample=
 rate converter
> >   */
> >  enum sndrv_compress_encoder {
> >       SNDRV_COMPRESS_ENCODER_PADDING =3D 1,
> >       SNDRV_COMPRESS_ENCODER_DELAY =3D 2,
> > +     SNDRV_COMPRESS_SRC_RATIO_MOD =3D 3,
> >  };
>
> this sounds wrong to me. The sample rate converter is not an "encoder",
> and the properties for padding/delay are totally specific to an encoder
> function.

There is only decoder and encoder definition for compress,  I know
it is difficult to add SRC to encoder or decoder classification,
SRC is a Post Processing.  I hope you can have a recommandation.

Thanks.

Best regards
Shengjiu Wang

>
> The other point is that I am not sure how standard this ratio_mod
> parameter is. This could be totally specific to a specific
> implementation, and another ASRC might have different parameters.
>
> >
> >  /**
> > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/=
compress_params.h
> > index ddc77322d571..0843773ea6b4 100644
> > --- a/include/uapi/sound/compress_params.h
> > +++ b/include/uapi/sound/compress_params.h
> > @@ -43,7 +43,8 @@
> >  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
> >  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
> >  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> > -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> > +#define SND_AUDIOCODEC_SRC                   ((__u32) 0x00000011)
> > +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_SRC
>
> I am not sure this is wise to change such definitions?
> >
> >  /*
> >   * Profile and modes are listed with bit masks. This allows for a
> > @@ -324,6 +325,11 @@ struct snd_dec_ape {
> >       __u32 seek_table_present;
> >  } __attribute__((packed, aligned(4)));
> >
> > +struct snd_dec_src {
> > +     __u32 format_out;
> > +     __u32 rate_out;
> > +} __attribute__((packed, aligned(4)));
>
> Again I am not sure how standard those parameters are, and even if they
> were if their representation is reusable.
>
> And the compressed API has a good split between encoders and decoders, I
> am not sure how an SRC can be classified as either.
>
> >  union snd_codec_options {
> >       struct snd_enc_wma wma;
> >       struct snd_enc_vorbis vorbis;
> > @@ -334,6 +340,7 @@ union snd_codec_options {
> >       struct snd_dec_wma wma_d;
> >       struct snd_dec_alac alac_d;
> >       struct snd_dec_ape ape_d;
> > +     struct snd_dec_src src;
> >  } __attribute__((packed, aligned(4)));
> >
> >  /** struct snd_codec_desc - description of codec capabilities
>
