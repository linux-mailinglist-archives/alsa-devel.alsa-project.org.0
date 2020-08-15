Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D81245198
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Aug 2020 19:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D291671;
	Sat, 15 Aug 2020 19:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D291671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597512415;
	bh=8/42uvq9VS/92gIf0mx/PCxDRD/id02SRGpxBQ7fi1M=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T1ItH2fh2ahx78NjBBPpbsvf2AMmAyxLElB+5Ijl0EASXBddL7xQi5n79w4dLWsZS
	 LZ4Ak6FbAYWrETYdZJ1RXiyF7zRAcnjNOoyr33S40Lr+tt3ADTAot+mfaTkBIb5PuH
	 7Qm5UR8WRTL5KcXkeD5xZ15GEsnVDIfIZwafMghg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C460FF80161;
	Sat, 15 Aug 2020 19:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 476F0F8015B; Sat, 15 Aug 2020 19:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wforward2-smtp.messagingengine.com
 (wforward2-smtp.messagingengine.com [64.147.123.31])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA17BF800D3
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 19:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA17BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A2DNKMlU"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.west.internal (Postfix) with ESMTP id 0858AB7F;
 Sat, 15 Aug 2020 13:25:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 15 Aug 2020 13:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=jwXtMLwc1VX0OyA7lMgHW+yQ6MiatJ1Bq40oG3/cF
 bw=; b=A2DNKMlUhrUGx3ar7EF+UbES9qSQ3xDbpm3I0lOhu3MwyAcSMzMJcTCok
 f7eBi3NUUqvAkr2vl0uSG/E/fuofV9Vlfv8Er9yOBT2Lfi6Tc3GfsKSN6BlM9YEm
 Tr1yLdgGLtdfoYlmrSdZfJ5Qui2/G/n2WFz/3+G5SX64fxeWOX99XOEn/ueGZYSf
 NQbNw2K5YrDD/3m9vWwkAy3/wWJc/zseuoZcc+j86Zsdsdu2GJv9OwtV3pcB1f0b
 wHOG+sM3IpHqDZbjSy+iv6kLc9S0BDctY8ql2eLBqV+vRC+Tp51lOstDzydXuQ+q
 tO6SGqQYB7y3doKHpcriC8nOor6Hg==
X-ME-Sender: <xms:bBo4X_OyveubC9sn9BJ9ImyvdG1VTE8thf5_VvDfe9AGFXYUL8VI4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrleelgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
 epgfelkefhjeevtddvledtkeelvefhfeejteegkeffffefudeugfelffeiueegveefnecu
 ffhomhgrihhnpehprghtrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukf
 hppedukeekrdduvdeirdekledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:bBo4X5-fhchJ_vmAH62s2VJGf85KXM5ydsxcQ74XJeYFxC0LgWyIZw>
 <xmx:bBo4X-QoQm7vmC_DxuBypayua0vqFnEbRtUmykzKrYRccUyZTS-DbA>
 <xmx:bBo4Xzut-xEbQihFrfOt3HjJ1MpAq-rzKgGzlRNfKdw4IQqNTdtJGg>
 <xmx:bRo4XxppCIwv1R0Nplbetr9XM8kDkdYi6AxlSQjDx0Qx0_ra-qvZSaGtA2Q>
Received: from laptop (unknown [188.126.89.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1E0830600A3;
 Sat, 15 Aug 2020 13:24:58 -0400 (EDT)
Message-ID: <a9b7bf686688b7792b3f2d8bfb091be538d9ecc1.camel@iki.fi>
Subject: Re: How to send in patches?
From: Tanu Kaskinen <tanuk@iki.fi>
To: Tanjeff Moos <tanjeff@cccmz.de>, alsa-devel@alsa-project.org
Date: Sat, 15 Aug 2020 20:24:47 +0300
In-Reply-To: <50b5f6cc-366f-7793-868b-6900d0d8327b@cccmz.de>
References: <50b5f6cc-366f-7793-868b-6900d0d8327b@cccmz.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2020-08-14 at 09:57 +0200, Tanjeff Moos wrote:
> Hi folks,
> 
> I'd like to send in my first patch for alsa-lib. Is it okay if I simply
> send it to this list? Or is there a process how to do this?

Yes, you can send alsa-lib patches to this list. I believe you should
add Takashi Iwai <tiwai@suse.de> and/or Jaroslav Kysela <perex@perex.cz
> to Cc to make sure your patch is not missed. (I think this should be
documented somewhere, I'll make a patch for README.md.)

A pull request on GitHub is also a valid way to submit alsa-lib
patches, but at least Takashi prefers the mailing list.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

