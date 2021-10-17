Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB294305D0
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 03:24:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B62717DB;
	Sun, 17 Oct 2021 03:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B62717DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634433846;
	bh=oUYIslE5KRJmSu1PIIw7VtGNOtYk+/5zm1ITVhSk5lA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W3l5Tz9Yskb2uV3Zt+Mt6mQkms4W+CZ6qTYax88A9xUivEfdLZ7CZUaWXCFgVyPHr
	 OVzs71TY0Q9ZseAt3XCH+PsYJrF/bNyOALs/thMYQhqSZRWeW9Uraccsr21s1e/B0M
	 R86fpLMlvUIVGyEBI6PjLhftTY80aPWndq5xpaEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E4FF800C5;
	Sun, 17 Oct 2021 03:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DC66F800C5; Sun, 17 Oct 2021 03:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E300F80167
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 03:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E300F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="P51uGG0i"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eW6tGiBf"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AE1985C00AD;
 Sat, 16 Oct 2021 21:22:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 16 Oct 2021 21:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=kP2Ic3xniZoSBtKfUKn1rh1/Gh6
 46cDNmIqhVpWsN+g=; b=P51uGG0iqPT0kmbOuCaZtbV6P1+AsbKgrXWNC5L/alw
 FcJ0dKjCtHDv9FQoNsksUfVFg1HjPsrdNkmIyJF90CD3a3uCHuyvF1xNDngeGq84
 XbYJjqfoQalc94gyjFpRQ0/y6KCP4Pab5QPg4zzceCICTBnd5IMromB+7Hot3ZGT
 DAh7n1tiMq1AMdl7d3XAvSM/78Ys4+OLJSyv5NQHn3tacg1vvsM6TZrUHsQqMn3N
 zMs3X+4d/S6zWHCKbr1HifAYqlMr0D5cRIFziDSdkwxDb6xT1q1224Byss6+a7Xh
 NgiThFLPL0b7znHkzmw+XtW9Y602s/FgFuANpZZ6B3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kP2Ic3
 xniZoSBtKfUKn1rh1/Gh646cDNmIqhVpWsN+g=; b=eW6tGiBffnmgZr4k1J29u6
 M0rwtuzKHpXlqTpJtLsvNvFqDTW2+3ToWzb18l/AP2k0LIIvCHs9atMgTSdrneKG
 VBKekHAIrCkaqNWBU9RD3VNbQte9Zm9IgoRAePhF/VQa68b3WyCWlnAvN7pBKmyN
 cpnBp+yh+q96IHlQ+WUNvQBtHnXXZBUsulGpKQltxKLX4n4N05LxLWT30bpu36cw
 OgPQDT340u/zG1ATPwBDxuHkbf91tHqTd9nyuB7DxryMH1ka9wcFiuMdLlfGfKOb
 PYl50vYjHVSYbj/CWbrhILafOXuJvGslFpZnh7BRkDUUoji4446dfOssT7yQ+DQA
 ==
X-ME-Sender: <xms:23prYXP40NLwSS0_vmNw9473Y8n2e7eTLPEnRqa20YsptCRqh0ygHA>
 <xme:23prYR83K47Ph4_U_l27Gl34Ny775M29TWpIaD4lh8WqwkrmkS7PFMxmK_EASRT-b
 Ip2u60kiOP1QQmzjuo>
X-ME-Received: <xmr:23prYWSq4AU_NUW4QFfA7rgUaAbyceg_mpZ6MSwOI_cw688skwXWLgLJRfOtm2vjEPzpliU8qh1NxzS-fCkp0-76ZOrD0nrazQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddujedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:23prYbvQ0Wr6lGPT4T3mscBD07aNYKW3czq_pkgTNFICa76n3fF6HQ>
 <xmx:23prYfelhc9mCL01kKEKvGEV7TTor4bHGRHHbfFEhNLXyXvfWuBf1g>
 <xmx:23prYX0wniGXqPSiSAD-1DliDikE-Vgu1wq7r0TBhiK_CfNGqmywng>
 <xmx:23prYQrbzOQ3MnsXM8qyGVwi0HIC4gaWb0jAANSvLaxxp6JLDSIRdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Oct 2021 21:22:33 -0400 (EDT)
