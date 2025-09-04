Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F300B43CEA
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Sep 2025 15:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF596019D;
	Thu,  4 Sep 2025 15:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF596019D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756991941;
	bh=wV0yfGoHn6c4KIaX2WQsVA1c9mDcZW4LX12hbAQmucQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K06Yjud15799VRKD1btZ/mtxoEHOYYnlfxxJt7XP6H7GeahIVB9+uTRzQGuuHF0RK
	 8CO5X+MHZiJHHbGqm9PGl78zmKETpWyBhDqidEWGIOK5rm+kdpej9jKqAQGWpYHizI
	 s+2iJj+5RzWWR6k5Kl/VnQqwAg3BQsT+zXzgi8TQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48BD4F805C1; Thu,  4 Sep 2025 15:18:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 278EAF805C6;
	Thu,  4 Sep 2025 15:18:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43D73F804B0; Thu,  4 Sep 2025 15:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 902E9F8011B
	for <alsa-devel@alsa-project.org>; Thu,  4 Sep 2025 15:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 902E9F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=adIwBHc9;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eDe+8XFc
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 29F927A03D0;
	Thu,  4 Sep 2025 09:18:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 04 Sep 2025 09:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1756991892; x=
	1757078292; bh=Iyuj87vy4e6aMmv8nQ0zfqnbJyUHJmzF1z8YFo4q9ig=; b=a
	dIwBHc9T6xDf/78BBY1uMfGBVqiZvdR8nQh4QyY4qux2PCCVm3+l3ksJOVBBNcB9
	JK/kLqhRbl9xx1RxqvreD7pYrnAD72uLJ4scSMbuO2W8GOIzlqgxFz4yKiik0XIQ
	JnlB92u69fJBw4HoEVr2D1+5jTH7EY7/s04m5MWVg/c4tuTZdNUkheVyQV9Kj2EO
	qPbB+e9Da/VPM9tFbi0Q7e3LXhEvDjJqxd3NGoTenOS1a39aIfFQXBDTwl8zc401
	82QgHBgH0FjVDHNE4+rOGRCqVXFBYGLxP2bW/6UbfRZFcvVG8/ljoVVf0w2gYEu+
	ynPlmB0ztSWLQLJy5X43A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756991892; x=1757078292; bh=Iyuj87vy4e6aMmv8nQ0zfqnbJyUHJmzF1z8
	YFo4q9ig=; b=eDe+8XFck1zuFxUgiGOW0jjLfc2Az5sBkOvyJ/9Xsha8k8R3FXx
	dTHi8kkn5x6qmF8OMgxGmt1aVqs1KI+qkg54W/CNaXRDg34Rd0Fnka2gwcMwF9MO
	4u112T5ullkaYPBuJm+J8ElyoIddudnuZP+2wJ7kNHtySbx27GLlRwobERTbkZOe
	AIt+tPMjbIA+tKIpXVXidzDLcgDsmPY3W31FfSh+Y5BFGdH93vZY9jkgjqXEds6O
	rbliW8dOE5YsZe+fpzyXlpfPkBr4gdem2mTYpntuxFNT+BbDVIX4z5BSN1za+M8j
	G5P2IX6scMZEr4giSk+UQUkLo8VwE2QbA0A==
X-ME-Sender: <xms:k5G5aGWMi4NaQEKHc4QfvN3G_8EKRKzWN55xYc1Pn2iWjMOsyu6rAQ>
    <xme:k5G5aNeOfNMh7fGolLILjqqYRDY0-IsOp7x6KJIkTwIpmhA93yTPEpPvt6Pm6e8cN
    Hm4G0TadgLqQWHw6mA>
