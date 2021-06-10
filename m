Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C22073A2639
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 10:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F8881744;
	Thu, 10 Jun 2021 10:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F8881744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623312424;
	bh=zTOVeb7tUu2vMo9edfqeVoNS27ceuF9WIn8cf0v4quk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNZhHD1UZ2yixuW+HuYFRmYjJbiC3IZGzt1vhq5cwcnXZU+TrXmDaH0IR06jMVccr
	 /FTQBdX9nAXjMB5UQgVEJl1Ybh22uW7m+Nd1ukd8CjcKbzh2cU57/8doF74k0B0Tm0
	 c1TkTtGpLn9vNFmUieSKB3hnn6hEx+tGEET5uvKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A706AF80227;
	Thu, 10 Jun 2021 10:05:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49560F80218; Thu, 10 Jun 2021 10:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E047F80149
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 10:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E047F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jHjncCg8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sTZGmyo3"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A2405C01EE;
 Thu, 10 Jun 2021 04:05:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Jun 2021 04:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=03/MEePxPX3xK7mrWCG2XpFB2Dz
 Mqef2+eeodUFC+Hg=; b=jHjncCg8fTYyuQPpfhC+znOsE+wGi1JKeVjngGE6qDj
 zqn7Ki7z0U2QCxwrtRu7Yz1vt1NC7IEaGlBP38rQyy1UZHn/RPUJYJ+HcsEdYeyI
 qi7b5WbG6Xw2GDkGfh3rXJg4591S3T0RIwzd3XqrZbZeIHJtTfbiDj1bi9Aol6CN
 uma5RjM4iqsz8dzfu2CnPM+VPEa09wgVi9M0yhn5Kx/EW0hzYE42GrWdMtr7q8V5
 rC2sKZolwWwmft53252MQpg70dmAHplJ/SmwQISvr1qDHklgpsUhqBN2ucY/ahwb
 gbKLuNy0V7se77Rh/EAkUYclGHbzf9WiJ+fLX98RzKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=03/MEe
 PxPX3xK7mrWCG2XpFB2DzMqef2+eeodUFC+Hg=; b=sTZGmyo3dz47IPabTnE0Je
 E1HY/i8j0t8zp3KsLZxUScwgOZOGBpjg1cHCVoElz/aLyWomxXR2M+xXFEKbrKsM
 lgKk/L883YThy1LMukJd2a1S2f5KPN7XH0V8MFxHKVboX0mNdX4VGtBsaftOmq/R
 omw6F/rULWt6fa1QjdN3dDUPd+YYhpNJaBI1up2p06lZYc16tKciKMnx3GSXVlB7
 V3V0844DfJ+CV9FrTXOGINPmjnSM6qY5cY0+0t/3LXa4aXPDAC1JbwUsnbjkNWRR
 TtMFUZip3DISIEsxcJrYL8OjeArwgzBuGIqG9fHZ59ZBN/fOXVQaM0Ecbm4ZAHIg
 ==
X-ME-Sender: <xms:xcfBYHTlsk852LBX0WvSPWAWeVOSGJSGTtoXfZSQsDWiQle37-3svg>
 <xme:xcfBYIwGOBCSvmrroJx3sSfAtldnmiRyN2cMYiXVL715Z47-dugxCk9eYKhDqlE02
 IbKzh2zDBj4Y5pgKow>
X-ME-Received: <xmr:xcfBYM3pLKZX2_62nSy7VndjoPM1n8uR-kcqMRBnu1C4TQjtRPsbD2JrdNmm5hpKNHXDwpbTRLdAL_7c3TPZKoSJrEyySKDVQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:xcfBYHAmDa_Z1QcnjPYnTENNeu7rHJnF5HXDADD4GURT1BQEaMEJYg>
 <xmx:xcfBYAjCpSTM6FQX7PNisiEH_-553TDtdjS7tIuA0IlcRoQrFR4bNw>
 <xmx:xcfBYLppLdd298A7IcvmnNR-6zgL_sQxUEj5aPvalBkDYp37mQR-bw>
 <xmx:xsfBYMaPGPUTHserP44ZZfH7ZUpEEEHIfyAN05pVfy-496WfZr-WGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 04:05:23 -0400 (EDT)
