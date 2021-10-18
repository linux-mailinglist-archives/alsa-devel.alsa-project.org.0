Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3194318DA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 14:19:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D71D1AA1;
	Mon, 18 Oct 2021 14:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D71D1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634559540;
	bh=7rtTrKUfbJtk/SpDGD0beR/jsaelT3WFrJui+aXumIk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlrqfSCI6eJkrnqBQftWDzr+mJr8tolA+Sr0fRInHKC3NdTeSWIFsjuJ0lfvwdzr+
	 1yA9UAZlxM2I6sMGmV+oNNzF7WoRENPTNk2MceQIQDa9rm5hGwL6sNnyh4npQVtOJ4
	 R7SVKrMnxZ7GmpqROjNgjXiqgAjKeEoi7wPYF2bQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DD7F80111;
	Mon, 18 Oct 2021 14:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72166F80224; Mon, 18 Oct 2021 14:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5CA8F80111
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 14:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5CA8F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sv+KtCGo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SZUPvv8f"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C5B203200FA2;
 Mon, 18 Oct 2021 08:17:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 18 Oct 2021 08:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=x0KJzCbJFSe9C/yj3j/2aCCzcsO
 x35f4682NnWdDluM=; b=sv+KtCGoqPyFXurcu/jhFUUGEPCC8ADKapb/x3ENyqW
 2nwWr5Aqhpj6lelCO3nJiEA2iqQrutJIMgAY5b/gbWwCJ7979rYAytlc9i8MJxm7
 ptLG+Q6uKlSMug+OBT53gfqlRx5WhLIV1lspdJULCTR8UzJCuT7QlV446o69dIxn
 c+7hkSMEYQhhRNrdQJHYvc6BRzJ06fpECnoKQnT+6WzEEJt51KiXdG3/uB3W582g
 LVuux3noxAXGNqycqJ68jfFIcKyO6MjCIjtD1202QTs+C9P7G2kXxL7ONEsJqZ6s
 UoI86VD/+ZSCuA03m4A1sPTt4mAsDaaYLE9P+GEzFtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x0KJzC
 bJFSe9C/yj3j/2aCCzcsOx35f4682NnWdDluM=; b=SZUPvv8fYnOJVLiYv1jfnJ
 HzgHCWzjAlewIb5eFz4lcg4/jW/IfTauwFQnMs9j1FP7YXsgd9QHbZHQn/Geq/hy
 gqXwLIGBeXdgyS9O4k+14ms6yNXmztB0rwWDwlN8YHKooRyoXQOW2JWH8SJ5bvip
 ktKNHLIzLgjNf1RvswLGiGrGou24w65mLa/ea8R5HJcm4ryT+LwffKLTjXPYhj5w
 AorHgk/tuF1QCfxZqm5FvRQ/QpmD5Ej4KyY4BCmY6pyP5El/f6mnpTvRuNpa1bA9
 vlxCrsTCoE0eQiENC+8NM9Beh1w0DtCmYQRbsdHbOO+D0UjruaLf/qk9BEbvF8bA
 ==
X-ME-Sender: <xms:2WVtYfCsvcW4h2HK9hw5dWULdtJGVKJwYjaAU2CbCJ8ftLOwHrtvow>
 <xme:2WVtYVheWHDRaCMA_SbWnxzClLucAtVOaj__QUq02xF1tAvvIClMuUjhuHvX1VxCB
 Rq0c92Lxkd9eKNebd4>
X-ME-Received: <xmr:2WVtYamT43prbW0ssdCgWzFIYl0CfUNRo4W-JhlP6qPZWlu9Uel4s0zkZXvP-tk1blULWdnKLjIZMKoiWSrXPHNmvTftRT_zfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeejgeeifeeuveeufeeigeegjeelvdfgjeegffejgfdv
 keelhefgtdefteejleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2WVtYRwhP7zdoYsZyqlXfJd99YA86nvHBKI7-vw29yahZ59EJ9Fzzw>
 <xmx:2WVtYUQFtOgaMv8SPT0Dx2j2UDJvbcz1LEthaeMIYVvlACvIfYjJHg>
 <xmx:2WVtYUby9ySOXAJJEKtck0i9bIlivMKUZVmvOJ3ZgzoGjSE-jYsSlg>
 <xmx:2mVtYacaNifuXk4OTJo6E5wa4Gutpkp3crxOfidH4wUnbf53asWx7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 08:17:28 -0400 (EDT)
Date: Mon, 18 Oct 2021 21:17:25 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: firewire: Fix C++ style comments in uapi header
Message-ID: <YW1l1U4/isAd2xzc@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211018063700.30834-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018063700.30834-1-tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Oct 18, 2021 at 08:37:00AM +0200, Takashi Iwai wrote:
> UAPI headers are built with -std=c90 and C++ style comments are
> explicitly prohibited.  The recent commit overlooked the rule and
> caused the error at header installation.  This patch corrects those.
> 
> Fixes: bea36afa102e ("ALSA: firewire-motu: add message parser to gather meter information in register DSP model")
> Fixes: 90b28f3bb85c ("ALSA: firewire-motu: add message parser for meter information in command DSP model")
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/r/20211018113812.0a16efb0@canb.auug.org.au
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/uapi/sound/firewire.h | 70 ++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 33 deletions(-)

I completely overlooked it. Thanks for your reporting.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Regards

Takashi Sakamoto
