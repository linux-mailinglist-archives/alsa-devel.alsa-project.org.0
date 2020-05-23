Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F071DF528
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 08:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35241186F;
	Sat, 23 May 2020 08:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35241186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590214337;
	bh=0ftU1TTGfhFEpNW3NsbgYUbiFGGQHnZ3H3HOeSMeYD4=;
	h=From:Date:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wh/3DzxanWth6H8fvyZL/FjXNhxRfsDc97jFlBiw8t+/tyXrdkcKKpGXrQBcwZM6i
	 Elr9mCLaCfgoxxPSRFgn++lNCFQHRfIDIXOac1dX6eI1xNaniXncg+s1zGAg+iXoRY
	 4dofVAO3lxUVQyrzn5XrUZG75XVRU/h6Mnz08DKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BEFF801F8;
	Sat, 23 May 2020 08:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59409F801D8; Sat, 23 May 2020 08:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 924ACF80121
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 08:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924ACF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="kAPKJBbB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="o3LniShn"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B27D18CB;
 Sat, 23 May 2020 02:10:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 23 May 2020 02:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 from:date:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=LrrYTVFkm9x5WAtV96l5QFTVfXK
 7jcQpg5sr70HsgwE=; b=kAPKJBbB3e4aBtF2OcbBUICIud8yPLH22RFoStnp4e8
 yDZXaIlUHk0hzMRsWVU1tHFiy4j0L0oLLRjDEWOTmhX/S/kyk3zo4JPIGMqvBvu/
 pVHsRR8shbwejVVYYURo0N2WYAO0gpTmU1ZNWJ2HUmC1oVxu4P8anVPVK5dPa3D3
 VCtDB+/zUbFUwYk4BMaqAjLO9JlrzQtA/2FPzETfMh6ca94xQ5B/gQDe0te1qzXw
 /DdP9SgJLR7qZbBpupaF2rfmz2uUpswbVzE6RAxliD1hVZEC6Cxme/m7h+bltlXo
 sgi1B50yNPN4u/lqaF3ofGVVEz6iGA+UFhvCDk9u8bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LrrYTV
 Fkm9x5WAtV96l5QFTVfXK7jcQpg5sr70HsgwE=; b=o3LniShnRlpl+p+BDDClSJ
 gFgFe65lkZbszodtwx+k48xiTCURwK42S+Fty6srSnJabd4skcMtn27IN77BBB4t
 0m6wvn6WSvufHru66KSihYcVKdZmLEv188Rj/+jHrpJRk7vef08ZiRmu6xJzZeUb
 brmvvzvNucIVMlzSlDVdJOwBLrzodmiQwcIIvPxG2miwdgmgYaS1xK3qbGXy0b/B
 0gwn3JDRJH9RlFMvMAS5WoQy9X9IX7E6Zbaj4Oc+/Nc8SxPoasIiShar3D91kh21
 l8/i2gHtlYm6pgY2gXS1A6QnKUZM07e1CXyuBXaMoKSP1JNtmNR25lY6c3PjWSTg
 ==
X-ME-Sender: <xms:T77IXlv6y-F4jWSN-g0qsuwh-D2FgNmSuQkyix1z2-REyP1dBZ1AQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddugedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepghhrvghg
 sehkrhhorghhrdgtohhmnecuggftrfgrthhtvghrnheptdehveeuieekuddvjefhlefgke
 dugeeffeffjeetieefgfduveehfedvheeludfhnecukfhppeekfedrkeeirdekledruddt
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:T77IXud2oWQcXqtjJpYSLzcm7xfysXz80uywdWroCd0IuG6WeZsNvQ>
 <xmx:T77IXoyC589Z7sLJ5OoU5m3ZDXiWXru70tkQEr2CPDnobSrWxGnt4Q>
 <xmx:T77IXsPJz4o-qG0QNang-l9w2SYk8cE6fRSpM7EiEVXr9iU2A99IVg>
 <xmx:UL7IXsVykN8rG8y8fgoGUWZ6glDMhYsF3Sub3bpYfEABCX_YO4a-ML45vUs>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFB1530664D9;
 Sat, 23 May 2020 02:10:22 -0400 (EDT)
From: greg@kroah.com
Date: Sat, 23 May 2020 08:10:18 +0200
To: Oscar Carter <oscar.carter@gmx.com>
Subject: Re: [PATCH v2] firewire: Remove function callback casts
Message-ID: <20200523061018.GA3131938@kroah.com>
References: <20200519173425.4724-1-oscar.carter@gmx.com>
 <20200520061624.GA25690@workstation> <20200522174308.GB3059@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522174308.GB3059@ubuntu>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>,
 Takashi Iwai <tiwai@suse.com>, stable <stable@vger.kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 "Lev R . Oshvang ." <levonshe@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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

On Fri, May 22, 2020 at 07:43:08PM +0200, Oscar Carter wrote:
> Hi,
> 
> On Wed, May 20, 2020 at 03:16:24PM +0900, Takashi Sakamoto wrote:
> > Hi,
> >
> > I'm an author of ALSA firewire stack and thanks for the patch. I agree with
> > your intention to remove the cast of function callback toward CFI build.
> >
> > Practically, the isochronous context with FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL
> > is never used by in-kernel drivers. Here, I propose to leave current
> > kernel API (fw_iso_context_create() with fw_iso_callback_t) as is.

If it's not used by anyone, why is it still there?  Can't we just delete
it?

thanks,

greg k-h
