Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446E9C299
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2019 10:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB7BD166D;
	Sun, 25 Aug 2019 10:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB7BD166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566722609;
	bh=SsFMLexT0eC0+NeOruEJq2hPNHXsvSONQx9fCwvgpS4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7hNS2Occfi6Mmw28er+55nPNqv+23P7tQgnzaTpHvJZGy8gGDqImWwA0jUcQvIze
	 qUkuKhH95H0FlNm+ODws9Ex0t4q+t6h3EnOxwDJRIjDyPfDnG+7CTinMjXUWJdQoPR
	 sYS6H+uBy4EE41PozEIZYk06rK5+33JasVfSutog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E53E4F80213;
	Sun, 25 Aug 2019 10:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93EF6F80213; Sun, 25 Aug 2019 10:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E36DF80144
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 10:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E36DF80144
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UaYWdIWz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EKByhpjA"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A563621B8C;
 Sun, 25 Aug 2019 04:41:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 25 Aug 2019 04:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ReRnioo0Y3sHXzLBBgsh67Z1Ecq
 t3Ltnv2HUnF1o+ZA=; b=UaYWdIWzS/Co98InYYCypuvkPloH47xypPAZfyGQQAh
 cNuv1RN1xJUvKLafNQlDffo12jAZBf1lWePbSBnCnl08obwAD0XDaLXdn+QO9/Wz
 tySu+JA2ZtFwQrlrU1lYlwXWiCGleigbWLa9GLimXuJ6rahQJrCezenGycXOZWo/
 lwKLT/xuLAE6YVXz2atZ4W67PMc/8LiNZMONqkYp4TUCFfFCtYIUsLrBjaQm58AU
 K1Lc/4fjLXYCC1M+Ppx5kG2oVTyowDFRLczmA1j3oodO4jO+82TlrAfeh23xRT30
 s9o3t9YUy7auZ2ERrurKx23WZ2CL5BxP2uIg0MDAYAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ReRnio
 o0Y3sHXzLBBgsh67Z1Ecqt3Ltnv2HUnF1o+ZA=; b=EKByhpjAG+VKNxaxYQkwAN
 07UKwqPrwPK09GP5GvHSfpkKr5GgxQj4Rvq+7PMN3Ur1u6Wl7p2BX2f2TO8vv7ww
 SfvqPL0ZvM5lu+igR3PfC6tePu5Px/LbtIvwcxhtMw28ihajWt82oCd3jbcwq4ge
 Yte4zf0lWwv1Pl0K3rZcr+D57uxG/nl5RbZ48TeTwFA3PO/MxN3YC+/pIR/Aelvt
 GrZirAMr845qBh+NvUMkZHJt4xXeskuCjxSvX2uF1lmN2LBJl1llW115GyqSTxn3
 kRcrvYzI7A07XbJFDLwBVr6EgdGAT7PsIZuLovxeMVAGSQwY+XDHiPRYW7NyRuMw
 ==
X-ME-Sender: <xms:vUliXQVuGFQUvL2mn-Gkzq4seeUbbVd6umrJApINu-efrz3Xi5kP2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:vUliXQSABmKmBYX04TTuP5DwLuqdKdYNvS7D3Zifn8dyX-NJdTcJGw>
 <xmx:vUliXUKwms2arzJVCJ0XNLRwZDLtfE-uMJK3j6MPg3rKQr4gqZUfcQ>
 <xmx:vUliXShYtobigEf4w2oAhgwO5Bd8376REQKWpWiIl6Ns-v2yn7qNmQ>
 <xmx:vkliXREuVcqa-Mzwoqp0nJWmpwpaJcGcAviLHcTgV0nRordRbT16VA>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE7B2D6005E;
 Sun, 25 Aug 2019 04:41:31 -0400 (EDT)
Date: Sun, 25 Aug 2019 17:41:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190825084128.GA28851@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190825065247.26840-1-o-takashi@sakamocchi.jp>
 <s5hwof14sx1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hwof14sx1.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH] ALSA: firewire-lib: allocate additional
 entries for list of packet descriptor to avoid out-of-bounds access
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

On Sun, Aug 25, 2019 at 09:15:38AM +0200, Takashi Iwai wrote:
> On Sun, 25 Aug 2019 08:52:47 +0200,
> Takashi Sakamoto wrote:
> > 
> > This patch is for Linux v5.3-rc7.
> 
> The patch doesn't seem cleanly applicable to for-linus branch (or
> 5.3-rc6).

Oops. Against the commit comment, I rebased this patch onto your 'for-next'
branch...

> Care to fix and resend?

Yes, but in this time would you please abandon this patch. With a bit
consideration after the posting, I concluded that there's another side of
the out-of-bounds bug. It comes from patchset for AMDTP domain which
I'm working for v5.4. I'd like to investigate and work further for the bug.


Thanks and sorry to bother your work.

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
