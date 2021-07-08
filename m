Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF23C16E3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 18:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80CC7828;
	Thu,  8 Jul 2021 18:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80CC7828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625760783;
	bh=5E8kdc9Oqm2QoJ6/RD6rJ80t5LJsrDUm9T1DCsErFNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxgrYrhgEAu3xZHHrMPoqfE/u4ShGMDvvwtzI+d/0MqYQ/Gawedcj46NeuMYkMgb5
	 fm1YvLzFWW1Qm2YMu+OZ71LHQtHAfCCxxMwuoJl6Ss7hBYX1oIe5VyxXY7lO+huYmJ
	 2KxKpiDBCaHyK5lhhxKxurg469vSAimg6wh3TtzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BD0F8012A;
	Thu,  8 Jul 2021 18:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04982F80249; Thu,  8 Jul 2021 18:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A777EF8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 18:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A777EF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vb1pUKkp"
Received: by mail-lj1-x234.google.com with SMTP id q4so3271289ljp.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fwTYwmISOcExj5Z6gmpYDNMFuU7Hd9ffs4yLfzQoLnA=;
 b=vb1pUKkpw/ZI2+Ehi1mTyHXRI7wuTyubVirC7X3/nIbGwL8Ett2qME4ove9OS2JVWH
 HhZ8easPKNU712AcVRh/OoN0t5uruWa3E3AWL4mdkpKvb0J7uEmdB2CWg+WhLSfmuXdQ
 m+4zAvR8K8reCBmWV0ZstebUzW5LcN1VrKDpSS6M8GIaPx60jB0npgoJhU28ABrAsjeO
 cgrCqrDOxeln1hZ91/TJ02Soh/a1y9NqTyK8bBKem7eqNwCxhixXuED/GYXQ5vADNxa2
 bncpENQxNgPDKDNHoV+hbpr8WqwfJJBnd3k+VTdMAXQ2lLxdvMgMyuh0cqH2hRPj5/mL
 Amzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwTYwmISOcExj5Z6gmpYDNMFuU7Hd9ffs4yLfzQoLnA=;
 b=nIrKdVU3FMJuPi6zeIqmJBNjlbWNy2eOR9WISsMIz0gETQjlgwhDOe7YGeyt3vGss7
 8yAZVTe1/e6Z3IhXSYFtGijhLPB3F+wpr932E/2y5po9lXEyZ1pMSmQdYkWQGH9NrWv1
 /nHJYtm2UazeaOj0PMxWtnfUvi+GhIaS+C1bO0Q/0Dz9rk5rG3dFW3NGsOnAm1uKXiXv
 HbiBsq88e6fBH4Ux/hLoIroeVneoVCj26Wo8+timUS5KtDEG2XjcaQLQFoWHd7K9EHdl
 zBR6b0/eCGZW7ysswPZcz2QOfNq9zV8TmVB9aHlrrh5/Uznl2edUA1Q6pJuwc3zTkcL7
 FkYg==
X-Gm-Message-State: AOAM532QNmi6kx1ObygGJYyJo2akSObzIDlWAyafAklqW6UsBIpz3Wcr
 kpx5gtk9yZegBFOjI+A7DKQl3Gkb81jGmkECVSE=
X-Google-Smtp-Source: ABdhPJw0LozJgH/8zg+aOhqsED4xPjiLNkDDXU7X8/N2qsgOjsFp3ddw8tQIW2AuQvakbS/hz9OFr7yj/D7DMgU2vno=
X-Received: by 2002:a05:651c:28a:: with SMTP id
 b10mr13713758ljo.355.1625760685294; 
 Thu, 08 Jul 2021 09:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+h9=fMu7jLfmzZF2XMWAT=JBLik2WSSbfYtLg3kmzqWtg@mail.gmail.com>
 <s5hmtqx59hm.wl-tiwai@suse.de>
 <CAHhAz+guERMjmT_bRrgWzMoKkH2S0Zv0JatjpbNJZnLj+RyxXw@mail.gmail.com>
 <s5heec956kn.wl-tiwai@suse.de>
In-Reply-To: <s5heec956kn.wl-tiwai@suse.de>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 8 Jul 2021 21:41:13 +0530
Message-ID: <CAHhAz+gAAdrZJzr3fYXACnTW0r_5v35-wH+ohsrZ7nOcomoW5w@mail.gmail.com>
Subject: Re: trigger timestamp
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Thu, Jul 8, 2021 at 6:02 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 08 Jul 2021 14:19:12 +0200,
> Muni Sekhar wrote:
> >
> > On Thu, Jul 8, 2021 at 4:59 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Thu, 01 Jul 2021 01:41:29 +0200,
> > > Muni Sekhar wrote:
> > > >
> > > > Hi all,
> > > >
> > > > >From the user space test application , Is it possible to get the
> > > > trigger timestamp corresponding to SNDRV_PCM_TRIGGER_START &
> > > > SNDRV_PCM_TRIGGER_STOP events for audio playback capture?
> > >
> > > That's exactly what trigger_tstamp of snd_pcm_status corresponds for.
> > Does aplay and arecord have any command line options to get the
> > trigger_tstamp? If not how to get it?
>
> Implement some code :)
>
> Alternatively you can check the proc output contents in
> /proc/asound/card*/pcm*/sub*/status.  It'd be difficult to see the
> stop timestamp, though (as the application closes the stream
> immediately after that).
How to specify if i want the REALTIME/MONOTONIC_RAW trigger_time
timestamp type output in  /proc/asound/card*/pcm*/sub*/status?
>
>
> Takashi




--
Thanks,
Sekhar
