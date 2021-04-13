Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1135E7D7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 22:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9B0F16B2;
	Tue, 13 Apr 2021 22:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9B0F16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618347322;
	bh=5h9YB49RRXeQsyHSC2VWpubuvw4228fDxXw3uyGAlBo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUvZ3omaoyqbY89kWyyUdgywVaSJ68RZ/c1HpquwaQ7QB1tTdug+aSiLk8mBob2+V
	 7nhdW4B+W8bx8L+d+XviuZMajcQTFuWvOo6wKDpThT9C9fxtC+BedYf6mHeQn89c6Q
	 1LikvAA2puf/s/iUQ5jUO3RJTlL3BZWJ78wrPlwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F9BF8021D;
	Tue, 13 Apr 2021 22:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 285FEF8022B; Tue, 13 Apr 2021 22:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 942DBF800EB
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 22:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 942DBF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X7JwF5np"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5945561353;
 Tue, 13 Apr 2021 20:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618347218;
 bh=5h9YB49RRXeQsyHSC2VWpubuvw4228fDxXw3uyGAlBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7JwF5npo5YwIKk1EZ83CGAabzrmj+JsqLM1+P6dzfwJtA6HLJ18lsEx1yO6fEJNU
 5VSxEQqiLhv5+FVv0i4xEjGlhQwUyJfxbLCltNGtyJxGXzWm2NCy8l3othRuxilnXg
 Pq4wDDnHnNa5K+yVcx8Uuk41mEIYyKd2TjJAYyMAI9NDq9RPlI/Lr6Znybg2x/OIGd
 Vi5X3a9Eta88KmvHBOjOopABRmYOrZc4NzsfHNOkatUd1kDcHSKlH+/BxyJbsGRROa
 LC4R9LQJSzgfOTxnD/kquIPaN5ZxhEYfbOm7GQcvFqJnc2LT1a13G1dRpcB9EfJKBh
 kXK08mRkDipMQ==
Date: Tue, 13 Apr 2021 13:53:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH] ALSA: control_led: fix stack frame usage over 1024 bytes
 in snd_ctl_led_get()
Message-ID: <YHYEzjCuA6o0Myyj@archlinux-ax161>
References: <20210404065929.52501-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210404065929.52501-1-o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On Sun, Apr 04, 2021 at 03:59:29PM +0900, Takashi Sakamoto wrote:
> GCC warns that snd_ctl_led_get() uses stack frame over 1024 bytes.
> 
> control_led.c: In function ‘snd_ctl_led_get’:
> control_led.c:128:1: warning: the frame size of 1504 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> When taking care of convension in Linux kernel development. it's preferable
> to suppress too large usage of kernel stack, when the function call is not
> in critical part.
> 
> This commit fixes the bug, including some minor code refactoring relevant
> to variable names.
> 
> Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  sound/core/control_led.c | 68 ++++++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index b97f118cd54e..1be854a861f0 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -94,34 +94,35 @@ static struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
>  	return &snd_ctl_leds[group];
>  }
>  
> -static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
> +static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl, struct snd_ctl_elem_info *elem_info,
> +			   struct snd_ctl_elem_value *elem_value)
>  {
>  	struct snd_kcontrol *kctl = lctl->kctl;
> -	struct snd_ctl_elem_info info;
> -	struct snd_ctl_elem_value value;
>  	unsigned int i;
> -	int result;
> -
> -	memset(&info, 0, sizeof(info));
> -	info.id = kctl->id;
> -	info.id.index += lctl->index_offset;
> -	info.id.numid += lctl->index_offset;
> -	result = kctl->info(kctl, &info);
> -	if (result < 0)
> +	int err;
> +
> +	memset(elem_info, 0, sizeof(*elem_info));
> +	elem_info->id = kctl->id;
> +	elem_info->id.index += lctl->index_offset;
> +	elem_info->id.numid += lctl->index_offset;
> +	err = kctl->info(kctl, elem_info);
> +	if (err < 0)
>  		return -1;
> -	memset(&value, 0, sizeof(value));
> -	value.id = info.id;
> -	result = kctl->get(kctl, &value);
> -	if (result < 0)
> +
> +	memset(elem_value, 0, sizeof(*elem_value));
> +	elem_value->id = elem_info->id;
> +	err = kctl->get(kctl, elem_value);
> +	if (err < 0)
>  		return -1;
> -	if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
> -	    info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
> -		for (i = 0; i < info.count; i++)
> -			if (value.value.integer.value[i] != info.value.integer.min)
> +
> +	if (elem_info->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
> +	    elem_info->type == SNDRV_CTL_ELEM_TYPE_INTEGER) {
> +		for (i = 0; i < elem_info->count; i++)
> +			if (elem_value->value.integer.value[i] != elem_info->value.integer.min)
>  				return 1;
> -	} else if (info.type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
> -		for (i = 0; i < info.count; i++)
> -			if (value.value.integer64.value[i] != info.value.integer64.min)
> +	} else if (elem_info->type == SNDRV_CTL_ELEM_TYPE_INTEGER64) {
> +		for (i = 0; i < elem_info->count; i++)
> +			if (elem_value->value.integer64.value[i] != elem_info->value.integer64.min)
>  				return 1;
>  	}
>  	return 0;
> @@ -132,6 +133,8 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
>  {
>  	struct snd_ctl_led *led;
>  	struct snd_ctl_led_ctl *lctl;
> +	struct snd_ctl_elem_info *elem_info;
> +	struct snd_ctl_elem_value *elem_value;
>  	int route;
>  	bool found;
>  
> @@ -146,10 +149,24 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
>  		mutex_unlock(&snd_ctl_led_mutex);
>  		return;
>  	}
> +
> +	elem_info = kmalloc(sizeof(*elem_info), GFP_KERNEL);
> +	if (!elem_info) {
> +		mutex_unlock(&snd_ctl_led_mutex);
> +		return;
> +	}
> +
> +	elem_value = kmalloc(sizeof(*elem_value), GFP_KERNEL);
> +	if (!elem_value) {
> +		kfree(elem_info);
> +		mutex_unlock(&snd_ctl_led_mutex);
> +		return;
> +	}
> +
>  	list_for_each_entry(lctl, &led->controls, list) {
>  		if (lctl->kctl == kctl && lctl->index_offset == ioff)
>  			found = true;
> -		UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
> +		UPDATE_ROUTE(route, snd_ctl_led_get(lctl, elem_info, elem_value));
>  	}
>  	if (!found && kctl && card) {
>  		lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
> @@ -159,10 +176,13 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
>  			lctl->kctl = kctl;
>  			lctl->index_offset = ioff;
>  			list_add(&lctl->list, &led->controls);
> -			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
> +			UPDATE_ROUTE(route, snd_ctl_led_get(lctl, elem_info, elem_value));
>  		}
>  		kfree(lctl);

This patch is still relevant on latest -next and this hunk prevents the
patch from applying cleanly because that patch was NAK'd:

https://lore.kernel.org/alsa-devel/20210404064031.48711-1-o-takashi@sakamocchi.jp/

Cheers,
Nathan

>  	}
> +
> +	kfree(elem_value);
> +	kfree(elem_info);
>  	mutex_unlock(&snd_ctl_led_mutex);
>  	switch (led->mode) {
>  	case MODE_OFF:		route = 1; break;
> -- 
> 2.27.0
> 
