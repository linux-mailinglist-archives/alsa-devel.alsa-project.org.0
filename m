Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9F1DF5E2
	for <lists+alsa-devel@lfdr.de>; Sat, 23 May 2020 10:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 310B21873;
	Sat, 23 May 2020 10:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 310B21873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590220858;
	bh=HZxkaD1E5jYXlzH7DRwnRQfcG1Qhb3qPGW+J3IHahcM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sF+fL5zOQK5Q/qP4oB/ve+SkJ/Rlrxuwp+W/Zi8ipPKIBmOkrxn4QP/xsYJoIVtEx
	 n99isxYiTRwJ6bWiliDjwrXrKcay5pHtn7ZgmnSPbypAFXxeZLu3DBByPI6bG6DTTJ
	 KxXqv4iv5KjcZVu71eWrkOorgshY8/7UfwY9eB64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F405F801F8;
	Sat, 23 May 2020 09:59:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09E5F801D8; Sat, 23 May 2020 09:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E646F80121
 for <alsa-devel@alsa-project.org>; Sat, 23 May 2020 09:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E646F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="H3rWb5HU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CcVRcc9i"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id A0D13874;
 Sat, 23 May 2020 03:59:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 23 May 2020 03:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=K9bdneoooJ1uSBw5jkomBqz3iW0
 HsoKgOxHBuN88dzA=; b=H3rWb5HUYcQn7iZXb7kBxoSo164u2D2hVvlNCeXfw33
 vPfXrucVHEPaNFgPKynsNfLu9sswkct6TBU+ulxNIaw6VejbT3wIjZSh1SBgRWed
 37G/3vgYwnuytM7AUt8VmRelj55JNfHGl1DFJBnkktNp8gbthsSgRqUD1vb3Dioo
 oApBMjnbaUmoQHmdsXR/FXiAtvFI3xc/C56alJZluumRtFOFuQWhJ6VtYXGn29mx
 /uHQLUxc7EcEWeJSmD0RVHQVwxL4y6E+vJ36WC4ktDt+GWzQYna8G67frcbar58V
 WkkaAGX9eKQ7ZdE0czbjq4KF00ZmXPj+KX9G9WSf7qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=K9bdne
 oooJ1uSBw5jkomBqz3iW0HsoKgOxHBuN88dzA=; b=CcVRcc9iulo5FrFWsvMwNI
 lnO1f6CwgY494tKBtmumqn8rFALyNsIivbS9xjEuFDxNvieYN9l7bH8WRLr+piIR
 Hj1jylf3k9X9SMeOYOzEMKd1s/EJHu1VdQ7/+FqtPUVATE/KUoEHME8/ctLx+itm
 eagXQ48TrSjcTD6En5e10/SVYN8DPtqRQZIwzDFDZ6T4+ggwg+Z5pKCf5SwFjZNy
 H1xpeXO1XhBuis4MzAWZOClWQIJIggq4HU8TTMcNqQr+dMJbbRE/O5YaYggluu+v
 hkouwGdlZiV8+Gw6yhghDLUytmFQ+kUM8upUDnJlv3Gq1dPGRi5Cmr7Q6VFMCqQA
 ==
X-ME-Sender: <xms:xNfIXpIYAmfqIChvyJM_rKIA0yUIxHG6Z0AgyhTnotb0mwkBuTquYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddugedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephfefleekfeevgffhhfehudetkeeivdeuvdelgeej
 jefhffegkeffffdugfevudetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprghlsh
 grqdhprhhojhgvtghtrdhorhhgnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshh
 hisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:xNfIXlK-hUj2c_B-TJAeEP4Nv8ItDjNR79jB0y4kcSeRYV0cYVe9Ng>
 <xmx:xNfIXhsN6JBRk4ydpuWG_Wqdcl1Uy2vhIKaqbVVFOHa-B7fcj_lI2w>
 <xmx:xNfIXqZCW_JuSxoblr1zefmM5ZBES2YNtOCd4SmdkHLQMAoGY4rc-Q>
 <xmx:xdfIXqDiHCJPhSs3amiBVLQ9b3oEfEyPZLCS9vGA9sPVJvr-kmK65UXOCtI>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 747FB328005E;
 Sat, 23 May 2020 03:58:56 -0400 (EDT)
Date: Sat, 23 May 2020 16:58:54 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] firewire: Remove function callback casts
Message-ID: <20200523075854.GA170441@workstation>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Oscar Carter <oscar.carter@gmx.com>,
 stable <stable@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 kernel-hardening@lists.openwall.com,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 "Lev R . Oshvang ." <levonshe@gmail.com>
References: <20200519173425.4724-1-oscar.carter@gmx.com>
 <20200520061624.GA25690@workstation> <20200522174308.GB3059@ubuntu>
 <20200523061033.GB3131938@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523061033.GB3131938@kroah.com>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Oscar Carter <oscar.carter@gmx.com>, Kees Cook <keescook@chromium.org>,
 kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 stable <stable@vger.kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
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

Hi Greg,

On Sat, May 23, 2020 at 08:10:33AM +0200, Greg KH wrote:
> On Fri, May 22, 2020 at 07:43:08PM +0200, Oscar Carter wrote:
> > Hi,
> > 
> > On Wed, May 20, 2020 at 03:16:24PM +0900, Takashi Sakamoto wrote:
> > > Hi,
> > >
> > > I'm an author of ALSA firewire stack and thanks for the patch. I agree with
> > > your intention to remove the cast of function callback toward CFI build.
> > >
> > > Practically, the isochronous context with FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL
> > > is never used by in-kernel drivers. Here, I propose to leave current
> > > kernel API (fw_iso_context_create() with fw_iso_callback_t) as is.
> 
> If it's not used by anyone, why is it still there?  Can't we just delete
> it?

For this patchset, I followed to the theory to keep backward compatibility
when adding any change, and it's what I'd like to discuss.

The isoc context of multichannel mode is also available for userspace
applications, and libhinoko[1] uses it. In a point of backward
compatibility for userspace, we can't delete the mode.

(Practically, the mode is useful for the purpose of packet sniffing in
bus and helpful to my work for development of ALSA firewire stack[2].)

On the other hand, there's no unit driver to use the mode in upstream
kernel. It's unlikely to use the mode for unit driver since the mode is
not specific to unit functionality. In my opinion, it's reasonable to
lose backward compatibility slightly by hiding the multichannel mode
from in-kernel unit driver.

I'll post v2 patchset later and I'd like you to merge them if no
objections from the others for the loss of backward compatibility.

[1] https://github.com/takaswie/libhinoko
[2] https://mailman.alsa-project.org/pipermail/alsa-devel/2019-April/147862.html


Regards

Takashi Sakamoto
