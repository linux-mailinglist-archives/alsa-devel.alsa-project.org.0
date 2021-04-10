Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999F35ABE3
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 10:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD4BD1658;
	Sat, 10 Apr 2021 10:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD4BD1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618043035;
	bh=z2ESdn1uBkdoQDUY4g1O/3CEdc3Ed5TmsLohgBP2778=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDKtCiwoargCjO9thRqHbRVMIz0JUVGgNmtTTWShNH0ZUEaex9U1nS6htzdQCD5/P
	 9irZqFvC2o6bBDpE8To+ZvZfnU2trX1vmN0yncshJHhfwYRCvs86fLyFGnhb9IaW/0
	 ANQzrVWaWFlP7NqFp1xtQTTmXIIvpqnrhOdVoN64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED4EF80113;
	Sat, 10 Apr 2021 10:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9508F8020B; Sat, 10 Apr 2021 10:22:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F743F80113
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 10:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F743F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Uo7n6q6Q"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="B4oiS110"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2066E5C00D6;
 Sat, 10 Apr 2021 04:22:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 10 Apr 2021 04:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=tG3SlZD+6DDjaCl6CoogqwJmU76
 vfa/1fz5lo7HeMxk=; b=Uo7n6q6QR4ORk4iWnjqQAiBJyDanbLZXRu0NEuewQcK
 xaZnt3IyQojxOJt+64Ckzoii42vPkpK77cZhqoVbFGgI+kSKzUM8/kP+hXBdEMh+
 ur3jKmrBwH1C5x2f+OCoU1byG59emKCVBVpCVqCIY6IsWSQtd48nbWo1t6VuvEEr
 5A0Acnh7MoNaKRt/wgDesxguN+TjpwKJAzuvSg8RfT6yy4TdU+HUPyrKaYfD4/n1
 e7/Wkb5FIpJTVlmEgqJsy5GqWiGl9oB0f+QNFdptX5aftCZzhMT097U5kuWdL1nF
 d1AHstsliwun8Ub6nQBmHfL+fXA86s/+peaq5JP573Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tG3SlZ
 D+6DDjaCl6CoogqwJmU76vfa/1fz5lo7HeMxk=; b=B4oiS110jXMJZKPWJw8BBA
 Tgry61aQSQp0Fss98JHr9UUB4tfXJp+JrIZFnopYPg6hwWLLrtNNVMejyFePn1fk
 5EQlZ24fQigsJmkugSqMaVlic0XAdqkyJ3f0jvY9+LOdI9XRffuZZkfvWOkkikv3
 u9vgd3C+TGvH9rR9Z533q4b+LBA/x0q22YCe7D+zXHF51QfxCm+VaugMDXg0lkXe
 RB0PhBa9t678sBVNw//TLXjsfDQYDegVuYnINmF2V006bPKczCRx2UWG9StX1gSL
 HhfMAu7hr4ZA4OE3wABUC2XeDP2nrg6/kU+qhqg+NVn9gvQxGs5QOmCgPVmqd/vw
 ==
X-ME-Sender: <xms:PWBxYGXCYQt-u_S-eMiM4KvNOtrd21arSJkErFxIQEdl4l4ZgvzAfg>
 <xme:PWBxYCmfWMDTnBB-UJ_hTXE0DoeBeGT88BpSGv6oMYd9rRrGm--uYAS09B9JFV4Nx
 Q7hnRtY5eu6Mbytrvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekfedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:PWBxYKby5sP-3PL0yVXoaoJaSZy-TeY4omyhzpM5zceynI5D_SjgrQ>
 <xmx:PWBxYNXgQdHau0aFIuLYzs_0bTQTXjbUzRNqbTXs4Ov3eQ8sjXUmOg>
 <xmx:PWBxYAndq38PoXchipTYYhd1SKHBhOxjWiZo4zYwchCdDiuaZglbpQ>
 <xmx:PmBxYHt-xQWS8dY3BKUxraLFyhoAMpQLuL1tHSPji4gdVtK59EqxTA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id E572F108005C;
 Sat, 10 Apr 2021 04:22:20 -0400 (EDT)
Date: Sat, 10 Apr 2021 17:22:18 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
Message-ID: <20210410082218.GB10316@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
 <20210408105025.GB40407@workstation> <s5h1rbl80yy.wl-tiwai@suse.de>
 <20210409022735.GA3776@workstation> <s5h5z0v67wh.wl-tiwai@suse.de>
 <1c2da980-1f63-c6fe-a4c0-005a1ed5bc19@perex.cz>
 <s5h1rbj5yp3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1rbj5yp3.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
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

On Fri, Apr 09, 2021 at 04:18:00PM +0200, Takashi Iwai wrote:
> On Fri, 09 Apr 2021 15:34:14 +0200,
> Jaroslav Kysela wrote:
> > 
> > Dne 09. 04. 21 v 12:59 Takashi Iwai napsal(a):
> > 
> > >> 5. add any mechanism to bind lifetime of user-defined element set to user
> > >>    process
> > >>
> > >> At present, the lifetime of user-defined element set is bound to card
> > >> itself. However, it's convenient to user processes to bind the lifetime
> > >> to process itself. I add any mechanism for it.
> > >>
> > >> For recent years I've made some patches in house but never arrive at the
> > >> best one. In the patches, I utilize access flags but in general the
> > >> maintenance of lifetime is not easy issue. I tackle again in this time.
> > > 
> > > It sounds interesting, but I don't know how easily you can manage it.
> > > The driver doesn't care much about the user process lifetime, but
> > > mostly concentrate on the file handle...
> > 
> > It should be easy to trace which process created the user element and
> > automatically remove this element when the process close the file descriptor.
> > Something like 'bind lifetime of the control to the active control file
> > descriptor'.
> 
> If it's tied only with the file handle, it's easy.  But I thought this
> is about the process?

The 'lifetime' relates any operations from userspace relevant to
element. In the point, it's not so easy. It's better to see the list of
ioctl request to ALSA control character device, guys.


Regards

Takashi Sakamoto
