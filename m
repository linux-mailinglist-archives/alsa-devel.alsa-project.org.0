Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647EBCB9F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 17:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F400616B3;
	Tue, 24 Sep 2019 17:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F400616B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569339319;
	bh=RQizCfyofjtkXfdhiOKE4OaB2J4fDV9Kiy6/QcRU3nQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mwNG5x8f3o0hebPDyFkdnqiThYZ4WsSzGWEoCaW0RBn7xWDXi8rVH+Qo/uRBlkrvv
	 DZ1u8JjM3rzn2KUdd0sPB4GnLot3p7vOihDY43SHyFlvWIFBoBgWMPs2l5fTUrjAtQ
	 OMK+sgeQryUxroPtRwKnX9UW6y0nMsta9r0wAAOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47079F80533;
	Tue, 24 Sep 2019 17:33:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10EDF8045F; Tue, 24 Sep 2019 17:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA4E1F802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 17:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA4E1F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GGqAep3c"
Received: by mail-qk1-x730.google.com with SMTP id y189so2212823qkc.3
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQyHJxXQ2560NvsHCfmcAJ7W7f6KVt4qCaRtYqtNtog=;
 b=GGqAep3c8LuyY+x7v3KlG3JAra0zFR9OcKuzJv6rKg4Jmv3gF85eVRsjP7or5/zFek
 Gp26Fo5x4g1i/AHCoqy4ANacvj/NaaOjvtS1aqvPOI4nrDIaHbJHKfByr8e3wnYZBCDk
 CZ6EMAoh9SdycpDbMN/MTdcCthHVLf25od4bquiy4yJUD3w3YBS19ezXbsY+iN3wv6j7
 eMNpEm0K+QvV+ufGnxPG373Oavy60g2A7IMVcpYE3cj89ebiz7CjSaVAqyWDMbe3vWT+
 QaEErN2mWWSD6nZSE8uuFutWV32IEkbC5gEXghR9ALh0wOSDpSkZITAe34mIYph3a3og
 152g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQyHJxXQ2560NvsHCfmcAJ7W7f6KVt4qCaRtYqtNtog=;
 b=KNQ/y4RqWSHrr1s6ZRFMF+/vpTboGREpxZp7ryxnMJunnXekqK6jGCdRgxAIRTqkLA
 HI3uTeL+8sRdc98qJFtaqAD4YjilieRdq2RGdK81ayo7wGc90PABQCQhXOW1XGJkcCtd
 Y6sOtQ+NJqOmd259hOuelQ96/L3lKiySsoKp2sBVwvr+MJ7LAsDE0Ur86lQA7CzvA84g
 7cpjHZFnnFKzgJGZXRPkOBuoDz4FfvI7DpndkXx4Qo/mzdpRGudqXyOy6P01qv5Z5Cga
 ErWMmofEimFItonXcTUVbBjD8/x0iASvG0IZ0yOeZDdE0TjNAhYpXsYWeK8PhrslD0Dl
 fTXw==
X-Gm-Message-State: APjAAAXhvKdN31TQpjpP46Su6FPNX9yuA8CR7YKneQnN4sm5aE2lgMFN
 OsLXES8MHYj5zhnziljmDGhG+cybB5W8tH/EZLE=
X-Google-Smtp-Source: APXvYqwpbjwU7D2EaFzjXxRMNoC0azLaZyRBoxwXDToaJmP9NcdeqjKuAyVGCKFM3NfjiNaGxJU+h53ffc2uSTaw0YI=
X-Received: by 2002:ae9:ee10:: with SMTP id i16mr2920504qkg.35.1569339207075; 
 Tue, 24 Sep 2019 08:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
 <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
 <878168cb-07e0-cdfd-37e9-9b9fb229155b@free.fr>
 <20190924135219.GQ10204@ediswmail.ad.cirrus.com>
 <0a1bd89e-c6b7-d9ce-dac2-fa324e42b31d@free.fr>
 <20190924144259.GR10204@ediswmail.ad.cirrus.com>
In-Reply-To: <20190924144259.GR10204@ediswmail.ad.cirrus.com>
From: Pavel Hofman <pavhofman@gmail.com>
Date: Tue, 24 Sep 2019 17:33:15 +0200
Message-ID: <CA+SWvNzDjfgFJL4=HZn4dGRBQfDYr0T0NZCQFf_rOL=SKPxcxA@mail.gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] Propagating audio properties along the audio path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Sep 24, 2019 at 4:44 PM Charles Keepax <
ckeepax@opensource.cirrus.com> wrote:

> > "at one point we were just closing the stream (somehow) if we detected
> > a change in e.g. sample-rate, so the user-space application would fail
> > on snd_pcm_readi()"
> >
> >       snd_pcm_stop(p_spdif->capture_stream,
> SNDRV_PCM_STATE_DISCONNECTED);
> >
>
> Ah ok yeah that seems like a pretty good option to me thus
> forcing user-space to re-open at the new params.
>
>
E.g. SPDIF receivers do that when sample rate change is detected in a
separate timer thread

https://github.com/torvalds/linux/blob/master/sound/i2c/other/ak4114.c#L588
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
