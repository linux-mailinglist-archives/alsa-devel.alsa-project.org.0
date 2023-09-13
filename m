Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A57F79E187
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 10:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E838BA4C;
	Wed, 13 Sep 2023 10:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E838BA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694592438;
	bh=k2kKC6VxzCp5Yvg8PTboxHuxdDo5vQCxUtb+WYiikGg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbeDXFPs41V2BOEHijK7RLYrTt6WCMd8DLv8YFbRitLHM79FBPi7eHAVVt6Wp4OGW
	 dF5ugcFQodM3PLGzqdw0uyzCjOWjBVWoKKkwPmDZZG8g3YpjnRjVKbISuBS7ySTMM8
	 ZMjG672QVpwmcJW+sqlz25oZ1m+vR9AJAP3rYBAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0343F80558; Wed, 13 Sep 2023 10:06:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 701F6F80246;
	Wed, 13 Sep 2023 10:06:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A41BF80425; Wed, 13 Sep 2023 10:06:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F0D6BF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:06:21 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 82DB611E6;
	Wed, 13 Sep 2023 10:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 82DB611E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1694592380; bh=COPTaKuhPKGl59HZ6FbsLEJV0HWJZ4O7f0tbJZrnSEk=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=TugO/kogKuFAr0XDQHHzz+YOWCYbauZ6aXk9xzQ8gZVCxz0I11f3d0lVbPVHqDwkU
	 lDpKv8V1AGd1cXPaVyyLWEYMGGEGSe+VZWZLIutvHr9EkzCtvRsOsMOBJnFOqVFmhM
	 0Z/6Vo/u062Ar8yMlMY23dLM5y4SDhCBiQJyKa9Q=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 13 Sep 2023 10:06:12 +0200 (CEST)
Message-ID: <a7edad8f-3e07-ee37-f47c-6cd49d0b681d@perex.cz>
Date: Wed, 13 Sep 2023 10:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <87bkezdsjh.wl-tiwai@suse.de> <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz>
 <874jkrdr49.wl-tiwai@suse.de> <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
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
 <fe7af3b9-2393-d8eb-221c-03363b281a26@perex.cz>
 <faddd2c6-78fc-beab-1960-ba024d5a7a38@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <faddd2c6-78fc-beab-1960-ba024d5a7a38@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6AFVSQUO46UVSHZ5PVMLQZCASRH7M6UR
X-Message-ID-Hash: 6AFVSQUO46UVSHZ5PVMLQZCASRH7M6UR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AFVSQUO46UVSHZ5PVMLQZCASRH7M6UR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13. 09. 23 9:44, Cezary Rojewski wrote:
> On 2023-09-12 6:30 PM, Jaroslav Kysela wrote:
>> On 11. 09. 23 17:45, Cezary Rojewski wrote:
>>> On 2023-09-11 10:43 AM, Cezary Rojewski wrote:
> 
> ...
> 
>>>>
>>>> Could you help me understand what new code is needed? The
>>>> get_subformat() example raised more questions than answers. The patchset
>>>> defines snd_pcm_subformat_width(), perhaps you meant that I should
>>>> update that function by adding paramter 'format' to its parameters list
>>>> and handle it accordingly?
>>>>
>>>> Any guidance would be much appreciated.
>>>
>>> What I come up with is a hw_rule for subformat that I add in
>>> snd_pcm_hw_constraints_init(). That piece, plus both STD and MSBITS_MAX
>>> ORed into hw->subformats in snd_pcm_hw_constraints_complete() make
>>> things spin.
>>>
>>> static int snd_pcm_hw_rule_subformat(struct snd_pcm_hw_params *params,
>>>                       struct snd_pcm_hw_rule *rule)
>>> {
>>>      struct snd_mask *subformat_mask = hw_param_mask(params,
>>> SNDRV_PCM_HW_PARAM_SUBFORMAT);
>>>      struct snd_mask *format_mask = hw_param_mask(params,
>>> SNDRV_PCM_HW_PARAM_FORMAT);
>>>      snd_pcm_format_t f;
>>>      struct snd_mask m;
>>>      int width;
>>>
>>>      snd_mask_none(&m);
>>>      snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_STD);
>>>      snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
>>>
>>>      pcm_for_each_format(f) {
>>>          if (!snd_mask_test_format(format_mask, f))
>>>              continue;
>>>
>>>          width = snd_pcm_format_width(f);
>>>          switch (width) {
>>>          case 32:
>>>              snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_20);
>>>              snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_24);
>>>              break;
>>>          default:
>>>              break;
>>>          }
>>>      }
>>>
>>>      return snd_mask_refine(subformat_mask, &m);
>>> }
>>>
>>>
>>> However, this means snd_hdac_query_supported_pcm() becomes confusing as
>>> you need to MSBITS_MAX regardless of what the codec supports.
>>> After spending additional few hours on this, I'd say I preferred how
>>> things look with MSBITS_32 instead. STD and MSBITS_MAX existing
>>> simultaneously is confusing too.
>>
>> This is not a correct implementation. Many things are missing including
>> the proper subformats filter. I sent my own version here for discussion:
>>
>> https://lore.kernel.org/alsa-devel/20230912162526.7138-1-perex@perex.cz/
> 
> I do appreciate the input but I expected that, through guidance, this
> patch gets updated. Sending a separate patch, not connected to this
> patchset - not even a single reference within the commit message body -
> is not nice.

The basic API extension is self-contained and I marked it as RFC. The 
connection was added to this thread.

> I'd rather send v2 with your patch incorporated as a part of the
> patchset.
No problem. Please, add these cosmetic changes to my patch:

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index f414f8fd217b..cb376e428f59 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1412,9 +1412,10 @@ static int snd_pcm_hw_rule_subformats(struct 
snd_pcm_hw_params *params,
         struct snd_mask m;
         struct snd_mask *fmask = hw_param_mask(params, 
SNDRV_PCM_HW_PARAM_FORMAT);
         struct snd_mask *mask = hw_param_mask(params, 
SNDRV_PCM_HW_PARAM_SUBFORMAT);
+       bool found;
+
         snd_mask_none(&m);
         snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
-       bool found;
         pcm_for_each_format(k) {
                 if (!snd_mask_test(fmask, k))
                         continue;
@@ -1437,7 +1438,6 @@ static int snd_pcm_hw_rule_subformats(struct 
snd_pcm_hw_params *params,
   * @runtime: PCM runtime instance
   * @cond: condition bits
   * @subformats: array with struct snd_pcm_subformat elements
- * @nmemd: size of array with struct snd_pcm_subformat elements
   *
   * This constraint will set relation between format and subformats.
   * The STD and MAX subformats are handled automatically. If the driver

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

