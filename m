Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AFE2EC94D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 05:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF231847;
	Thu,  7 Jan 2021 05:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF231847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609992464;
	bh=b+H1wTS6lPTS0vlbZwJ+1IMvOpRBfl8DBKhlbo2sTgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g61YYriXTSVkC0bqnmTjmb0vFHFiuPGok7yJb1QOcefJd8BYGk1fh1hHXRMJ6ZPR5
	 Sp+dnswd3SYAacJC06KzV38UCX5By91lKqfheHmHpJ1C82PuPfzcdIIZH7P5dFOMXw
	 LsjnsvlxflvRAwIx9gIVoRELnpkBETwJzORaPayI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77B54F800E9;
	Thu,  7 Jan 2021 05:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 356F1F80258; Thu,  7 Jan 2021 05:06:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45504F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 05:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45504F800FD
Received: from mail-ua1-f72.google.com ([209.85.222.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kxMYj-0005Kr-4Z
 for alsa-devel@alsa-project.org; Thu, 07 Jan 2021 04:06:01 +0000
Received: by mail-ua1-f72.google.com with SMTP id 14so1758163uae.8
 for <alsa-devel@alsa-project.org>; Wed, 06 Jan 2021 20:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oB+VPXmJ5ngbLdpq6YE49ucI1D/rfct5S9a9aSXZ/SU=;
 b=PFnAZzevcqS1oh/dPnd6KBsAUCs+EOygNF5gQegz0dGotho/AIdBwmIQcGAz9Ux3yG
 xEiXKmrNCosbZ762v9kObHBvgYBEgXgBtvpVFx7QG895qgMnxCONjVwutrvUyBq8yNmw
 m47yUCc8iiYY/4f0K03osffqWmnTesK0AMsrh13lP480dymX20yN5uPftCMn5SWsEF/g
 by/gjcA+tBo0HzynbunOoNFpaYrL9ey/2i4OzqHYx17oxZ/bV1LK/kPES2Hu3WtjHmUP
 P3VA4TqscuCY80Zw7C+vNOkEnMC1Mb4C8clH6SgOVZWT/TCo+w9OvhON0sVHVXe8+2n9
 xosw==
X-Gm-Message-State: AOAM533zOlZ0+fpaj/xjypFSLwKBChRFhlBqSNp507j0xFiAtQbFJq8i
 haNUCSFT9TjACIlmTTgnkR+GPb2SSRIgr0QRGkZG8srvHOiCXY5iF5M5UpIsFHfedk2p/IxueK4
 h8PaFJ5TR/e631gO8kfK92wWGLUh9Zze8dTCV0/2Pew737gjddhaU5z4X
X-Received: by 2002:a9d:7411:: with SMTP id n17mr5313076otk.262.1609992028422; 
 Wed, 06 Jan 2021 20:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA1vf7fyf7N42CsYG20iYZFQxxNLgectNoTSl3eoacAhaho85G7ft/GlA6rdZHyKPtEYClOYBSz+JaDCGZyhU=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr5313050otk.262.1609992027962; 
 Wed, 06 Jan 2021 20:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20210104140853.228448-1-kai.heng.feng@canonical.com>
 <alpine.DEB.2.22.394.2101051425560.864696@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2101051425560.864696@eliteleevi.tm.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 7 Jan 2021 12:00:16 +0800
Message-ID: <CAAd53p7==ttVR+XQchOLDwreK-4qov4FZQ8Q55HVx5egWDd7BA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: SOF: Intel: hda: Resume codec to do jack
 detection
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
 Rander Wang <rander.wang@intel.com>, daniel.baluta@nxp.com,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

On Tue, Jan 5, 2021 at 9:00 PM Kai Vehmanen
<kai.vehmanen@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, 4 Jan 2021, Kai-Heng Feng wrote:
>
> > Instead of queueing jackpoll_work, runtime resume the codec to let it
> > use different jack detection methods based on jackpoll_interval.
>
> hmm, but jackpoll_work() does the same thing, right? So end result should
> be the same.

It depends on the jackpoll_interval value. But yes the end result
should be the same.

>
> > This matches SOF driver's behavior with commit a6e7d0a4bdb0 ("ALSA: hda:
> > fix jack detection with Realtek codecs when in D3"). Since SOF only uses
> > Realtek codec, we don't need any additional check for the resume.
>
> This is not quite correct. First, SOF does support any HDA codec, not just
> Realteks (see e.g. https://github.com/thesofproject/linux/issues/1807),
> and second, this doesn't really match the hda_intel.c patch you mention.
> SOF implements a more conservative approach where we basicly assume
> codec->forced_resume=1 to always apply, and do not implement support for
> codec->relaxed_resume. So the above patch doesn't fully apply to SOF as
> the design is not same.

OK, I assumed SOF always use Realtek codec, so codec->forced_resume=1
is always applied like the other patch.
I'll remove this section.

>
> > diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
> > index 6875fa570c2c..df59c79cfdfc 100644
> > --- a/sound/soc/sof/intel/hda-codec.c
> > +++ b/sound/soc/sof/intel/hda-codec.c
> > @@ -93,8 +93,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
> >                * has been recorded in STATESTS
> >                */
> >               if (codec->jacktbl.used)
> > -                     schedule_delayed_work(&codec->jackpoll_work,
> > -                                           codec->jackpoll_interval);
> > +                     pm_request_resume(&codec->core.dev);
>
> I think this change is still good. Just drop the but about Realtek
> codecs from commit message and maybe s/matches/aligns/.

OK, will do.

Kai-Heng

>
> Br, Kai
