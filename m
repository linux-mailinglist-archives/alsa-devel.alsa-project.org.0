Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE93A20A6
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 01:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D139116A8;
	Thu, 10 Jun 2021 01:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D139116A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623280689;
	bh=wNrx5McK8KnSXeWuD/Di35PVg7nrd683mAvFM5Jhxi8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p28lNXkLkGdtXTZRe9MuSTJGmpcAg+EHmpxUGQWxZ5/LdBs1+J35GelJMdRcRAGKf
	 uWNAVX+kNqY2jNAqiJKFxJ9QL9E92KnxbV+ekqBB8y4qDVvjUy1ybxEGuNMNyNxelS
	 ZO1/vnDFNBQoq0W6sZQPCf1GfwmlWVFbvykQktlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B80F800F4;
	Thu, 10 Jun 2021 01:16:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13180F8026C; Thu, 10 Jun 2021 01:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06450F800F4
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 01:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06450F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lKOiwx6s"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="H0VHIAyc"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D0E85C0190;
 Wed,  9 Jun 2021 19:16:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 09 Jun 2021 19:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=L+OWmO0mVvk643PqTVCovxdgGsM
 elOryVDUAq2kD41I=; b=lKOiwx6s6hdGfVp5Iww7RcuXiG58W3qYNVFi1cJElCt
 pDirQtiPK6HRZ0YUqOuJ1oqohyzIRI4/mDJslSiwmBqMSjBsLrX+Q3EXvpFGeyM6
 zTjJxuVFcnyEfs+Gg9/ydkdy4Vtp3gCRRt7hS58XmeDWdJre+/YR0Pc9TWRKCRdq
 e74SwOU77JNpCpt+pTi1n2WGVurWTMxnxM5m75vSMLYtubrqJ0VfIAGe/lP/XWsJ
 9fGgsIfvnCaDOHMuI4gHNVb4561JDGq2TaBmqAFgZblqynC4DS+sGGchkTpyePwk
 hZIv0WtSlK5JT9Qio8uuumM1uHSFOwQ4hkuxUBFa8Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=L+OWmO
 0mVvk643PqTVCovxdgGsMelOryVDUAq2kD41I=; b=H0VHIAycISRkiZx4qzf7Z6
 WT0u/q7TN4X7FDFxJY0PJZ5Nw5MEXqLiIWf4UqrDiBolv1pCs49WdLYN/hA1iBVt
 W3ShqiQf4hYiqweAG4RxWIJFtZqyxGBdX/oqBbXnZqkykcaoNYXq59O7383MxVvI
 RtmsvOht9MQ5j9sllDSBH7tm6FMIQlsesAPy+O63/P4rDmUAZi3hT6UP9478pEpO
 zOCOYevYg9TaNKlQVRytvqmPjQ3fDauFBzA2+KJJiSMq2i1/qpgvbeA9F2OdlHEN
 E01fW/IekBEeL/gGHXOfst00GBVIWrwWWXHH+AnpWx73fM8xqr68GA9CuHESFuHA
 ==
X-ME-Sender: <xms:ykvBYMWu-7JQN36s17KHH-U0KplDwViKlKdSpbSTE8J22K7yi79Lrw>
 <xme:ykvBYAmEwI-AEUc2sPsUCXsQv-S4cQ88teEQf8vgFuY73VjCtv7iXw2wPyygfTUG0
 -7bnzrd4kBVQqA1Pw4>
X-ME-Received: <xmr:ykvBYAamRKncC51uW8pcOfffzAFBPSSoE_TZVvFNO3CPIegYRyyDfmpPYMIms73F_SxGtiuuuRbyN4gVGRX_bdw9CeOMC00QAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ykvBYLWAz0U0rxPUcEtfXyjIr1vvchEkssIwkzXtjhUZonilt1gP2g>
 <xmx:ykvBYGkvHAB_gQVMq-BotgoWLAfAJXZbVytGVehanTWOg_IuFJHMvQ>
 <xmx:ykvBYAciS6KAo2yq4_1D6WTDY5-nPMyHCXn-IO6L2CbKWS58PrDoUw>
 <xmx:y0vBYKsNMAGOAusKQrxbdMJeBMrQJDDENdj7PIwF6SQtA9Pd-mCPWw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 19:16:25 -0400 (EDT)
Date: Thu, 10 Jun 2021 08:16:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Message-ID: <20210609231623.GA3207@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
 <20210609143145.146680-2-o-takashi@sakamocchi.jp>
 <s5him2nawim.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5him2nawim.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Wed, Jun 09, 2021 at 05:27:29PM +0200, Takashi Iwai wrote:
> On Wed, 09 Jun 2021 16:31:43 +0200,
> Takashi Sakamoto wrote:
> > diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> > index b7e3d8f44511..3488ec1e3674 100644
> > --- a/sound/core/pcm_lib.c
> > +++ b/sound/core/pcm_lib.c
> > @@ -1778,27 +1778,41 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
> >  EXPORT_SYMBOL(snd_pcm_lib_ioctl);
> >  
> >  /**
> > - * snd_pcm_period_elapsed - update the pcm status for the next period
> > - * @substream: the pcm substream instance
> > + * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
> > + *						under acquired lock of PCM substream.
> > + * @substream: the instance of pcm substream.
> > + *
> > + * This function is called when the batch of audio data frames as the same size as the period of
> > + * buffer is already processed in audio data transmission.
> > + *
> > + * The call of function updates the status of runtime with the latest position of audio data
> > + * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
> > + * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
> > + * substream according to configured threshold.
> > + *
> > + * The function is intended to use for the case that PCM driver operates audio data frames under
> > + * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
> > + * context. In any interrupt context, it's preferrable to use ``snd_pcm_period_elapsed()`` instead
> > + * since lock of PCM substream should be acquired in advance.
> >   *
> > - * This function is called from the interrupt handler when the
> > - * PCM has processed the period size.  It will update the current
> > - * pointer, wake up sleepers, etc.
> > + * Developer should pay enough attention that some callbacks in &snd_pcm_ops are done by the call of
> > + * function:
> >   *
> > - * Even if more than one periods have elapsed since the last call, you
> > - * have to call this only once.
> > + * - .pointer - to retrieve current position of audio data transmission by frame count or XRUN state.
> > + * - .trigger - with SNDRV_PCM_TRIGGER_STOP at XRUN or DRAINING state.
> > + * - .get_time_info - to retrieve audio time stamp if needed.
> > + *
> > + * Even if more than one periods have elapsed since the last call, you have to call this only once.
> > + *
> > + * Context: Any context in which lock of PCM substream is already acquired. This function may not
> > + * sleep.
> 
> Hm, this text still remains here.  Overlooked?

It's my intension for documentation of
snd_pcm_period_elapsed_under_stream_lock() since it's expected to call
it under acquired lock. Its implementation doesn't yield processor
voluntarily by itself. If it yielded, it would depend on implementation
of each driver for struct snd_pcm_ops.{pointer, trigger, get_time_info},
but it's not preferable implementation of driver, in my opinion.

Hm. Addition of context section seems to bring more discussion since we
should consider about several types of context; e.g. threadirqs. Although
the documentation for the detail is the part of my intension in the
patchset, it's not the center. I'm sorry to reviewers but let me delete
the section in next version...


Thanks

Takashi Sakamoto
