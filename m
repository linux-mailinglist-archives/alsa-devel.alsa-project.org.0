Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264523E5DF
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 04:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CCE1614;
	Fri,  7 Aug 2020 04:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CCE1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596767817;
	bh=9dvjMoQgiVnbsEI92tvS3Mrhty3JvQ+61S1GZIe+d5s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P7kskayNwvrCdC/deRc+/9bPOpBE9H2cBa06ELwojkrsx/pieSy2mpqA1AJZQLJWw
	 oKKWrpBDIua0yfnHxN9WzyMweBw3ZjK54j+JkaWvavHz+Bun9+KOxIIMWjvGLUexsG
	 S1m8JgsELoLWvFYpvmwhk+fuAOVJAvh9wCst3LHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9688F8020B;
	Fri,  7 Aug 2020 04:35:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01935F80218; Fri,  7 Aug 2020 04:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB12F800AB;
 Fri,  7 Aug 2020 04:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB12F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lJzRMKuW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="e3QPM/vW"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 26975B72;
 Thu,  6 Aug 2020 22:35:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 06 Aug 2020 22:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zPtqLhxnDWVpik34ejMNwMwD5Dp
 80DY5IwSBDMFLPYc=; b=lJzRMKuWy/FPSDRXNlv6hk47RqnxXw+3z0F6iPDx9rg
 63V2mfExYdx1/GHnByzKoLRqL0rTnK2hIAZFvMm2gzwB0aG2h3XtMzPNO7Dy7AZu
 SnfrdSL/6yjGutDIx45RgS3ykqJ4pMTBEyAZnntC/cGfzyaMhfKEqv73IAwqNOkI
 7K3+Es9WYX4+WhK5MMLe90I7aUaQ3rHKMDIxlt3qwPQtJZ01uAgX6wtqQKAzbpZG
 w4MdDnKEvJbl3KJCQudYOHdj5eJ05Se4UDkBFpprwgimWLH6ID3J8S17SM7/hRhH
 a/UPSpSYDo8YPqrnAnzSDMZzCPKBTcTU9drTePW4SFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zPtqLh
 xnDWVpik34ejMNwMwD5Dp80DY5IwSBDMFLPYc=; b=e3QPM/vWPdJJTHpRAErO9Q
 R8lhPw3Qvrn2ajJHdHlPyaXiiV0PVxyx/wmxPRlOxkZQAN9ZQ/JGQgmuMIAVErUQ
 Txgw7MVYlHEl5o8psDG8Goqd4YIfr9OjUfZw5/o4dFTwQH6lZuMzMRqosNQ3saZP
 ZTXqPDEaejdd1PcjZbA4LxHDSRq3GQtlHqjvTnLj3Va6PVRyihGh7XTut8f1y18e
 1AE7XlVawpwgMAgM8WjdbFm03NtFy6YD1H3vFcFZamwLLf3t+Q+bZe9CpjZB59ta
 mjGxE7QQReSIaRMfGd5qUjCZv8aQcQFKD80GzIrO8mwh5qHxIFJiwDfceRDvgybg
 ==
X-ME-Sender: <xms:2L0sX-_d-JhCcD2-DCm5kFSbfPKrSs6Gf5JvSRE50-tUHiECoYIwmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkedugdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepleefleeikeeiieevtdfffeeiheefhfdufeeiieffhfet
 ffefheefvdevuddugfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 ektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2L0sX-tUpdtjnoBHFHLL2FRuj8tZAc0ZzNKs9Jff2Y0s5aEURHQi9g>
 <xmx:2L0sX0CitBkHWgN8TpfXNY3P1CZ9E2VB3OAEvEfXKwYpshAr_eMQ6g>
 <xmx:2L0sX2cBkpMOPdW4_RkLWI21fNpYU4BnwQNvLKKvsEqDlqN1bRMogA>
 <xmx:2L0sX1XHm9x9MHU-ekifjcIa6fUz78iwZ1q9Ttjjrd_EbELAmlwdYA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id E52D83280059;
 Thu,  6 Aug 2020 22:35:01 -0400 (EDT)
