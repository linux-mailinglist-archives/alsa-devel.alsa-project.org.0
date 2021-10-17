Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3B43077B
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 11:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDB41866;
	Sun, 17 Oct 2021 11:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDB41866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634462834;
	bh=fr8j7OFSDOPMw9HovUDTYiXht6G0osnwh1XSFbIM0Yk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmh130HAIdH6euN5Egc2XHpykp/wuvOq+ueyOHF63cMPITAeZ8cuqg1Dbmn1o9vSE
	 CHsT3nnap3NyIpALlNLU6ofJpzdmwjmzri86Mc32+1w7mBERQ0Tsx6uLdWrAZYVey5
	 6P2vg8mEUnLX5PRdTM90BDsIknxoclGbVpIfz9xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D38F800E5;
	Sun, 17 Oct 2021 11:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3237F80256; Sun, 17 Oct 2021 11:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59EFFF80111
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 11:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59EFFF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PAXNBdA6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZY9oIy0T"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 82E553200929;
 Sun, 17 Oct 2021 05:25:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 17 Oct 2021 05:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=IJHe+73IUIl5CfcqD1R60UfPtfz
 DL6hecpVuU3B4aTU=; b=PAXNBdA6brjah2eMWvzhW+0q2JLmckGf7nU3zGSJei4
 5iXeOwJKpC7dIycVlKIcJFCwzARC153wa2l4pv+0oY7miQrMNfRRvklV5ImWRm4a
 6B51bVTxiiAi+yYrupI7vWNTESiejtjp4UlasSHrmRfyJX2Vp04lC2vrf0gaqL+O
 tbAi9Ld6AvvYZrbb5wkP9JtTivqWT0E9rAnk8ARI49yhmvpfyPv+nkTHOsEGV98S
 RaLM9xcGeKlNVAi+a2Hb3gBsDK88Kj2C8wU6I1ADgOkCyESwSeDyRidoBLGHhWOn
 Xs7mokVk8ysl2/YMuHmNBVWKyv0KFQgG9FF4NZw1ECw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IJHe+7
 3IUIl5CfcqD1R60UfPtfzDL6hecpVuU3B4aTU=; b=ZY9oIy0TIlMda64ZVUeodh
 zxBmw0JO3lsvD99aiMy1SEeGVXjcUMRapLkDeU+02HJFUWjqYuNJHciprF86sJ3Y
 LBSaNZMbWjjrD5hjf/S436Euff0BfGTruij3MkhDDBW+ZAsAHeMXbOhb0OekuKIm
 DMpkFs4ZuMRG1zWCUJlrMZJqP8unm7rFH0HdutM+G0HF1ZZ1EzwGloPdxb9dme4u
 srwWvhnZE0Tfq2Z69XG5zMuiST/ipwtsrVYhp/xYCSuunN6svQZ10MH17ttwH2gj
 GtzXRUl3o96NZX0gqK1Sd+dBJHe51QLO4MRra8m2r6W4qre8e3LEyxWhJ/wBKt/g
 ==
X-ME-Sender: <xms:FOxrYQfW0T5QzXCD3h9ZBz0zAufmeKbq2xDey4xA2hZ3ouapo2ZWTA>
 <xme:FOxrYSOHDO7zZGjsxCGB1G3wM302n8_I6ZFAUA-q88jM-qHuQRoZRWzNTHpPgoPw9
 d_JJIADaoVs515UFzc>
X-ME-Received: <xmr:FOxrYRhUY4K9widreonKvgubQEUYhv4Wbv6D2hYKbQ0O_jBwY4552q_F-kAEtZXIsq9aZekbGfW8VAU22I7TW5dPyDh_Lav4NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddukedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:FOxrYV_K21wjl1Z-w28qnkIi9_2UxEcUm9yZ-ulg_cHgO2Pbcajbuw>
 <xmx:FOxrYctIPi-GqdPyw8ayVOT2z2r5nU-jnTSnhTgcj0vFvKdx1QJFmA>
 <xmx:FOxrYcH89bh2p2D-Kzofupii5pm7TPQrIdVx7f6ZWHDmklpTysSZmA>
 <xmx:FexrYV6EXx1-QE6ZjmWG7zBYPov5fmzon-qLP1sXaXiWw3ihcGHyxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Oct 2021 05:25:39 -0400 (EDT)
Date: Sun, 17 Oct 2021 18:25:37 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/11] ALSA: firewire-motu: add ioctl commands to
 retrieve information in messages delivered by isoc packet
Message-ID: <YWvsEY2aGYtDloou@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
 <s5hv91ythay.wl-tiwai@suse.de> <YWt6179lGu6xM3Gw@workstation>
 <s5hczo4t9q1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hczo4t9q1.wl-tiwai@suse.de>
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

