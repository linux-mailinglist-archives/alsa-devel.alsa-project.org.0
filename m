Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228A75C40B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E0FAE8;
	Fri, 21 Jul 2023 12:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E0FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689934188;
	bh=wuCnUsHx2jtMJQ0/QaMdo2I4ox/4peO7fWeK6L5PqdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPbaIt1kkvnZyNPKNRnf6S/+2XF2a/SqAiwYhyUZUx4mHZ6yiu/a6m7vNxJEUiiHx
	 NX8JcWUJ3Km3REeMkVHjZqYPQF1ZL1lzYhy+SMlGVjKPhZY9Uan0FWkcGQtXr5ElLp
	 m7fguubRPaJ+jVkOobbJlsZlL2l5z0iVN8QA5QT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E816EF80544; Fri, 21 Jul 2023 12:08:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA71F8027B;
	Fri, 21 Jul 2023 12:08:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 568D9F8047D; Fri, 21 Jul 2023 12:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B00AF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B00AF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HC0YGgZz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a1MOJTVg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAC3321873;
	Fri, 21 Jul 2023 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689934126;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ltp3vgBxTSOzGDIs46F3JngbLBYC+fyTISiSirvL/h0=;
	b=HC0YGgZzSAspp6B+lbyX4pKPh42PM4hz+tRDI09fep4mse2BjHK/ZoP8EuBk3/zeA1iXyC
	sMnk0JORalFxDqZj3K9ILqZsBst85OUrz2iKpHWRmuHuoUuo5IpVeQhObpH2c3Dq2qm6ZY
	PM6JA5JnmztR4ziJWnMQKQvKupydABw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689934126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ltp3vgBxTSOzGDIs46F3JngbLBYC+fyTISiSirvL/h0=;
	b=a1MOJTVg5/HvtCnMrHuFIV3/W5wqKWTq9NIUHksjHwQpibdfWfg72Itz3IIUVGmpKXGm8F
	ysCMdFEWXvdEATDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1855134BA;
	Fri, 21 Jul 2023 10:08:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3xonLi5ZumS2BgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 10:08:46 +0000
Date: Fri, 21 Jul 2023 12:08:46 +0200
Message-ID: <878rb9h901.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
In-Reply-To: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
References: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: MUMXEONECHZRVERNCQGCK47DNN4ZQ2NV
X-Message-ID-Hash: MUMXEONECHZRVERNCQGCK47DNN4ZQ2NV
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUMXEONECHZRVERNCQGCK47DNN4ZQ2NV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 12:01:46 +0200,
Andy Shevchenko wrote:
> 
> The sockptr_t (despite the naming) is a generic type to hold kernel
> or user pointer and there are respective APIs to copy data to or
> from it. Replace open coded variants in the driver by them.

While I see the benefit, I feel this is very confusing.  If we use the
API for a generic use, it should be renamed at first.

Also, the current function actually follows the call pattern, and we
know in the caller side whether it's called for a kernel pointer or a
user pointer.  So, if any, the PCM core callbacks should be revised to
use a generic pointer instead of fiddling in each driver side.


thanks,

