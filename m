Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C52741014
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98AE7F1;
	Wed, 28 Jun 2023 13:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98AE7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687951868;
	bh=70eiRgMId8GszUBox+K8lSzub08GDt5E0bcgSN/md3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rYxeV7a7/q1dyNiKfLagasqPoICfK33VhB7bSGs++9fAD1FF8R/lj49kv0JehHUa+
	 AbcNV0twlGf3ChafCiQWT4lEL//nU8Zfriac7nQ5FblUw+0LBtMLwt77KcaSMLcuFJ
	 kad+T+i7ku0D/YIM4Vn5LXKYEoLH2vH5oVbjke6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FB4CF8057F; Wed, 28 Jun 2023 13:29:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 495A3F80579;
	Wed, 28 Jun 2023 13:29:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C80FF80246; Tue, 27 Jun 2023 12:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10A3DF80124
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 12:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10A3DF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dj7GHGZn
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313e714342cso3459861f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Jun 2023 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687863331; x=1690455331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBb5URQN0kKPJGX9e65RQhKm85RHTpZ2JS4kUJzomcs=;
        b=dj7GHGZnTDG/FnGE3uZfDBmMlrZCetCOq1VfSfOQhX76nTh0ySpdlJxWwsUNQhu+ka
         8AhaCFYYmZUWMZvbon9Z+Fsg2vZ6St7+UdYz0ayPc5qPd16SH/Yub4ay+7pvvn1MLcTm
         6TYvzRibjGxeyB5rRRQbnxwCLPcPwHf7SSP2QDqagGMICgF0SFwiAeJ7zh61v3kvCXMZ
         agazkGMt72Cp9dKH8NN7GsbIoVbqAjAX0LL+8dkHo2PIZensoQE5HAFi7DrzsnhPb6ak
         eJegCZiUP314M2p7nzkN2vtvr0VePon+at4/0aqSCg93g9+sf5DFz4w1wJH/Me+s5zeG
         VABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687863331; x=1690455331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBb5URQN0kKPJGX9e65RQhKm85RHTpZ2JS4kUJzomcs=;
        b=lb1M8LfCVWSh4q5Eo3gbKNMxo3TupweuH3R/+ics+g7QdiplZRH6fW/WTHAqWomLpa
         Da5DXTU1BQycTLJqCpf4IvbfX9U4ocS8QAzlBnHCcYLY+9v25oeF5+cCUHDCDT7vFyWA
         2KlzFksTh10riCwpezwZ5Hzmw/Rx3xYDedq0Eow4ViB9hE+58AlAlpabRSIr+FYPfKDw
         YTLErWqfsHPkGilWJBPnLxesToEV98W4l48g/czcS0y/LZ02tPRMddonfQvBDPH+8go4
         fJ49CZx8s4cWRFeVBeH1iPMY7txaa2HTUZznNeO8OLQUHI8bhTadWH07W1V1NrgUx6BZ
         ZWKg==
X-Gm-Message-State: AC+VfDzWT76K9MVVWCQwGQ3bDxoMf3LXOmB6TLd4PNQYtvn1VuffYm1a
	Z5oXeG7KDtok8InBeSND+j0UP1Mv55V4tdPaTdE=
X-Google-Smtp-Source: 
 ACHHUZ6Nub3lyZD6Zpipd6CDx1GlU9GPN7JjXdnPtj1sdd9MPHyejyogmbI/vCxN6ebr2rYNX13L+wsIId9OWChC5uA=
X-Received: by 2002:a5d:4489:0:b0:313:ef08:c83b with SMTP id
 j9-20020a5d4489000000b00313ef08c83bmr5946932wrq.56.1687863330593; Tue, 27 Jun
 2023 03:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230627095616.5333-1-dg573847474@gmail.com>
 <87jzvpfcli.wl-tiwai@suse.de>
In-Reply-To: <87jzvpfcli.wl-tiwai@suse.de>
From: =?UTF-8?B?5Y+25r6E6ZSL?= <dg573847474@gmail.com>
Date: Tue, 27 Jun 2023 18:55:19 +0800
Message-ID: 
 <CAAo+4rV6qbUftFFDX0q1+tkbmZNrY7nN2b12B4GhsjJ64k6PVg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: sb: fix potential deadlock on &chip->mixer_lock
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: dg573847474@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DPOUVRTZA5GGLGSA5BCX7CI7SF2XCCVT
X-Message-ID-Hash: DPOUVRTZA5GGLGSA5BCX7CI7SF2XCCVT
X-Mailman-Approved-At: Wed, 28 Jun 2023 11:29:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPOUVRTZA5GGLGSA5BCX7CI7SF2XCCVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Oh yes, sorry for not considering that one.

Best regards
Chengfeng

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2023=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=
=91=A8=E4=BA=8C 18:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 27 Jun 2023 11:56:16 +0200,
> Chengfeng Ye wrote:
> >
> > As &chip->mixer_lock is also acquired by the irq snd_sb8dsp_interrupt()
> > which executes under hard-irq context, code executing under process
> > context should disable irq before acquiring the lock, otherwise
> > deadlock could happen if the process context hold the lock then
> > preempt by the interruption.
> >
> > As the ALSA Driver document described, PCM prepare callbacks are not
> > executed with irq disabled by default, thus the acquiring of
> > &chip->mixer_lock should be irq disabled.
> >
> > Possible deadlock scenario:
> > snd_sb8_playback_prepare
> >     -> spin_lock(&chip->mixer_lock);
> >         <irq interrupt>
> >         -> snd_sb8dsp_interrupt()
> >         -> snd_sb8_capture_trigger()
> >         -> spin_lock(&chip->mixer_lock); (deadlock here)
> >
> > This flaw was found using an experimental static analysis tool we are
> > developing for irq-related deadlock.
> >
> > The tentative patch fix the potential deadlock by spin_lock_irqsave().
> >
> > Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
>
> I believe it's a false-positive.  There is already a call
>         spin_lock_irqsave(&chip->reg_lock, flags);
> beforehand.
>
>
> thanks,
>
> Takashi
