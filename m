Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B197479E2CD
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 10:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9889693A;
	Wed, 13 Sep 2023 10:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9889693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694595545;
	bh=4t6SF3fGK6WKAqmtXRjs8Fpkpg1AW7SfDK4wMLxdhZI=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mp/C3e0LtUk+qHiC+djek53oC2boWgo/gmg7KWo8MKN6B9lha8zC8ICdm2ROKH8mR
	 mThGM3XpCO3v3LS/OWrYYOD7SGVSPHz3gCEU8WdfoxwF3Rt4kJUmpmSZ+jtXIKqWC/
	 8HfBLJHwcX33jLtRlWNvedPkCp7qkFvr/xMPq7Hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10FFFF8047D; Wed, 13 Sep 2023 10:58:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C221EF80212;
	Wed, 13 Sep 2023 10:58:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6699F80425; Wed, 13 Sep 2023 10:58:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F3296F801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:58:00 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5849311E6;
	Wed, 13 Sep 2023 10:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5849311E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1694595479; bh=GPHLAS7Xb91PCR6LUUPvIAcryV3lpEh7BdkXZ6Srymc=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=m2VBFRwIxOgDpGPa8FqfGPAKdZTl6dA3yBm3zr9weZcpMRXiAJQ6PzilgoiOPSVUK
	 thZMbP3oMfB6Gcq9vc+QgiBNa3K6pjHRMdOFHXaCaRD24eJzko7ae6RkxW0dG7nCNx
	 pzsm9TGUmrdl3CE6MraUElLuXBU2msecSdGAWTho=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 13 Sep 2023 10:57:56 +0200 (CEST)
Message-ID: <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
Date: Wed, 13 Sep 2023 10:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>
References: <20230912162526.7138-1-perex@perex.cz>
 <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
In-Reply-To: <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5D5CE4UZEP6OSHQ4DSA23F7SK5W4S6XC
X-Message-ID-Hash: 5D5CE4UZEP6OSHQ4DSA23F7SK5W4S6XC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5D5CE4UZEP6OSHQ4DSA23F7SK5W4S6XC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13. 09. 23 10:22, Cezary Rojewski wrote:

>> +struct snd_pcm_hw_constraint_subformat {
>> +	snd_pcm_format_t format;	/* SNDRV_PCM_FORMAT_* */
>> +	u32 subformats;			/* SNDRV_PCM_SUBFMTBIT_* */
> 
>   From what I know, we are dealing with u64 masks here. Why u32 here?

It's not true. See the removed code which calls snd_pcm_hw_constraint_mask() 
for SNDRV_PCM_HW_PARAM_SUBFORMAT. Only the format is handled for 64 bits and 
the handling of other bits is purely optional, because masks can handle up to 
256 bits:

#define SNDRV_MASK_MAX  256

struct snd_mask {
         __u32 bits[(SNDRV_MASK_MAX+31)/32];
};

Because we used only few bits for SUBFORMAT, the 32 bit code is enough. We can 
expand this latter without any impact to the user space interface.

>> +static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
>> +				      struct snd_pcm_hw_rule *rule)
>> +{
>> +	const struct snd_pcm_hw_constraint_subformat *sf;
> 
> What's 'sf'? I'd suggest to be more descriptive here.

SubFormat. The larger name will not make the for loop more readable. The 
function is small, so reader is not lost.

>> +	snd_pcm_format_t k;
> 
> Internally I was utilizing 'f' as that's what macro expects in its
> declaration. s/k/f/

Copied from pcm_native.c - snd_pcm_hw_rule_format().

>> +	struct snd_mask m;
>> +	struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>> +	struct snd_mask *mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
> 
> So, the reason I opted for 'subformat_mask' and 'format_mask' is that
> otherwise reader is crowded with ambiguous 'mask' and its relatives. I'd
>    avoid shortcuts when multiple variables touch the same subject.
> 
> s/fmask/format_mask/
> s/mask/subformat_mask/

Too long, the function is small.

>> +	snd_mask_none(&m);
>> +	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
>> +	bool found;
> 
> Suggestion is to add newline before declaration and execution blocks.
> Also, why not reserve-christmass-tree model? There quite a few variables
> here.

Yes it should be shuffled.

>> +	pcm_for_each_format(k) {
>> +		if (!snd_mask_test(fmask, k))
>> +			continue;
> 
> Similarly here. A newline would effectively separate conditional
> for-loop from the actual execution block.

It's questionable.

>> +		found = false;
>> +		for (sf = rule->private; sf && sf->format != SNDRV_PCM_FORMAT_CONSTRAINT_END; sf++) {
>> +			if (sf->format != k)
>> +				continue;
>> +			found = true;
>> +			m.bits[0] |= sf->subformats;
>> +			break;
>> +		}
>> +		if (!found && snd_pcm_format_linear(k))
> 
> For my own education, why checking if format is linear is essential
> here? Perhaps a comment?

Subformat MSBITS are valid only for linear formats, aren't? It does not make 
sense to set MAX for other formats.

>> +			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
>> +	}
>> +	return snd_mask_refine(mask, &m);
>> +}
>> +
>> +/**
>> + * snd_pcm_hw_constraint_subformats - add a hw constraint subformats rule
>> + * @runtime: PCM runtime instance
>> + * @cond: condition bits
>> + * @subformats: array with struct snd_pcm_subformat elements
>> + * @nmemd: size of array with struct snd_pcm_subformat elements
>> + *
>> + * This constraint will set relation between format and subformats.
> 
> I do not believe 'This constaint' brings any value. Reader is already
> aware of it. Starting from the 'Set' part brings the same value with
> fewer words.

Copied from snd_pcm_hw_constraint_msbits function.

>> + * The STD and MAX subformats are handled automatically. If the driver
>> + * does not set this constraint, only STD and MAX subformats are handled.
>> + *
>> + * Return: Zero if successful, or a negative error code on failure.
>> + */
>> +int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
>> +				     unsigned int cond,
>> +				     struct snd_pcm_hw_constraint_subformat *subformats)
>> +{

...

>> -	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
>> -					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
>> -	if (err < 0)
>> -		return err;
>> +	if (!runtime->subformat_constraint) {
> 
> I'd try to avoid another special-bit in the runtime space. But I might
> be wrong here and it's unavoidable. Let me ask though, why cannot we do
> the constraint unconditionally?

This is for a special case when the drivers do not set 
snd_pcm_hw_constraint_subformats (all current drivers). In this case, the 
default is to handle STD and MAX subformat bits.

This constraint should be applied only one time. So this prevents to install 
it twice.

I'll send v2 to address some things from this discussion and kernel test robot.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