Takashi

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/pci/korg1212/korg1212.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
> index 33b4f95d65b3..92c3eab4d12c 100644
> --- a/sound/pci/korg1212/korg1212.c
> +++ b/sound/pci/korg1212/korg1212.c
> @@ -10,6 +10,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
> +#include <linux/sockptr.h>
>  #include <linux/wait.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -1285,8 +1286,7 @@ static int snd_korg1212_silence(struct snd_korg1212 *korg1212, int pos, int coun
>  }
>  
>  static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
> -				void __user *dst, int pos, int count,
> -				bool in_kernel)
> +				sockptr_t dst, int pos, int count)
>  {
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>          struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
> @@ -1306,24 +1306,21 @@ static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
>  #if K1212_DEBUG_LEVEL > 0
>  		if ( (void *) src < (void *) korg1212->recordDataBufsPtr ||
>  		     (void *) src > (void *) korg1212->recordDataBufsPtr[8].bufferData ) {
> -			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_to KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst, i);
> +			printk(KERN_DEBUG "K1212_DEBUG: %s KERNEL EFAULT, src=%p dst=%p iter=%d\n",
> +			       __func__, src, sockptr_is_kernel(dst) ? dst.kernel : dst.user, i);
>  			return -EFAULT;
>  		}
>  #endif
> -		if (in_kernel)
> -			memcpy((__force void *)dst, src, size);
> -		else if (copy_to_user(dst, src, size))
> +		if (copy_to_sockptr_offset(dst, i * size, src, size))
>  			return -EFAULT;
>  		src++;
> -		dst += size;
>  	}
>  
>  	return 0;
>  }
>  
>  static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
> -				  void __user *src, int pos, int count,
> -				  bool in_kernel)
> +				  sockptr_t src, int pos, int count)
>  {
>          struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
> @@ -1345,16 +1342,14 @@ static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
>  #if K1212_DEBUG_LEVEL > 0
>  		if ( (void *) dst < (void *) korg1212->playDataBufsPtr ||
>  		     (void *) dst > (void *) korg1212->playDataBufsPtr[8].bufferData ) {
> -			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_from KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst, i);
> +			printk(KERN_DEBUG "K1212_DEBUG: %s KERNEL EFAULT, src=%p dst=%p iter=%d\n",
> +			       __func__, sockptr_is_kernel(src) ? src.kernel : src.user, dst, i);
>  			return -EFAULT;
>  		}
>  #endif
> -		if (in_kernel)
> -			memcpy(dst, (__force void *)src, size);
> -		else if (copy_from_user(dst, src, size))
> +		if (copy_from_sockptr_offset(dst, src, i * size, size))
>  			return -EFAULT;
>  		dst++;
> -		src += size;
>  	}
>  
>  	return 0;
> @@ -1644,15 +1639,14 @@ static int snd_korg1212_playback_copy(struct snd_pcm_substream *substream,
>  				      int channel, unsigned long pos,
>  				      void __user *src, unsigned long count)
>  {
> -	return snd_korg1212_copy_from(substream, src, pos, count, false);
> +	return snd_korg1212_copy_from(substream, USER_SOCKPTR(src), pos, count);
>  }
>  
>  static int snd_korg1212_playback_copy_kernel(struct snd_pcm_substream *substream,
>  				      int channel, unsigned long pos,
>  				      void *src, unsigned long count)
>  {
> -	return snd_korg1212_copy_from(substream, (void __user *)src,
> -				      pos, count, true);
> +	return snd_korg1212_copy_from(substream, KERNEL_SOCKPTR(src), pos, count);
>  }
>  
>  static int snd_korg1212_playback_silence(struct snd_pcm_substream *substream,
> @@ -1672,15 +1666,14 @@ static int snd_korg1212_capture_copy(struct snd_pcm_substream *substream,
>  				     int channel, unsigned long pos,
>  				     void __user *dst, unsigned long count)
>  {
> -	return snd_korg1212_copy_to(substream, dst, pos, count, false);
> +	return snd_korg1212_copy_to(substream, USER_SOCKPTR(dst), pos, count);
>  }
>  
>  static int snd_korg1212_capture_copy_kernel(struct snd_pcm_substream *substream,
>  				     int channel, unsigned long pos,
>  				     void *dst, unsigned long count)
>  {
> -	return snd_korg1212_copy_to(substream, (void __user *)dst,
> -				    pos, count, true);
> +	return snd_korg1212_copy_to(substream, KERNEL_SOCKPTR(dst), pos, count);
>  }
>  
>  static const struct snd_pcm_ops snd_korg1212_playback_ops = {
> -- 
> 2.40.0.1.gaa8946217a0b
> 
