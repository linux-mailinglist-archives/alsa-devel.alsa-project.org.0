Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5403A0ECC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 10:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35CD016CE;
	Wed,  9 Jun 2021 10:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35CD016CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623227770;
	bh=dh4uhPl7iWVvAaTImf2Fq/NmcCHB/Mv4FkLbjxizms4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/8rFcusM929Oi0VvRB56HM+6R5/Cfkt922NHlrLU9dVZCuQzWeilDsmBufYXp5uM
	 93+iq+9RUb59p7tmcUYY3BBkUKUpZfwYOAZ81RAOZ4Hv6HJ6s3UfsNj/zfREgVRe3e
	 sUtHTXEWFhLCIPhp4ZhcxAUluHxoWT+yWwTf0y9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C77D7F80276;
	Wed,  9 Jun 2021 10:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE379F8026C; Wed,  9 Jun 2021 10:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 168AFF80116
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 10:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 168AFF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sxfszWY9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZPThPs/z"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D6F6E5C01BA;
 Wed,  9 Jun 2021 04:34:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 09 Jun 2021 04:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=mDCPMX1+s9ez+WKZT+DLpHdMlMA
 wwCy9uXKwv0PCZWw=; b=sxfszWY9ycP5N+BngEaT5sgpQyLOvnQX2CP6e008MwP
 Yy91Y3VJHTMBsC0AxfZS7Zy5MyppFk+j0W6I43Tlxv4P5oXq1inGEWF+6kxTx35V
 0LCFBKEMSqEvRWzUHgJrlyUi5Dt1bi4KCPg9mEgMAop5YugAHAhmlnVketHWBCQX
 1i+zUx8pbfdExjylViTJYSsiF84UI1lebe/wXGFG/20cWQlFtzmGaYAf7CT+rDEm
 jvBG+M9cFI8Zqz1I5TbqIaKaz9T3xqE+AlcsjYCjJIeGo55NrTeoMrFWeNVO/Ju7
 yrk5hoH0dtGFogPRUcezMFblS2OU23E5MhAGiJjHUEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mDCPMX
 1+s9ez+WKZT+DLpHdMlMAwwCy9uXKwv0PCZWw=; b=ZPThPs/zPZLQM93yxAqn1p
 MjODwhrEKdrm3/HrAofNwbEFpNx54SjVzDbOZS9ys/gcGfM1UIqmsVfm6XBJ+coa
 c50Ey7JwaL2PTHJy1G01A03Ql//OUA681AmQMusMBrrXJyC/pVKtO0mUCAjbNfF0
 n3YoYtXKkvnRsrJFKqW2mSkadtyMvlr93tETSL3GbzjaXikpaxRH97+PTrH3IW+E
 OmlHHn0ryNP1TBqjjWgM3Wrd02cV2xTks9t0vEVP5nJKwW51nTYsgXl0iCLczvcP
 NKuS2JAhfPiwPOTsdoHdGFFP2ReFqzTQfYoH1hrNUS2kdBELwvPOCCMNmnLpdaDw
 ==
X-ME-Sender: <xms:EX3AYMAFWjISV-VQ0XsFgVzeH1LjJXcDUIuurmdd6CdTCJLPRI5VNA>
 <xme:EX3AYOgOdWZ3SBfL2PBwwL-KK0nf6djOytYujDKdvVlQtpDG8IfwF7MBaeLM3hBYn
 Mo6KonJ3LFXHJDiXoE>
X-ME-Received: <xmr:EX3AYPkgfLDogM0VYsxKFUSNRVZJr_bvtAghXv4u_RyAGx1JY1Jmh8tUOc3DIBSsz0RXVpK7-_N3AYwTSWTdPq0IYtj5mg1fKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:EX3AYCws6UKxqoVvrqcaWhS1MKZL5Kv13Hh7ZGKCXrRrbIIHTofaww>
 <xmx:EX3AYBQbyxcSUFcaITsJQw45LvcvUByeqSv6CBBLQp-hvgSXJgvXAw>
 <xmx:EX3AYNYbJWtYUScNzm0usv_I0i5xTEMKLlashnh1k3yDRYSLCUBiUw>
 <xmx:EX3AYAIRMUQ_z8VrDF1awpvSg4-sxFpRi-mxK7PEq3V1D67OMbGM7Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 04:34:24 -0400 (EDT)
Date: Wed, 9 Jun 2021 17:34:21 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Message-ID: <20210609083421.GA134607@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
 <20210609012244.24296-2-o-takashi@sakamocchi.jp>
 <s5h4ke7cy0b.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h4ke7cy0b.wl-tiwai@suse.de>
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

On Wed, Jun 09, 2021 at 09:12:20AM +0200, Takashi Iwai wrote:
> On Wed, 09 Jun 2021 03:22:42 +0200,
> Takashi Sakamoto wrote:
> > 
> > Current implementation of ALSA PCM core has a kernel API,
> > snd_pcm_period_elapsed(), for drivers to awaken processes from waiting for
> > available frames. The function voluntarily acquires lock of PCM substream,
> > therefore it is not called in process context for any PCM operation since
> > the lock is already acquired.
> > 
> > The call in process context is convenient for packet-oriented driver, at
> > least for drivers to audio and music unit in IEEE 1394 bus. The drivers
> > are allowed by Linux FireWire subsystem to process isochronous packets
> > queued till recent isochronous cycle in process context in any time.
> > 
> > This commit adds snd_pcm_period_elapsed() variant,
> > snd_pcm_period_elapsed_under_stream_lock(), for drivers to queue the event
> > in the process context.
> > 
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > ---
> >  include/sound/pcm.h  |  1 +
> >  sound/core/pcm_lib.c | 68 ++++++++++++++++++++++++++++++++++----------
> >  2 files changed, 54 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> > index 2e1200d17d0c..bae90696cd06 100644
> > --- a/include/sound/pcm.h
> > +++ b/include/sound/pcm.h
> > @@ -1066,6 +1066,7 @@ void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
> >  void snd_pcm_set_sync(struct snd_pcm_substream *substream);
> >  int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
> >  		      unsigned int cmd, void *arg);                      
> > +void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
> >  void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
> >  snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
> >  				     void *buf, bool interleaved,
> > diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> > index b7e3d8f44511..6f01b0c805ca 100644
> > --- a/sound/core/pcm_lib.c
> > +++ b/sound/core/pcm_lib.c
> > @@ -1778,27 +1778,40 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
> >  EXPORT_SYMBOL(snd_pcm_lib_ioctl);
> >  
> >  /**
> > - * snd_pcm_period_elapsed - update the pcm status for the next period
> > - * @substream: the pcm substream instance
> > + * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
> > + *						under acquired lock of PCM substream.
> > + * @substream: the instance of pcm substream.
> > + *
> > + * The function is called when the batch of audio data frames as the same size as the period of
> > + * buffer is already processed in audio data transmission.
> > + *
> > + * The call of function updates the status of runtime with the latest position of audio data
> > + * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
> > + * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
> > + * substream according to configured threshold.
> > + *
> > + * The function is intended to use for the case that PCM driver operates audio data frames under
> > + * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
> > + * context. In any interrupt context, it's preferable to use ``snd_pcm_period_elapsed()`` instead
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
> > + * Context: Any context under acquired lock of PCM substream. This function may not sleep.
> 
> Actually it may sleep if the PCM is nonatomic mode; then the stream
> lock is a mutex instead of a spinlock.
 
Ah... Yes. I have less care of the case when writing it. I'm going to post
revised version this night.


Thanks

Takashi Sakamoto
