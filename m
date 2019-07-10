Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C180E64F2C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 01:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 569D316A9;
	Thu, 11 Jul 2019 01:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 569D316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562800624;
	bh=oec55iAjTwd8LIA7bTLRjfdVxeKYVzsipOY3F2NXHBY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TinLT7oS+qykmuiRruk3frcNXsf8yQOsTVtgGzJ9PVGwlJl06w1gXizotY1itsAhH
	 42xd9hYOgocVVWdm5V/zoz/vxPVsej1XfXC546bH5qZ+Mw2nWHz6YfYSa0xsrgbzlg
	 zb5iqZTUsgblStX8vQOoqw1WiwAqFVxjPcV9lb1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBBAF802A0;
	Thu, 11 Jul 2019 01:15:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EB68F802A1; Thu, 11 Jul 2019 01:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
 SPF_HELO_NONE, 
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C73A7F801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 01:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C73A7F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="N9XqQaAo"
Received: by mail-lj1-x241.google.com with SMTP id v18so3776644ljh.6
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 16:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQboB9+e5px7PkIQYt9TxvsS0wLCuRZrok0YN+xW9qU=;
 b=N9XqQaAoPIac0JgRLKRl24GB5pv/laq9/aLbMTAMPG3ugr4LWVOZT31hk9asJq2PbT
 4vbRER2CYPSpBipbp6megRSlHCqNJlQDHS6DIHW8KXk5qcQB1oYqNHmHvRK3CDE41AoQ
 KEElx4br0/fmL3uJ3KZjwiQChE+aU6reGumrPGx6/rnfvrzPpeTl2hoCtaeMgj/3jDfS
 N6aOulMiEveT0MBg8c+bNMd7dLPA3chriCRktpHuLXq7iUBcd9JufPpb7Ch78NSDaUbM
 L6+dE+/INbvwqYLzXVPt0uFUdJjehkjavB871hg4vQ6vOnN5/vcLB10xqGY0pWLh9xHv
 KOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQboB9+e5px7PkIQYt9TxvsS0wLCuRZrok0YN+xW9qU=;
 b=Y0gJ0Kr8+SdbVUp435SwYZ9UgekhvztVYz/mP+k7LwUft0CSk+7NyyhupBW6jBTPI9
 gfjhm0zmegqsVudEpceH49os6URTKMoxXSxH43ASKzPYRGOf/UJxTRK1xCVH+bOvW+Kd
 uCNoHGCT2a6SddNg0EKPHp2HXr+8DJfIWJo0AFr20n+uy06TZqvWcPi5qbTmOwe0d0TP
 m6pS7hBg2lGaGW+0jik1C/S2P2d1b3BP2PrZJyo1u7CSEcNioQN2wWPmwoA1z+YWs0mU
 oKwvnPpT3tbe0UNEfXaIO7buAs0eRTFW8eTykmbXJCZ7aQmksSpu3pJJtPjXG+qmohoc
 y+Qw==
X-Gm-Message-State: APjAAAUGBDwUvr0oM6UNXP7DFxustZDZnk1bKNFSxsK2L1TX+fJePYrn
 yZghakh7VBALQXFkoBzIjU9e5wRIx6zHVDjsV5VEew==
X-Google-Smtp-Source: APXvYqwdA4hJIQGF0PNM45a6g8O+FEFfKyJo3wL3XhbJp0NMRVgo11Jh/3mf/hNrzNIKK4AkK0jZ9VZODakhNdWe6b8=
X-Received: by 2002:a2e:890a:: with SMTP id d10mr411931lji.145.1562800514229; 
 Wed, 10 Jul 2019 16:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190709040147.111927-1-levinale@chromium.org>
 <20190709114519.GW9224@smile.fi.intel.com>
In-Reply-To: <20190709114519.GW9224@smile.fi.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 10 Jul 2019 16:15:03 -0700
Message-ID: <CAOReqxirZdKJQ59Z4789wT5Cxh2fyQrUcuB1pm9AidYLiPEs1A@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Alex Levin <levinale@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Atom: read timestamp moved to
	period_elapsed
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

On Tue, Jul 9, 2019 at 4:45 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jul 08, 2019 at 09:01:47PM -0700, Alex Levin wrote:
> > sst_platform_pcm_pointer is called from both snd_pcm_period_elapsed and
> > from snd_pcm_ioctl. Calling read timestamp results in recalculating
> > pcm_delay and buffer_ptr (sst_calc_tstamp) which consumes buffers in a
> > faster rate than intended.
> > In a tested BSW system with chtrt5650, for a rate of 48000, the
> > measured rate was sometimes 10 times more than that.
> > After moving the timestamp read to period elapsed, buffer consumption is
> > as expected.
>
> From code prospective it looks good. You may take mine
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Though I'm not an expert in the area, Pierre and / or Liam should give
> their blessing.
>
Agreed, Liam or Pierre should also give their ok since this is one of
the closed source firmware drivers.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> >
> > Signed-off-by: Alex Levin <levinale@chromium.org>
> > ---
> >  sound/soc/intel/atom/sst-mfld-platform-pcm.c | 23 +++++++++++++-------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> > index 0e8b1c5eec88..196af0b30b41 100644
> > --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> > +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> > @@ -265,16 +265,28 @@ static void sst_period_elapsed(void *arg)
> >  {
> >       struct snd_pcm_substream *substream = arg;
> >       struct sst_runtime_stream *stream;
> > -     int status;
> > +     struct snd_soc_pcm_runtime *rtd;
> > +     int status, ret_val;
> >
> >       if (!substream || !substream->runtime)
> >               return;
> >       stream = substream->runtime->private_data;
> >       if (!stream)
> >               return;
> > +
> > +     rtd = substream->private_data;
> > +     if (!rtd)
> > +             return;
> > +
> >       status = sst_get_stream_status(stream);
> >       if (status != SST_PLATFORM_RUNNING)
> >               return;
> > +
> > +     ret_val = stream->ops->stream_read_tstamp(sst->dev, &stream->stream_info);
> > +     if (ret_val) {
> > +             dev_err(rtd->dev, "stream_read_tstamp err code = %d\n", ret_val);
> > +             return;
> > +     }
> >       snd_pcm_period_elapsed(substream);
> >  }
> >
> > @@ -658,20 +670,15 @@ static snd_pcm_uframes_t sst_platform_pcm_pointer
> >                       (struct snd_pcm_substream *substream)
> >  {
> >       struct sst_runtime_stream *stream;
> > -     int ret_val, status;
> > +     int status;
> >       struct pcm_stream_info *str_info;
> > -     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> >
> >       stream = substream->runtime->private_data;
> >       status = sst_get_stream_status(stream);
> >       if (status == SST_PLATFORM_INIT)
> >               return 0;
> > +
> >       str_info = &stream->stream_info;
> > -     ret_val = stream->ops->stream_read_tstamp(sst->dev, str_info);
> > -     if (ret_val) {
> > -             dev_err(rtd->dev, "sst: error code = %d\n", ret_val);
> > -             return ret_val;
> > -     }
> >       substream->runtime->delay = str_info->pcm_delay;
> >       return str_info->buffer_ptr;
> >  }
> > --
> > 2.22.0.410.gd8fdbe21b5-goog
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
