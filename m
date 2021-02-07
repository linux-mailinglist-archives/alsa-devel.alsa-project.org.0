Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186DA312346
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 10:51:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70671677;
	Sun,  7 Feb 2021 10:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70671677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612691506;
	bh=kJkUnNF4ebtxkaaQ2TKOe353U0vuyNSoymKICJ1QXzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNrd2klBqJXCPKgJx8VvGyWc3C1405jFSJxQoKkgaOQwZuuqrrst+z9tUlWWfBitc
	 45RBFeVN6gdlZQJTGxo+9J/DN3Ysmr9Uc0UQlIfHobMMXWpYQS33mRzDGURHOQ9NOJ
	 LxwRyAY/g05jPxt1PiITmI7ig1f3gbg9GEH8VEZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C6BAF80260;
	Sun,  7 Feb 2021 10:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83562F8025F; Sun,  7 Feb 2021 10:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DE97F80129
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 10:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DE97F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pDgcBRam"
Received: by mail-qv1-xf2a.google.com with SMTP id p12so769100qvv.5
 for <alsa-devel@alsa-project.org>; Sun, 07 Feb 2021 01:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ4pFx7u5BUDAgelezxkYQyF+xKN7GGALoSIhITUj+o=;
 b=pDgcBRamMSdoUB2BEpAst1f1B9nv0WmaS1Vvz3pxn90Bo2k1jjA+Rmy0x4aLBo07mY
 asda/mt0rtnitVvzATsvxfXHA32w6sTXiqJjs1JBXExweSz1LhjNLHlAe1y/uJwVoXPP
 wMZxM9NPideQw1Zn+3YhCfTxp2iE+jS49MhfAhBXlxoCTbo27Rn9tle+lHnmbjfbFvXp
 X0hAwsQSyOLaIiM0VA16unpVG4z8pP0NFOokUPDV4c6WWuDTv7Mspy8/5jiWRxPdTYZ2
 ot4n0YWlHpRfnib2YaYfQTZxNBV6VLrvkNQtRO3nOIMXZmsratGIKOhZWgirQuqokfd3
 5XYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ4pFx7u5BUDAgelezxkYQyF+xKN7GGALoSIhITUj+o=;
 b=q9Gf5WNKqg+MyDOScT3YrZ97uFHwREvzr8Exmu/Il6g9UZrC3T862rSErPNy/Fg4eG
 N/6pNs/FHPA46SMaVce5gjzlLJSO/1QiUUHiUMaIo9E955z+3WYBEywe4wXrJlniJXwW
 dvXjOjwpuc9QCww0SxqK6cfdZvtB3P7w9Ft8CWkufN8xLMuExTn/ONnkld4mStTh+T/e
 bF+KxFJ3RdSpZdmYC7OxRoE5KmAAi53mkqi732EychiMz4lQxfrSAtnyIypx5wDSXtdW
 8w/mYzfmyUXzvDsw+dzStZ33RQXHTFBWzVQfPCRUF/YeGgpMcHqiaE2xI1IkiSCnv6Nl
 t/6Q==
X-Gm-Message-State: AOAM5321iC/Fq5qeDH8iphlDFMisspydO/9paeL7r1ml4TOG9DGXLCTi
 yAcJd9yy/3IB47XMp7smY9uS9x+gu0BzFjRrWdI=
X-Google-Smtp-Source: ABdhPJy645FIrmGyg3s+S/f06QE4AJor1BtSgmIOXYOPdd5fhNxXhtiMyZ5sAnnbwtjUKTyx3gqZcZrxPegIJKozRmo=
X-Received: by 2002:a05:6214:76f:: with SMTP id
 f15mr11458355qvz.56.1612691446129; 
 Sun, 07 Feb 2021 01:50:46 -0800 (PST)
MIME-Version: 1.0
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
 <20210205145816.GD4720@sirena.org.uk>
In-Reply-To: <20210205145816.GD4720@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 7 Feb 2021 17:50:35 +0800
Message-ID: <CAA+D8AMTyxcz2nXEDemuWRwtORSfRoBRZO03WyX+XpuiOD0XiA@mail.gmail.com>
Subject: Re: [PATCH 5/7] ASoC: imx-pcm-rpmsg: Add platform driver for audio
 base on rpmsg
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Fri, Feb 5, 2021 at 11:00 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 02:57:28PM +0800, Shengjiu Wang wrote:
>
> > +     if (params_format(params) == SNDRV_PCM_FORMAT_S16_LE)
> > +             msg->s_msg.param.format   = RPMSG_S16_LE;
> > +     else if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)
>
> Again this should be a switch statement.
>
> > +     if (params_channels(params) == 1)
> > +             msg->s_msg.param.channels = RPMSG_CH_LEFT;
> > +     else
> > +             msg->s_msg.param.channels = RPMSG_CH_STEREO;
>
> Shouldn't this be reporting an error if the number of channels is more
> than 2?
>
> > +             /*
> > +              * if the data in the buffer is less than one period
> > +              * send message immediately.
> > +              * if there is more than one period data, delay one
> > +              * period (timer) to send the message.
> > +              */
> > +             if ((avail - writen_num * period_size) <= period_size) {
> > +                     imx_rpmsg_insert_workqueue(substream, msg, info);
> > +             } else if (rpmsg->force_lpa && !timer_pending(timer)) {
> > +                     int time_msec;
> > +
> > +                     time_msec = (int)(runtime->period_size * 1000 / runtime->rate);
> > +                     mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
> > +             }
>
> The comment here is at least confusing - why would we not send a full
> buffer immediately if we have one?  This sounds like it's the opposite
> way round to what we'd do if we were trying to cut down the number of
> messages.  It might help to say which buffer and where?
>
> > +     /**
> > +      * Every work in the work queue, first we check if there
>
> /** comments are only for kerneldoc.

Thanks Mark, I will update them.

Best regards
wang shengjiu
