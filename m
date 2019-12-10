Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD80118D07
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA69E1688;
	Tue, 10 Dec 2019 16:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA69E1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575993084;
	bh=6tXZDQDZxQb0xxvKcbCsBImX/wZITGZ77tATPDIrjJg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EUKdFi0dYrczritzmqY+X80kAs7+ybvgpaWKt1R+092+p9Go56y9oYsM5Pb3qRh+A
	 n/drPQjM47VSRCZLzeGLVIsZxWHfydUihDavw9q19kT2NxWTgs/yF5HoEZKEwO9yLF
	 JB/0BYGrog7doJbYpVJ/e69AVEL7A2bkCZMHq81Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA41F80217;
	Tue, 10 Dec 2019 16:49:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACDE1F8020C; Tue, 10 Dec 2019 16:49:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 185C0F800B4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 185C0F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="5bqwbNP1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PIFIkmrA"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 06CBA222FD;
 Tue, 10 Dec 2019 10:49:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 10 Dec 2019 10:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=g1bsOkaCCXj4SZtepgimproYIcy
 fEtRROEALwB3JplY=; b=5bqwbNP1wqIA+XMcvEUe/qtlyfg4h1pqy7pxZqdqsPW
 tBNA/8HM42blt1jQgaesNaZDJ+7Rm7cmpS+LlF7NMlHLPLRLSd+P1KR+e2TZPPLt
 0r5iWZFNdGjgAr+24WrE4fRpXk6G+dzndaYsj9bWIL1GcVlV0zT+o5U9SMvQZQS8
 gzqCfybwcYcZiP3noK2wXYU194DPGKW0ZhtKRJ0jn3THZm0zXizuYajOi9OSKzCs
 DMAKYagRN0113ZEHWEoesZHD4SV8I0yai5UUz9SmncJohBzAXgnukqeKQdWNG2fa
 ABCcaeNgTOfCH7VFO+185U0hH0HcJEDyCCyVveXemVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=g1bsOk
 aCCXj4SZtepgimproYIcyfEtRROEALwB3JplY=; b=PIFIkmrAAdTeRwDrwmBtOq
 3Xlqf68lb1zJhgFn0FNrYJXTEXWpDpXsXDDPi+8tGtRkAPp13SLDg/F0MFZ2Y4Fz
 U++FxUXciIOVnZYDXlcoqoMFi/4dtAUyHxYqtG9k2TcRGixuT4E9FZjrU/RnAD3a
 OUEoMfPFIUS/p0X0gfiOUOtDSk34gE1HuJjCA32DQ07GQmlNIVnWj6I63yoE6Idb
 0GmoNDCmT0pmdjKklMDGQ49m3yaLzmt7V97BhKvTIgsKcSkjUpzKH9HzlR5yw5Li
 wnm2XM0Jpdl53btzMu/4xQILT9BXMjT+2/8Jzz3O22ZDLl0Cc91LHJbsqdSJZC5A
 ==
X-ME-Sender: <xms:i77vXT3tfvWGCbNOZr-XuaRbP90ASn_nW9cl3--Ej6FMGz1dB6VwwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepudeg
 rdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhih
 esshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:i77vXRyT5rM1jQJH-0SUbaAHNRogOX2jg6HqojfUS2yErT21qII4Ew>
 <xmx:i77vXfhQoAmZ0hMXvmAUq1HnWhPtZpsUh61Ug7b2_sIolNy_jdprPg>
 <xmx:i77vXUqN780MLmBVhO9x5dk4e3b67tVRulspcdT3Eksrp-T0S9N6wQ>
 <xmx:i77vXQOrAlHKyW4F-UKpOhU1zopyYqbSwgLAd4c-SSsBOrf9mR_D8w>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AE0FA80062;
 Tue, 10 Dec 2019 10:49:30 -0500 (EST)
Date: Wed, 11 Dec 2019 00:49:28 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210154927.GA31637@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20191210061145.24641-1-tiwai@suse.de>
 <20191210061145.24641-6-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210061145.24641-6-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 05/23] ALSA: firewire: Drop superfluous
	ioctl PCM ops
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Tue, Dec 10, 2019 at 07:11:27AM +0100, Takashi Iwai wrote:
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/bebob/bebob_pcm.c         | 2 --
>  sound/firewire/dice/dice-pcm.c           | 2 --
>  sound/firewire/digi00x/digi00x-pcm.c     | 2 --
>  sound/firewire/fireface/ff-pcm.c         | 2 --
>  sound/firewire/fireworks/fireworks_pcm.c | 2 --
>  sound/firewire/isight.c                  | 1 -
>  sound/firewire/motu/motu-pcm.c           | 2 --
>  sound/firewire/oxfw/oxfw-pcm.c           | 2 --
>  sound/firewire/tascam/tascam-pcm.c       | 2 --
>  9 files changed, 17 deletions(-)

I understand that this patch is based on the below commit:
 * fc033cbf6fb7("ALSA: pcm: Allow NULL ioctl ops")[1]

All of the changes are fine to me.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158692.html 


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
