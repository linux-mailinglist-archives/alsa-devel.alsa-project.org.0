Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A381268662D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:45:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32A81F3;
	Wed,  1 Feb 2023 13:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32A81F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675255517;
	bh=gkD6HRgfOl2ffKtHR7tQZwvitttJ6AZILFMJL8aBzXU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YgRzGuFVT5NyfPsj2DAYQq81Pvsbm1krYG2NPd1b4BpTaKSB4iCoPaWIzQpwWC2we
	 Zzg3I7NEknvb/LYiPPyl6koSyKfI/Xwy6NxDTotdMasJl2kpetMvM3tTSA3y6p0X1N
	 TY59s1ZrVyRw9PseexmkKOTPjEbr572YZEicfmSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA6DF80155;
	Wed,  1 Feb 2023 13:44:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A0B1F80423; Wed,  1 Feb 2023 13:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9314F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9314F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=xe0mCmtk
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id ADACD400;
 Wed,  1 Feb 2023 13:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz ADACD400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675255451; bh=/Yd2TOqlsMlmjlL8fFy/F70AA/X9hqlI6H9gn+IdeP8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xe0mCmtk+/5jBU6sNVDwU+z6vaJPldinmMzYjcQxU83PKKfbd/nfdKJaBaVAzO3Xq
 M4+qBmhQap/EX7Zxr0jvW7OXkOrLKUJ6MuQQOJMQNZV0vmA+uUo3X/TsbKpN0kmd9l
 Svuivh04SmRGLp7fxuCp54Sd7doX+2x/Hjhbm6xs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  1 Feb 2023 13:44:02 +0100 (CET)
Message-ID: <d5f6aa34-4fff-9e23-0811-de1ee6d8a2e9@perex.cz>
Date: Wed, 1 Feb 2023 13:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 9/9] ASoC: SOF: ipc4-pcm: add delay function support
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
 <20230201123231.26361-10-peter.ujfalusi@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230201123231.26361-10-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01. 02. 23 13:32, Peter Ujfalusi wrote:

> +static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
> +					    struct snd_pcm_substream *substream)
> +{

...

> +
> +	/*
> +	 * Handle 32-bit counter wrap around, which would happen
> +	 * for a 48khz 2ch stream in 24.855 hours
> +	 */
> +	link_ptr = tmp_ptr & UINT_MAX;
> +
> +	host_ptr = substream->runtime->status->hw_ptr;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		return host_ptr - link_ptr;
> +
> +	return link_ptr - host_ptr;

I don't think that this calculation is fine for the wrap point. The hw_ptr is 
in range 0..pcm_boundary not UINT_MAX. Also, you should consider the 
underrun/overrun situations. The simple substraction is not enough to handle 
this correctly.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

