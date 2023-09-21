Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7927A91C7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 08:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C266A4D;
	Thu, 21 Sep 2023 08:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C266A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695277715;
	bh=M+L7+F55WM4eBb+OG7TotbuMyHtiWu3cAjnynoCMZjc=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ih4iUfSv/Q/CDUeDQWmzAkeNjED7EE82PhUPsuQWG2VopuEaCfgHwKCmH1p0BlDFi
	 LX+i/redyU+6rzpRlSYLzqZYxaXI8R6D+vJqHt8XgmUuWjYVZ/9AoY6DtJMW+nDWvB
	 mlOP7/QtKgGJzX32UeyNH9pqioudvF7uXwMIRe1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19FD1F8055B; Thu, 21 Sep 2023 08:26:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB2FF8055B;
	Thu, 21 Sep 2023 08:26:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04F67F8025A; Thu, 21 Sep 2023 08:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52A93F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:25:21 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DD58C1A5A;
	Thu, 21 Sep 2023 08:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DD58C1A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695277520; bh=h1+29ujJVsZjgKz4znBsbmS5rDXG1dS4MFnQRdPOSuo=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=tnP64pn1xlKaMU2pKdbgv5NYedTGfp+tnQhM1LgkKx3BiqdjiOFTw6SZYRUigR5hr
	 Pyw76pc5a+UEt9tzJFvTJcajTkLSQxcOfFnpTzoKa60ehdbKX6u5+lGt6IR+8VneOf
	 TkBm/qsx0Kyfcy/TB4cZy9JbaYY58X3Rj/Anhalc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 21 Sep 2023 08:25:13 +0200 (CEST)
Message-ID: <be2ec481-fb35-52be-0847-199d446b6431@perex.cz>
Date: Thu, 21 Sep 2023 08:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
 <20230918133940.3676091-2-cezary.rojewski@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <20230918133940.3676091-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NCVKLU5FETTFLBEDBCD2AAOINX4NNJIX
X-Message-ID-Hash: NCVKLU5FETTFLBEDBCD2AAOINX4NNJIX
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCVKLU5FETTFLBEDBCD2AAOINX4NNJIX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18. 09. 23 15:39, Cezary Rojewski wrote:
> Improve granularity of format selection for S32/U32 formats by adding
> constants representing 20, 24 and MAX most significant bits.
> 
> To make it easy for drivers to utilize those constants, introduce
> snd_pcm_subformat_width() and snd_pcm_hw_params_bps(). While the former
> is self-explanatory, the latter returns the bit-per-sample value based
> on format and subformat characteristics of the provided hw_params.
> snd_pcm_hw_copy() helps with copying a hardware parameters space as with
> introduction of subformats the operations becomes non-trivial.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

...

>   struct snd_pcm_hardware {
>   	unsigned int info;		/* SNDRV_PCM_INFO_* */
>   	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
> +	struct snd_pcm_subformat *subformats;

I don't think that it's required to add subformats to the hardware template. 
The new constraint can handle subformat refining without the template 
modifications (pointer to map table is stored privately to this constraint).

Also, I miss the constraint handling here. Without the constraint, the new API 
is not functional and it does not make sense to split the constraint code to 
other patch.

> +int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p);

This may be probably inline function. See bellow.

> +	kfree(runtime->hw.subformats);

Do we really need to do an assumption about allocations for this field? The 
driver may use a static structure. No problem, when this is not added to 
runtime->hw.

> +int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p)
> +{
> +	snd_pcm_subformat_t subformat = params_subformat(p);
> +	snd_pcm_format_t format = params_format(p);
> +	int width;
> +
> +	switch (format) {
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +	case SNDRV_PCM_FORMAT_U32_LE:
> +	case SNDRV_PCM_FORMAT_S32_BE:
> +	case SNDRV_PCM_FORMAT_U32_BE:
> +		width = snd_pcm_subformat_width(subformat);

This is not a correct implementation. The width should be returned for MAX 
subformat (== snd_pcm_format_width value). See bellow.

> +int snd_pcm_subformat_width(snd_pcm_subformat_t subformat)

This function should probably have two arguments - format + subformat to 
return the correct information. The MAX subformat should return 
snd_pcm_format_width value.

> +int snd_pcm_hw_copy(struct snd_pcm_hardware *hw, const struct snd_pcm_hardware *from)

This function is not required, if only the constraint function handles the 
subformat refining.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