X-ME-Received: 
 <xmr:k5G5aCO8wHeqQQl08ElLvZC-G7Fyq-BzGxDow5tM0C1mXM3FWZPZ6aSSiLmRR4fers4ObQ_br2_MSPIj_eIY03WnviBi7xehvqI>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcu
    ufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqne
    cuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeegieeljeeh
    jeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
    rghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehmrdgr
    rhhmshgshiesghhmgidruggvpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrg
    dqphhrohhjvggtthdrohhrghdprhgtphhtthhopehtrghkrghsfihivgeskhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:k5G5aLiaRV64nTieeWi42GYz3cf8hYOjDS8-rYEM8Qp3plRYDxcIxA>
    <xmx:k5G5aF0-ZLfSdMsHMu-smGz3pbZm7-pNOLMTwP_7Xtd0hLlOZGrX9A>
    <xmx:k5G5aFhRs_Z1gKXUaWY2iwCXXwGXRe6Ig2zLBAW3WpdKGd0zLNlmLA>
    <xmx:k5G5aFcAJcEIjKSTn1zVIeAYgc72iN8SzdVQUxndHxGMiQdKOlsPNg>
    <xmx:k5G5aGX-Taew1-Eu7JxBcju9Z_Nd1CTUAF47cVrHyVvC1guBvPNS6YmD>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Sep 2025 09:18:09 -0400 (EDT)
Date: Thu, 4 Sep 2025 22:18:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: "M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
Message-ID: <20250904131807.GA209723@workstation.local>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	"M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
	Takashi Sakamoto <takaswie@kernel.org>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
 <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
 <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
 <d21fb84e-d72e-4747-a9ff-92722b93f835@perex.cz>
 <20250903111519.GA76122@workstation.local>
 <3e07de0a-affa-4776-9172-83b2b071fbe8@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e07de0a-affa-4776-9172-83b2b071fbe8@perex.cz>
Message-ID-Hash: 2PIEVBJ2U2JAIOKOCKN2AOO5A3ORGJTX
X-Message-ID-Hash: 2PIEVBJ2U2JAIOKOCKN2AOO5A3ORGJTX
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PIEVBJ2U2JAIOKOCKN2AOO5A3ORGJTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Sep 03, 2025 at 02:19:59PM +0200, Jaroslav Kysela wrote:
> On 03. 09. 25 13:15, Takashi Sakamoto wrote:
> > Hi Jaroslav,
> > 
> > On Wed, Sep 03, 2025 at 10:47:32AM +0200, Jaroslav Kysela wrote:
> > > For Takashi Sakamoto:
> > > 
> > > The hw_params constraints in the firewire driver should be improved based on
> > > [1]. The drivers may also require the SNDRV_PCM_INFO_BATCH info flag.
> > 
> > How it works in this case?
> 
> I guess that the question is for the BATCH flag. It's just an information
> that the stream queuing is not granular enough like for PCI cards and the
> samples are queued in chunks to the hardware. Applications can handle the
> queuing differently in this case.

Hm. A packet can multiplex several Multi Bit Linear Audio (MBLA) data
frames defined in IEC 61883-1/6 (e.g. 0, 6-8 frames per packet at 48.0
kHz sampling transmission rate) When considering the frame count reported
by typical serial sound interface in embedded SoCs, this granularity is
not particularly unusual, even if DMA transmission occurs between system
buffer and the interface buffer. Since the ALSA PCM interface does not
expose this granularity, it remains invisible to userspace applications,
and application therefore cannot distinguish its origin. This is why
these drivers does not report the BATCH flag[1].

Nevertheless, one likely reason might be that i programmed the
IEC 61883-1/6 packet stream engine to recycle retired packet buffers as
quickly as possible, using a "sequence replay" approach. This behaviour
may appear as though it follow the concept of the BATCH flag.

I plan to redesign both the engine and PCM operation implementations of
each driver to address this point, as well as to add support for
SNDRV_PCM_INFO_SYNC_APPLPTR to packetize in application processes.
However, it is not yet the right time (I still have some items in Linux
firewire stack itself).

> See also proposed (and applied) change in [2]. Please, read [1] thread
> referred in my previous e-mail to see the problematic buffer size
> configurations for firewire drivers.

In Linux FireWire subsystem, there is a size restriction on the context
header within the.structure specific to isochronous context[2]. This
software-side restriction determines the upper limit of the PCM
buffer. The content of IEC 61883-1/6 CIP header is stored into this
buffer, The frame count in each PCM period/buffer, as well as the total
count itself, are governed by the computation of the number of headers
fitting into the context header buffer[3]. The count differs by the
design of target device. The design of protocol mentioned in the above
appends more constraints[4].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=d360870a5bcf
[2] https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git/tree/drivers/firewire/ohci.c?h=v6.16#n3137
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/amdtp-stream.c?h=v6.16#n227
[4] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/amdtp-stream.c?h=v6.16#n160


Regards

Takashi Sakamoto
