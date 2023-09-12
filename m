Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9394679D657
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75EE950;
	Tue, 12 Sep 2023 18:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75EE950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694536335;
	bh=CAkdwXcfPTFZ/XmEPga5SJp5zK/RRLZWa9I6hfmfsLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M91iIjEQR7w6D7O87btLgBR0W04nHcFjKEnYQHiomqzpOyCFpJ1ziOtAr5259+qLR
	 uhbSI0hUGohniCeCSAWn5o0pZNpPxJRuMyDbKCkKFdqtDlUGrpgL1Zko0xazg4tc7W
	 2oUT/WKQwZlX69CW0IEwIdGLMGgxP8MCUG9nyCtc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6032BF80552; Tue, 12 Sep 2023 18:30:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A92F8007C;
	Tue, 12 Sep 2023 18:30:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28051F80425; Tue, 12 Sep 2023 18:30:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BAFFF80431
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:30:45 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id DE86511E6;
	Tue, 12 Sep 2023 18:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz DE86511E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1694536243; bh=iofbL2AoahXLQgOHT9/XBjfZDjFyFHTgoxcx2+mlgDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SL++76kMhzbavbWYH2YxmFyO5vRzctfEZQAa90E7Pg4nkMFDqAEk9BmX+RpC/URiQ
	 Cv1WDPFWfPUR/2QeP68Gs8/+OwTCZaddpCjdhoqvxBwIH2JsF8T88dYDqUiTPgjYCt
	 62cMmb3TmflR2icoxhcBgIIpkh4JyrdsGeSt3t1s=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 12 Sep 2023 18:30:35 +0200 (CEST)
Message-ID: <fe7af3b9-2393-d8eb-221c-03363b281a26@perex.cz>
Date: Tue, 12 Sep 2023 18:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz> <874jkrdr49.wl-tiwai@suse.de>
 <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
 <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
 <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz> <871qfuhyog.wl-tiwai@suse.de>
 <85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
 <dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
 <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz> <87zg2iggn5.wl-tiwai@suse.de>
 <f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz>
 <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
 <7d2d56a5-698e-7ee3-e6ab-95757012537c@perex.cz>
 <36fb8f83-9b39-966b-c105-7ef1bcc17afa@intel.com>
 <337fe790-fdbc-1208-080d-5bcf9264fc65@perex.cz>
 <cd163597-a15f-a52e-fb24-529f8e855171@intel.com>
 <8d76a1d8-e85c-b699-34a0-ecea6edc2fe1@intel.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <8d76a1d8-e85c-b699-34a0-ecea6edc2fe1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ET5Z77R33JT6MDMI77ZI622M4FS4PPYC
X-Message-ID-Hash: ET5Z77R33JT6MDMI77ZI622M4FS4PPYC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ET5Z77R33JT6MDMI77ZI622M4FS4PPYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11. 09. 23 17:45, Cezary Rojewski wrote:
> On 2023-09-11 10:43 AM, Cezary Rojewski wrote:
>> On 2023-09-11 9:35 AM, Jaroslav Kysela wrote:
>>> On 08. 09. 23 16:36, Cezary Rojewski wrote:
> 
> ...
> 
>>>> After reading all of this again, I'm fine with rewording MSBITS_32 to
>>>> MSBITS_MAX.
>>>>
>>>> As I do not see any other points to address here and review of v1 has no
>>>> points to address either, I'll send v2 with this single change. If I'd
>>>> missed anything, let me know.
>>>
>>> The subformat bitmask should be also refined/updated depending on the
>>> selected format.
>>>
>>> https://lore.kernel.org/alsa-devel/f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz/
>>>
>>> It requires new code in pcm_lib.c and ASoC PCM core code.
>>
>> Could you help me understand what new code is needed? The
>> get_subformat() example raised more questions than answers. The patchset
>> defines snd_pcm_subformat_width(), perhaps you meant that I should
>> update that function by adding paramter 'format' to its parameters list
>> and handle it accordingly?
>>
>> Any guidance would be much appreciated.
> 
> What I come up with is a hw_rule for subformat that I add in
> snd_pcm_hw_constraints_init(). That piece, plus both STD and MSBITS_MAX
> ORed into hw->subformats in snd_pcm_hw_constraints_complete() make
> things spin.
> 
> static int snd_pcm_hw_rule_subformat(struct snd_pcm_hw_params *params,
> 				     struct snd_pcm_hw_rule *rule)
> {
> 	struct snd_mask *subformat_mask = hw_param_mask(params,
> SNDRV_PCM_HW_PARAM_SUBFORMAT);
> 	struct snd_mask *format_mask = hw_param_mask(params,
> SNDRV_PCM_HW_PARAM_FORMAT);
> 	snd_pcm_format_t f;
> 	struct snd_mask m;
> 	int width;
> 
> 	snd_mask_none(&m);
> 	snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_STD);
> 	snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
> 
> 	pcm_for_each_format(f) {
> 		if (!snd_mask_test_format(format_mask, f))
> 			continue;
> 
> 		width = snd_pcm_format_width(f);
> 		switch (width) {
> 		case 32:
> 			snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_20);
> 			snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_24);
> 			break;
> 		default:
> 			break;
> 		}
> 	}
> 
> 	return snd_mask_refine(subformat_mask, &m);
> }
> 
> 
> However, this means snd_hdac_query_supported_pcm() becomes confusing as
> you need to MSBITS_MAX regardless of what the codec supports.
> After spending additional few hours on this, I'd say I preferred how
> things look with MSBITS_32 instead. STD and MSBITS_MAX existing
> simultaneously is confusing too.

This is not a correct implementation. Many things are missing including the 
proper subformats filter. I sent my own version here for discussion:

https://lore.kernel.org/alsa-devel/20230912162526.7138-1-perex@perex.cz/

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

