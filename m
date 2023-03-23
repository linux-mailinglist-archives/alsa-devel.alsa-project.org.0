Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D106C697F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:30:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D243EC2;
	Thu, 23 Mar 2023 14:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D243EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679578223;
	bh=gRfElBvlWsL1EwaN3c85xAmBYqF6yS+/2pTporZrL5Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tEfKZDV+5Q2Z6lMGTnacMyRYZtbvGLkn3yl+vy2TzL41O3bMhV5914on0WIKlVw2d
	 6OOhckkO03S3tobAvcBi9BeoWCn5CSkf7el4zAbvCauzZ1eCMmNRNIjVWCcx/RCdwd
	 McvWgsrwVmZFzVbVcTZyOQKOnf7GZ+HSylLMRCXc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF31F80254;
	Thu, 23 Mar 2023 14:29:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92501F8027B; Thu, 23 Mar 2023 14:29:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1932F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1932F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=DB+F7q5+;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GRIlj1FD
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 35E445C019C;
	Thu, 23 Mar 2023 09:29:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 23 Mar 2023 09:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1679578161; x=
	1679664561; bh=W6EujQ5X9vQGxLNpuCaetBTi2E1tyFAtOMolmehKW54=; b=D
	B+F7q5+dMLaBdxqaR8dfJvOwDHZKjqOxGqV0j2IqfOeJ5h2DomNwo7WVxWRisPaK
	pn3n2ONPI+N6MXjWuedYXDTFzYBVrPTRAgjTc4l5o1zBYyMmaAbLE+2xbDWFXjR+
	GhI1o18hR0NyFQTeCIQl9tpYpQ+y5WvL7kpLU1xxSoFVSmfv4iOqSF0aeSOFDNUA
	9GbZ9RyR1FaqAJu/VmFa8FofPxjufwY4md/I04wU77YomjCoDX31ak6F9opCtrXR
	lodcqZpF9pLY391RcrfjXgX05DLVBaXWPPfs1MAH34UXkes4av1mjrLYVgCn+RzS
	EjrlVHFQiLks0E6+esdEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679578161; x=1679664561; bh=W6EujQ5X9vQGx
	LNpuCaetBTi2E1tyFAtOMolmehKW54=; b=GRIlj1FDiN4oLVLA0wGFzRJdfPSqE
	8Q5tg65UfA+55vJ4I23lZIHcm6+PX85tLOHa5RbMhwH+YH76m3OeMIBZokx8/iS9
	XAQI104DfJtLVIkDz27Uwkac/PoN5+VmcXHUzkojo08K4NDAv6WctYPZb4J261NG
	11DSF0CHrP8ShldyVOeEFSYPgyJHqOI5wWmwHSgooSpkpQkpRt4USSyyfk3CsGsg
	+IlBm5eibQjTuAwb3BgZzGL/MGKWllQlntzVwRTAkYLczyHvzXbZulAPej2pI/rA
	Am1EITBIxvlb1rtuoZ+57V9S3/yHv/L0Y3Hda4NcS8NrNLLLPVvhyL6Zg==
X-ME-Sender: <xms:MFQcZKMV1RHkMemPA3YqxCZlbSjW-nBLU4So3eRNqNQc5Ob9_rBoFA>
    <xme:MFQcZI_EZJ1B2BcMjFaQosVVEN6Z2yP8w_utOpMyTJLzhKLwNTdr2i_zn7rcGyFun
    QguEjmdNSaQPESK-y8>
X-ME-Received: 
 <xmr:MFQcZBSDtLkjpHKuhrJzjpsxSvVOBix7pRwt48Y8K8-Bz1GGoYIbVq4cRK-VfqVni2ofFUnutTOnu9sa5U5TkOK4-4s>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:MFQcZKsz87ICm9JIv27bjmLRBP7_ZYRCBvAKRcCeOGXwrzhJ_ReMUA>
    <xmx:MFQcZCdm4Nne2xNVg9C3VXQWff92j07azGKa2UGwGp0yZ4O8ij_vTw>
    <xmx:MFQcZO0kLd-u424nvNxgXuZgUO7n4l-sGQQIhDOFbSYo3YaTXjXe5A>
    <xmx:MVQcZGHpfubm1poL9E_-KLfG3LYKieOKVoY5UnXGrwP-0ByfK0ynMg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 09:29:19 -0400 (EDT)
Date: Thu, 23 Mar 2023 22:29:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Fix recursive locking at XRUN during
 syncing
Message-ID: <20230323132916.GA235532@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	John Keeping <john@metanate.com>
References: <20230320142838.494-1-tiwai@suse.de>
 <20230321040258.GA164337@workstation>
 <87cz50htvi.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cz50htvi.wl-tiwai@suse.de>
Message-ID-Hash: 3DIB73U6K5IEHCX2NYI2KLZLETSAMUNI
X-Message-ID-Hash: 3DIB73U6K5IEHCX2NYI2KLZLETSAMUNI
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, John Keeping <john@metanate.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DIB73U6K5IEHCX2NYI2KLZLETSAMUNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 23, 2023 at 07:19:45AM +0100, Takashi Iwai wrote:
> On Tue, 21 Mar 2023 05:02:58 +0100,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Mon, Mar 20, 2023 at 03:28:38PM +0100, Takashi Iwai wrote:
> > > The recent support of low latency playback in USB-audio driver made
> > > the snd_usb_queue_pending_output_urbs() function to be called via PCM
> > > ack ops.  In the new code path, the function is performed alread in
> > 
> > 's/alread/already/' or slang.
> > 
> > > the PCM stream lock.  The problem is that, when an XRUN is detected,
> > > the  function calls snd_pcm_xrun() to notify, but snd_pcm_xrun() is
> > 
> > 's/the  function/the function/'
> 
> Corrected at applying.
> 
> > > supposed to be called only outside the stream lock.  As a result, it
> > > leads to a deadlock of PCM stream locking.
> > > 
> > > For avoiding such a recursive locking, this patch adds an additional
> > > check to the code paths in PCM core that call the ack callback; now it
> > > checks the error code from the callback, and if it's -EPIPE, the XRUN
> > > is handled in the PCM core side gracefully.  Along with it, the
> > > USB-audio driver code is changed to follow that, i.e. -EPIPE is
> > > returned instead of the explicit snd_pcm_xrun() call when the function
> > > is performed already in the stream lock.
> >  
> > Practically, the implementation of 'pcm_hw' in alsa-lib never evaluates
> > the return value (see 'snd_pcm_hw_mmap_commit()' and the others). I guess
> > that it is inconvenient for the low-latency mode of USB Audio device class
> > driver for the case of failure.
> > 
> > My additional concern is PCM indirect layer, since typically the layer
> > is used by drivers with SNDRV_PCM_INFO_SYNC_APPLPTR. But as long as I
> > read, the change does not matter to them.
> 
> I find rather that's an extra bonus :)  It allows the existing code to
> give a more proper error handling.  For example, the indirect PCM
> helper returned -EINVAL, but this can be switched to -EPIPE for
> stopping the stream.
> 
> I'm going to submit the patch together with the documentation
> updates.

In my opinion, extra care is required for the simple replacement of
-EINVAL with -EPIPE, since it may not come from any operation relevant
to hardware. In my understanding, it comes from just careless
implementation of user space PCM application, thus it is still reasonable
to return -EINVAL.

... However, you are the best person who has enough knowledge about the
layer. I would not mind the replacement if you did.


Regards

Takashi Sakamoto
