Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB17AC424
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 19:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E0BAEA;
	Sat, 23 Sep 2023 19:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E0BAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695490990;
	bh=HYps/ZmjTdbw8taJBpmKlPvC7NBAvmma6sJSTC+dQcc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YVR3qAforaca04miIxg6LZejhLYD7qTpMUdiGmyYt//eDHNmqbznpRU2CnZOZ8sF7
	 FJrQ2XvOo4J3vQzL4ujTxMDmyHRCGRiS+ZY13JeYzTIVXiCWyVZ7iIh8i7+qq9tHpL
	 KcyR3eL8vYv/YX2OIkUQilMHdLPLUmcdNSiqRmlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A05A9F80558; Sat, 23 Sep 2023 19:42:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89553F8025A;
	Sat, 23 Sep 2023 19:41:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28F16F8047D; Sat, 23 Sep 2023 19:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from omta036.useast.a.cloudfilter.net
 (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7D8BF80125
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 19:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D8BF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=mSOS2op9
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTP
	id jq43qZqYADKaKk6dRqJfbd; Sat, 23 Sep 2023 17:41:41 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k6dQqFjwcIDdmk6dRqEUtW; Sat, 23 Sep 2023 17:41:41 +0000
X-Authority-Analysis: v=2.4 cv=HcYH8wI8 c=1 sm=1 tr=0 ts=650f2355
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=iox4zFpeAAAA:8 a=foHCeV_ZAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8
 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=h8a9FgHX5U4dIE3jaWyr:22 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=93ZnapHLAzhfjp9su+EviZJ/5xXSQ8EviN5S7/1wWMQ=; b=mSOS2op9ZyaNpjPP1tXCBZePjp
	1quPoFjTeldDvJvK7unBQqp9pqubI2qRl+FZTR5U5ictKyLN7xckfnyZRLkAbdKQoYlgs8bzeghy2
	iL6OdUSW4F+uqSC7P5jDsiphQrtXxD2ZQZsF1cdfGUELJT5myIK03/P3/ILrQuIA71JKtkh79vV2L
	o3ru78NibuG85lVIj2FHVukbs88u9w8Uv4R7IUvmXUIfLTJvOJ1aQOKCVbicxWE5GTubbozvXtTVL
	qYUNoe8tIIXMHeAek8/6eeRnugQqSV6LWPsUiKr67VILxlBLnNsuBkRk22zYJUqYBJ2DDXSQO3Trx
	ohHDolRA==;
Received: from [94.239.20.48] (port=44874 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy1H-003Yer-1S;
	Sat, 23 Sep 2023 03:29:43 -0500
Message-ID: <672fa6b5-d311-40cc-65b0-b042ccae69b5@embeddedor.com>
Date: Sat, 23 Sep 2023 10:30:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ALSA: usx2y: Annotate struct snd_usx2y_urb_seq with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175046.work.766-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175046.work.766-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy1H-003Yer-1S
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:44874
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfBdn2gc7I2mQzM5V0A/ahDy7vLpiRY3bY42QBgRcTwEelJeWmfsX+Xbt7IHvK3cIfuUIG7y/oLEr5OL+Hr+eKHMUIZAIQFxVP1O/ZqvH7QDF5RjI/tAo
 /oMoSnzZ470AzrQexdCg9Q3yJ2/Hx1Q+XLsI2kuH5hOf42mYLuKL1EbClCOhFDhi1kWmKGvqqgDEHhmUtjlAs+SbLEzbKLHzG1bdMBW2Ml4YsktwEqh6FjA0
Message-ID-Hash: TE2HW2RX36OWY4CAL6SY5M7POQPGZVAT
X-Message-ID-Hash: TE2HW2RX36OWY4CAL6SY5M7POQPGZVAT
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TE2HW2RX36OWY4CAL6SY5M7POQPGZVAT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct snd_usx2y_urb_seq.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   sound/usb/usx2y/usbusx2y.h      | 2 +-
>   sound/usb/usx2y/usbusx2yaudio.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/usb/usx2y/usbusx2y.h b/sound/usb/usx2y/usbusx2y.h
> index 8d82f5cc2fe1..391fd7b4ed5e 100644
> --- a/sound/usb/usx2y/usbusx2y.h
> +++ b/sound/usb/usx2y/usbusx2y.h
> @@ -18,7 +18,7 @@ struct snd_usx2y_async_seq {
>   struct snd_usx2y_urb_seq {
>   	int	submitted;
>   	int	len;
> -	struct urb	*urb[];
> +	struct urb	*urb[] __counted_by(len);
>   };
>   
>   #include "usx2yhwdeppcm.h"
> diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
> index 5197599e7aa6..ca7888495a9f 100644
> --- a/sound/usb/usx2y/usbusx2yaudio.c
> +++ b/sound/usb/usx2y/usbusx2yaudio.c
> @@ -681,6 +681,7 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
>   			err = -ENOMEM;
>   			goto cleanup;
>   		}
> +		us->len = NOOF_SETRATE_URBS;
>   		usbdata = kmalloc_array(NOOF_SETRATE_URBS, sizeof(int),
>   					GFP_KERNEL);
>   		if (!usbdata) {
> @@ -702,7 +703,6 @@ static int usx2y_rate_set(struct usx2ydev *usx2y, int rate)
>   		if (err < 0)
>   			goto cleanup;
>   		us->submitted =	0;
> -		us->len =	NOOF_SETRATE_URBS;
>   		usx2y->us04 =	us;
>   		wait_event_timeout(usx2y->in04_wait_queue, !us->len, HZ);
>   		usx2y->us04 =	NULL;