Date: Sun, 17 Oct 2021 10:22:31 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] ALSA: firewire-motu: add ioctl commands to
 retrieve information in messages delivered by isoc packet
Message-ID: <YWt6179lGu6xM3Gw@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
 <s5hv91ythay.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hv91ythay.wl-tiwai@suse.de>
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

On Fri, Oct 15, 2021 at 05:54:13PM +0200, Takashi Iwai wrote:
> On Fri, 15 Oct 2021 10:08:15 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > The purpose of this patchset is to add message parser to ALSA
> > firewire-motu driver so that userspace applications can read information
> > in message delivered by isochronous packet as well as PCM frames.
> > The message includes information about hardware meter and user action
> > over hardware component such as knob, and MIDI message bytes.
> > 
> > Models in MOTU FireWire series can be categorized to 4 groups in regard
> > of message mechanism:
> > 
> > Group 1. 828 and 896
> >  * quadlet message to registered destination address
> > Group 2. 828mk2, 896hd, Traveler, 8 pre, Ultralite, 4 pre, and Audio Express
> >  * quadlet message to registered destination address
> >  * message delivered by isochronous packet
> > Group 3. 828mk3, 896mk3, Ultralite mk3, Traveler mk3, and Track 16
> >  * quadlet message to registered destination address
> >  * message delivered by isochronous packet
> >  * block message to registered destination address, including command
> > Group 4. V3HD/V4HD
> >  * quadlet message to registered destination address
> >  * block message to registered destination address
> > 
> > The patchset is for message delivered by isochronous packet in group 2
> > and 3. In Group 2, the message includes information of hardware meter,
> > information of user action over hardware component. The model in Group
> > 2 is called as 'register DSP' in the patchset since parameters of DSP
> > can be configured by asynchronous transaction for register access. In
> > Group 3, the message includes information of hardware meter only. The
> > model in Group 3 is called as 'command DSP' since software and device
> > communicate with commands transferred by asynchronous transaction in
> > regard of DSP parameters. Two types of message parser is going to be
> > added so that the driver caches images for the information. The cache
> > is available for userspace application by ioctl commands newly introduced.
> > 
> > I note that no control element is added for the hardware meters and user
> > actions. It's expected for userspace application to retrieve and parse the
> > information of image then operate for user-defined control element set.
> > 
> > Takashi Sakamoto (11):
> >   ALSA: firewire-motu: add message parser to gather meter information in
> >     register DSP model
> >   ALSA: firewire-motu: add message parser for meter information in
> >     command DSP model
> >   ALSA: firewire-motu: add ioctl command to read cached hardware meter
> >   ALSA: firewire-motu: parse messages for mixer source parameters in
> >     register-DSP model
> >   ALSA: firewire-motu: parse messages for mixer output parameters in
> >     register DSP model
> >   ALSA: firewire-motu: parse messages for output parameters in register
> >     DSP model
> >   ALSA: firewire-motu: parse messages for line input parameters in
> >     register DSP model
> >   ALSA: firewire-motu: parse messages for input parameters in register
> >     DSP model
> >   ALSA: firewire-motu: add ioctl command to read cached DSP parameters
> >   ALSA: firewire-motu: queue event for parameter change in register DSP
> >     model
> >   ALSA: firewire-motu: notify event for parameter change in register DSP
> >     model
> 
> Applied all patches now.  Thanks.

Thanks for your applying the above patches into your tree. I have some
slight concerns about them. I'd like to ask your opinion.

The snd_firewire_motu_command_dsp_meter structure includes array of 32 bit
storage elements. As I added its documentation, the storage includes
IEEE 764 binary32 values between 0.0 and +1.0. In the patchset I use __u32
type since I can find just a few usage of float type in UAPI header. In
driver side, no floating point arithmetic is used since the float value
is just constructed by gathering messages from target device. In the case,
is it adequate to expose the value as float type in UAPI?

Additionally, current ALSA control interface have no support for control
element with float value, like SNDRV_CTL_ELEM_TYPE_IEEE764_BINARY32. As
long as I know, no discussion about it in the list for recent decades.
Have you ever seen such discussion in the list? (Here I intensionally
ignore that we have several binary expressions for floating point since
I'm just interested in the existence of discussion.)


Regards

Takashi Sakamoto
