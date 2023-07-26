Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19C76284C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 03:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54199FA;
	Wed, 26 Jul 2023 03:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54199FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690336139;
	bh=INBv/W7pxT2hTyF17i+pRAZMn/ELL9xs+IdIbv4jEn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bji/9ozilAASTYS74iXOwLHJthdZxXz1+nPw/sHoGg/uAWDtjesCr9IUXO72RzUYR
	 dzhwz+UfCPp7VDxUYLH0op+mW5w80IMFUUTbxZ01yIdZT3kRqXQmrT1M35eUFzwyvR
	 lJdLPVTy8nqnsidGhxgHpRqWx5G481xgEY64leTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51D15F80520; Wed, 26 Jul 2023 03:48:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ADCDF80149;
	Wed, 26 Jul 2023 03:48:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89FA6F8019B; Wed, 26 Jul 2023 03:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A734BF80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 03:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A734BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=I1wqWaF7
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-58439daf39fso11251277b3.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 18:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690336045; x=1690940845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GWTIil/tm7mqD4sdysaM/Da0PfAMCmi2KUFDiSQGwA=;
        b=I1wqWaF7xVjCzMs+jeu7Mf+11Tx5KCsdv9Rcv8lBYR569EaeTkQdk73AgXA4ErQA64
         DPGXqVv9KUqyjwD3DzDKPxPkonBtIFfFSX3TgmXhhbTTCUhZ3NtNlBPp1MuGDWxEHX8D
         MYlpqLfRIDc5AzwBTMCOH/e+aeyoWWZlJ2I7BZHXDhjbctB+EQkirNbOpQhBdpqKafxE
         Rg6X3ztrKELT3NWEgghlPLWFZr4/2Bx+dV9IMww3z0bKxISmI6QbYC6sa+xJp2O9UWDr
         Dsa+PY7a2rbCE/i+18XdesZACx9KaxCONOsHPA84XQwnN7mjce6ymDN3CWOm7GPYBsdU
         wvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690336045; x=1690940845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GWTIil/tm7mqD4sdysaM/Da0PfAMCmi2KUFDiSQGwA=;
        b=KX98oAH6HBdSTW7OCcd2wecR7FPNMsOo//eUbBP/U5OTNmfvHgMo6fLL8OWFAgylqI
         aoceGYo1PEtifnSe+2PXMYShyZPHRxKpUZVlTqFWtAwWp2Wohscq6F6ruBEuW68gQElw
         PeJbapzE5QQ6cFhwFIFIvWj/f68ujAMpqJciAzVSwJ7arcCkRBXPE69HNe3YiQ60mZNi
         8C7gE2Ts6zJqggp6zbEagMKNxBqJ7nc8sr5eoCEzmUKdPY+USL6PZ2TyQCzMYY3TvzfN
         svoUCtR90Of67NFcqr3Q05/wp7jNYk8lzRT9SxXzz+Ikkj6LIJDjQMl1ogMzuFGI6PQk
         MVtg==
X-Gm-Message-State: ABy/qLYXztEb9VArhx7+13EP0BD0bneQxvmwdRNYFufuQO4WOTngsYXP
	fzuD41BzNxO4aZMwBYR0GHl3rMqxy2efjvNj/5yq
X-Google-Smtp-Source: 
 APBJJlGKCmF6Eq7yIsgErcnDcg/CYg926aKaUaYzEfOzvWSEGEZNw51kJosjI5zxYDSJvamqMRJphUgL4Cq5GX9fLzQ=
X-Received: by 2002:a81:7bd5:0:b0:579:f5e3:ad07 with SMTP id
 w204-20020a817bd5000000b00579f5e3ad07mr844539ywc.14.1690336044906; Tue, 25
 Jul 2023 18:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230725093005.3499455-1-lerobert@google.com>
 <87sf9ctifg.wl-tiwai@suse.de>
 <CAOM6g_Db8qwbDmbWSSLKqUHsSMLUYxFtpqKi1cWsXsXTE9B+vA@mail.gmail.com>
 <87lef4thir.wl-tiwai@suse.de>
In-Reply-To: <87lef4thir.wl-tiwai@suse.de>
From: Robert Lee <lerobert@google.com>
Date: Wed, 26 Jul 2023 09:47:13 +0800
Message-ID: 
 <CAOM6g_DVKpEhnVStpNWmPoXyHNUuNTA+CNbdPxasObGcXtGEpQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: compress: add opus codec define
To: Takashi Iwai <tiwai@suse.de>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NYPVO5PHOZAOHVYRGYDHXSUA4TJPJCOD
X-Message-ID-Hash: NYPVO5PHOZAOHVYRGYDHXSUA4TJPJCOD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYPVO5PHOZAOHVYRGYDHXSUA4TJPJCOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Yes, but we still need this change to let the sound system can use the
codec. or do you have any suggestions?

Thanks,
Robert.

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2023=E5=B9=B47=E6=9C=8825=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 25 Jul 2023 12:14:56 +0200,
> Robert Lee wrote:
> >
> > Thanks for reply so quickly.
> > And yes, there are other changes but it is inside our offload pcm
> > driver to handle it.
> > Currently we only use it to decode, and we don't need additional option=
 for it.
>
> It means still a downstream-only change :)
>
> It's nice to upstream changes in general, but from the upstream POV,
> only changing this gives no benefit.  Let's tie with the actual use
> case *in the upstream*.
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks,
> > Robert.
> >
> > Takashi Iwai <tiwai@suse.de> =E6=96=BC 2023=E5=B9=B47=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, 25 Jul 2023 11:30:05 +0200,
> > > Robert Lee wrote:
> > > >
> > > > Add to support decode Opus codec in Ogg container.
> > > >
> > > > Signed-off-by: Robert Lee <lerobert@google.com>
> > >
> > > The change makes sense only when it's really used.  So usually it's
> > > better to put into a series that actually implements its usage.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > > ---
> > > >  include/uapi/sound/compress_params.h | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/so=
und/compress_params.h
> > > > index ddc77322d571..bac5797bcb02 100644
> > > > --- a/include/uapi/sound/compress_params.h
> > > > +++ b/include/uapi/sound/compress_params.h
> > > > @@ -43,7 +43,8 @@
> > > >  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
> > > >  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
> > > >  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> > > > -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> > > > +#define SND_AUDIOCODEC_OPUS                  ((__u32) 0x00000011)
> > > > +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS
> > > >
> > > >  /*
> > > >   * Profile and modes are listed with bit masks. This allows for a
> > > > --
> > > > 2.41.0.487.g6d72f3e995-goog
> > > >
> >
