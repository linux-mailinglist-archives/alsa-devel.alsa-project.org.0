Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590646350E5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 08:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E313815CA;
	Wed, 23 Nov 2022 08:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E313815CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669187255;
	bh=VyvhTF65oY14CGXtnidRvhPjLbYqscXiPaqmvNVdUHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IY4e/cjyNRUo2kTIf6pkJj3Metsn1zASKh+4+QZN9HZTG+dJIMiQE0XQ47vAIsOZv
	 UTu5BapH2wjP/ZN45NTljXQ877TwHPl3HYqIuMWRoduxQlO2BYd0cCvSc7ZyWL3ykC
	 ZQjPBTnDjLGHrCGQ4hF9ANIO774/vV95WLM3YWnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6916FF80149;
	Wed, 23 Nov 2022 08:06:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B9AF8025D; Wed, 23 Nov 2022 08:06:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790BDF80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 08:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790BDF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k0ZKc4rl"
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3704852322fso166058637b3.8
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 23:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y5UDO+CDsn9tFw1qu+1aLuYY9kc6ZmG6caszAYHBPIs=;
 b=k0ZKc4rlcJ8vbgPMnoksZY0Tqbn8uXGIdhZIDZTu3FonEUgSXrgweYVDesztwfngPG
 loXDpZjKXnzm1r7L//rA0y7smBeXNRHvlS7XQtT3CrMcwe8O8U+cKhPTtXUcA7z9wfoH
 jn+Smm8EhgP61pS6Y6FOFFHzAAUvpA9YD1iskAnq3picfKhw39wVhRoN8HlXrqMf9vtQ
 J5SywyMdFw2KM3zT00i4NdwHIXoXrPQN7h+5i7XMXBfuvBeTG8tizPSHVl4m/H3MkwXs
 SfsLN0j21okXWpn0ciXx+orWLWV6uUURITAS3L79tcKBb8cnPXR0btP4FRMU6G/ExUNV
 xHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y5UDO+CDsn9tFw1qu+1aLuYY9kc6ZmG6caszAYHBPIs=;
 b=M8N+nHfFiBHYdOhzbv4SAz4vfD4CLdqGGQSatxSduQ24OoJ0+NknsVUwpMZ/St4W6B
 Ix/ZXExigLu5lcJIzoXQbFYFxALi6c5VVFZVjGksNh5M9rggfpNgTbKn6DG5TE32VXZP
 x2vZbnO71zGfCf1fRz8hXDVo4LcyU3nvBBd7Ws+8zUXse+fUDNsD0FSliEbYCIRWSDSz
 9fCKbIWoJ+SmgI/tz79dKnFN7VBpqiYqzsTNTe3MB/o9dvE24ODAGaBQrZChjKFcx5QD
 cLjvpPn3f0lWg/Z/Vwgviir7gy20KcRzblT3Lq41J7SfeWthlsZByNvM1PLWDQNhpCN2
 Kzqg==
X-Gm-Message-State: ANoB5pm28iFxX9dZe1ZKU1408eTnXFO3EcjhDWtIbHueq/mFf0v7P4h8
 aXCHyEP3He+bbuYn8QIhgwEzrcciGgrrPf7kHXM=
X-Google-Smtp-Source: AA0mqf68y7B7EVuw4un0nSXxSEHbUoayj/EwX1/tdjpicF+MeZYb/u8jBCEz9F+Q1yMrChT7SyVDPs4nfev0Hw65ZUY=
X-Received: by 2002:a81:a18e:0:b0:368:b923:b500 with SMTP id
 y136-20020a81a18e000000b00368b923b500mr9453740ywg.10.1669187187069; Tue, 22
 Nov 2022 23:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20221123050911.1045190-1-butterflyhuangxx@gmail.com>
 <87mt8i5fcz.wl-tiwai@suse.de>
In-Reply-To: <87mt8i5fcz.wl-tiwai@suse.de>
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Wed, 23 Nov 2022 15:06:16 +0800
Message-ID: <CAFcO6XPoNnM+VzY+bj5sPfJ-tCLQQ_pb8yb90KifWTwVpdENKA@mail.gmail.com>
Subject: Re: [RESEND PATCH] ALSA: rawmidi: fix infoleak in
 snd_rawmidi_ioctl_status_compat64
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 baolin.wang@linux.alibaba.com
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

Hi, the compat_status structure is struct compat_snd_rawmidi_status64 {
s32 stream;
u8 rsvd[4]; /* alignment */
s64 tstamp_sec;
s64 tstamp_nsec;
u32 avail;
u32 xruns;
unsigned char reserved[16];
} __attribute__((packed));
The rsvd[4] and reserved[16] are not  initialized.


Regards,
 butt3rflyh4ck.

On Wed, Nov 23, 2022 at 2:55 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 23 Nov 2022 06:09:11 +0100,
> Xiaolong Huang wrote:
> >
> > The compat_status is declared off of the stack, so it needs to
> > be zeroed out before copied back to userspace to prevent any
> > unintentional data leakage.
> >
> > Fixes: d9e5582c4bb2 ("ALSA: Avoid using timespec for struct snd_rawmidi_status")
> > Signed-off-by: Xiaolong Huang <butterflyhuangxx@gmail.com>
> >
> > ---
> >
> > Reason for resend:
> > 1. add Fixes line.
> > ---
> >  sound/core/rawmidi_compat.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/core/rawmidi_compat.c b/sound/core/rawmidi_compat.c
> > index 68a93443583c..6afa68165b17 100644
> > --- a/sound/core/rawmidi_compat.c
> > +++ b/sound/core/rawmidi_compat.c
> > @@ -80,6 +80,7 @@ static int snd_rawmidi_ioctl_status_compat64(struct snd_rawmidi_file *rfile,
> >       if (err < 0)
> >               return err;
> >
> > +     memset(&compat_status, 0, sizeof(compat_status));
> >       compat_status = (struct compat_snd_rawmidi_status64) {
> >               .stream = status.stream,
> >               .tstamp_sec = status.tstamp_sec,
>
> Here at the line just after your addition, compat_status is fully
> initialized by substitution, so I believe the memset is superfluous.
>
> Or have you verified that it really leaks the uninitialized memory?
>
>
> thanks,
>
> Takashi



-- 
Active Defense Lab of Venustech
