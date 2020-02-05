Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74160152913
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1342E168E;
	Wed,  5 Feb 2020 11:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1342E168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580898358;
	bh=noNBHkPNS741rjkYR250N1bYiXe+1fY/yE2NEtVpx3w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XJzv2Jtjr/JLNauNexgVrkT1bvvGpVTUdTadT0WXiSly1ae9jQT8nzCo/2OMVH8O4
	 L89Aq7w+64/yoFvXhe49+IE6XJG5fd6IbYYnxoVXy/QJesMgEps4DskrnbfgmSbJq3
	 eb3tTjueFed3wTwjpE9M/mQu4BzG0gEIw9eJr2FA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28744F800AB;
	Wed,  5 Feb 2020 11:24:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F86DF80148; Wed,  5 Feb 2020 11:24:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B869F800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B869F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Vj0gfAxF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XOtVs1f5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 917863C4;
 Wed,  5 Feb 2020 05:24:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 05 Feb 2020 05:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1zqgTYo/Pi8IKA0JRqUGbnWue54
 f6GSjph0CniB6F30=; b=Vj0gfAxFVrlo/2axbx7Lh+2EzjLNcMcAQRnGSWDGlWl
 E57Mat+I7PrKliraPXOG5VtXV5euiQH9TORY2pnEvBsu5g9dHl5Tz8NZuNdAo7SF
 x8J3W2p+/2IiDInCUUJdZCoVpZybC/JOWoWxSJU9UG+mK6wURBlichpCPWjik8AB
 l5i7j/LrFiNxGKgoxmBNgTYyukggqr3lga/TV9Z5wb30dUvXIK70kx3jrrsO7Lr9
 Yskz+B3g5FeHvZhzU0yFfPpgYvhCMIk6O85VKl7ODYNKLCZaZ8p97sqX5TgHKzoq
 anPgjcc9K7wdPlfyn783SFkNzr9GpWWiMB/rHijiIfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1zqgTY
 o/Pi8IKA0JRqUGbnWue54f6GSjph0CniB6F30=; b=XOtVs1f5bi/DX7MVEyMDyZ
 Ckij7pBfA/G0YbC/Wi6sav2whSEVdxmygufNVdW6fkUfxgOAeZVr8WpY3bmHluVp
 ST7dfVkrLrKq6N8ellDCB+xVnlCRRb1VG3KHoAHeM8Vf6yzPeqve4qL0ZxH6qFJ/
 x3oHqdSEJRA1PtisKRmo+ceZ+BiA1cTOoxaZvX4PVGvcV/zH+fqmNZ2azlx1oRd5
 Jotfa/l2krNFKGsdU9QMnjxUqkM1GP+2mhjTi4f6yObt5WbNUBy0GpNQizhzW9Fn
 54+1PNI8fdf8CEStjtsIXOzwqcThjuSQeLDHAmWsNXdbEJrBVyu6ZA0Z4ynv1TQw
 ==
X-ME-Sender: <xms:yJc6Xv8LNefEykoswIKCzek9HMNIBTo1sk7PsU27rAutQZaALceldg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedugddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedugedr
 fedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:yJc6XkSKOagz8G_u4Y2nNgcCPeDI1C4z2hTboaGB1L-9hxLYZeP86w>
 <xmx:yJc6XkGbYl5VYjgXjGK47wX7XrH_5Nrc9nnPvyc24-DO8RLbLCgU7Q>
 <xmx:yJc6XgjeN2JYKo-xueXlzkdERFjnBn8RNOXKWmEFkSxRdm8x5VTt1A>
 <xmx:yJc6XhoscdK0bG2ueNWjzhQakb130cs1voHry4K1s8UEgw09BVuBcg>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DEF23060272;
 Wed,  5 Feb 2020 05:24:07 -0500 (EST)
Date: Wed, 5 Feb 2020 19:24:05 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michael Forney <mforney@mforney.org>
Message-ID: <20200205102404.GC9810@workstation>
Mail-Followup-To: Michael Forney <mforney@mforney.org>,
 alsa-devel@alsa-project.org
References: <20200205081221.18665-1-mforney@mforney.org>
 <20200205081221.18665-3-mforney@mforney.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205081221.18665-3-mforney@mforney.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH alsa-utils 3/4] Use %lli for long long in
	printf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Feb 05, 2020 at 12:12:20AM -0800, Michael Forney wrote:
> The `L` length modifier only applies to floating-point conversion
> specifiers, and `ll` is used for `long long` integers.
> 
> Although glibc accepts %Li, musl does not and returns EINVAL.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
>  alsactl/state.c | 4 ++--
>  amixer/amixer.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
 
Looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/alsactl/state.c b/alsactl/state.c
> index 38e85c0..22e0269 100644
> --- a/alsactl/state.c
> +++ b/alsactl/state.c
> @@ -336,9 +336,9 @@ static int get_control(snd_ctl_t *handle, snd_ctl_elem_id_t *id, snd_config_t *t
>  		long long max = snd_ctl_elem_info_get_max64(info);
>  		long long step = snd_ctl_elem_info_get_step64(info);
>  		if (step)
> -			sprintf(buf, "%Li - %Li (step %Li)", min, max, step);
> +			sprintf(buf, "%lli - %lli (step %lli)", min, max, step);
>  		else
> -			sprintf(buf, "%Li - %Li", min, max);
> +			sprintf(buf, "%lli - %lli", min, max);
>  		err = snd_config_string_add(comment, "range", buf);
>  		if (err < 0) {
>  			error("snd_config_string_add: %s", snd_strerror(err));
> diff --git a/amixer/amixer.c b/amixer/amixer.c
> index 928f7c5..4c19a58 100644
> --- a/amixer/amixer.c
> +++ b/amixer/amixer.c
> @@ -620,7 +620,7 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
>  		       snd_ctl_elem_info_get_step(info));
>  		break;
>  	case SND_CTL_ELEM_TYPE_INTEGER64:
> -		printf(",min=%Li,max=%Li,step=%Li\n", 
> +		printf(",min=%lli,max=%lli,step=%lli\n",
>  		       snd_ctl_elem_info_get_min64(info),
>  		       snd_ctl_elem_info_get_max64(info),
>  		       snd_ctl_elem_info_get_step64(info));
> @@ -662,7 +662,7 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
>  				printf("%li", snd_ctl_elem_value_get_integer(control, idx));
>  				break;
>  			case SND_CTL_ELEM_TYPE_INTEGER64:
> -				printf("%Li", snd_ctl_elem_value_get_integer64(control, idx));
> +				printf("%lli", snd_ctl_elem_value_get_integer64(control, idx));
>  				break;
>  			case SND_CTL_ELEM_TYPE_ENUMERATED:
>  				printf("%u", snd_ctl_elem_value_get_enumerated(control, idx));
> -- 
> 2.25.0
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
