Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E864911868
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 04:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA311B65;
	Fri, 21 Jun 2024 04:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA311B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718936539;
	bh=K6TXBBkcuGG3+1AOnlgP+3FCiMsThHscvB97VY8MFhM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a3j7dy9CdqtiIjImXIfwaB+aCQEPoPHNPgDHLzaYDRFbrgRpsc6htyap4Ltm6T83v
	 lBagoerdhoFB2kAfhZGnS66nZ3sABbCAXLx53hn0mi65iCrgnKi26T8u9gg3XSYLaQ
	 Pyqh1PzE8nbdbNbzqP49GMuW6V7bnywHN6QVXeO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2354BF8059F; Fri, 21 Jun 2024 04:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FC3F805A8;
	Fri, 21 Jun 2024 04:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B52B3F8023A; Fri, 21 Jun 2024 04:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6097F801EB
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 04:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6097F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M9C+NC0Y
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-376208fbe7bso5757045ab.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 19:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718936490; x=1719541290;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSk8h7hKbIPqaEw4OuvVmqhytgxXbEHflO4uc1Iybpk=;
        b=M9C+NC0YuLAcCsM2WLnPneFSRA4bkgsN7HFgJlYkLW7HmwJcfSYt3SY5OpRrZExiBz
         tOEu73SdGyN71Mjiq1dzat76kwpkz/zck90xwVsymE6GC978kWNXojdGGrs5Z/xhvmQH
         FvuwP4/qnyJ4x2yRRFsd31sH+Q1JVqq4ddLKp196rPQk8FhJZ+NyhSsNHbKY/U6htJY7
         wnGAjYHhUmu7Aei5vJ1Wu0BrgH8h4rrBr6VWCeN8XcRhApfPePFe0mTwn96hT/r2cTLu
         uvMYMPrkoleUXJ5aBN01uCP30vKgxKFFMKsHU5zurm5UY8Vil+P1x9fdl9tvCrc8G8Y8
         oZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718936490; x=1719541290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSk8h7hKbIPqaEw4OuvVmqhytgxXbEHflO4uc1Iybpk=;
        b=YiYwnwVnqZzM9Pcs+Brq1HrNStGu74GLduPgkRvJeO1SVAqMAlBNIk9WpwlWQizLJT
         EP7MyJm6a6fFS3yOYHvKb3mtlG6wTi/wIx9/UcxXJtmPpS8Q6fgEI9xIbtGyB8kfaQG1
         g3QaMbSaDKG622eRVD9Q+Kkhnx+MpIA3qEwhNOrnWNCKyB1AuamTq+nz48aBrSIw0q6C
         G2nXiCMOEhVc80ZxYLhryU4WZDE5gM+cRvRxi/xyhSGPjMcy1SWbm1mXWNUrJxuBXKZw
         4c7cysxAuffM12iWE4JsfTHSsqsnylbls4pS3WKwdpbTxbzKT9u+lmf++4LPLl1SLwQw
         mfsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKwdoXIsxrt3yvr48IlmYQYj7HbMoahUXrpfuSauZOn082C8j5Wk7vmrNGVxnYuJ3qTr53Uv6p4ShhQ9cRW/b6xGbsYG8TrEJyerg=
X-Gm-Message-State: AOJu0YwzbsExDsKWK4PnTRInoWYlFy8JenSxeg/iifp1dWQbGSdhdDpo
	XsPvfGuixeD4LXQ6qSKw4+jWe14N9a9IO5QvC2lfMysuPbMUuKhAV8HGMRQWhiuAb8/epqrLhup
	2qCRwryH0TzHkVZNCSvshpyc2zIY=
X-Google-Smtp-Source: 
 AGHT+IGmfVNJDop2DudLdwqs9uZVTjlcrH2ShhifeWXIuD43SSv94NurFFxYTdFRVLVT3Fyp2S1okJmsNyfPB0Oapa0=
X-Received: by 2002:a92:c269:0:b0:374:abf8:4f65 with SMTP id
 e9e14a558f8ab-3761d74e1d1mr72390415ab.32.1718936490164; Thu, 20 Jun 2024
 19:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <1718851218-27803-1-git-send-email-shengjiu.wang@nxp.com>
 <87frt82gj7.wl-tiwai@suse.de>
In-Reply-To: <87frt82gj7.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 21 Jun 2024 10:21:19 +0800
Message-ID: 
 <CAA+D8APZ8-3NFceuQeTnEL-K4reUGGfrgyG63jyjydFA6o_4MA@mail.gmail.com>
Subject: Re: [RESEND PATCH] ALSA: dmaengine_pcm: terminate dmaengine before
 synchronize
To: Takashi Iwai <tiwai@suse.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lars@metafoo.de, perex@perex.cz,
 tiwai@suse.com,
	broonie@kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JZCCMPLZTSDHRIHRZKOC6ZAFEPZRTP6R
X-Message-ID-Hash: JZCCMPLZTSDHRIHRZKOC6ZAFEPZRTP6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZCCMPLZTSDHRIHRZKOC6ZAFEPZRTP6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 20, 2024 at 3:56=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 20 Jun 2024 04:40:18 +0200,
> Shengjiu Wang wrote:
> >
> > When dmaengine supports pause function, in suspend state,
> > dmaengine_pause() is called instead of dmaengine_terminate_async(),
> >
> > In end of playback stream, the runtime->state will go to
> > SNDRV_PCM_STATE_DRAINING, if system suspend & resume happen
> > at this time, application will not resume playback stream, the
> > stream will be closed directly, the dmaengine_terminate_async()
> > will not be called before the dmaengine_synchronize(), which
> > violates the call sequence for dmaengine_synchronize().
>
> Hmm, I can't follow this state change.
> Do you mean that:
> - snd_pcm_drain() is performed for a playback stream
> - while draining operation, the system goes to suspend
> - the system resumes (but the application doesn't call resume yet)
> - The stream is closed (without calling resume)
> ??

yes. this is the case.

>
> If so, it's rather an inconsistent PCM state in the core side, and can
> be fixed by a simple call like below:
>
> -- 8< --
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2700,6 +2700,7 @@ void snd_pcm_release_substream(struct snd_pcm_subst=
ream *substream)
>         if (substream->ref_count > 0)
>                 return;
>
> +       snd_pcm_resume(substream);
>         snd_pcm_drop(substream);
>         if (substream->hw_opened) {
>                 if (substream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
> -- 8< --
>
> This will be no-op for the PCM device without SNDRV_PCM_INFO_RESUME.
>
> But, this may need more rework, too; admittedly it imposes the
> unnecessary resume of the stream although it shall be stopped and
> closed immediately after that.  We may have some optimization in
> addition.

The suspended_state is not cleared that the resume may be called again
at the end of stream.

Will you push the code?

Best regards
Shengjiu Wang

>
>
> thanks,
>
> Takashi
