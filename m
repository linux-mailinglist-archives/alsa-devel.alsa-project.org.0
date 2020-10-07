Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A741285FBC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 15:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4BC16C2;
	Wed,  7 Oct 2020 15:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4BC16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602075993;
	bh=tMNF6j/gbE++1XGaq2cLZBHNcmVRelETKDv8v1wucjY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lndTOHVO43OirIwtrg5MokIuIKk5DHgwUEDrILb7DkrP82cxOEVjhpRrG4oU/0M3t
	 GfXSObuQ9UO/55Ra1rFOpOe6sVAmGhA5hssNN4ZgftDFdmB2m2MKWrUJNXtcqGoGC0
	 AWpocrak+yjYR7BFM4kgY2YAdQNy6LGuDM2CINZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C20F8016A;
	Wed,  7 Oct 2020 15:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04E88F80128; Wed,  7 Oct 2020 15:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61278F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 15:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61278F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="a65ArENd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nKBGInhj"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C288DA5C;
 Wed,  7 Oct 2020 09:04:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Oct 2020 09:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=n7glPiflw/igCEGVay4K6mUqzzn
 H9kxtNvx6OHbU5es=; b=a65ArENdy/CeOlw4UvlRqGVqCCZVhVlAMKSGJcVZ8M+
 wrkSLeFL+urha0w7KbKand/fZgZA72tosRFJEmF+1CzntW29gKzYJrkpg5/OvFYp
 vb3KqMZ9DwFxKBhoOhf13sqTbJiYZyUVLYYGQhCdBPU0LMcKGr5EkixnK/LpDb8h
 YCHWyvQP+MshMNCJKDuoW8C55+1TlxwJN9F7kfKnGP7uZ7n2wDgl+hdhwhUe576L
 7ieBmyc4CoSoIanH5X7NWStTpcP9Wm7g+LZY9zplafCGbQxJO1PN+f8Wg7ulQRmE
 RmlFH1JqYj7gEZxa9HnSo1OI6Wi3iqnhIE4tZ647qkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=n7glPi
 flw/igCEGVay4K6mUqzznH9kxtNvx6OHbU5es=; b=nKBGInhjO4W2bnuKy9JkTL
 v7RGXrV3W+5QFkiysyCV6uPI3lXBWQ9oCZHUvOA4Qg3+J4Q2TWt6qeKlxewrqyP+
 N79X2DBKXfFttrp+Ux/wbfv580ksZlr8DRVK7s8bswf0nuPL/5UtnnCp6I6a9Pmt
 BsVezJf3O703mH5wQ2px7fGHEZyx0BeB4eixRzTsKWmidvPFbYtenHVXddWaXXia
 GehE6S7Im3m+EIGu+MZ2CyofLYcO4ByLuj2bKPHze1j79hfWk6+QGO3QkojNRwwk
 AX69rYjnQUAPqYrODiibTx6v8Okm4sdbCIazkruISRlYzBCg+S+LyqohrdwiXJiA
 ==
X-ME-Sender: <xms:6bx9X2o5ZAEH-wdzZl4rxwB2QoL5gEHWaLUVeGMc6rHVvnJ7gFxflA>
 <xme:6bx9X0rK78TMotS0OkAtseUUbXH12LW5ikJNBURxFMkPPRU_PkeaEaDsgbLQKrPfX
 CFQQ5zCSbJeWW2OaCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeigdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppedugedrfedrieegrddvtdejnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
 khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6bx9X7P1b-m0N8T70l8P-BPN-JCjD4QM79KTtakhH8ZO5pTI1mHemg>
 <xmx:6bx9X17bUftLNCoyiZHK4LMGw2z7eGN0neKczCxytkPo_O-wg54DGw>
 <xmx:6bx9X16f3IcN_VO0dHlDi9OglApDwF1OAvF5hq5hHuk-EHMhUtvtlQ>
 <xmx:6rx9X_lj1uyjjmV3iys_6fm8LvxP9XB3yczWDeBfJ5lo3xmOF6n3uQ>
Received: from workstation (ae064207.dynamic.ppp.asahi-net.or.jp [14.3.64.207])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC0BB3280067;
 Wed,  7 Oct 2020 09:04:39 -0400 (EDT)
Date: Wed, 7 Oct 2020 22:04:37 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-ID: <20201007130437.GA73459@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <20201007074928.GA2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007074928.GA2529578@mwanda>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
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

Thanks for the patch.

On Wed, Oct 07, 2020 at 10:49:28AM +0300, Dan Carpenter wrote:
> The "count" variable needs to be capped on every path so that we don't
> copy too much information to the user.
> 
> Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/bebob/bebob_hwdep.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
> index 45b740f44c45..c362eb38ab90 100644
> --- a/sound/firewire/bebob/bebob_hwdep.c
> +++ b/sound/firewire/bebob/bebob_hwdep.c
> @@ -36,12 +36,11 @@ hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>  	}
>  
>  	memset(&event, 0, sizeof(event));
> +	count = min_t(long, count, sizeof(event.lock_status));
>  	if (bebob->dev_lock_changed) {
>  		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
>  		event.lock_status.status = (bebob->dev_lock_count > 0);
>  		bebob->dev_lock_changed = false;
> -
> -		count = min_t(long, count, sizeof(event.lock_status));
>  	}
>  
>  	spin_unlock_irq(&bebob->lock);
> -- 
> 2.28.0

Indeed, the bug can leak the contents of kernel memory into user space
unintentionally for the size indicated by ALSA HwDep application...

I will check the other drivers in ALSA firewire stack later for safe.


Thanks

Takashi Sakamoto
