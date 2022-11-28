Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465263A4F5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 10:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375751650;
	Mon, 28 Nov 2022 10:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375751650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669627675;
	bh=MAHFi5hwpuOxqHfnfuNAMoOLVEaTn8sk8xbSbi7BW6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+RU0VVn3Cmbi+LZ/tOSh1sbC8gBJTZ8BHXZ0Igh7rzub65yK7VNU+jQ3JgKQdTiH
	 lgz/HQZutUgtrr8XOFfmik8M9g2tclEJNpiyQpYJY7RFenS4GjO2i+oY5hX3ZAZ/v8
	 lYRIcE9T5nqA3WcTqph+hWlcrN5aVMl+/rOq7O+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8CE2F801D8;
	Mon, 28 Nov 2022 10:26:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E533F8020D; Mon, 28 Nov 2022 10:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5003FF8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 10:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5003FF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fHupL+kN"
Received: by mail-il1-x135.google.com with SMTP id z9so4735944ilu.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rSjenL36nx6dkpFfPvUHmLRtB3WtAx9+34Fs2KvTI98=;
 b=fHupL+kNUU1LXHaNAPqGC7s6qKRyRPCDbj2c4DTGlg6mKcXeZ8CxSpies/1a1MiyxC
 9R37c6cxx+9Gj9y2jpUJ7JrfUg72+3QkWD0oOtVoYFn1NtQPrK435X11qQ0dITnz8Muj
 naVVWUn+elbnLK9DPkHY6lwo+3xYSdr2hKNZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rSjenL36nx6dkpFfPvUHmLRtB3WtAx9+34Fs2KvTI98=;
 b=X1333InzcIWmtfZLaVAT7fh3pNcQJZL53bMr1pqBqy+m4wYsjMjR79W5Jg/NgM1ioB
 uRu9uahMESp1xNRPp3Xm1YWfhq13NniC7LP8T5Wxchuk7XMlBKYxwzLUZLJEJ3u6wyET
 QECD6EpKgS0uNpEbaJZ6Kw5iiK4B6bwS3vvggFaB6gi8iSu+UkQvspQl1ZyQDmI/TUoL
 xEauB+tQEKxew7yoWCwJYHiHRS6Xo21zhhlZZgO75AINYaTc0pL6Nplbh/QgqCxMJVQV
 DwhWVa3YCbjcDojTKKcUnQEbhRxcb7a6DOCfWwyhzQaoHuKkTYQB3lNmausziHIXepX8
 lRRA==
X-Gm-Message-State: ANoB5pkaHkrmYLwUOVDgioE2+DH7Hg+GHG4+1eONF/qQ0y2DvBXyCeuF
 wGnJ/EQeE+1exyML1bxmalIXBIpqouLe2g==
X-Google-Smtp-Source: AA0mqf55NYMLV2+X24NeqYPg4OWkOJhOtYpt8eyKm28ksD+ikrUF1dGnoFBZS3HFbY6ZCwiHfbb8kA==
X-Received: by 2002:a05:6e02:13d1:b0:302:d470:1ca8 with SMTP id
 v17-20020a056e0213d100b00302d4701ca8mr13369234ilj.103.1669627609475; 
 Mon, 28 Nov 2022 01:26:49 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52]) by smtp.gmail.com with ESMTPSA id
 g4-20020a92d7c4000000b00300ea3a86e2sm3666271ilq.68.2022.11.28.01.26.48
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:26:48 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id q21so7141840iod.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 01:26:48 -0800 (PST)
X-Received: by 2002:a02:c897:0:b0:374:100a:b0c7 with SMTP id
 m23-20020a02c897000000b00374100ab0c7mr14573933jao.185.1669627607759; Mon, 28
 Nov 2022 01:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org>
 <87wn7fzb2g.wl-tiwai@suse.de>
In-Reply-To: <87wn7fzb2g.wl-tiwai@suse.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 10:26:36 +0100
X-Gmail-Original-Message-ID: <CANiDSCtSAM3seszVWfjJPaYFO3v223P-tYEtdpW4+pQQ3bcf0g@mail.gmail.com>
Message-ID: <CANiDSCtSAM3seszVWfjJPaYFO3v223P-tYEtdpW4+pQQ3bcf0g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ALSA: core: Fix deadlock when shutdown a frozen
 userspace
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Len Brown <len.brown@intel.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Hi Takashi

Thanks for your prompt reply

On Mon, 28 Nov 2022 at 10:24, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 28 Nov 2022 10:10:12 +0100,
> Ricardo Ribalda wrote:
> >
> > Since 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
> > we wait for userspace to close its fds.
>
> IMO, the fix above brought more problem.  If you'd need to want to
> avoid later accesses during shutdown, the driver should rather just
> disconnect devices without waiting for the user-space completion.
> And, for that, a simple call of snd_card_disconnect() should suffice.
>
> > But that will never occur with a frozen userspace (like during kexec()).
> >
> > Lets detect the frozen userpace and act accordingly.
>
> ... and skipping the user-space sync at snd_card_disconnect_sync() as
> of this patch set is a dangerous move, I'm afraid.  The user-space
> gets frozen also at the normal suspend/resume, and it implies that the
> sync will be lost even for the normal PM, too (although it must be a
> very corner case).
>

And what about checking kexec_in_progress instead?

Thanks!

>
> thanks,
>
> Takashi
>
> >
> > To: Jaroslav Kysela <perex@perex.cz>
> > To: Takashi Iwai <tiwai@suse.com>
> > To: "Rafael J. Wysocki" <rafael@kernel.org>
> > To: Pavel Machek <pavel@ucw.cz>
> > To: Len Brown <len.brown@intel.com>
> > To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > To: Mark Brown <broonie@kernel.org>
> > Cc: alsa-devel@alsa-project.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>
> > Cc: linux-pm@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v3:
> > - Wrap pm_freezing in a function
> > - Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org
> >
> > Changes in v2:
> > - Only use pm_freezing if CONFIG_FREEZER
> > - Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org
> >
> > ---
> > Ricardo Ribalda (2):
> >       freezer: Add processes_frozen()
> >       ALSA: core: Fix deadlock when shutdown a frozen userspace
> >
> >  include/linux/freezer.h |  2 ++
> >  kernel/freezer.c        | 11 +++++++++++
> >  sound/core/init.c       | 13 +++++++++++++
> >  3 files changed, 26 insertions(+)
> > ---
> > base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> > change-id: 20221127-snd-freeze-1ee143228326
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >



-- 
Ricardo Ribalda
