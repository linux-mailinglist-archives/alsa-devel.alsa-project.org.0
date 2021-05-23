Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F438DAA8
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490631693;
	Sun, 23 May 2021 11:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490631693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761245;
	bh=9ir+cHxkxgPI5G4GWdt2I5wnTqLWpnMGU8dlSQaLroI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ShUU7mRyxSZWm5R/keYGyu6eLct/vGd4hwEsPfi+Xl8iaKdHdnSd3+3sXVpmIScgZ
	 HdaCC6ZOMsA0Q5TOYmMcHtuA8TJZLYMvqpo++ujeDng8FLYKavCqpL9EshDl2ohP4g
	 CNjN83RqW1nyMod1zwLhOEv0LBoI0Zc8LOXUdxA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78993F8026F;
	Sun, 23 May 2021 11:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 551C9F8019D; Sun, 23 May 2021 11:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1DBEF8019D
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1DBEF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="1OZduIs9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Y3UTSR3H"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 947355C00DE;
 Sun, 23 May 2021 05:11:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 23 May 2021 05:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/NSpBw0YS595+mTt3f/1xCuzoZ8
 5jIUURDT5+uIWRI8=; b=1OZduIs9AU6EGXGEMqq7B5mu7Yne/TjCfr77XKuqHPu
 0CDDziv9AWb2olVyqmkb+oNzp5F4HOlYELRWv4MlqecbqKwf8kEjlylrCcLETU3o
 oHFCrNN+WcCEfz+fkDG5WPy3hk1VMAIuDBumdzXAkl3L8WlARm8axFYbs+ul4vn4
 YUMm6K1okwtJd41Z+jA/Cjiyf6Ar680TFX1PjY4jvzG1JpQyJn6XAV7+9DCOqACj
 4Sf+GHBbkz/LmnDiQtXc2tvcB5BGvGWUTaUMk21B+/lwvR7HARQP68kHxX658i1v
 UGtx762tpqJ4CLoEhU37lwGj7k5GQOcbjOMUNOXkytg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/NSpBw
 0YS595+mTt3f/1xCuzoZ85jIUURDT5+uIWRI8=; b=Y3UTSR3HIuAXfWNniSMFnE
 ya0aPpfZWrqLPXw/7MlKD2q9O4mCR9SjGQwQFGaAiVRlL2GsgshcEnnbrSPI7k7G
 WeWX+FneA0wSya6qSY3sy4fpTw1itCqE0FG0mMK2GusEGcuZLl+iXXTLA5kUcuk7
 Oa8Ik7/XqBBiFRdbhPg1/4DsPWi4eaDQb8b+2heN5LjJ5GrSyVOlg36OATZnsj8j
 Owque13kQxMDP7yhQSlfRSqv8UtIpLAsaaAhHyB5meHuaNXk/LIMI9uscPe8wty6
 8dI1dem3iRYdrgqSnK2ACX5P9hF6S06oR+vsAxyPpb/bnLAtW5UohMcaWGHd0aew
 ==
X-ME-Sender: <xms:SRyqYIQnH_R4-xlgXQctbcxuLdje10wgE--DTxny30Wk-ZGOMl78gA>
 <xme:SRyqYFyHahyx3nDTTl69Q0I4Yv0CKOHsjpqjLQpp3jFYYSRXjEAw3M0SqnOd7ut9w
 tSE98VC9Tk1CsYUIgc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejiedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
 ertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeelhfeuge
 dvjefgjefgudekfedutedvtddutdeuieevtddtgeetjeekvdefgeefhfenucfkphepudeg
 rdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:SRyqYF2iKFcYcCQ8lpO5_xf7k0WrKtfk0ClrBGERSr-bUEzX7zgLEQ>
 <xmx:SRyqYMAbzDb7N1dQ8ZRHQHUTCUINglpIImDtHZAyKb0nZJ6RYWSb3w>
 <xmx:SRyqYBgVGgeTv7N0i6Fl81wuQwlUaINFrDsLJlj8BB62q25GjpqJjw>
 <xmx:ShyqYEutuc64ic6_xcGXTk2TyhVPR7biOIkq3vdgPJtVnFegLUzGRg>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 05:11:36 -0400 (EDT)
