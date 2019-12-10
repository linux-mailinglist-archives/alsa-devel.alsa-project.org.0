Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807AC119FA0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 00:43:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5EF7843;
	Wed, 11 Dec 2019 00:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5EF7843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576021422;
	bh=T67/kAvAOyTbLyq3/9D3Jl5/kyk+0JkWves37qcNeOs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0KK/UpVcAV4NsfZ4xalhxz4stj9h6uUlgByJ4bnC3Wrt86uiCrCqElZyHPYgwjdz
	 0OQ3gi/U9AJ96K/CNjBkmvvUiIk0DlMEVVAAgRF3YEGCPHirqidAM2DdfU/iPr3Qll
	 4nr4Hel3NDXl/Z/DsD9P8+fprZ9naD/7kX1FlSww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99C2EF80248;
	Wed, 11 Dec 2019 00:41:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8006FF8020C; Wed, 11 Dec 2019 00:41:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5270F800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 00:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5270F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="IMnoiDkC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sFe0EMqX"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 01C63C9B;
 Tue, 10 Dec 2019 18:41:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 10 Dec 2019 18:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=URH7LDtpX1TbMnrXLT3Ogjau2SE
 UWeBlUa6E10ktDTU=; b=IMnoiDkC24taaib3yDMhYlAeUvrTmF6iwMwYWooeiBd
 ibo2u2qBnJw7X2b/Xh31X9hWMxkUrazp3gYCxmQRm2kdhnib4ZnHA/APFI/8B6pr
 jVIluSJ9EzpcYQjzixRdva/5tG8nbW4zghV/rm0a49l3DWPpiaTZfqjtz3dvaPzn
 eCWimbhTqFZofA3t5V6/MHp7et4aGv68kvDnnI+QkhUhB1bLY1oHwXLSXWt4lJW9
 2gdIzEBZ+SwRG7gKROYoRhttC6wT/oexqgDHSV/YxSoU79h7BqfE1YaTgQj2C2aA
 KOoX1oabD1I7NQDfseCQMV9cI020U4R++5BVVuEqgwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=URH7LD
 tpX1TbMnrXLT3Ogjau2SEUWeBlUa6E10ktDTU=; b=sFe0EMqXj+I8zqrLFcXsnF
 OubjtmFBVdnmHQXFr89mUzftUXL81Hn0x6+I7MQBtlgZ4LiW1XX/KORFcIIl1sIv
 k3q3VvXce28WSKMUX69T3uVNd/5vAKvtFOzZNbzKzTWIdwH13Zbhw0TkuO7ihdz8
 YSXZFkqr4hJjJPnfTNajmvCVhRfwjMflILSnP59bIaZefeRsluumBW7pYuM44ZXu
 8b785quf6r9dcCHi3QxEMm9c1CqWcaLrdsYkW33Gn2BWzDcd4bfHzxdCxMbyR5Xe
 og9vko02fxD9c7N0lCzVd7Shzb494x3nm4k82MpEe6kmBBXOoz563QKP8F3fA6/w
 ==
X-ME-Sender: <xms:OC3wXQfCqv4Nfg2V_NeQFAc5NewUmHxi7pJ2bZqy0LkZj2dYZNdnbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghlshgrqdhprhhojhgvtght
 rdhorhhgnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:OC3wXWfcn2p68YMB5Ny0KbuZRliCTI4tf6BM6R34uMzMoc3m0HGhhA>
 <xmx:OC3wXchOtEh7BqMvO6sp3XGHnE_BXGVQrnTTG-24bD2BXP6n8qGJFw>
 <xmx:OC3wXaRE7BIhSeZtFglxIHzke48ODOrVCifYRxTCpaNDQOYUHggarQ>
 <xmx:OS3wXbp5LShiviVIZNYqr8_2L6lB-0LDP0M_3emGcD4G6qIoz44zOA>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0984230600D4;
 Tue, 10 Dec 2019 18:41:43 -0500 (EST)
Date: Wed, 11 Dec 2019 08:41:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210234140.GA3344@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20191210061145.24641-1-tiwai@suse.de>
 <20191210061145.24641-6-tiwai@suse.de>
 <20191210154927.GA31637@workstation> <s5h5ziow4sy.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h5ziow4sy.wl-tiwai@suse.de>
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

On Tue, Dec 10, 2019 at 04:58:37PM +0100, Takashi Iwai wrote:
> On Tue, 10 Dec 2019 16:49:28 +0100,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Tue, Dec 10, 2019 at 07:11:27AM +0100, Takashi Iwai wrote:
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  sound/firewire/bebob/bebob_pcm.c         | 2 --
> > >  sound/firewire/dice/dice-pcm.c           | 2 --
> > >  sound/firewire/digi00x/digi00x-pcm.c     | 2 --
> > >  sound/firewire/fireface/ff-pcm.c         | 2 --
> > >  sound/firewire/fireworks/fireworks_pcm.c | 2 --
> > >  sound/firewire/isight.c                  | 1 -
> > >  sound/firewire/motu/motu-pcm.c           | 2 --
> > >  sound/firewire/oxfw/oxfw-pcm.c           | 2 --
> > >  sound/firewire/tascam/tascam-pcm.c       | 2 --
> > >  9 files changed, 17 deletions(-)
> > 
> > I understand that this patch is based on the below commit:
> >  * fc033cbf6fb7("ALSA: pcm: Allow NULL ioctl ops")[1]
> > 
> > All of the changes are fine to me.
> > 
> > Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > 
> > [1] https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158692.html 
> 
> Thanks.  It's good idea to put the background information.  I'll add
> it to the changelog.
> 
> Actually I seem to have forgotten to fill the changelog text in this
> commit.  Below is the revised patch to be committed.
> 
> 
> Takashi
> 
> -- 8< --
> Subject: [PATCH] ALSA: firewire: Drop superfluous ioctl PCM ops
> 
> All the PCM ioctl ops of ALSA FireWire drivers do nothing but calling
> the default handler.
> 
> Now PCM core accepts NULL as the default ioctl ops(*), so let's drop
> altogether.
> 
> (*) commit fc033cbf6fb7 ("ALSA: pcm: Allow NULL ioctl ops")
> 
> Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Link: https://lore.kernel.org/r/20191210061145.24641-6-tiwai@suse.de
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

It's preferrable. Thanks for your extra work ;)


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
