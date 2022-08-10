Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C548D58E41F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 02:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDCE41;
	Wed, 10 Aug 2022 02:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDCE41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660091641;
	bh=5mHEmJmzPq98jvMap5QuX23aoUdR2xPKvaymteFthSM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOpHEXvvnThgeFv+ncWIIlMe5Xr1nqgJjRUaKollYNnHbYMepojS71UUn3TFUSazS
	 WWD9IRjBrJG7MjdIEBqox7GFBcMMtVB9lGitM71jTrPNMmJZx/GKpTTgnm5Z5JJG+C
	 bN6+xpxA6TYiyutvTGUkJNbEZUGJzj+utk8a8VB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAE5F800E8;
	Wed, 10 Aug 2022 02:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC8EFF8016C; Wed, 10 Aug 2022 02:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3449DF8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 02:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3449DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="B3BAxjK7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="4LLcty2f"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CC6523200906;
 Tue,  9 Aug 2022 20:32:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 09 Aug 2022 20:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1660091567; x=1660177967; bh=LZ
 pAdembuGdhKW1eypN1bC25S0FWHMVEESr3ekwwsBk=; b=B3BAxjK7JEI8HQTx9K
 K6zhIwf0r/Ii7JiooS3n4mtSbjVPOYH0k84IKNXxVeVIAQKOXV11Wl/xMytmAJc2
 w/uQrSb4vq2yRcW8er2CqERcJfPE4Xy/fkgtj3ZLfzWOP+nBmlq0JTyzSiFeJhpJ
 4Xwx42c4OFLviWKlaq3GYebGJXs3zLlSsfz77yamJpBbO4jCr0uoteTOi+yNjJ2O
 NOMcymG/OUcgEculEAPLsJg8iIcW0KrumO8G+p2pny1bOSOvv00bgwLN8K1l5s1J
 GoTZHGQiZGNR9t3LWUbre9B7McpnYvsf4hdDF9vdXpCADTWMT07TSn6/MoZ8WvS1
 Fu4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660091567; x=1660177967; bh=LZpAdembuGdhKW1eypN1bC25S0FW
 HMVEESr3ekwwsBk=; b=4LLcty2fZq1G7TmIjlBP1s8NX00kq0pzEywft+1mjid1
 3gRG+UucBRFH2BaR9tDobYBQk4lVy6OIk/nxQuW93qr9J3NOWiH/ZryKOij40TJH
 hSyjkdzwI1oiTOGWGq4Zy6ZFFnVs55WB2dtAOgvubpcSveCSZ8TfbLJU83FLon3a
 LjqgVDZox2lifKFGMttSvc36A6l75HHfa7w2dgaFj2nHSXKvsTAZxe7vHShntpBW
 pwU0cRuD5z9RR8dhRcbk8Gh/0JglKGwHMDIs8cfZR6OQ14jaL0ysk0WkQudH2WmX
 8mGo1UFkX83J3Z/tdl9ywQCuPQJoMeuW1JaW6n57Rg==
X-ME-Sender: <xms:rvzyYl9uaBjWEk_GAfKUgf6G8MjYAj58MBZUzs5zzo9VdmId7noaAQ>
 <xme:rvzyYpt0KqHkxd2MjCKP4IRpKBAhgECRfUonOuuMGf09fCZv-_mbgKdcxmYZmQ9Zw
 lD2homP_rLiVeMbEoI>
X-ME-Received: <xmr:rvzyYjBAG6SJoQmSlA8XaJBpaH7Qck_eacPQ0rk5drPHr0K89LQMxW-Vm6HT5dced7ysXAprNj8LUSAHwVFjp4nlrtRt8kKd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeguddgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepvdegveevgfeuvdelffeljeelkeeiheejheelvddu
 heeigeetfeeuveeffefhheeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptghrrg
 htvghsrdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:r_zyYpfgaGwz6cKFVTcWYCCLGx5rBcag85WHnKXfZ9zGYIomwBdhWw>
 <xmx:r_zyYqMO55ti2StlFRhF1xWsHdQyxIRqED7qxN2xMydoDxdF58j_vQ>
 <xmx:r_zyYrlJslHZuKIyrECdcGYexRdARJxcQcbuQZS7hdz_5VXTKliwyA>
 <xmx:r_zyYkUznlOOUo58bmx3rtBPJz0NYKA1Guvk4HmS19dC_pGAUwuCmA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Aug 2022 20:32:46 -0400 (EDT)
Date: Wed, 10 Aug 2022 09:32:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: forevernoob@tutanota.com
Subject: Re: How trivial would it be to port the DICE driver from FFADO?
Message-ID: <YvL8q7HII3df7Pte@workstation>
Mail-Followup-To: forevernoob@tutanota.com,
 Alsa Devel <alsa-devel@alsa-project.org>
References: <N9213zQ--3-2@tutanota.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <N9213zQ--3-2@tutanota.com>
Cc: Alsa Devel <alsa-devel@alsa-project.org>
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

I'm a maintainer of ALSA firewire stack. Thanks for your contacting to the
list.

On Tue, Aug 09, 2022 at 04:44:23PM +0200, forevernoob@tutanota.com wrote:
> Hello,
> 
> I'm new to these kinds of mailing lists so please forgive me if I'm doing something dumb.
> 
> I would love to see Allen & Heath Zed R16 as well as Midas Venice F32 support in ALSA.
> ...
> So my question would be: How difficult would it be to port this driver
> (more specifically: Port it sufficiently enough to support the
> aforementioned devices) ?
> 
> Are we talking trivial enough for someone with minimal C experience, a
> dedicated team of ALSA devs or something else?

If investigating just for code migration from libffado2, it's impossible
since the implementation of ALSA dice driver is completely different from
the implementation of the dice part of libffado2. They have different
root for development. Thus we need to start investigation for the devices
at the first place. It demands you for a bit patience.

As long as reading manuals of the models, hardware vendors selected
TCD2210 ASIC (Dice Jr.) for them. I know that some options were given to
the vendors when using the ASIC;
 1. just with TCAT general protocol
 2. with both TCAT general protocol and protocol extension
 3. with Open Generic Transporter (OGT) protocol.

If you can drive the devices by libffado2, the possibility of OGT is
dropped. The implementation of libffado2 mention about the 2nd option by
usage of word, EAP (=Extended Application Protocol), however I know the
case of TCD2220 without protocol extension. It's Lexicon FW810s[1], In
the case, we need to hard-code stream formats in ALSA dice driver by
investigation to actual models.

Anyway, if you are satisfied in libffado2, it's better to continue using
it. Of course, I would be glad if I got your help to extend ALSA firewire
stack.

P.S. If you are interested in DICE ASICs and protocols themselves, it's
a good start to read my user space implementation (but by Rust language),
which I recently published. You can see overview at crates.io[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git?id=9a08676fc596
[2] https://crates.io/crates/firewire-dice-protocols


Regards

Takashi Sakamoto
