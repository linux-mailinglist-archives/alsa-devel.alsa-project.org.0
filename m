Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1355EC5F5
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 16:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A24184B;
	Tue, 27 Sep 2022 16:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A24184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664288814;
	bh=u5karUteb9j+5evLw4yib2eL16MHQrzR0rAAy3gz32g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYTx9XQSFWlZO17H0rKvcIZ3Qya0KawkW/ZxZeA/srs2vgSqfPJu0yFliWIX44U1b
	 mYOow8az+nJtEs8QUFSDbkq5zq7IYeSgo1TVp/Z3KmqKWf2C0AmlHOf5p+3Xngcc0s
	 gK2bDz7IB6b2qiBNL+yaB5URVzXUvRt+y7iXcaoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B303BF80496;
	Tue, 27 Sep 2022 16:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33C37F8025E; Tue, 27 Sep 2022 16:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_DNSWL_BLOCKED, RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE, 
 SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82E40F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 16:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E40F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ct41H5Pz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ld+YG2gg"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id AB80E3200902;
 Tue, 27 Sep 2022 10:25:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 27 Sep 2022 10:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1664288742; x=1664375142; bh=u8
 LKpjilFMjqvRfP4/Oz9p+QHSDNfwKBfShQj9oyoDU=; b=ct41H5PzwzGw542OQf
 Urnogk092MnbdHh+HD/m6V2SaHcKlfO/02wh5PTeV2AmFSLDwj2Hf/1rtHfMZ6v9
 QoCC6r6Ra2haWqJJfCai6BCr6jKUUfXR6Uj9BGO3e1akK6jBo6Q6KDTdDX0Y+KFO
 uCLGMoSRE7/Chl1mS92He1yGfjujTmy6mU2mudYAPaiJgW3354Tl+reo5fqvgpEJ
 7Zsa4wioSh4awyxmeygjaV0AC4SIVw4n3tuf/vy20JgHsv78v4V1EekZuNZq6F+n
 4+ni3/V0mglf3DIBpzSX1H0GxOLG2jJg2pS35VpcLRCeri/AWkYhUR88I+ikJAac
 5tEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664288742; x=1664375142; bh=u8LKpjilFMjqvRfP4/Oz9p+QHSDN
 fwKBfShQj9oyoDU=; b=ld+YG2ggbRlIlm/X3tS6FS3qM7KneZthx/nFYmeNaqCx
 cmGX0CJQ17T0KMU50RNKQFyY1XwPGc5FKxO8nT/XfzjH71ucpWLV6hSRhdyyjP0f
 go7iYsGL3ZsJPS23HIMLZvmYF/bjXj06ME2MdDkNVPVAzZAPva+qtfNZY8LJRn8I
 gFbWd3AIH6lVgfyxgMGWlkxl94g3ZMOj3rlKoftsEV++gMwkPaMYeNmdPQu54q/A
 kNUsKpnuNkHkYP56MUkJ4ldgzF+YzNleVR5hiifDgQA6uOEDcWKTxXJN/Q8ekaqf
 ie3jxnf2DNiRumI0WJZQmES1kSxgx070ey60ModT+w==
X-ME-Sender: <xms:5QczY1THQ0K59BnHl7Xge8VhsZL3bu4oPGD3cNzy9YBfpMQDjg2Ngw>
 <xme:5QczY-xyV_3e1L_BPqcP0QlIoUPbe6ja46O3YLd0aozuIp6SgftD2iG_Uo7FDwYzc
 lHWtHP-VLT00utzgB0>
X-ME-Received: <xmr:5QczY61ObAC7s3zFaEMUI7JWiPbRv2k5ovYN3Mn24elmi8z3o2KIlbPbEsnLyYuMB3lcGEBTrpEwBYj-IIxj-4AaK8dlObS9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
 ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:5QczY9BZLE_klaof3GlwiDWIgSmWkSjWz913GREQextJvT0SFqjslw>
 <xmx:5QczY-jhlvZH7p1gWjOVQkqW-nALQjsdX7x0Uoy4aQH12bYXFwdUNg>
 <xmx:5QczYxo8-38l6Fh77aFkb2pXQZaDSZNypCJWPGEAw1IM7uXa6YVYaQ>
 <xmx:5gczYza-mbdAKcU1dTcH3VVsI-MZN2wh3HSwOAztANawZks9463L5w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 10:25:39 -0400 (EDT)
Date: Tue, 27 Sep 2022 23:25:36 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] ALSA: PCM state reference optimization
Message-ID: <YzMH4AlsIF0Zn0q+@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20220926135558.26580-1-tiwai@suse.de>
 <YzJQP26l3k7yrTrs@workstation> <87h70tgwos.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h70tgwos.wl-tiwai@suse.de>
Cc: Felipe Balbi <balbi@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Tue, Sep 27, 2022 at 08:26:11AM +0200, Takashi Iwai wrote:
> On Tue, 27 Sep 2022 03:22:07 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Mon, Sep 26, 2022 at 03:55:47PM +0200, Takashi Iwai wrote:
> > > Hi,
> > > 
> > > this is a patch set for simplifying the reference to the current PCM
> > > state by having the local copy in runtime instead of relying on
> > > runtime->status indirection.  This also hardens against the attack by
> > > modifying the mmapped status record.
> >  
> > The overall patches looks good to me and I have no objections, while I
> > have some slight opinions to them in a place of sound driver developer.
> > 
> > > The first patch does the basic job in the core PCM side,
> > 
> > The main concern is indirect accessing to state field via some pointer
> > hops. I think addition of helper macro at first step eases centre of your
> > work, like:
> > 
> > ```
> > diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> > index 8c48a5bce88c..f6a160cb8135 100644
> > --- a/include/sound/pcm.h
> > +++ b/include/sound/pcm.h
> > @@ -669,6 +669,20 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
> >              stream <= SNDRV_PCM_STREAM_LAST;           \
> >              stream++)
> >  
> > +/**
> > + * snd_pcm_stream_state - Return state in runtime of the PCM substream.
> > + * @substream: substream to check. runtime should be attached.
> > + *
> > + * Return state in runtime of the PCM substream. The substream should exists and
> > + * runtime should be attached to it.
> > + */
> > +static inline snd_pcm_state_t snd_pcm_stream_state(const snd_pcm_substream *substream)
> > +{
> > +       snd_BUG_ON(!(sub) || !(sub)->runtime);
> > +
> > +       return substream->runtime->status->state;
> > +}
> > ```
> > 
> > As we can see, sound driver programmer sometimes checks state of runtime
> > in their code, thus the macro could helps them as well as centre of your
> > change.
> 
> This might help if we may need any change in future again.
> 
> But the NULL check is superfluous in most places, and the state check
> is done often in a hot path, it's better to rip off.  So it's only
> about the read of runtime->state, and then it's doubtful whether it
> brings much value at this moment; that's the reason I didn't introduce
> such a macro for now.

Yes, so I have no strong suggestion to introduce the macro and no
objections to apply the patches as is.

I'm too conservative developer and consider about usage of memory
barrier always when seeing such state check since we should pay enough
attension to instruction reordering and concurrent accesses across
processors for such case. Fortunately we have no reports for such issue
yet. When posting the last message, it was on my mind and it's still.


Regards

Takashi Sakamoto
