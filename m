Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B098B3A3CA7
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 09:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22C6218A3;
	Fri, 11 Jun 2021 09:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22C6218A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623395390;
	bh=EcIUqLULc0GGlEYhqfIsewTqBKDuBGELYhQnLoaa96o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1eStXNMrDpr1NHUina91nvGDppOjSOc8l//sBPWq+lN6IKF/TaBYOmzNan5WOOE3
	 tuO0OTrAylCPkFBLAT/1sg/c90iPg73di7ESYWvhoq1FlWi/lnQs0T9G9UEYwuGnLx
	 ATBMS39yMgubDn1aT16R3RDeQuGoSv/dTd+b5e7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90C88F80149;
	Fri, 11 Jun 2021 09:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09545F8026C; Fri, 11 Jun 2021 09:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E57DF800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 09:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E57DF800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="AjPXdCI9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qBKt6kuy"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A3A4A1AC3;
 Fri, 11 Jun 2021 03:08:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 11 Jun 2021 03:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=T1zjdb30aqHRtGL/m4eSWxQmsmE
 nr3s3NkvQuw3mn+4=; b=AjPXdCI9NLA8XAJuL1GNcCkbjKse1uK126aRV8Vcb1B
 QvIIfJYcqmKJOyhimg5PaDdjH6BTmIEL9gmUET1FlaoshrFAWXnu3Nb+DxY24Dnz
 cj1FBAUqZpuxtqDrK+BLAYQHhqf/GECPVbCuQlRMkq9sZ4LsVwX+4eVRLoqXXYht
 t0NiV2rRtZrNDevY3jObaBnJZsJW2oK3Wp7TVdwzD+XLZBh2DPEVLdv9QffYFSaw
 k4iNnH62cbYrKz75jTVY9IjUcRCFbnvL8LCFiLn5+vTJNtNduHwd3oTiFHhoozo8
 0FxtCteBYs2dw+HGp5X/d1D0yYxBctwZxTnJrLCdR2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T1zjdb
 30aqHRtGL/m4eSWxQmsmEnr3s3NkvQuw3mn+4=; b=qBKt6kuy9ofH3c55l/MPb8
 R16fP4m7XHCXxXCtdr/RIMLK9N6KvdAI5cSUN4IYspWMwujQJcrP3NW4bSVmQhEY
 pMI/4IsmLrtvMuhhDD6fi0RIbD0jHKoLED9SguAX7R6XYzPBGhC8uZzVZwjeY1v7
 jgVdiC/NnCK+tICbgMy2Ju2my1o1UHTJvfLoG1LDAihwWeJugRB230MJpTvyG1Lq
 RoGUCHBw6JMgGQ+PhTw+rz7+56gy3Yx8wT9uQz9GNevjgjEb7ZMGM9dKO67ZR93y
 Oa8z+itxMEAzQjpfHvlw0F+uoT+UeZWTE/xRovwootiigY3OSg1mswt3otWgdLJg
 ==
X-ME-Sender: <xms:0QvDYI3Q4YCe0Ylb4RoxR7yiN6RFnL6P31-G8LQw024OWzoLDh--jQ>
 <xme:0QvDYDGWdpGtH3mebL6Xb1r8jPUHFuzhntfa1yb0NL1vX3seu0_p3JU30X-_6AeSU
 cKTfSezDyvl2sRy6Nw>
X-ME-Received: <xmr:0QvDYA5R-mRT2v4QNNYK85Xmvnazh_dGTXrxLIystlgapnfNExL7pKXq_gRd14m3GNnJfgFiMlp5hyjsFKtFXmcJ-QTcnjVb4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:0QvDYB2DMgV20jUoN9gW2f-NloWMi329iSFo1Ovh-UnhXqIytwfKBA>
 <xmx:0QvDYLGlTdmuThuxl3EiwvSYMP_FH_Ao2iUHPIzwDDHQ0H2yf4hrlw>
 <xmx:0QvDYK8u_wYkeQnlzZSJ4BODcko-cmPJD539vsV5yyv8n5J_SyysAw>
 <xmx:0gvDYBP1eRwrjRcb8k6zSfYX25l5d18QyxgYaF67ubGC9Q1tJOrvzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 03:08:00 -0400 (EDT)
