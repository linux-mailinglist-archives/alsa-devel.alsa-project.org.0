Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5C18E88
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 18:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26BE1862;
	Thu,  9 May 2019 18:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26BE1862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557421088;
	bh=gjkjZ5RpSBjk9yNLd5uOHi0cDANvvALbS4IyIiaD/hE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hO7G5q4J0KreIHuYrPXg2AJKRylny7INwhu/uBqJsYZ4uLysNmjWhntzg2n2tLg19
	 /fB99ZTaGQMp0hB2AdPhr1LCeEINo+cxo7MvEZ2YemMHYtqv0rU6jMdQd5VXhOlvKY
	 JxsidN1VnpTVwEXgsBS9UHuTV05+cy0I0Yin4zhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 424EEF89682;
	Thu,  9 May 2019 18:56:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA32CF89682; Thu,  9 May 2019 18:56:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30 autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53932F89674
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 18:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53932F89674
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 09:56:13 -0700
X-ExtLoop1: 1
Received: from ahsanmuh-mobl1.amr.corp.intel.com ([10.255.229.68])
 by orsmga004.jf.intel.com with ESMTP; 09 May 2019 09:56:13 -0700
Message-ID: <ac99b2fefe05833787e473cbd2327a35c02de68b.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 09 May 2019 09:56:12 -0700
In-Reply-To: <s5htve4mymn.wl-tiwai@suse.de>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
 <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
 <s5htve4mymn.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
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

> Hm, it's a good question.  Currently the PCM core doesn't care about
> the paused stream wrt PM by the assumption that the paused / stopped
> stream doesn't need a special resume treatment.  But, generally
> speaking, the pause-release won't work for a hardware that doesn't
> support the full resume, either.  For example, the legacy HD-audio
> may
> restart from some wrong position if resumed from the pause.
> 
> Maybe this problem hasn't been seen just because the pause function
> is
> rarely used.
> 
> So, the safe behavior would be to let the stream being SUSPENDED
> state
> at snd_pcm_stream_suspend() when it's in the PAUSED and has no
> INFO_RESUME capability.  Then the application does re-prepare the
> stream like the running one.
> 
> But the question is what's expected at next.  Should the application
> re-start?  But it was paused.  Should PCM core automatically move to
> pause?  But most hardware can't move the pointer to any random
> position.
> 
> My gut feeling is just to treat like a normal error-restart,
> i.e. re-prepare / re-start.  But I'm open and would like to hear more
> opinions.

Hi Takashi,

So in the current scenario what we see is that after resuming from S3,
a pause-release action from the user results in a FE prepare() followed
by the START trigger (and not a PAUSE-RELEASE trigger).

Libin's patch proposes to do a prepare() for the BE even in the case of
a regular pause-release. But this might not be ideal since other
drivers might have logic in the prepare() ioctl that might end up with
errors. 

So I am thinking maybe we can have some internal logic in the SOF
prepare() callback that will also call the BE prepare() when the 
be->dpcm[stream].state is SND_SOC_DPCM_STATE_PAUSED? Would that make
sense?

Thanks,
Ranjani

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