Date: Thu, 10 Jun 2021 17:05:21 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Message-ID: <20210610080521.GA84899@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210609143145.146680-1-o-takashi@sakamocchi.jp>
 <20210609143145.146680-2-o-takashi@sakamocchi.jp>
 <s5him2nawim.wl-tiwai@suse.de> <20210609231623.GA3207@workstation>
 <s5h1r9ab22u.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1r9ab22u.wl-tiwai@suse.de>
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

On Thu, Jun 10, 2021 at 09:39:37AM +0200, Takashi Iwai wrote:
> On Thu, 10 Jun 2021 01:16:23 +0200,
> Takashi Sakamoto wrote:
> > 
> > On Wed, Jun 09, 2021 at 05:27:29PM +0200, Takashi Iwai wrote:
> > > On Wed, 09 Jun 2021 16:31:43 +0200,
> > > Takashi Sakamoto wrote:
> > > > diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> > > > index b7e3d8f44511..3488ec1e3674 100644
> > > > --- a/sound/core/pcm_lib.c
> > > > +++ b/sound/core/pcm_lib.c
> > > > @@ -1778,27 +1778,41 @@ int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
> > > >  EXPORT_SYMBOL(snd_pcm_lib_ioctl);
> > > >  
> > > >  /**
> > > > - * snd_pcm_period_elapsed - update the pcm status for the next period
> > > > - * @substream: the pcm substream instance
> > > > + * snd_pcm_period_elapsed_under_stream_lock() - update the status of runtime for the next period
> > > > + *						under acquired lock of PCM substream.
> > > > + * @substream: the instance of pcm substream.
> > > > + *
> > > > + * This function is called when the batch of audio data frames as the same size as the period of
> > > > + * buffer is already processed in audio data transmission.
> > > > + *
> > > > + * The call of function updates the status of runtime with the latest position of audio data
> > > > + * transmission, checks overrun and underrun over buffer, awaken user processes from waiting for
> > > > + * available audio data frames, sampling audio timestamp, and performs stop or drain the PCM
> > > > + * substream according to configured threshold.
> > > > + *
> > > > + * The function is intended to use for the case that PCM driver operates audio data frames under
> > > > + * acquired lock of PCM substream; e.g. in callback of any operation of &snd_pcm_ops in process
> > > > + * context. In any interrupt context, it's preferrable to use ``snd_pcm_period_elapsed()`` instead
> > > > + * since lock of PCM substream should be acquired in advance.
> > > >   *
> > > > - * This function is called from the interrupt handler when the
> > > > - * PCM has processed the period size.  It will update the current
> > > > - * pointer, wake up sleepers, etc.
> > > > + * Developer should pay enough attention that some callbacks in &snd_pcm_ops are done by the call of
> > > > + * function:
> > > >   *
> > > > - * Even if more than one periods have elapsed since the last call, you
> > > > - * have to call this only once.
> > > > + * - .pointer - to retrieve current position of audio data transmission by frame count or XRUN state.
> > > > + * - .trigger - with SNDRV_PCM_TRIGGER_STOP at XRUN or DRAINING state.
> > > > + * - .get_time_info - to retrieve audio time stamp if needed.
> > > > + *
> > > > + * Even if more than one periods have elapsed since the last call, you have to call this only once.
> > > > + *
> > > > + * Context: Any context in which lock of PCM substream is already acquired. This function may not
> > > > + * sleep.
> > > 
> > > Hm, this text still remains here.  Overlooked?
> > 
> > It's my intension for documentation of
> > snd_pcm_period_elapsed_under_stream_lock() since it's expected to call
> > it under acquired lock. Its implementation doesn't yield processor
> > voluntarily by itself. If it yielded, it would depend on implementation
> > of each driver for struct snd_pcm_ops.{pointer, trigger, get_time_info},
> > but it's not preferable implementation of driver, in my opinion.
> 
> My point is again about the sleep.  This function may sleep in the
> nonatomic mode.  The type of the PCM stream lock depends on it.

Would I simply request you to show how the added function yields except
for the driver implementation? The lock of stream is expected to be
acquired already.


Regards

Takashi Sakamoto
