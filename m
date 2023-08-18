Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB178068E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 09:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9135F84B;
	Fri, 18 Aug 2023 09:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9135F84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692345021;
	bh=u0QNB4NBQHe9/Tv8SSBSHfGoFVmUZm05W7slEPnlQ3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i8R1FUR1zOctdT8fvZGqPTe/EGTcmzCH1ozfEEV2zXLVLEXdOU2ZjXDuTzQu7TsZI
	 EwORmCnO5xFQi0onzP9U4b1MD6Qm8D1nbzPxrKqom5vhuhNzPi0f7FVeyahxTqzQNz
	 08pKkmT9ZQzO5toElecObTu0IIIHyw9MzenrAelY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE564F80536; Fri, 18 Aug 2023 09:49:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43249F800EE;
	Fri, 18 Aug 2023 09:49:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97EA2F801EB; Fri, 18 Aug 2023 09:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-8.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD615F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 09:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD615F800EE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53A9863ABA;
	Fri, 18 Aug 2023 07:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FB0C433C7;
	Fri, 18 Aug 2023 07:49:00 +0000 (UTC)
Message-ID: <096d6149-90d0-e32e-0af4-5b3cc5b818bd@xs4all.nl>
Date: Fri, 18 Aug 2023 09:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/25] media: solo6x10: Convert to generic PCM copy ops
Content-Language: en-US, nl
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Ismael Luceno <ismael@iodev.co.uk>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Anton Sviridenko <anton@corp.bluecherry.net>,
 Andrey Utkin <andrey_utkin@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20230815190136.8987-1-tiwai@suse.de>
 <20230815190136.8987-18-tiwai@suse.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230815190136.8987-18-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2TYF2HUPCUE4IX6J26BQHF7BN5IWLWSL
X-Message-ID-Hash: 2TYF2HUPCUE4IX6J26BQHF7BN5IWLWSL
X-MailFrom: SRS0=bgEe=ED=xs4all.nl=hverkuil@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TYF2HUPCUE4IX6J26BQHF7BN5IWLWSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/08/2023 21:01, Takashi Iwai wrote:
> This patch converts the solo6x10 driver code to use the new unified
> PCM copy callback.  It's a straightforward conversion from *_user() to
> *_iter() variants.  As copy_to_iter() updates the internal offest at
> each write, we can drop the dst counter update in the loop, too.
> 
> Note that copy_to_iter() returns the copied bytes, hence the error
> condition is adjusted accordingly.
> 
> Acked-by: Ismael Luceno <ismael@iodev.co.uk>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
> Cc: Anton Sviridenko <anton@corp.bluecherry.net>
> Cc: Andrey Utkin <andrey_utkin@fastmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/pci/solo6x10/solo6x10-g723.c | 39 ++++------------------
>  1 file changed, 6 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index 6cebad665565..1db9f40ee0c0 100644
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
> @@ -223,35 +223,9 @@ static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
>  		if (err)
>  			return err;
>  
> -		if (copy_to_user(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES))
> +		if (copy_to_iter(solo_pcm->g723_buf, G723_PERIOD_BYTES, dst) !=
> +		    G723_PERIOD_BYTES)
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
> @@ -263,8 +237,7 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
>  	.prepare = snd_solo_pcm_prepare,
>  	.trigger = snd_solo_pcm_trigger,
>  	.pointer = snd_solo_pcm_pointer,
> -	.copy_user = snd_solo_pcm_copy_user,
> -	.copy_kernel = snd_solo_pcm_copy_kernel,
> +	.copy = snd_solo_pcm_copy,
>  };
>  
>  static int snd_solo_capture_volume_info(struct snd_kcontrol *kcontrol,

