Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBE76FED9
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 12:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC95120C;
	Fri,  4 Aug 2023 12:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC95120C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691146135;
	bh=j39Sbjbid9eSbHXJRZMatMzCVD/IimAeIkz8j2PZ264=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BDJe3VuzfowuQGhNi3cuNO9bmqimdJBeLmbIf3J/953OIBQo7OR04n/2bKHb4l0hS
	 19erW4Zw7KaWOiLwKDQl1zJj38UuQOBrfpaqXvLd62pPiPxlA8qhNGeZA2dAlgEGMr
	 Aqdj2bOkqmn4PSqUo/GebuVMJTdkTOzG+ggWCfO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF0F3F805B2; Fri,  4 Aug 2023 12:47:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33181F80552;
	Fri,  4 Aug 2023 12:47:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1B12F805AA; Fri,  4 Aug 2023 12:47:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4BE0F80535
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 12:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4BE0F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NLEQYOJ/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EqO4X27A
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0F2421860;
	Fri,  4 Aug 2023 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691146011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+RCvu64k2tkk7w/weX6gTH8M7RTUJSIekejqVZef5Q=;
	b=NLEQYOJ/t8VyF9gY23NkCvXsqhwrRWkh1Pv18sXNYlDkvOwxGPutG2CDJy2u7FmLwqiKE8
	4c1T0Rt1Av5EsrNY0qNqdhTJu0tVJ5CCC7V4mFopq+7YiuX2kf0To8+g2hgSWSDWd28sS7
	qBJw14vRQziH2MJlEGOsuMdBSxOM6po=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691146011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+RCvu64k2tkk7w/weX6gTH8M7RTUJSIekejqVZef5Q=;
	b=EqO4X27A48oKleqeso9rMvDzRqIJibaLjF0M1+htAgddFEP7VYz/kbbEruDJTBq+54OMPP
	/iP1awYKRHGtqaCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3F98133B5;
	Fri,  4 Aug 2023 10:46:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DsKbLhvXzGRUPgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 10:46:51 +0000
Date: Fri, 04 Aug 2023 12:46:51 +0200
Message-ID: <87msz79jac.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: Move buffer iterator initialization to
 prepare callback
In-Reply-To: <20230803152824.7531-1-ivan.orlov0322@gmail.com>
References: <20230803152824.7531-1-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: PPGKKNLWVVCUZA2IX5AX3WGVVVUGHAFC
X-Message-ID-Hash: PPGKKNLWVVCUZA2IX5AX3WGVVVUGHAFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPGKKNLWVVCUZA2IX5AX3WGVVVUGHAFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 17:28:24 +0200,
Ivan Orlov wrote:
> 
> Trigger callback is not the best place for buffer iterator
> initialization, so move it out to the prepare callback, where it
> have to be.
> 
> Minor enhancement: remove redundant definitions and blank line.

A blank line removal is OK, but other changes are too much to fold
into.  Please split.


thanks,

Takashi

> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  sound/drivers/pcmtest.c | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
> index 08e14b5eb772..7f170429eb8f 100644
> --- a/sound/drivers/pcmtest.c
> +++ b/sound/drivers/pcmtest.c
> @@ -41,8 +41,6 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  
> -#define DEVNAME "pcmtestd"
> -#define CARD_NAME "pcm-test-card"
>  #define TIMER_PER_SEC 5
>  #define TIMER_INTERVAL (HZ / TIMER_PER_SEC)
>  #define DELAY_JIFFIES HZ
> @@ -74,11 +72,11 @@ static u8 ioctl_reset_test;
>  static struct dentry *driver_debug_dir;
>  
>  module_param(index, int, 0444);
> -MODULE_PARM_DESC(index, "Index value for " CARD_NAME " soundcard");
> +MODULE_PARM_DESC(index, "Index value for pcmtest soundcard");
>  module_param(id, charp, 0444);
> -MODULE_PARM_DESC(id, "ID string for " CARD_NAME " soundcard");
> +MODULE_PARM_DESC(id, "ID string for pcmtest soundcard");
>  module_param(enable, bool, 0444);
> -MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
> +MODULE_PARM_DESC(enable, "Enable pcmtest soundcard.");
>  module_param(fill_mode, short, 0600);
>  MODULE_PARM_DESC(fill_mode, "Buffer fill mode: rand(0) or pattern(1)");
>  module_param(inject_delay, int, 0600);
> @@ -92,7 +90,6 @@ MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callb
>  module_param(inject_open_err, bool, 0600);
>  MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
>  
> -
>  struct pcmtst {
>  	struct snd_pcm *pcm;
>  	struct snd_card *card;
> @@ -405,25 +402,9 @@ static int snd_pcmtst_pcm_close(struct snd_pcm_substream *substream)
>  
>  static int snd_pcmtst_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  {
> -	struct snd_pcm_runtime *runtime = substream->runtime;
> -	struct pcmtst_buf_iter *v_iter = runtime->private_data;
> -
>  	if (inject_trigger_err)
>  		return -EINVAL;
>  
> -	v_iter->sample_bytes = runtime->sample_bits / 8;
> -	v_iter->period_bytes = frames_to_bytes(runtime, runtime->period_size);
> -	if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
> -	    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED) {
> -		v_iter->chan_block = runtime->dma_bytes / runtime->channels;
> -		v_iter->interleaved = false;
> -	} else {
> -		v_iter->interleaved = true;
> -	}
> -	// We want to record RATE * ch_cnt samples per sec, it is rate * sample_bytes * ch_cnt bytes
> -	v_iter->s_rw_ch = runtime->rate / TIMER_PER_SEC;
> -	v_iter->b_rw = v_iter->s_rw_ch * v_iter->sample_bytes * runtime->channels;
> -
>  	return 0;
>  }
>  
> @@ -454,8 +435,24 @@ static void pcmtst_pdev_release(struct device *dev)
>  
>  static int snd_pcmtst_pcm_prepare(struct snd_pcm_substream *substream)
>  {
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct pcmtst_buf_iter *v_iter = runtime->private_data;
> +
>  	if (inject_prepare_err)
>  		return -EINVAL;
> +
> +	v_iter->sample_bytes = samples_to_bytes(runtime, 1);
> +	v_iter->period_bytes = snd_pcm_lib_period_bytes(substream);
> +	v_iter->interleaved = true;
> +	if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
> +	    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED) {
> +		v_iter->chan_block = snd_pcm_lib_buffer_bytes(substream) / runtime->channels;
> +		v_iter->interleaved = false;
> +	}
> +	// We want to record RATE * ch_cnt samples per sec, it is rate * sample_bytes * ch_cnt bytes
> +	v_iter->s_rw_ch = runtime->rate / TIMER_PER_SEC;
> +	v_iter->b_rw = v_iter->s_rw_ch * v_iter->sample_bytes * runtime->channels;
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
