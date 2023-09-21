Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41137A91CE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 08:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 106109F6;
	Thu, 21 Sep 2023 08:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 106109F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695278579;
	bh=58kIfvWvOI3rJ1BPjfFsdGG6ESCtqO0FU96tJV3Bbqg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=btHkcpiVMuGg/oVT0XeWPuCZ79Iqs9cR02TzeO2WI+hzRg+eoi4nOEwqEq+pUj26x
	 i6xYhoYCz3JmhFLaNyCndbRGZ80bJhxYVdkyHlJpNkTSehTEK04ZfNpNGeVxn2l0RJ
	 JRnWD/FQ+K13XwvqlJYppcsrgOk/rlxzLrc1WZX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FBEF80558; Thu, 21 Sep 2023 08:42:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC70F801F5;
	Thu, 21 Sep 2023 08:42:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4880F8025A; Thu, 21 Sep 2023 08:42:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D945BF80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:41:58 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 915991A59;
	Thu, 21 Sep 2023 08:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 915991A59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695278517; bh=Eeq7sJDs1hu7y+D8yq9la0L6+8mtY+D8U6KKDTZYBqg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=d1X6qlagWwbP3e3/2EqcPJTLcKYYB7P/fqkVSdnjPFCoFl4JLKxJkYzqVEmBry0LW
	 ep8Qe92wX6fxREXyeKlyMDvjKXX18RX0yq1Yvgqg9AouAl9q5Rz+ebgB0tBfxsqLev
	 ZS9IvPCOdljmZstYkyQvykte0IoxKydmx2gVPciM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 21 Sep 2023 08:41:50 +0200 (CEST)
Message-ID: <2a249c19-d045-f3c4-3b8a-898ecd278abc@perex.cz>
Date: Thu, 21 Sep 2023 08:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
 <20230918133940.3676091-3-cezary.rojewski@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring
 substream
In-Reply-To: <20230918133940.3676091-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HCYQIXPHMEHMJCN3KUY64MBB55JPOTHP
X-Message-ID-Hash: HCYQIXPHMEHMJCN3KUY64MBB55JPOTHP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCYQIXPHMEHMJCN3KUY64MBB55JPOTHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18. 09. 23 15:39, Cezary Rojewski wrote:
> Substream value is currently hardcoded to SNDRV_PCM_SUBFORMAT_STD.
> Update the constraint procedure so that subformat selection is not
> ignored. Case STD is always supported as most PCMs do not care about
> subformat.
> 
> Suggested-by: Jaroslav Kysela <perex@perex.cz>

Better Co-developed mark. Also I would move whole code to the first patch. It 
does not make sense to split the mandatory code.

Another option is to increase the protocol version to the separate patch where 
all necessary code changes are applied (for MSBITS_MAX). But it may break 
backports, so the change should be aligned with the SUBFMT defines.

> +	struct snd_mask *sfmask;

m_rw -> sfmask renaming. I prefer universal name to allow easy reuse in future.

> +		for (sf = hw->subformats; sf->mask && !found; sf++) {

My proposal [1] defined SNDRV_PCM_FORMAT_CONSTRAINT_END value not relying to 
zero format (which is U8) and zero subformat to skip the MSBIT_MAX setting 
bellow. After some thought, if the driver sets SNDRV_PCM_SUBFORMAT_MSBITS_STD, 
the result will be similar, thus the mask can be zero and the code may be 
reduced. So no objection for this change.

> +		if (!found && snd_pcm_format_linear(f))
> +			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
> +	}
> +exit:
> +	return snd_mask_refine(sfmask, &m);
> +}
> +
> +static int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
> +					   unsigned int cond,
> +					   struct snd_pcm_hardware *hw)
> +{

Because your change does not assume that this constraint is called from the 
drivers, the comments and EXPORT_SYMBOL() lines were removed from the original 
proposal [1]. I believe that the standalone constraint is better at this time 
- reduce code, the use of the subformat extension is not mandatory.

							Jaroslav

[1] https://lore.kernel.org/alsa-devel/20230912162526.7138-1-perex@perex.cz/
     https://lore.kernel.org/alsa-devel/20230913103716.67315-1-perex@perex.cz/

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

