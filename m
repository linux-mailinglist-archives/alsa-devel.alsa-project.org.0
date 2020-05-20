Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3BB1DAA7C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 08:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8034F17B0;
	Wed, 20 May 2020 08:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8034F17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589955513;
	bh=NNCIrvBC9TBA0WD+xBeUzlOlKiYBvj2IpQbiVkJQMBM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9/MmeBPGhTCE7XHLsSFDInHSKQpO2//QbmZF9/RZDsLfCjh06XU2N8w0qYfWLhEW
	 tr7WStW0LO2mP/FZb+xTy87rnPruGu0PYcqZqQIAV/fuQ7oHKnveE0xLds5AbPaXYH
	 0inLsqOpvpOZ+ybN2at1ebXh4DYartuNb1e6cA/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D4EEF80090;
	Wed, 20 May 2020 08:16:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03692F801F9; Wed, 20 May 2020 08:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDDA3F80090
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 08:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDA3F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="boZgr2GG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kvz2/Wez"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 4A81EC4E;
 Wed, 20 May 2020 02:16:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 20 May 2020 02:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3XNYaKnp2YGCe91EplwF85srPK8
 6i5OIm/TZfO+r/A4=; b=boZgr2GGEoSCPOnQyY7adWYwLGs6cKNwB4tPIHroF9Q
 6nBi0D14HFNTaPEDK3mIToWgpFD/SoE7jIoA7nd1Ehuqfj2nkYSu+jP+xit2P2md
 XyTPT8i1+WR8EI2wlndxzZ0JCoY2jwiZnEzCWg0NvPuRyoDazEcAnX0KRzebYOeh
 EVRIWQ0WD1GjnazMVjqf/Ab6PxSId5ikiYxDPAipIlx+4a5HXOeE1cQFGijcK+4Z
 ro7MyN64kh82CxC5mgEKPkcegXkk23zwMsIVa12ZzhglXUSQa+C08eKEbhYQ3M8h
 svQd995a84sj/zPAqYjaoID1dZyUcdtTmLgXBJ1n/1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3XNYaK
 np2YGCe91EplwF85srPK86i5OIm/TZfO+r/A4=; b=kvz2/WezRA3U7KeAYIoye/
 GsK/JdQkFZfgnTnjy2U5r+nWxYV6BqcjDpSfSvImK33U8NDqHQjjWgIddB9ItzE5
 VQoDX9qFU83BCNZmvLoTQJxyRMkt/SBkeuaDt6CGdf22EfiLsSvhWCjXL0WoaOWk
 G5jP6/vgh7y54m0i6/oDos61fHKztdduCD99IIrEyuVmehl96QhRMEnhO2T+4zxM
 mrEi/nZR2z10IjvG0j3QEp6j/7Tf+5KyCS0BRWTIBwlN0LIkwsudGJ9r4vB+Kz9F
 mWRnnA6e+WTUa1SICCmLKb+BxjRygr+OCe+Nvn1RFo54RJDyhj0Q4OjeYX7twCiw
 ==
X-ME-Sender: <xms:PMvEXtybO761tUOfUtM1Uqz2bHplKGTEmVGoIF0G3kzcLSXeGp8BQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:PMvEXtQgL0xVSCOkaJchdgOBsjqZ2eLoEvsuUCzy-o2rOR9gqAeSCg>
 <xmx:PMvEXnXKX9pr1U5wgNkSMjZe8QCjXPg31XSMjzBCpwtmJubMfnKZXw>
 <xmx:PMvEXvi9bWn-4QBYxqXPK1RYyfQElyNhwIe9R9yz2xMB1_c_Ji2mjg>
 <xmx:QsvEXrtMztEFg7yl7BxqGmfpINuyC9xWvXo4xPA7p_oJD80NbveZlEi0-BA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 42D9C3066434;
 Wed, 20 May 2020 02:16:26 -0400 (EDT)
Date: Wed, 20 May 2020 15:16:24 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Oscar Carter <oscar.carter@gmx.com>
Subject: Re: [PATCH v2] firewire: Remove function callback casts
Message-ID: <20200520061624.GA25690@workstation>
Mail-Followup-To: Oscar Carter <oscar.carter@gmx.com>,
 Kees Cook <keescook@chromium.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 kernel-hardening@lists.openwall.com,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 "Lev R . Oshvang ." <levonshe@gmail.com>
References: <20200519173425.4724-1-oscar.carter@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519173425.4724-1-oscar.carter@gmx.com>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>,
 Takashi Iwai <tiwai@suse.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
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

Hi,

On Tue, May 19, 2020 at 07:34:25PM +0200, Oscar Carter wrote:
> In an effort to enable -Wcast-function-type in the top-level Makefile to
> support Control Flow Integrity builds, remove all the function callback
> casts.
> 
> To do this, modify the "fw_iso_context_create" function prototype adding
> a new parameter for the multichannel callback. Also, fix all the
> function calls accordingly.
> 
> In the "fw_iso_context_create" function return an error code if both
> callback parameters are NULL and also set the "ctx->callback.sc"
> explicity to NULL in this case. It is not necessary set to NULL the
> "ctx->callback.mc" variable because this and "ctx->callback.sc" are an
> union and setting one implies setting the other one to the same value.
> 
> Signed-off-by: Oscar Carter <oscar.carter@gmx.com>
> ---
> Changelog v1->v2
> -Set explicity to NULL the "ctx->callback.sc" variable and return an error
>  code in "fw_iso_context_create" function if both callback parameters are
>  NULL as Lev R. Oshvang suggested.
> -Modify the commit changelog accordingly.
> 
>  drivers/firewire/core-cdev.c        | 12 +++++++-----
>  drivers/firewire/core-iso.c         | 14 ++++++++++++--
>  drivers/firewire/net.c              |  2 +-
>  drivers/media/firewire/firedtv-fw.c |  3 ++-
>  include/linux/firewire.h            |  3 ++-
>  sound/firewire/amdtp-stream.c       |  2 +-
>  sound/firewire/isight.c             |  4 ++--
>  7 files changed, 27 insertions(+), 13 deletions(-)

I'm an author of ALSA firewire stack and thanks for the patch. I agree with
your intention to remove the cast of function callback toward CFI build.

Practically, the isochronous context with FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL
is never used by in-kernel drivers. Here, I propose to leave current
kernel API (fw_iso_context_create() with fw_iso_callback_t) as is.
Alternatively, a new kernel API for the context (e.g.
fw_iso_mc_context_create() with fw_iso_mc_callback_t). This idea leaves
current drivers as is and the change is done inner firewire-core driver,
therefore existent kernel API is not changed.

Later I post two patches for the proposal. I'd like you to review it and
I'm glad to receive your comments.


Regards

Takashi Sakamoto