On Sun, Oct 17, 2021 at 09:02:30AM +0200, Takashi Iwai wrote:
> On Sun, 17 Oct 2021 03:22:31 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Fri, Oct 15, 2021 at 05:54:13PM +0200, Takashi Iwai wrote:
> > > On Fri, 15 Oct 2021 10:08:15 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > The purpose of this patchset is to add message parser to ALSA
> > > > firewire-motu driver so that userspace applications can read information
> > > > in message delivered by isochronous packet as well as PCM frames.
> > > > The message includes information about hardware meter and user action
> > > > over hardware component such as knob, and MIDI message bytes.
> > > > 
> > > > Models in MOTU FireWire series can be categorized to 4 groups in regard
> > > > of message mechanism:
> > > > 
> > > > Group 1. 828 and 896
> > > >  * quadlet message to registered destination address
> > > > Group 2. 828mk2, 896hd, Traveler, 8 pre, Ultralite, 4 pre, and Audio Express
> > > >  * quadlet message to registered destination address
> > > >  * message delivered by isochronous packet
> > > > Group 3. 828mk3, 896mk3, Ultralite mk3, Traveler mk3, and Track 16
> > > >  * quadlet message to registered destination address
> > > >  * message delivered by isochronous packet
> > > >  * block message to registered destination address, including command
> > > > Group 4. V3HD/V4HD
> > > >  * quadlet message to registered destination address
> > > >  * block message to registered destination address
> > > > 
> > > > The patchset is for message delivered by isochronous packet in group 2
> > > > and 3. In Group 2, the message includes information of hardware meter,
> > > > information of user action over hardware component. The model in Group
> > > > 2 is called as 'register DSP' in the patchset since parameters of DSP
> > > > can be configured by asynchronous transaction for register access. In
> > > > Group 3, the message includes information of hardware meter only. The
> > > > model in Group 3 is called as 'command DSP' since software and device
> > > > communicate with commands transferred by asynchronous transaction in
> > > > regard of DSP parameters. Two types of message parser is going to be
> > > > added so that the driver caches images for the information. The cache
> > > > is available for userspace application by ioctl commands newly introduced.
> > > > 
> > > > I note that no control element is added for the hardware meters and user
> > > > actions. It's expected for userspace application to retrieve and parse the
> > > > information of image then operate for user-defined control element set.
> > > > 
> > > > Takashi Sakamoto (11):
> > > >   ALSA: firewire-motu: add message parser to gather meter information in
> > > >     register DSP model
> > > >   ALSA: firewire-motu: add message parser for meter information in
> > > >     command DSP model
> > > >   ALSA: firewire-motu: add ioctl command to read cached hardware meter
> > > >   ALSA: firewire-motu: parse messages for mixer source parameters in
> > > >     register-DSP model
> > > >   ALSA: firewire-motu: parse messages for mixer output parameters in
> > > >     register DSP model
> > > >   ALSA: firewire-motu: parse messages for output parameters in register
> > > >     DSP model
> > > >   ALSA: firewire-motu: parse messages for line input parameters in
> > > >     register DSP model
> > > >   ALSA: firewire-motu: parse messages for input parameters in register
> > > >     DSP model
> > > >   ALSA: firewire-motu: add ioctl command to read cached DSP parameters
> > > >   ALSA: firewire-motu: queue event for parameter change in register DSP
> > > >     model
> > > >   ALSA: firewire-motu: notify event for parameter change in register DSP
> > > >     model
> > > 
> > > Applied all patches now.  Thanks.
> > 
> > Thanks for your applying the above patches into your tree. I have some
> > slight concerns about them. I'd like to ask your opinion.
> > 
> > The snd_firewire_motu_command_dsp_meter structure includes array of 32 bit
> > storage elements. As I added its documentation, the storage includes
> > IEEE 764 binary32 values between 0.0 and +1.0. In the patchset I use __u32
> > type since I can find just a few usage of float type in UAPI header. In
> > driver side, no floating point arithmetic is used since the float value
> > is just constructed by gathering messages from target device. In the case,
> > is it adequate to expose the value as float type in UAPI?
> >
> > Additionally, current ALSA control interface have no support for control
> > element with float value, like SNDRV_CTL_ELEM_TYPE_IEEE764_BINARY32. As
> > long as I know, no discussion about it in the list for recent decades.
> > Have you ever seen such discussion in the list? (Here I intensionally
> > ignore that we have several binary expressions for floating point since
> > I'm just interested in the existence of discussion.)
> 
> It's not been proposed, AFAIK.
> 
> The biggest concern is that, *if* any reference or calculation of the
> float type is required, what to do.  e.g. the kernel has a validation
> code for each values (min/max check), and how could it be implemented
> for the float type?

Indeed. It's probably unavoidable to min/max check and it brings issue
to ALSA control core. It's absolutely out of my scope and thanks for
your indication.

Would I ask you opinion about my concern about firewire UAPI header? Is
it allowed to use float type instead of __u32 type?

> thanks,
> 
> Takashi


Thanks

Takashi Sakamoto
