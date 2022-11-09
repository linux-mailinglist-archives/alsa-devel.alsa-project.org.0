Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A270A622845
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 11:21:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3417683B;
	Wed,  9 Nov 2022 11:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3417683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667989282;
	bh=aB57Y+h9dvAgLP4+v7s3u24IwhYvRpT3/2HlgtnUBlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4NPR6175G5mTuJ4viibmzUknNcf/saZKyf5wQRggGUHt4VW5kWpdEG+k+WIDwwL4
	 x+vtdRSBF5Yh7Hh4JoHEYL1pfx3zm5R+LK0vKgLT1yUU5wgyRf2PScyxYcrHkvrbSW
	 0tGi3maZcEvb2CDcaXGQMUIhs3NBuXIGELz/s9sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05068F80114;
	Wed,  9 Nov 2022 11:20:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD24FF80217; Wed,  9 Nov 2022 11:20:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65734F80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 11:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65734F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cm7wSLR6"
Received: by mail-lf1-x130.google.com with SMTP id f37so24943335lfv.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 02:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5r6KoisG3XYaVvdVQvgXTuqMO/9wZuIyI11DUMhCMkU=;
 b=cm7wSLR6mgbQnLK2ADdrbxwPSWOoetknctx5mCrjYReE8OE1qxTLUYFB5iuq/xmkJa
 uboXjHj0a6vOhxXjR/RcN5LwpE3tF2Q+qjOau3JtsPsgY5XDHE9zw1bm4E5uhOIB6/EX
 Ey5vMBnzIJz3F+9Nwhmu6QVVUPgm0LVecrM3SudT5EOGdkUestN9pqjNk8uL/rdSYEym
 gmxziRiXjo3l1RxUHj8XOgs5puRG8rdPFIYadyX6MEyE3Agx59KHQWTIkMcliMzeB5yY
 3lXjExmHPMZXbcmJY0ZVL58UAvYD/gcSciT0TG3loyo7UIvTsFeOUr6sB/fPOwmlnGxi
 nc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5r6KoisG3XYaVvdVQvgXTuqMO/9wZuIyI11DUMhCMkU=;
 b=XhQ5MVz2lLyXz1Zqe/PV4iZqiuBlNpj/Ql5HpzKg2xX6TbjWFPbETKH1fh3Y84PAMZ
 AMAluD4YB1V7ydSnMftZ3+46UTPTPDdmPFWtzJmCVpQUebN16P1In+1ecG8+va3XQ0WX
 yn5PqjY4bQH3V7/t6dxHlQmAq5VSMQ88heGp7FrgIqAHbnKN6h5J4rvG2fsDfAoyk1FU
 Q0TgOJ7ec83wYDv26wymEae8tJu/IJdXoA2VyBIbmE+Te0IV9woHk308j/c4WU8DlIMH
 YayNQKD0H/k8iDl+s0QKBKYlWnMRJmA/bhKAv+oQAwkk+AgAJkyrz3CT6sCVWjDhaF5/
 f0fQ==
X-Gm-Message-State: ACrzQf0qeG4jW0TR6K4K/sKxLD2Q02J7l+5yWUVH0dNA0ZhjWf0XJS6f
 fVXVXTpi/sfKwDRwJRXuSBImU8mAOkOV93ZHvj0=
X-Google-Smtp-Source: AMsMyM4yL+YaiIo1hBgnyMkfJp6x55NXM99QUVq9q9jKXSpHmJZmp5oq0O7KMfyTdETQkQwt8yTJH7+cVZJ86pVkQtg=
X-Received: by 2002:ac2:58d8:0:b0:4af:af1f:87e0 with SMTP id
 u24-20020ac258d8000000b004afaf1f87e0mr19741718lfo.283.1667989215508; Wed, 09
 Nov 2022 02:20:15 -0800 (PST)
MIME-Version: 1.0
References: <1667793912-18957-1-git-send-email-shengjiu.wang@nxp.com>
 <c15c4464-6f44-26c0-36ba-05232af5362a@perex.cz>
In-Reply-To: <c15c4464-6f44-26c0-36ba-05232af5362a@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 9 Nov 2022 18:20:03 +0800
Message-ID: <CAA+D8ANqrcpctFF9OAci5gVvCOK3-qRROHb5L2SL_zEs5jjZWg@mail.gmail.com>
Subject: Re: [PATCH] pcm: rate - check rate type for using
 snd_pcm_rate_slave_frames
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, broonie@kernel.org,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Wed, Nov 9, 2022 at 4:39 PM Jaroslav Kysela <perex@perex.cz> wrote:

> On 07. 11. 22 5:05, Shengjiu Wang wrote:
> > With plughw device and mmap case, the plug pcm fast_ops pointer is same
> > as slave pcm fast_ops, but ops pointer is different, which cause
> > the "bus error" in snd_pcm_rate_slave_frames.
> >
> > The test command is
> > arecord -Dplughw:x -r12000 -c2 -fS16_LE -M temp.wav
> >
> > This patch is to add pcm type check as commit:
> > d21e0e01 pcm: plugin - fix avail_min calculation on rate plugin
> >
> > Fixes: d9dbb57b ("pcm: rate - rewrite the may_wait_for_avail_min
> callback for the rate plugin")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >   src/pcm/pcm_rate.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
> > index e8815e8b..dc502202 100644
> > --- a/src/pcm/pcm_rate.c
> > +++ b/src/pcm/pcm_rate.c
> > @@ -1304,8 +1304,11 @@ static snd_pcm_uframes_t
> snd_pcm_rate_slave_frames(snd_pcm_t *pcm, snd_pcm_ufram
> >   static int snd_pcm_rate_may_wait_for_avail_min(snd_pcm_t *pcm,
> >                                              snd_pcm_uframes_t avail)
> >   {
> > -     return snd_pcm_plugin_may_wait_for_avail_min_conv(pcm, avail,
> > -
>  snd_pcm_rate_slave_frames);
> > +     if (snd_pcm_type(pcm) == SND_PCM_TYPE_RATE)
> > +             return snd_pcm_plugin_may_wait_for_avail_min_conv(pcm,
> avail,
> > +
>  snd_pcm_rate_slave_frames);
> > +     else
> > +             return snd_pcm_plugin_may_wait_for_avail_min_conv(pcm,
> avail, NULL);
> >   }
> >
> >   static const snd_pcm_fast_ops_t snd_pcm_rate_fast_ops = {
>
> It's not a correct fix. The snd_pcm_t pointer passed to all fast ops
> functions should be in sync with the callback implementation.
>
> I tried to fix this issue in commits:
>
>
> https://github.com/alsa-project/alsa-lib/commit/aa4f56c3c952269c36464cc0da9db5a1381648fa
>
> https://github.com/alsa-project/alsa-lib/commit/39060852d810461dc8cd1464cfb2ffe84da42d56
>
> Let me know, if this update does work for you. Thank you for your report.
>
> Thanks for the fix.  The crash is fixed. We will do more tests.

best regards
wang shengjiu


>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