Date: Fri, 7 Aug 2020 11:34:59 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: General PulseAudio Discussion <pulseaudio-discuss@lists.freedesktop.org>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
Message-ID: <20200807023459.GA408402@workstation>
Mail-Followup-To: General PulseAudio Discussion
 <pulseaudio-discuss@lists.freedesktop.org>, 
 Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <61bf48f0-e63e-c762-c083-27a0bf371483@linux.intel.com>
 <20200806174708.GA404054@workstation>
 <ff97864d-d21f-a6e2-967b-f9ecd1a412f7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff97864d-d21f-a6e2-967b-f9ecd1a412f7@linux.intel.com>
Cc: alsa-devel@alsa-project.org, alsa-user@alsa-project.org,
 Tom Yan <tom.ty89@gmail.com>
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

On Thu, Aug 06, 2020 at 07:12:14PM -0500, Pierre-Louis Bossart wrote:
> > On Thu, Aug 06, 2020 at 10:30:36AM -0500, Pierre-Louis Bossart wrote:
> > > What I was trying to describe in my earlier answer is a different need to
> > > have an atomic update of *multiple* controls.
> > > 
> > > If e.g. a DSP or hardware engine exposes two separate filters for left and
> > > right channels, and the coefficients for those filters are modified with
> > > separate controls, it would be really nice to have the capability of writing
> > > these controls separately, but have a 'commit' mechanism so that these
> > > updated coefficients are used at the same time by the left and right
> > > filters.
> > 
> > For the pair of left and right filters, the simplest solution is to unify
> > the two control elements into single one, as you know. The array of
> > two values can be passed to your driver by single system call and
> > ALSA control core surely calls driver code under lock acquisition
> > against any operation for control element.
 
(After posting the above message, I realized that the above method is
not good in the case since the coefficients data is array type of data.
The aggregation seems not to be well...)

> I am not worried about other applications, the issue is that a transaction
> on a bus or IPC is assumed to have an immediate effect. In the case of
> multiple values, it'd really be desirable to defer the effect of write
> transactions until they are all complete.
> I am not making this up, this sort of capabilities is described in standards
> and I am not aware of any support from the ALSA control framework for a
> global commit operation. We have mechanisms to synchronize triggers on PCM
> devices with the snd_pcm_link(), synchronization of control changes is a
> miss IMHO.

I attempt to arrange several points in your messages:

1. passing vendor-dependent data blob or metadata via ALSA control
   interface without any data abstraction
2. control ioctl request to handle multiple 'struct snd_ctl_elem_value'
   to corresponding control elements at once.
3. introduce traditional 'asynchronous I/O' operation to element write
   operation in system call level.

I'm in conservative place in a point of changes in kernel land. At present,
my answers for the above is:

1. It's impossible for standard ALSA control applications such as
   amixer(1) to handle the vendor-dependent data blob or metadata.
   Therefore the functionality is not necessarily to be implemented with
   ALSA control interface. The functionality is itself unfriendly to
   the existent userspace applications.
2. Any kernel patch is welcome. But I'm happy if you have enough care
   of my proposal of limitation removal for the number of members in
   value array[1].
3. It seems to be problematic for both of ALSA control core and
   userspace applications since any attempt for asynchronous I/O in
   system call level is not necessarily successful in history of Linux
   kernel development (or standardization by Austin). I don't know the
   future.

Summary, I recommend you to use ALSA hwdep interface for the
functionality in your device, instead of ALSA control interface.
You can see some drivers have implementation for userspace applications
to execute request and wait for response; e.g. snd-fireworks.

But I note that the summary comes from my conservative place and
there is space for further discussion.

[1] https://github.com/takaswie/presentations/blob/master/20181021/contents.md#limitation-on-a-container-for-value-array-to-an-element


Thanks

Takashi Sakamoto
