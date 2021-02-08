Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE986314310
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 23:36:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728DD836;
	Mon,  8 Feb 2021 23:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728DD836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612823788;
	bh=NBlqPVIpyQlu0e04vocxuBXBVhg91/G/Laf33d0qnqE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=StJk3n1WGg6yWuy9rTC9ANm9udR6eoEyNaLX6ouez6cOEm5YChfVvmcWSATm+Eo9X
	 EvEAx9z3M+51jZHZzpJ9YMVLyZCRPH82OYn4RJEKb5MHeGrPyf5E0r36FEmQYiG7qq
	 Al1ddw1RpGybB2vx+kVCYfkIqOBJtwMX1hovzNPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5264F8013A;
	Mon,  8 Feb 2021 23:34:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C8BF8022B; Mon,  8 Feb 2021 23:34:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBB57F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 23:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB57F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="P1eZhk03"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qcxV34QF"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2509C5C016C;
 Mon,  8 Feb 2021 17:34:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 17:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=DL2tJU08yilTZlR/Evwt++c57Kf
 EjKKQbfVgHqoAHVQ=; b=P1eZhk03zxFcOm0PJDhDezfy1JFuMM2VhyWECbAYlYM
 4lmd+fx2IE/Ai+0wo46s72iacoQDy9PjfMfOufzJ7X8UbZ64R2BIpGyXrlTpPlW6
 RJLrT+wo+lJR5BOLkNuCx8tSo6DgNs74bukovURaj74NlfATIWP4dZUzxDlrm/eg
 9Uob9DzgsKg+WfE00o9fSUoNb2HDHwz+dwcHPRq/PP70RIxyy7ewUSiiE/UXBKZh
 mJd6ce/wuDPabvGaArq/iQL4tVq/jcT2Co1iRZXvxilHeYYnDqgOFieVFAU8naWn
 fDbCOC3cdYb0JA99dUndwpVNHa1eCAjH5koY9VxWYlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DL2tJU
 08yilTZlR/Evwt++c57KfEjKKQbfVgHqoAHVQ=; b=qcxV34QF2MLhoLO5NvNEXx
 Q8F4s1n61ng6WbZLSD5v6C9vZayrxrCl2M+SXEcxq7Lcjh/lAIjIYnrIFoA/PEXC
 2GenugkqBHx23QI/uR5q8Rap3JFVKQFU9f17Z1gbMvWmzEGK1pubJj/Lqxh9Lqtz
 oAKdrCsLbMFjfDB6nMj/HIVpm49YfLHenHKZT0vGJsXbnEXOKhdbNNq1OFefdxeO
 9auusLc5g/f5KLPxdNvLcNqb5n3bpN4Nb/hIioYS195FQ+/0Bk460TxqPRhTE7pG
 IvO/ShOFsQJZjJKJu6gRAHktnq4aZ/fFOupM+Q9ErEYswNBMXALEwh4Arh5pDmjA
 ==
X-ME-Sender: <xms:h7whYM73rYthkoPa7lLJd78IVeADSwNMpjgiRfTBZkpuk5wVr4Kizw>
 <xme:h7whYN6ykyPJi2_8SkOFu_NUm3aCdPo4pTkxES9NG7YFOUTFI1sj9bkCN7Vxux9Oa
 VwlFL3-IKAPtQXQ4Ck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdduieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:h7whYLf0njizeqmLRHaHOdWBVaVJBex_nZr5S19dNv31G0G9reF7Lg>
 <xmx:h7whYBIIInvv5xM2C5g35yXoOs1WleQtd2abUgx07gyDnAOeufCq-Q>
 <xmx:h7whYAJgmUlvgfzO2fVpXCboyGedBHTiwtP0_98G4UakTW4h1lLsQQ>
 <xmx:iLwhYHWre5puWIv9FdyrC8Ugv6keBpjYuLWf0YjawxGhQk3lUkI42w>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B97A108005B;
 Mon,  8 Feb 2021 17:34:45 -0500 (EST)
Date: Tue, 9 Feb 2021 07:34:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] [RFC] ALSA: control - add generic LED API to sound core
 routines
Message-ID: <20210208223443.GA258185@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Perry Yuan <Perry.Yuan@dell.com>
References: <20210207201157.869972-1-perex@perex.cz>
 <s5him72y4q0.wl-tiwai@suse.de>
 <3bc1b151-68ce-8408-aff1-aeba2e6fe4c3@perex.cz>
 <s5h5z32y0xt.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h5z32y0xt.wl-tiwai@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Perry Yuan <Perry.Yuan@dell.com>
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

On Mon, Feb 08, 2021 at 05:33:02PM +0100, Takashi Iwai wrote:
> > > Also, are those new access flags exposed to user-space intentionally,
> > > so that user-space gets some information?
> > 
> > Yes, it's one benefit, the second benefit is that we can create user space
> > controls for hardware which does not have any switch / volume controls for the
> > given path.
> > 
> > An example is the AMD ACP bridge with the simple digital microphones. We can
> > use alsa-lib's softvol plugin to control the volume for this and it would be
> > nice to mark this user space control with the mic mute LED flag.
> 
> OK, makes sense.

I have a concern about the usage of access flag for such kind of
hardware specific stuffs (LED dedicated to specific audio control)
since it's not enough hardware abstraction.

In my opinion, for the case, developers for in-kernel driver tend to use
specific name for control elements (or prefix/suffix of the name). Adding
new access flags for it seems to be overengineering against the original
purpose.


The patch itself includes some remarkable ideas that:
 - introduction of association between control elements
 - analyzing current status of the association (then operate LEDs)
 - communication to userspace stuffs about the association

(here I carefully avoid usage of word 'topology'.)

The association itself seems to be useful when cooperating use case manager
of alsa-lib. I guess that the kind of framework designed for the association
is preferable instead of the patch tight-coupled to LED stuffs.
(And some subsystem already attempts to implement such framework into kernel
land, e.g. media controller devices in media subsystem.)


In another side, I guess that the reason to supply the association to
kernel land is to use 'ledtrig_audio_set()' kernel API. If userspace
stuffs find target LEDs and operate them via userspace interface,
the association could be in userspace. I think it better to investigate
for the direction since I can imagine that the introduction of association
to kernel land brings much codes into kernel land to support wide-variety
of hardware (and going to be obsoleted according to lifetime of actual
hardware sooner or later).


Regards

Takashi Sakamoto