Date: Sun, 23 May 2021 18:11:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ALSA: control_led - use DEVICE_ATTR_*() macro
Message-ID: <20210523091133.GA220048@workstation>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20210523071109.28940-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523071109.28940-1-yuehaibing@huawei.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Sun, May 23, 2021 at 03:11:09PM +0800, YueHaibing wrote:
> Use DEVICE_ATTR_*() helper instead of plain DEVICE_ATTR,
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/core/control_led.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
 
The usage of common macro is better way for safe than own way as long as
achieving the same function. This looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 25f57c14f294..a5e751f26d46 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -375,7 +375,7 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
>   * sysfs
>   */
>  
> -static ssize_t show_mode(struct device *dev,
> +static ssize_t mode_show(struct device *dev,
>  			 struct device_attribute *attr, char *buf)
>  {
>  	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
> @@ -390,7 +390,8 @@ static ssize_t show_mode(struct device *dev,
>  	return sprintf(buf, "%s\n", str);
>  }
>  
> -static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
> +static ssize_t mode_store(struct device *dev,
> +			  struct device_attribute *attr,
>  			  const char *buf, size_t count)
>  {
>  	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
> @@ -419,7 +420,7 @@ static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> -static ssize_t show_brightness(struct device *dev,
> +static ssize_t brightness_show(struct device *dev,
>  			       struct device_attribute *attr, char *buf)
>  {
>  	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
> @@ -427,8 +428,8 @@ static ssize_t show_brightness(struct device *dev,
>  	return sprintf(buf, "%u\n", ledtrig_audio_get(led->trigger_type));
>  }
>  
> -static DEVICE_ATTR(mode, 0644, show_mode, store_mode);
> -static DEVICE_ATTR(brightness, 0444, show_brightness, NULL);
> +static DEVICE_ATTR_RW(mode);
> +static DEVICE_ATTR_RO(brightness);
>  
>  static struct attribute *snd_ctl_led_dev_attrs[] = {
>  	&dev_attr_mode.attr,
> @@ -562,22 +563,25 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
>  	return count;
>  }
>  
> -static ssize_t parse_attach(struct device *dev, struct device_attribute *attr,
> +static ssize_t attach_store(struct device *dev,
> +			    struct device_attribute *attr,
>  			    const char *buf, size_t count)
>  {
>  	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
>  	return set_led_id(led_card, buf, count, true);
>  }
>  
> -static ssize_t parse_detach(struct device *dev, struct device_attribute *attr,
> +static ssize_t detach_store(struct device *dev,
> +			    struct device_attribute *attr,
>  			    const char *buf, size_t count)
>  {
>  	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
>  	return set_led_id(led_card, buf, count, false);
>  }
>  
> -static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
> -			 const char *buf, size_t count)
> +static ssize_t reset_store(struct device *dev,
> +			   struct device_attribute *attr,
> +			   const char *buf, size_t count)
>  {
>  	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
>  	int err;
> @@ -590,8 +594,8 @@ static ssize_t ctl_reset(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> -static ssize_t ctl_list(struct device *dev,
> -			struct device_attribute *attr, char *buf)
> +static ssize_t list_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
>  {
>  	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
>  	struct snd_card *card;
> @@ -624,10 +628,10 @@ static ssize_t ctl_list(struct device *dev,
>  	return buf2 - buf;
>  }
>  
> -static DEVICE_ATTR(attach, 0200, NULL, parse_attach);
> -static DEVICE_ATTR(detach, 0200, NULL, parse_detach);
> -static DEVICE_ATTR(reset, 0200, NULL, ctl_reset);
> -static DEVICE_ATTR(list, 0444, ctl_list, NULL);
> +static DEVICE_ATTR_WO(attach);
> +static DEVICE_ATTR_WO(detach);
> +static DEVICE_ATTR_WO(reset);
> +static DEVICE_ATTR_RO(list);
>  
>  static struct attribute *snd_ctl_led_card_attrs[] = {
>  	&dev_attr_attach.attr,
> -- 
> 2.17.1
 

Regards

Takashi Sakamoto
