Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999E3025A6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 14:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645C2182E;
	Mon, 25 Jan 2021 14:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645C2182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611582461;
	bh=K3BAt8i6PT/4Tc9+lWUJUQqONJzi6NTsEowK36aOc4c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBK2uqCOSLTChNRQIudRWFQQ9Z78iu08SPYmTYlqkHvLs743WcQfoZpLVZMzmroeU
	 aHAFORRa6i1/dvGgkL7HxArplhl9ooscD6iNFHJ+cpHp+4hIRIYnPWtH73ONiMsE1E
	 cys6b7mE0kugOd8hKBC3fjTCdzMwDGt9HN6WIsaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BC4F80260;
	Mon, 25 Jan 2021 14:46:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0862F80269; Mon, 25 Jan 2021 14:46:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B83AF8012D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 14:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B83AF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Y166K2kf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qFQuYgnC"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BE052435;
 Mon, 25 Jan 2021 08:46:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 08:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1Ha0tktpMEKttzSr9glvEkciUZQ
 pZiSo3EjsiTx+JQg=; b=Y166K2kfU+bHQBFreM/BQQbuoaS1AgEgbnyG8Lo3Uz1
 ZCw/ezjrtLgWDuLKz7BtDWLEBaXcWwnNizY6HtKNwdc8Cp5L9qn3N8ojrdND8l1n
 p82IiQb0nKc89YWQ7lsl8mvMojENvVvLzOVRaBrKK/Q5JPERHcVgbj5IffMKj1pg
 gY4Cfn8H55SAu6qH5PYpCLd3D0VivYTnbVMEgnGB4o0MzvMgtlVgR2CZDvvxxSQR
 x0MFBc7b6QFxO1Hl7mv0xl9qMHDA+i7OylwwBOCS88ISsCE+awM5U0TpsTktFTn6
 MbLVLejMxkrbhKPL0aguFsb9OINHZ0F6hUqdN7RCI0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1Ha0tk
 tpMEKttzSr9glvEkciUZQpZiSo3EjsiTx+JQg=; b=qFQuYgnCShr3aJJvjf6KSV
 KVHZq9ssqIQeB+7eDyAaTh9uXWD042fACW9S9JMWsnx1RydotlQGtRAa4Keew/J4
 5k7/UyBvrwEXPXHil9TFIFHlGmqo1XEHoNjY9EO4nv5Q395aa2dus4d3VwLoQfWf
 PSIq1OsXg9YJVub4BtXK8ZF+F6yJTD5egkZhnNNd/I5+bjXr7w+bQfXGsXSWi9r2
 EAHGWl3R7QC3kNeDWKIRze9BfQjWOfQDjiUPR2yVuIR5saj+IVHG5Kp4tA9N2l5p
 BBmopclTOHyURHolr7Q+RU8pfoa8xCgv0ZbYDahTKf2oqz34SsrI49o/1FibdPUA
 ==
X-ME-Sender: <xms:s8sOYOs6RsN-_osZ8IdTk4SRoF7DRWbH6iO56G-c7LY4VXRKignBOg>
 <xme:s8sOYDdUcKA3xrQSUN0XFcc2AhYNUvJhEHkT9R5EjqxYvG5t8Wk9hpezT4hGZN1Mc
 ypcommEVSwP8fn4PQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppeduudekrddvgeefrdejkedrheeknecuvehluhhsth
 gvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:s8sOYJydkYdV8IPdxbUQIBEfmDAacvDP19i2Iqu5Qw9bPgSfKgi-Fw>
 <xmx:s8sOYJOvTWWePPXNm0YSr-ffcBVgEmmGn9xG-V2Pg6jOIMuypFrdRQ>
 <xmx:s8sOYO-XmX9w2Tl0XGw40mr8of7u5mdiUUt6rMqdsZ6fJLDor_LRWg>
 <xmx:tMsOYFl8RQyBGhvsiyF2LU6TVlQUjqsJhsmOl48H8vra3Xm5TvDPIQ>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 89A44240057;
 Mon, 25 Jan 2021 08:46:25 -0500 (EST)
Date: Mon, 25 Jan 2021 22:46:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] ALSA: oxfw: remove an unnecessary condition in
 hwdep_read()
Message-ID: <20210125134623.GB24062@workstation>
Mail-Followup-To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
References: <20210122071354.GI20820@kadam>
 <YA6ntkBxT/4DJ4YK@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA6ntkBxT/4DJ4YK@mwanda>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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

On Mon, Jan 25, 2021 at 02:12:54PM +0300, Dan Carpenter wrote:
> Smatch complains that "count" isn't clamped properly and
> "oxfw->dev_lock_changed" is false then it leads to an information
> leak.  But it turns out that "oxfw->dev_lock_changed" is always
> set and the condition can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: this version just removes the condition
> 
>  sound/firewire/oxfw/oxfw-hwdep.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
 
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp> 

> diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
> index 9e1b3e151bad..a0fe99618554 100644
> --- a/sound/firewire/oxfw/oxfw-hwdep.c
> +++ b/sound/firewire/oxfw/oxfw-hwdep.c
> @@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>  	}
>  
>  	memset(&event, 0, sizeof(event));
> -	if (oxfw->dev_lock_changed) {
> -		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> -		event.lock_status.status = (oxfw->dev_lock_count > 0);
> -		oxfw->dev_lock_changed = false;
> +	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> +	event.lock_status.status = (oxfw->dev_lock_count > 0);
> +	oxfw->dev_lock_changed = false;
>  
> -		count = min_t(long, count, sizeof(event.lock_status));
> -	}
> +	count = min_t(long, count, sizeof(event.lock_status));
>  
>  	spin_unlock_irq(&oxfw->lock);
>  
> -- 
> 2.29.2

Regards

Takashi Sakamoto
