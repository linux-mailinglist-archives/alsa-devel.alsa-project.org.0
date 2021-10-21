Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195DA4363D5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 16:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19F7167F;
	Thu, 21 Oct 2021 16:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19F7167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634825562;
	bh=wn8iOhwK2TuAb50e4osnrc15KMZgDNRR9BeDsIUNJr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ja8TtyOIOiMkSWhioVmbBDZI3a7L4MNazc0LUHwxPMd/Ct2VLjMuSag/xpoWvt8ZQ
	 hIgIsRZXvDmucFw3eJV5wgvlij7wNYpAEEVVSpECffeAdSNz/JqQ339g96dgprbB8Q
	 wdjomW2aXlHU2MPQUysQlacl47LoCQs6tiC/LCtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2999BF80155;
	Thu, 21 Oct 2021 16:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78D80F80240; Thu, 21 Oct 2021 16:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_64,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81A69F800F2
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 16:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A69F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="S0a0uRE/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="P5MOrmuu"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AC185C01DC;
 Thu, 21 Oct 2021 10:11:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 21 Oct 2021 10:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Lc77xvxvIAlDSIcydSFGok83llb
 cxYQf/pBMlAKJDk0=; b=S0a0uRE/Xb8XRypA/KFA2Ufst3K2APtTRR1z/BGF8V/
 5pe3t2dkzmXZDxTpxASzv1AclEv/4lqVWrtDULEQlKzBvwcrmsPedw0K9BCsI7Xu
 v1Qit+BwochGQhVjdpCNQkmSSLjbh88NHVH/BdH4LfC9zUgPnLzS7Jj02xTwbcZp
 xGHvklEvGiljOB/AARS1D1ZdCqKoXt40RSyxAARyF6BNZhVhwiRDIB+MQ6caydqg
 HzSvclJ0k2L9hSXVPJ5/ZHMRlKC0BCbXfSffuzH6SEb9h2GtuGpjfLpAXL6ovzfv
 w1yUYmbys/9QT+s9OG/H2i42aWKCxzKarGVcK97+LJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Lc77xv
 xvIAlDSIcydSFGok83llbcxYQf/pBMlAKJDk0=; b=P5MOrmuu0kvtNmc+ZdRfjf
 nPoO9LWiEQTsX3KpqCIpDL1FRucn9K61q8++IjUlZM44l0S9YaIwvlfm+THY1hUH
 y7RW+cHlsrDmh9sttjCI+3jJROTN4zWKGQFBV6U3xY603H44SvOC9M24UA/YlYfm
 L4IZqRBLUe+uEJRvcnyShtVyrAtydIWrELPqaIUoKVT32hd1C1vSe5sIJ6GtMCVD
 b1ATOoKV3pD42a4h24aFrn+uFM2x80UIzq8Z56+Tlok9ONSf+Qv+IOE/BD94J5fT
 fGJMVTRFk4f24ieSx4ukolaNojG4ZhqvtjToX2Poqr/mE+MNQ52WIIOlgrTT7UlA
 ==
X-ME-Sender: <xms:_3RxYcyTGzVCFH2JWvZPtuNlE5FQFSQT5IZFWZmMo3cNC2kiNrfDow>
 <xme:_3RxYQRSjdNGstjy7ykIrSld-ntfo9kVZfTm-KGOHYN4vIsp5oWl3dfkxvwwy78tp
 ERtu3agloZcOjuZmVk>
X-ME-Received: <xmr:_3RxYeXb6xX5awZMW5oF7HaM-0D2c5ZpHqVN2NmFGaLL7w3S6X8k71LF57tgtDEUexiR6k55B_xcILetC4UXapsW9TRsExYV4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddviedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:_3RxYajK-85481BFlDMgCGpxdnGxzkA9lBsKI5C7CibjA5Nwh22GSw>
 <xmx:_3RxYeD9axgpgBLAkTzhChga9rvvSAhtnxU6yHM285jvFZJbJn4WKQ>
 <xmx:_3RxYbL0eDeD07ihw509X2q_ek-tiwP13ef_8ElxN6PiveUHm2IU5A>
 <xmx:AHVxYf6C8s6tUlpkTjLaOvlAi-eCw36gPYRv4DamEvhCs4_ufWyQEA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 10:11:10 -0400 (EDT)
Date: Thu, 21 Oct 2021 23:11:08 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: firewire-motu: fix invalid memory access when
 operating hwdep character device
Message-ID: <YXF0/PL+C3gHPxha@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20211020042555.40866-1-o-takashi@sakamocchi.jp>
 <s5hczo01cf5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hczo01cf5.wl-tiwai@suse.de>
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

Hi,

On Wed, Oct 20, 2021 at 07:40:46AM +0200, Takashi Iwai wrote:
> On Wed, 20 Oct 2021 06:25:55 +0200,
> Takashi Sakamoto wrote:
> > 
> > ALSA firewire-motu driver recently got support for event notification via
> > ALSA HwDep interface for register DSP models. However, when polling ALSA
> > HwDep cdev, the driver can cause null pointer dereference for the other
> > models due to accessing to unallocated memory or uninitialized memory.
> > 
> > This commit fixes the bug by check the type of model before accessing to
> > the memory.
> > 
> > Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> Wouldn't it be simpler to add the flag check in
> snd_motu_register_dsp_message_parser_count_event() and return 0 if
> SND_MOTU_SPEC_REGISTER_DSP isn't set there?

Indeed. It's simpler than my patch.

When posted, I considered about pre-condition in context of design by
contract. I programmed motu-register-dsp-message-parser.c so that
callers of extern functions should guarantee the target is register
DSP models.

> > +// NOTE: Take care of page fault due to accessing to userspace.
> > +static long copy_dsp_event_to_user(struct snd_motu *motu, char __user *buf, long count,
> > +				   struct snd_firewire_event_motu_register_dsp_change *event)
> > +{
> > +	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP) {
> > +		size_t consumed = 0;
> > +		u32 __user *ptr;
> > +		u32 ev;
> > +
> > +		// Header is filled later.
> > +		consumed += sizeof(*event);
> > +
> > +		while (consumed < count &&
> > +		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
> > +			ptr = (u32 __user *)(buf + consumed);
> > +			if (put_user(ev, ptr))
> > +				return -EFAULT;
> > +			consumed += sizeof(ev);
> > +		}
> > +
> > +		event->type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
> > +		event->count = (consumed - sizeof(*event)) / 4;
> > +		if (copy_to_user(buf, &event, sizeof(*event)))

The second argument should have been 'event'...

Anyway I'll use a bit more time to consider about what is better to fix the
bug.


Thanks

Takashi Sakamoto