Date: Fri, 11 Jun 2021 16:07:57 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 1/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Message-ID: <YMMLzQtnHdCi1nOv@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210609231623.GA3207@workstation> <s5h1r9ab22u.wl-tiwai@suse.de>
 <20210610080521.GA84899@workstation> <s5hsg1q9m60.wl-tiwai@suse.de>
 <20210610082622.GA86308@workstation> <s5hpmwu9kuu.wl-tiwai@suse.de>
 <20210610101243.GA89949@workstation> <s5hfsxq9e2w.wl-tiwai@suse.de>
 <20210611033816.GA10978@workstation> <s5him2k99sw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5him2k99sw.wl-tiwai@suse.de>
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

On Fri, Jun 11, 2021 at 08:47:59AM +0200, Takashi Iwai wrote:
> On Fri, 11 Jun 2021 05:38:16 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Thu, Jun 10, 2021 at 01:03:19PM +0200, Takashi Iwai wrote:
> > > On Thu, 10 Jun 2021 12:12:43 +0200, Takashi Sakamoto wrote:
> > > > 
> > > > On Thu, Jun 10, 2021 at 10:36:57AM +0200, Takashi Iwai wrote:
> > > > > Again, my *only* point is about the sleep.  You addition was:
> > > > > 
> > > > > + * Context: Any context in which lock of PCM substream is already acquired. This function may not
> > > > > + * sleep.
> > > > > 
> > > > > where "This function may not sleep" is stated incorrectly.
> > > > 
> > > > Hm. Would I request you to show the detail case that the call of function
> > > > (snd_pcm_period_elapsed_under_stream_lock()) goes sleep except for
> > > > driver-side implementation of snd_pcm_ops.{pointer, trigger,
> > > > get_time_info}? At least, in callgraph I find no function call to
> > > > yield...
> > > 
> > > True.  But the fact that those callbacks may sleep means that the
> > > function would go sleeping after all.
> > 
> > Thanks. After all, our discussion comes from the ambiguity that what
> > has responsibility at yielding processor under the lock. I think it helpful
> > to describe devide responsibilities about the yielding. I'm glad for you
> > to review patch below:
> 
> Well, I don't think it's worth to mention "ALSA core may not sleep".
> It's just casually so for now, but it doesn't mean that this will be
> guaranteed in future.  After all, this function call may sleep in
> the nonatomic mode (that's the very reason for that mode!), and the
> caller has to be prepared for that, no matter whether you do sleep in
> the callbacks or not.

I have an opinion that we should guarantee it as long as maintaining
existent in-kernel drivers, which call it in hw/sw IRQ context. This is
not the issue 'casually so for now'.

If you had a plan to rewrite or drop the drivers near future, you could say
it.

> > ======== 8< --------
> > 
> > >From 98e1b8332a95935ae875c637d3ddc27e68689aa0 Mon Sep 17 00:00:00 2001
> > From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > Date: Fri, 11 Jun 2021 11:03:46 +0900
> > Subject: [PATCH] ALSA: pcm: add context section for documentation about
> >  period-elapsed kernel APIs
> > 
> > This commit fulfils documentation of period-elapsed kernel APIs with their
> > context section.
> > 
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > ---
> >  sound/core/pcm_lib.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> > index 7d5883432085..5d28d63a3216 100644
> > --- a/sound/core/pcm_lib.c
> > +++ b/sound/core/pcm_lib.c
> > @@ -1803,6 +1803,10 @@ EXPORT_SYMBOL(snd_pcm_lib_ioctl);
> >   * - .get_time_info - to retrieve audio time stamp if needed.
> >   *
> >   * Even if more than one periods have elapsed since the last call, you have to call this only once.
> > + *
> > + * Context: Any context in which lock of PCM substream is already acquired. The function may not
> > + * sleep by ALSA PCM core. The function may sleep in the above callbacks by driver which should
> > + * configures PCM device for it (@snd_pcm.nonatomic).
> >   */
> >  void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream)
> >  {
> > @@ -1836,6 +1840,10 @@ EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
> >   * It's typically called by any type of IRQ handler when hardware IRQ occurs to notify event that
> >   * the batch of audio data frames as the same size as the period of buffer is already processed in
> >   * audio data transmission.
> > + *
> > + * Context: Any context in which lock of PCM substream is not acquired yet. It depends on
> > + * configuration of PCM device (@snd_pcm.nonatomic) by driver whether the function may or may not
> > + * sleep by operating lock of PCM substream.
> >   */
> >  void snd_pcm_period_elapsed(struct snd_pcm_substream *substream)
> >  {
> > -- 
> > 2.27.0
> > 
> > ======== 8< --------
> > 
> > Thanks
> > 
> > Takashi Sakamoto


Regards

Takashi Sakamoto
