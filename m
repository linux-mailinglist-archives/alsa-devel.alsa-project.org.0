Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956A3B3851
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 23:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81F81658;
	Thu, 24 Jun 2021 23:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81F81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624568860;
	bh=pcBbGJkFKAq5CcWf9FjOhomjUaV2iX57EYKWq7Wccuw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0X5U6IjjHijUUFD4laQPifJkhVC9rhP3BDn1xlZYPvjW125V7eARgkf2mu7SVDO/
	 qIhreD5HETyI5+0iSbDdrovo4nwNAL1uWXMjToJ0z6bq419LqWzzAuS5pU/yIYUPiL
	 KNziF+dsmcWLHhciQiYhmbvuDYlxgPzSXccuJ0ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBFE9F80137;
	Thu, 24 Jun 2021 23:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59427F8025F; Thu, 24 Jun 2021 23:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19605F80147
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 23:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19605F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nuN9S+LN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="f5ewB02t"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B0645C00E5;
 Thu, 24 Jun 2021 17:05:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 24 Jun 2021 17:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9jMAnkKABHSlUcjl0Zbwdrv+Qzw
 4CH1IFEmMt+CBJQM=; b=nuN9S+LNn5VAyRaKqfsXBGPZxheCRq79sIDUlTillPD
 vaCbwLLzr9CuIQxNF7L6r8qv+BM8VEKVYJgZQzDw7gkzOu+rQ23FJ9yoJqj3Wy2o
 6X7aetKdQkbvzSa6seVCvulVj/wr0b9zXETQ3SV06yBgVNaovOzY2AsZ1zAPSSTE
 RDn3hlVquDnOHoWk8cTDQVcqoegWnPr23JR06PAEL72Ur9Pv2/9X1qXD5sV/HPMD
 0Y3vUZV1iLvibVyu45h6Ie9+RjbDa1cHYo71aKbdWRZ/u47SyqpXvtpbhXSrh7X2
 re0rYiiI1AdONfxCO6gEQeM/6pHZ83pi82w1bMPQnGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9jMAnk
 KABHSlUcjl0Zbwdrv+Qzw4CH1IFEmMt+CBJQM=; b=f5ewB02t+PjuIZteLhi8Hq
 1UV0AA+y4qceBWA7esCLDrt4V20nk7gGQp/Egihq9D0zc7rsIA5gWuNAk98mayz+
 Waa9pdFcUQThjlfrTFHYr9kC4jUPNzNq3TrCODYqeIWROyD9tjVK5BniBVbdzeos
 XM/cFcgQ6QiXm4c62e3CHlUTKvYi7Tku0/jbDvEfFSrx1xYygGQ4FypyrK8vEBmb
 ws1wOzmGK3Z2PDQwTshywvFXQNu9BNZiCq2TFOm0kARshVkwhUCIooXYvJcg9l1t
 lqGNg0bmqyQd0u7M1gqOGfOjBP65SkrrijkpU+7NDqbf732w8+MV2ZZR0dS4NlkQ
 ==
X-ME-Sender: <xms:svPUYEMueiidqgq16_ztAa09NU9HGwvTqLleVpXAipf2WOe1AOq3XQ>
 <xme:svPUYK8AUAnC0RTQ8439GYYggBI0XG8gZXXc2obO_XMwt8K6K43SuhWdX662PIV6A
 6TiL-eTjvtKwf11w_0>
X-ME-Received: <xmr:svPUYLTcYTKnD4thJAxJTQamsmWIgDZQ7x4iDKxypdPfiEunTqW4ioISEq6cTPrwiOUFP5b56jBWScKq229nTWvpxQEPLmrplQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeghedgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueei
 vedttdegteejkedvfeegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:svPUYMscyDJRqGzKm13nuhyRgI7cfVSN8yA1W75AfT2bbiPnPh9Zpg>
 <xmx:svPUYMdoejo9qy75YeXIjiZ35vgfQGIabRibdyJbFxIW7zN1Nm_8xg>
 <xmx:svPUYA0DnIpF5irAI7k6GC2SQp1AYBAYsazth9ELtOlkXpAypFSyhg>
 <xmx:s_PUYBHksf2rMTAHbYTUReF8omVVDW3p4TbArw94j50D5U6_65xDew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Jun 2021 17:05:52 -0400 (EDT)
Date: Fri, 25 Jun 2021 06:05:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ALSA: firewire-lib: Fix 'amdtp_domain_start()' when no
 AMDTP_OUT_STREAM stream is found
Message-ID: <YNTzrtrmDBdg2ec6@workstation>
Mail-Followup-To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 clemens@ladisch.de, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <9c9a53a4905984a570ba5672cbab84f2027dedc1.1624560484.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c9a53a4905984a570ba5672cbab84f2027dedc1.1624560484.git.christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com
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

On Thu, Jun 24, 2021 at 08:49:36PM +0200, Christophe JAILLET wrote:
> The intent here is to return an error code if we don't find what we are
> looking for in the 'list_for_each_entry()' loop.
> 
> 's' is not NULL if the list is empty or if we scan the complete list.
> Introduce a new 'found' variable to handle such cases.
> 
> Fixes: 60dd49298ec5 ("ALSA: firewire-lib: handle several AMDTP streams in callback handler of IRQ target")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> We could test with" if (list_entry_is_head(s, &d->streams, list))"
> instead, but I find it much less readable.
> ---
>  sound/firewire/amdtp-stream.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
> index aad9778d1c4d..9be2260e4ca2 100644
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -1943,6 +1943,7 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles,
>  	unsigned int events_per_period = d->events_per_period;
>  	unsigned int queue_size;
>  	struct amdtp_stream *s;
> +	bool found = false;
>  	int err;
>  
>  	if (replay_seq) {
> @@ -1955,10 +1956,12 @@ int amdtp_domain_start(struct amdtp_domain *d, unsigned int tx_init_skip_cycles,
>  
>  	// Select an IT context as IRQ target.
>  	list_for_each_entry(s, &d->streams, list) {
> -		if (s->direction == AMDTP_OUT_STREAM)
> +		if (s->direction == AMDTP_OUT_STREAM) {
> +			found = true;
>  			break;
> +		}
>  	}
> -	if (!s)
> +	if (!found)
>  		return -ENXIO;
>  	d->irq_target = s;
>  
> -- 
> 2.30.2

Indeed. Nice to catch it. The bug affects Linux kernel v5.5 or later.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

In kernel v5.10 or later, we can use 'list_entry_is_head()' macro added
by a commit e130816164e2 ("include/linux/list.h: add a macro to test if
entry is pointing to the head"). However the development of ALSA firewire
stack is out-of-tree repository for my convenience to backport it to kernel
v4.17 or later (I need testers...), so I prefer your change.


Thanks

Takashi Sakamoto
