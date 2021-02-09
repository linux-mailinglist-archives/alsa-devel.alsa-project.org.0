Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A222331499C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 08:39:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126C216AD;
	Tue,  9 Feb 2021 08:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126C216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612856388;
	bh=mrfvpUuAzaJkoz8UJ6j93VK1lxGrQ/ksxrI0XhyexKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzFy31bgB2o/w5atsUkITuYJymaspXy6C9CqzUVnQy8TyureDcTmoLzwtPi2bev9u
	 lFREQjTzsHZTf93j1+ON7AErlcUaQvDJKtBfyT0jBA/EDGq3R0YELtgGvm6a4e1js/
	 uT4Zqt+zswIpSHroaTWmT/sCoJohZdoMVR6gfDVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E87F80107;
	Tue,  9 Feb 2021 08:38:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96716F801D5; Tue,  9 Feb 2021 08:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A0C2F8016B
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 08:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A0C2F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aFqx19Cs"
Received: by mail-qk1-x731.google.com with SMTP id 19so6961560qkc.13
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 23:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TA2zCXQWyDOuZ3241o0zHrHJeg5zoATDvEC3rNF5Thg=;
 b=aFqx19CsiDQ4CXdqv8NtZ9EA2SKeMsd4xC4NZ/nzezK9+J6zvORRsH7FpjZ00Ik6/L
 6hsxiV08Y+k2xbFHdnzVNJDW7n5XdC5Vv4di0f6h18Xz1hRTODJSwxvh5MMKW14p9V/V
 E+3pzL41BHxu8upArS7dHxNDsjFJt3vk73nK1UcCUpVoCxNjGXigytpfnmQJ3Tf8aZ50
 k49zN3UzHVgw/WsyvCBXUL7RXB13r6O6jBmp10AjM5BpJQ4DmlXJ6RnarQKz4wip9By5
 Ax42LOGkX8LkSYwCx4yCZUOChSuFsobNto37UtbuEDaEZr4Z8zRgHutlxAognEYXNYiD
 UrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TA2zCXQWyDOuZ3241o0zHrHJeg5zoATDvEC3rNF5Thg=;
 b=AMdw/R2z9Q7uS1Z70+58C3NDKCKjPMR/JrphFTOayI+eyJx/mJd2V4QvArHlA6rHkJ
 Vlm5EkZZeHzz4Ud+ql+cwwcCpDtcg8r+5QQEVrbI5vwfhTpj2eOu3CN3bO23jzfS1hHJ
 qqaDd4s783jtySHe64HhO6V2lW6m8MDEotUChvWLX33gWZxEDPS/ccBnJN1Ya2tYwmg1
 C9Ionp9AZPVWCVOYPKaCCJDkoCdWVSxT0mKOtz/4f6VyhX7WLzBs4TTKSku+Y3LFQBJO
 55V+0rpl3epMTucdY11C00tlxUzSyez8qFatw+OgDdqO18b3X+Ci8lPMnVoDenRnHN2W
 Ihvw==
X-Gm-Message-State: AOAM530tLyGXeDTFQ7E24cARo2Y7601xHTpq0FJY+iigSfiwQk2galR4
 XZ/ChTfovYBjE4gQP9rkGKiy4g2WSHJ/uhGpA/M=
X-Google-Smtp-Source: ABdhPJxQFReVv8ndL4K9cxsOw8JEsTJl2WThnm+2bqROErPee3aBm7b19iLaQ3kifghsdVfNJILtYnI8++GJL2d7Ojo=
X-Received: by 2002:a37:a004:: with SMTP id j4mr6861902qke.450.1612856277739; 
 Mon, 08 Feb 2021 23:37:57 -0800 (PST)
MIME-Version: 1.0
References: <1612771965-5776-1-git-send-email-shengjiu.wang@nxp.com>
 <b7f5442d-ad21-eb8a-7d90-7a8207320541@linux.intel.com>
In-Reply-To: <b7f5442d-ad21-eb8a-7d90-7a8207320541@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 9 Feb 2021 15:37:46 +0800
Message-ID: <CAA+D8AMkpQPXBcdwAy67dv=M+udQG4fdj7UJzt6s-pwBiUGTVw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-pcm: change error message to debug message
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Tue, Feb 9, 2021 at 12:39 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 2/8/21 2:12 AM, Shengjiu Wang wrote:
> > This log message should be a debug message, because it
> > doesn't return directly but continue next loop.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >   sound/soc/soc-pcm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> > index 605acec48971..cd9e919d7b99 100644
> > --- a/sound/soc/soc-pcm.c
> > +++ b/sound/soc/soc-pcm.c
> > @@ -1344,8 +1344,8 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
> >               /* is there a valid BE rtd for this widget */
> >               be = dpcm_get_be(card, widget, stream);
> >               if (!be) {
> > -                     dev_err(fe->dev, "ASoC: no BE found for %s\n",
> > -                                     widget->name);
> > +                     dev_dbg(fe->dev, "ASoC: no BE found for %s\n",
> > +                             widget->name);
>
> Do we really want to do this?
>
> This error message has historically been the means by which we detect
> that userspace didn't set the right mixers (e.g. on Intel Baytrail) or
> the topology was incorrect. And it's really an error in the sense that
> you will not get audio in or out.
>
> If you demote this to dev_dbg, we'll have to ask every single user who
> reports 'sound is broken' to enable dynamic debug traces. I really don't
> see the benefit, this is a clear case of 'fail big and fail early',
> partly concealing the problem doesn't make it go away but harder to
> diagnose.

Thanks for the explanation,  it seems I misunderstood this error message.

Best regards
Wang shengjiu
