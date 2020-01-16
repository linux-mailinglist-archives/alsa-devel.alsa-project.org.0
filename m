Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C913DECA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 16:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF2E17C9;
	Thu, 16 Jan 2020 16:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF2E17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579188782;
	bh=HDNS1xeP2eMzcc54Sg+Xwjh7a9wUu+Q+RDcyBcAJmP8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfnWPpF8TPYDVHXjTdGFHYWam3wChD0tuRCw+V2e2iTp8ob/dsSDnCF0qZntarISS
	 IpDl8q+Ppv/RPeYM3zxKopd3rPMSUARi+osMjZ9oFsKQMq7E05PB2aksCnxuYiFbE/
	 XRKOwit7efdijCn4XvEW/BBmSW1tPkMlzeP/+G6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B63F8014E;
	Thu, 16 Jan 2020 16:31:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC211F8014E; Thu, 16 Jan 2020 16:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8895F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 16:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8895F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 07:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="373354319"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 16 Jan 2020 07:31:05 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jan 2020 07:31:04 -0800
Received: from shsmsx105.ccr.corp.intel.com ([169.254.11.28]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.245]) with mapi id 14.03.0439.000;
 Thu, 16 Jan 2020 23:31:03 +0800
From: "Jie, Yang" <yang.jie@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Keyon Jie <yang.jie@linux.intel.com>
Thread-Topic: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
 constrained by preallocated bytes issue
Thread-Index: AQHVzGN6mc697fVomk2yCjUrm6hPFKftUbkwgAAXpuA=
Date: Thu, 16 Jan 2020 15:31:02 +0000
Message-ID: <E7B1D079BA13FB44A978CC8F69C7D6A96F98EE27@SHSMSX105.ccr.corp.intel.com>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <s5hd0bjq3cu.wl-tiwai@suse.de>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
 <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
 <s5hh80v7h82.wl-tiwai@suse.de>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
In-Reply-To: <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes
	max	constrained by preallocated bytes issue
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

> -----Original Message-----
> From: Jie, Yang
> Sent: Thursday, January 16, 2020 10:14 PM
> To: 'Takashi Iwai' <tiwai@suse.de>; Keyon Jie <yang.jie@linux.intel.com>
> Cc: alsa-devel@alsa-project.org
> Subject: RE: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
> constrained by preallocated bytes issue
> 
> > -----Original Message-----
> > From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
> > Takashi Iwai
> > Sent: Thursday, January 16, 2020 7:51 PM
> > To: Keyon Jie <yang.jie@linux.intel.com>
> > Cc: alsa-devel@alsa-project.org
> > Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
> > constrained by preallocated bytes issue
> >
> > On Thu, 16 Jan 2020 12:25:38 +0100,
> > Keyon Jie wrote:
> > >
> > > On Thu, 2020-01-16 at 11:27 +0100, Takashi Iwai wrote:
> > > > On Thu, 16 Jan 2020 10:50:33 +0100,
> > > >
> > > > Oh, you're right, and I completely misread the patch.
> > > >
> > > > Now I took a coffee and can tell you the story behind the scene.
> > > >
> > > > I believe the current code is intentionally limiting the size to
> > > > the preallocated size.  This limitation was brought for not trying
> > > > to allocate a larger buffer when the buffer has been preallocated.
> > > > In the past, most hardware allocated the continuous pages for a
> > > > buffer and the allocation of a large buffer fails quite likely.
> > > > This was the reason of the buffer preallocation.  So, the driver
> > > > wanted to tell the user-space the limit.  If user needs to have an
> > > > extra large buffer, they are supposed to fiddle with prealloc
> > > > procfs (either setting zero to clear the preallocation or setting
> > > > a large enough buffer beforehand).
> > >
> > > Thank you for the sharing, it is interesting and knowledge learned
> > > to me.
> > >
> > > >
> > > > For SG-buffers, though, limitation makes less sense than
> > > > continuous pages.  e.g. a patch below removes the limitation for SG-
> buffers.
> > > > But changing this would definitely cause the behavior difference,
> > > > and I don't know whether it's a reasonable move -- I'm afraid that
> > > > apps would start hogging too much memory if the limitation is gone.
> > >
> > > I just went through all invoking to
> > > snd_pcm_lib_preallocate_pages*(), for those SNDRV_DMA_TYPE_DEV,
> some
> > > of them set the *size* equal to
> > the
> > > *max*, some set the *max* several times to the *size*, IMHO, the
> > > *max*s are matched to those hardware's limiatation, comparing to the
> > > *size*s, aren't they?
> > >
> > > In this case, I still think my patch hanle all
> > > TYPE_DEV/SNDRV_DMA_TYPE_DEV/TYPE_SG/SNDRV_DMA_TYPE_DEV
> > cases more
> > > gracefully, we will still take the limitation from the specific
> > > driver set, from the *max* param, and the test results looks very
> > > nice here, we will take what the user space wanted for buffer-bytes
> > > via aply exactly, as long as it is suitable for the interval and constraints.
> >
> > Well, I have a mixed feeling.  Certainly we'd need some better way to
> > allow a larger buffer allocation, especially for HDA.  OTOH, if the
> > buffer was preallocated, it's meant to be used actually.  That's the
> > point of the hw_constraint setup.
> 
> So if the buffer was preallocated, it won't be re-allocated at hw_params()
> stage, is this conflict with the re-allocate logic in hw_params()?
> 
> >
> > And now thinking again after another cup of coffee, I wonder why we do
> > preallocate for HDA at all.  For HD-audio, the allocation of any large
> > buffer would succeed very likely because of SG-buffer.
> >
> > So, just setting 0 to the preallocation size (but keeping else) would work,
> e.g.
> > something like below?  The help text needs adjustment, but you can see
> > the rough idea.
> 
> So, do you suggest not doing preallocation(or calling it with 0 size) for all
> driver with TYPE_SG? I am fine if this is the recommended method, I can try
> this on SOF I2S platform to see if it can work as we required for very large
> buffer size.

Tried and found setting 0 size for preallocation doesn't work for me, I have
even tried to setting the size as big as the max(which the user space may
 require for buffer-bytes), it still doesn't work for me.

Thanks,
~Keyon

> 
> Thanks,
> ~Keyon
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
