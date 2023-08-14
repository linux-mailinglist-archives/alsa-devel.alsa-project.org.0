Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A977B876
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:16:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 601BA852;
	Mon, 14 Aug 2023 14:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 601BA852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692015399;
	bh=ztiQi74oMdwZPwURfrjQW+ecoGlpgI3gJxif4R/3FX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d2iWN4O2CEfbCVWPNlr+KCWGC+rGHRpQFGHX9UDTz/pRl2ljW3X+/1tH6+cYfy47N
	 rU03cNKM9xWBdhN65jGCOBQMusLZztVWGSnWP7tGlT4u6RCB41LtGGYvIoiglpP5IT
	 3Mgl67CL1MxNl8EpeMqGwml/oH5jPbzustTZZdXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C96B4F80551; Mon, 14 Aug 2023 14:15:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 616CAF80254;
	Mon, 14 Aug 2023 14:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E68BF8025F; Mon, 14 Aug 2023 14:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by alsa1.perex.cz (Postfix) with ESMTP id BE63CF800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 14:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE63CF800EE
Received: from pirotess (80.red-83-50-209.dynamicip.rima-tde.net
 [83.50.209.80])
	by iodev.co.uk (Postfix) with ESMTPSA id 7D29920891F;
	Mon, 14 Aug 2023 14:15:20 +0200 (CEST)
Date: Mon, 14 Aug 2023 14:15:18 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 17/25] media: solo6x10: Convert to generic PCM copy ops
Message-ID: <ZNoa1jU7O08KwOJ6@pirotess>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-18-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-18-tiwai@suse.de>
X-Spam: Yes
Message-ID-Hash: XG2OJIU4WNSUJY6JMV4Q6BAFQ7SBUDAA
X-Message-ID-Hash: XG2OJIU4WNSUJY6JMV4Q6BAFQ7SBUDAA
X-MailFrom: ismael@iodev.co.uk
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XG2OJIU4WNSUJY6JMV4Q6BAFQ7SBUDAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/Aug/2023 13:55, Takashi Iwai wrote:
> This patch converts the solo6x10 driver code to use the new unified
> PCM copy callback.  It's a straightforward conversion from *_user() to
> *_iter() variants.  As copy_to_iter() updates the internal offest at
> each write, we can drop the dst counter update in the loop, too.
> 
> Note that copy_from/to_iter() returns the copied bytes, hence the
> error condition is inverted from copy_from/to_user().
> 
> Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
> Cc: Anton Sviridenko <anton@corp.bluecherry.net>
> Cc: Andrey Utkin <andrey_utkin@fastmail.com>
> Cc: Ismael Luceno <ismael@iodev.co.uk>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/pci/solo6x10/solo6x10-g723.c | 38 +++-------------------
>  1 file changed, 5 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index 6cebad665565..aceacb822cab 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> @@ -204,9 +204,9 @@ static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *ss)
>  	return idx * G723_FRAMES_PER_PAGE;
>  }
>  
> -static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
> -				  unsigned long pos, void __user *dst,
> -				  unsigned long count)
> +static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
> +			     unsigned long pos, struct iov_iter *dst,
> +			     unsigned long count)
>  {
>  	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
>  	struct solo_dev *solo_dev = solo_pcm->solo_dev;
> @@ -223,35 +223,8 @@ static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
>  		if (err)
>  			return err;
>  
> -		if (copy_to_user(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES))
> +		if (!copy_to_iter(solo_pcm->g723_buf, G723_PERIOD_BYTES, dst))
>  			return -EFAULT;
> -		dst += G723_PERIOD_BYTES;
> -	}
> -
> -	return 0;
> -}
> -
> -static int snd_solo_pcm_copy_kernel(struct snd_pcm_substream *ss, int channel,
> -				    unsigned long pos, void *dst,
> -				    unsigned long count)
> -{
> -	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
> -	struct solo_dev *solo_dev = solo_pcm->solo_dev;
> -	int err, i;
> -
> -	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
> -		int page = (pos / G723_FRAMES_PER_PAGE) + i;
> -
> -		err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
> -				     SOLO_G723_EXT_ADDR(solo_dev) +
> -				     (page * G723_PERIOD_BLOCK) +
> -				     (ss->number * G723_PERIOD_BYTES),
> -				     G723_PERIOD_BYTES, 0, 0);
> -		if (err)
> -			return err;
> -
> -		memcpy(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES);
> -		dst += G723_PERIOD_BYTES;
>  	}
>  
>  	return 0;
> @@ -263,8 +236,7 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
>  	.prepare = snd_solo_pcm_prepare,
>  	.trigger = snd_solo_pcm_trigger,
>  	.pointer = snd_solo_pcm_pointer,
> -	.copy_user = snd_solo_pcm_copy_user,
> -	.copy_kernel = snd_solo_pcm_copy_kernel,
> +	.copy = snd_solo_pcm_copy,
>  };
>  
>  static int snd_solo_capture_volume_info(struct snd_kcontrol *kcontrol,
> -- 
> 2.35.3
> 

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
