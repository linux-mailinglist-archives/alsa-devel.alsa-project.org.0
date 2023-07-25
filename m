Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C728761067
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 12:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63FA7EA9;
	Tue, 25 Jul 2023 12:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63FA7EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690280172;
	bh=pTyB8Tmu2DQdOL0CMajDwXKq0fOuDeQz+pBTecw+HfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EOujhY/zXFfLszJLVxCGciXSdTSMC+h+Kv2TdoOuc9omHxl5Z7WZcmTQ4z6xrDCqW
	 Z9VuxZw8onjB3hj/pOzlYC4y7kDZJgcU/SUbgS9OVlG6zQO/Kjy6zWJjJrb08NagxX
	 GuRxgVP2PUOY9etb4WvAKnV/I2hrm2UV0sS/wCX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7215DF80544; Tue, 25 Jul 2023 12:15:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D70F8F80153;
	Tue, 25 Jul 2023 12:15:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD3FEF80163; Tue, 25 Jul 2023 12:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F1ACF800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 12:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F1ACF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=xr2pqPyl
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5701eaf0d04so63116357b3.2
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690280109; x=1690884909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erCjSkC9KKXf4HZ3WKTycAwEPfysE7GXkEGTjXCWoCc=;
        b=xr2pqPyl8f27DEfe19pvgcmJ6G7iYsnSQ2Wo2xIMgcWWnQDr6CttYXkCV+ygNEijGA
         Tz+VNxBKhxXezvexfPrTvp+VXR3c5+q8GlSLCs5fhYcLV26UeVvBdsutUMhdBQDDfkiO
         KqigSW5HrvP7uhvVL1iW4wzufgvd/ibIxFyrPgXw4p0FebigAckIyz2ugh7saz+8kmDB
         uTLa45BlCOM19TKKhUDnc3uQX+suuyTAT5i7X03n+0xaxaVcHo226rsAKddx+HO1dEYH
         eNMEEAgXwWwcT5zfSB233zmFb+Xgx2SLNJ6alD3MWIuQOV8SsyotWS1rwqQ/rXljg/9R
         vpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280109; x=1690884909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erCjSkC9KKXf4HZ3WKTycAwEPfysE7GXkEGTjXCWoCc=;
        b=FZD+hwu1GNP1itnQ2cBpXXxIR40D+7MGhbeeZZ+Xnoyy9Bnr3fFt+rrdav6VuYHoZv
         cwm190z18jsPWpxCIu2palptLP3mH1gtXcpe/z+GmBrFC8CZ0os/+6SUQd5cJicLhCmZ
         VUALwFZPPeWNlFXpCDRQql9EQquuvZCGZjrKYNWEAuZmqPa0KUA88lv98ih9r8JfXIZZ
         7ib6uMkfT0ftQP+eLUQ2TVAqq5RinYEsEycDrwPh4rTf5nj0KhA+WIB2V2j8SWvLn6gb
         8ed3/ptapmqgFiufvoppk5uOheFAYdJvBkfKRPguOBroe8ai3qJyEMKFTvhjOsDZMQRF
         SoXA==
X-Gm-Message-State: ABy/qLYWXv3RaTSA5AOxGCBnpvW+HOOTxQ5U7kgwu1hXOIBXyxeoaHqf
	qnP3z2sq5l++IhuSxVJhvPU99pakJL/SnNDnSolX
X-Google-Smtp-Source: 
 APBJJlGIO67AaF30j+BiHBC7vNFOhVQy4zYdxjKEcTdPuwUJyitpRm4x1zlrpIeM8OGM0y6X5Dm43P3CjK6IM53ptVk=
X-Received: by 2002:a0d:ea56:0:b0:57c:9e81:723 with SMTP id
 t83-20020a0dea56000000b0057c9e810723mr9598105ywe.5.1690280108609; Tue, 25 Jul
 2023 03:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230725093005.3499455-1-lerobert@google.com>
 <87sf9ctifg.wl-tiwai@suse.de>
In-Reply-To: <87sf9ctifg.wl-tiwai@suse.de>
From: Robert Lee <lerobert@google.com>
Date: Tue, 25 Jul 2023 18:14:56 +0800
Message-ID: 
 <CAOM6g_Db8qwbDmbWSSLKqUHsSMLUYxFtpqKi1cWsXsXTE9B+vA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: compress: add opus codec define
To: Takashi Iwai <tiwai@suse.de>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3RFTF4N7HVNIZG64TEV2XOEBMBHCLCTP
X-Message-ID-Hash: 3RFTF4N7HVNIZG64TEV2XOEBMBHCLCTP
X-MailFrom: lerobert@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RFTF4N7HVNIZG64TEV2XOEBMBHCLCTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks for reply so quickly.
And yes, there are other changes but it is inside our offload pcm
driver to handle it.
Currently we only use it to decode, and we don't need additional option for=
 it.

Thanks,
Robert.

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2023=E5=B9=B47=E6=9C=8825=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 25 Jul 2023 11:30:05 +0200,
> Robert Lee wrote:
> >
> > Add to support decode Opus codec in Ogg container.
> >
> > Signed-off-by: Robert Lee <lerobert@google.com>
>
> The change makes sense only when it's really used.  So usually it's
> better to put into a series that actually implements its usage.
>
>
> thanks,
>
> Takashi
>
> > ---
> >  include/uapi/sound/compress_params.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/=
compress_params.h
> > index ddc77322d571..bac5797bcb02 100644
> > --- a/include/uapi/sound/compress_params.h
> > +++ b/include/uapi/sound/compress_params.h
> > @@ -43,7 +43,8 @@
> >  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
> >  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
> >  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> > -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> > +#define SND_AUDIOCODEC_OPUS                  ((__u32) 0x00000011)
> > +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS
> >
> >  /*
> >   * Profile and modes are listed with bit masks. This allows for a
> > --
> > 2.41.0.487.g6d72f3e995-goog
> >
