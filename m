Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07D69465D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 13:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5E1827;
	Mon, 13 Feb 2023 13:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5E1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676292833;
	bh=jIAHiOpUZyu4o903XDVaMT723GpUHcMR7GxaRSQTEGg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jBqnFUN03SQcZ2Vz4RNDlvBFguP6Gx/Z68oZawBxjnttuvLof06b5LrtmhUobH7Qe
	 KJzb6Z0QheuseelBCZlhQpG1es2KuSbOT8ZLRacQ335fq4lIztiVYVW5opsNOPWrzv
	 BKkxAhpe+rueFUYf61Z7a4KesnrdEzFbvgFRl5hc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B40F804B0;
	Mon, 13 Feb 2023 13:53:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B579BF804B4; Mon, 13 Feb 2023 13:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBE53F8001E
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 13:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE53F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RISancr8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676292775; x=1707828775;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jIAHiOpUZyu4o903XDVaMT723GpUHcMR7GxaRSQTEGg=;
  b=RISancr8Vs/T1aTN7lsukQ1kj/Qfr93GWqiQ67vgV77zOcM6N/Qx9g72
   pO350p3/OIzfk6ATzwb9dbqoXUCZdA8xuo1YhR2JxpROjlMBrXDzD0toJ
   xgMASjbuUSDkEZPoJ35YrBEUqyYAsysGJLjWh6tHmNcDbB/EQ9WhOFsfM
   BJfdh5szoQhxNHTfX1M2OMKhvtI943+aH6NU15T/1Ssl8y85rp7wTAEmn
   fCWMr4DD1zHzjdfAccusk0lvJVaI0fvqvaoF4nJnyrFcvLhx9RbiIPa7B
   +SBR/vNuyBPRh52k12O9XzTWfRT/Nqvdu0jvK/R+ZwNTBf+bimDNqnFqg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332190687"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="332190687"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 04:52:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670809929"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="670809929"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 04:52:47 -0800
Message-ID: <af96abd5-1eaa-a74f-cfb6-7ed82fe2207c@linux.intel.com>
Date: Mon, 13 Feb 2023 13:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: Intel: Skylake: Replace 1-element array with
 flex-array
To: Kees Cook <keescook@chromium.org>
References: <20230210051447.never.204-kees@kernel.org>
 <54d4ffb1-1488-1a4f-58b2-8b3471389729@linux.intel.com>
 <63e695c0.620a0220.f69b1.6eec@mx.google.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <63e695c0.620a0220.f69b1.6eec@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XVLDRFJSVN6WPJLR6MWBKJE2HQTLSOTL
X-Message-ID-Hash: XVLDRFJSVN6WPJLR6MWBKJE2HQTLSOTL
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 Sasa Ostrouska <casaxa@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVLDRFJSVN6WPJLR6MWBKJE2HQTLSOTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/10/2023 8:06 PM, Kees Cook wrote:
> On Fri, Feb 10, 2023 at 02:10:56PM +0100, Amadeusz Sławiński wrote:
>> On 2/10/2023 6:14 AM, Kees Cook wrote:
>>> The kernel is globally removing the ambiguous 0-length and 1-element
>>> arrays in favor of flexible arrays, so that we can gain both compile-time
>>> and run-time array bounds checking[1]. In this instance, struct
>>> skl_cpr_cfg contains struct skl_cpr_gtw_cfg, which defined "config_data"
>>> as a 1-element array.
>>>
>>> Normally when switching from a 1-element array to a flex-array, any
>>> related size calculations must be adjusted too. However, it seems the
>>> original code was over-allocating space, since 1 extra u32 would be
>>> included by the sizeof():
>>>
>>>                   param_size = sizeof(struct skl_cpr_cfg);
>>>                   param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
>>>
>>> But the copy uses caps_size bytes, and cap_size / 4 (i.e. sizeof(u32))
>>> for the length tracking:
>>>
>>>           memcpy(cpr_mconfig->gtw_cfg.config_data,
>>>                           mconfig->formats_config[SKL_PARAM_INIT].caps,
>>>                           mconfig->formats_config[SKL_PARAM_INIT].caps_size);
>>>
>>>           cpr_mconfig->gtw_cfg.config_length =
>>>                           (mconfig->formats_config[SKL_PARAM_INIT].caps_size) / 4;
>>>
>>> Therefore, no size calculations need adjusting. Change the struct
>>> skl_cpr_gtw_cfg config_data member to be a true flexible array, which
>>> also fixes the over-allocation, and silences this memcpy run-time false
>>> positive:
>>>
>>>     memcpy: detected field-spanning write (size 100) of single field "cpr_mconfig->gtw_cfg.config_data" at sound/soc/intel/skylake/skl-messages.c:554 (size 4)
>>>
>>> [1] For lots of details, see both:
>>>       https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
>>>       https://people.kernel.org/kees/bounded-flexible-arrays-in-c
>>>
>>> Reported-by: Sasa Ostrouska <casaxa@gmail.com>
>>> Link: https://lore.kernel.org/all/CALFERdwvq5day_sbDfiUsMSZCQu9HG8-SBpOZDNPeMdZGog6XA@mail.gmail.com/
>>> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
>>> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>>> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: Jaroslav Kysela <perex@perex.cz>
>>> Cc: Takashi Iwai <tiwai@suse.com>
>>> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
>>> Cc: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
>>> Cc: alsa-devel@alsa-project.org
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>>    sound/soc/intel/skylake/skl-topology.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
>>> index 6db0fd7bad49..ad94f8020c27 100644
>>> --- a/sound/soc/intel/skylake/skl-topology.h
>>> +++ b/sound/soc/intel/skylake/skl-topology.h
>>> @@ -115,7 +115,7 @@ struct skl_cpr_gtw_cfg {
>>>    	u32 dma_buffer_size;
>>>    	u32 config_length;
>>>    	/* not mandatory; required only for DMIC/I2S */
>>> -	u32 config_data[1];
>>> +	u32 config_data[];
>>>    } __packed;
>>>    struct skl_dma_control {
>>
>> This fails in our validation.
> 
> Ah, okay. Thanks for checking!
> 
>> Maybe we can use the union workaround, to
>> leave the size as is?
>>
>> Following seems to work in manual test:
>> diff --git a/sound/soc/intel/skylake/skl-topology.h
>> b/sound/soc/intel/skylake/skl-topology.h
>> index 6db0fd7bad49..ffbd2e60fede 100644
>> --- a/sound/soc/intel/skylake/skl-topology.h
>> +++ b/sound/soc/intel/skylake/skl-topology.h
>> @@ -115,7 +115,10 @@ struct skl_cpr_gtw_cfg {
>>          u32 dma_buffer_size;
>>          u32 config_length;
>>          /* not mandatory; required only for DMIC/I2S */
>> -       u32 config_data[1];
>> +       union {
>> +               u32 x;
>> +               u32 config_data[0];
>> +       };
> 
> Yeah, that could work, though the last member would be:
> 	DECLARE_FLEX_ARRAY(u32, config_data);
> otherwise the array is 0 length (rather than a proper flex array).
> 
> But before that, let me see if I can track down where the size is being
> used, in case we can avoid adding the padding.
> 

I did spend some more time on this, apparently struct was missing one 
field according to IPC protocol. I've send fix for this.

