Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95432670E69
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 01:10:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CE3710D;
	Wed, 18 Jan 2023 01:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CE3710D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674000628;
	bh=vrlCdQ/qXxtqDHkPSvzMZeihZQYaPjRvrbPscLW7OA4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IOqzIx94qaf2SKcsLkN4tVRuJA4YNsFVruM/F61SH5lWqFUMX+yGOI2DRmC5pfxca
	 E8uIrGnmyQOtUntOXOAriKrLl6L50dEST6yWgMAU9ScdUmnLk/9aLhECNOEu7YnUF8
	 JQrIVEaw9squ0sbaTS3S9R1OVBQGx2KVBBlAi7UI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5768F80506;
	Wed, 18 Jan 2023 01:09:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BBC7F804F2; Wed, 18 Jan 2023 01:09:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5483EF8026D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 01:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5483EF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=P8FOQBsn; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=lFOPFzlb
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E03155C0116;
 Tue, 17 Jan 2023 19:08:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 19:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1674000529; x=1674086929; bh=q1
 PH25IQLsnN3LX7ptMcvbwCg622ib0Dmv0/dqTvCZA=; b=P8FOQBsndPGuLxLq9T
 l9D6jY5klyaXi0DCeOes1MNz6w0Apdyf+s1DA/kZBTAHaw0kkfki9pHuCHh73AuE
 PqzAv1peGHwq8I/3SC43++9eVp/yEry3tDeMtiPR6G2m/2Syw7XkUlPFkKPLZEdo
 r/x3t+KizxhH4WGDyI+ztgT1NNrqwfF+tGYIEehjnNcQYy7bCxHdX4TquKJbOHAN
 QACoOJYPpAgHDlQh6YY/5LHg+6k4EiezUyDU+AGJenQL6Ro1bXReKN0Y4oROJUEd
 Us1/SLsj2AAAOWfrCDrxJYeKlggc6b8qSYhOkVp8KFiWpK+ocIgMjULfgrE8g/+A
 Xbdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674000529; x=1674086929; bh=q1PH25IQLsnN3LX7ptMcvbwCg622
 ib0Dmv0/dqTvCZA=; b=lFOPFzlbNDe9pBfWaQB42KArawY2shiWw5LlkRiyzNGj
 CvssjeOIGV9LkUyPx10U9RKgY96W5RxZfwnL1XzlxHqE5xIMxDLdsXL99mjmKpUZ
 8SZldZ5D4oErmCjk0puR42/P9MYMiX+1FflIi9nsdfdcfT7v4oLeUbcqrrItDRXW
 q+qJ5X47Qk3+ZeMk7VH1YLf4ZD1sB//TP45Ew32lD36iBvz/KZ0vO7x1WkQmCu88
 h9q/V6aVmNlDkG2/m5f/wojHblNw1RkG9dXEm9iGhcW0rATGjhZYLHS+OpS7LwjF
 ORu5FVf240BE9H2hGQ5rO2hnjmlt3jzRtir0jz1jvw==
X-ME-Sender: <xms:kTjHY7GjqjKMY6AsB28FZ8NjTaW8t2Y3clUhutYfPZSxzXgyuh3fOw>
 <xme:kTjHY4XU2o6mSqHibk-E6WwO-4pDUk1qaO76a8I_RYr-xvJyEH74KiZki4NumaR3X
 sc-71p20knoyQG3q2A>
X-ME-Received: <xmr:kTjHY9JSGKZJEJHYTiNhbAmZqsCql5MMIqpxGo7KKh9kpvppYfILVZa9fhJcaH9yiwE_DE1SQhU4FxL7_x_TKA3lYAIAOnAICV1a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
 ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kTjHY5FbP01fYwovyfIKyJVm1yFSex1CHz3PfoSiC23u7i8wz_wRqQ>
 <xmx:kTjHYxUHLjSCV5VASMWv6yDmWAkADzB7LR1YxBSMr09YtmLZy4K_8w>
 <xmx:kTjHY0N-OND-gZ5jpCwS-yXPolHWyj5f9XKPcg9d_CohgIXXCPn2EA>
 <xmx:kTjHY3zp5HPzEsC9VibJ3ZKqB3ZnKF_2PgYS6Jb3rtt11W1RDYGxKg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 19:08:47 -0500 (EST)
Date: Wed, 18 Jan 2023 09:08:45 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ALSA: fireface: fix locking bug in
 ff400_copy_msg_to_user()
Message-ID: <Y8c4jcr/Uo0wiCnq@workstation>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <Y8at+W/7OGvEBY8O@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8at+W/7OGvEBY8O@kili>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Tue, Jan 17, 2023 at 05:17:29PM +0300, Dan Carpenter wrote:
> The ff400_copy_msg_to_user() function drops the spin lock to call
> copy_to_user().  However, if the copy_to_user() fails, then it must
> take the lock again before returning.  Failure to take the lock leads
> to a double unlock in the caller, hwdep_read().
> 
> Fixes: acdebd8b4c0c ("ALSA: fireface: implement message parser for Fireface 400")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  sound/firewire/fireface/ff-protocol-former.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Indeed. Thanks for your care.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
> index f58008762fe6..fa41de978756 100644
> --- a/sound/firewire/fireface/ff-protocol-former.c
> +++ b/sound/firewire/fireface/ff-protocol-former.c
> @@ -680,28 +680,30 @@ static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long cou
>  	struct ff400_msg_parser *parser = ff->msg_parser;
>  	u32 type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE;
>  	long consumed = 0;
> +	int ret = 0;
>  
>  	if (count < 8)
>  		return 0;
>  
>  	spin_unlock_irq(&ff->lock);
> -
>  	if (copy_to_user(buf, &type, sizeof(type)))
> -		return -EFAULT;
> -
> +		ret = -EFAULT;
>  	spin_lock_irq(&ff->lock);
> +	if (ret)
> +		return ret;
>  
>  	count -= sizeof(type);
>  	consumed += sizeof(type);
>  
>  	while (count >= sizeof(*parser->msgs) && parser->pull_pos != parser->push_pos) {
>  		spin_unlock_irq(&ff->lock);
> -
>  		if (copy_to_user(buf + consumed, parser->msgs + parser->pull_pos,
>  				 sizeof(*parser->msgs)))
> -			return -EFAULT;
> -
> +			ret = -EFAULT;
>  		spin_lock_irq(&ff->lock);
> +		if (ret)
> +			return ret;
> +
>  		++parser->pull_pos;
>  		if (parser->pull_pos >= FF400_QUEUE_SIZE)
>  			parser->pull_pos = 0;
> -- 
> 2.35.1
 

Regards

Takashi Sakamoto
