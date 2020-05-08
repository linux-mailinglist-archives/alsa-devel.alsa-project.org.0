Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7441CA0E4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 04:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F4A1833;
	Fri,  8 May 2020 04:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F4A1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588904977;
	bh=imgShy6A4UtCqR4/neELfYBIFMVGqBGe0hvxYgMtebQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6mqDlauovxgRaxwkVg6aUewXHAY1eJ+muNEoUYvQHPCgJxVgYSveS9gF6u+7NdRi
	 woO82sYQCV8/4iEliKeqRNVoZBdPFHyXbsimBbK8gWXbgBTpUFI8XMDC05IxQ8izwU
	 m6jCULAIYgFnmkwAp4Avdm5GoztsYoH5di+MZG+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7F7F800E7;
	Fri,  8 May 2020 04:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DFEF8023E; Fri,  8 May 2020 04:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4BAAF800F6
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 04:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4BAAF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mLom0gmh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Yq8NIafU"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B22B4AC1;
 Thu,  7 May 2020 22:27:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 07 May 2020 22:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JXHbhurBc2XgH5qUJKyr4SD4gSI
 tfGt7+CAU5SKeknE=; b=mLom0gmh9+Lu2QAi+LWm5GS4FKqTdMcvbVveiwhOn5D
 Llx5rzpJOan2eDXFzhVRfWV6WVhOL/HBOFANt705KeMHYDiGKrqtSmGcoB4KAC+n
 COYpW6Aa9bj9GLDamUyZVxKkZqe4tW9nRfuOR2Wxp3JyJvdgHHwxRZcW+em0oSui
 kPVmS1MZub+WThhCSPKXF4IKQR4/7vp+O5vh2D221uTjoGES66eeRXabMWDgqB01
 xk7fijtcU85Bf1DZfYyrebnuKAjQLdLDuWRhYFPqrge0t84tZwRvv1KbNwspf1nL
 UTZXVa0HdbpPwFMfPNyLrN3V7LfYgt1tJ+HsFIU5jYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JXHbhu
 rBc2XgH5qUJKyr4SD4gSItfGt7+CAU5SKeknE=; b=Yq8NIafUCtoJD7odyVw/mC
 StgQvlRHG3/jE0V5pvltdVctApsytiRTENLjHBX5n5luxTgyf68zu6rMqRpQYnOK
 +MqampiYVkEtq7z2p3TftC7n0Wfgkn+s8EhnzzJBljky+uvUYKj6uuUJaeJi7Qg3
 yZ6HSk/6/B+rLT/bfCGeMqeIIMEgxj3cqPpk7ufNwpgvChc+hw6Fb1Ry4KPJKUiB
 OCmcncIWk34yGILYXdYZDIjw4Nnuoa8WSiI/z08HGWs6n5wThmzMzqiYolTTSg4u
 7kawR1syPacTDM+S6oEukzbq+1cnH4yLEwFlxiKtxYYCF+XQ8Bf0Qtgbu8MEXB+g
 ==
X-ME-Sender: <xms:ncO0Xk6rOQ8nKYx6A0zN4w9tU7fnAovlB0MYkPXd6zKFn4SmcRXfHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepfeejhfevvefgledujeetffduteekteffudevudejffeh
 tdelteduledukeehkefgnecuffhomhgrihhnpehgnhhurdhorhhgpdhgihhthhhusgdrtg
 homhenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjph
X-ME-Proxy: <xmx:ncO0Xh3DoiRSj3o067rLg0kkTTHbWfsqHDENxQEJELBg6-05gvd7MQ>
 <xmx:ncO0Xpm9NpyBZE47MZHxeK7yQ441RkHsavlEngwsbkYHgY5TTFPs0w>
 <xmx:ncO0XvgIWEuBQseV89SzklA0SZKHmQAoZb3Dsoc4gjkJ5CAugYzYgg>
 <xmx:nsO0XmnJGSSDBbt6bVWIU0SIL7-TtGGERFcRE7Ey2NTo24UXIAPyvA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2836B3280060;
 Thu,  7 May 2020 22:27:40 -0400 (EDT)
Date: Fri, 8 May 2020 11:27:37 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] ALSA: fireworks: Replace zero-length array with
 flexible-array
Message-ID: <20200508022737.GA332087@workstation>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20200507185245.GA14270@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507185245.GA14270@embeddedor>
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>,
 linux-kernel@vger.kernel.org
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

On Thu, May 07, 2020 at 01:52:45PM -0500, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  sound/firewire/fireworks/fireworks.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
 
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
> index dda797209a27..654e28a6669f 100644
> --- a/sound/firewire/fireworks/fireworks.h
> +++ b/sound/firewire/fireworks/fireworks.h
> @@ -177,7 +177,7 @@ struct snd_efw_phys_meters {
>  	u32 in_meters;
>  	u32 reserved4;
>  	u32 reserved5;
> -	u32 values[0];
> +	u32 values[];
>  } __packed;
>  enum snd_efw_clock_source {
>  	SND_EFW_CLOCK_SOURCE_INTERNAL	= 0,


Thanks

Takashi Sakamoto
