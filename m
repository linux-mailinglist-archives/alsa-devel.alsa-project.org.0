Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACAD76654C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 09:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0CD6844;
	Fri, 28 Jul 2023 09:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0CD6844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690529242;
	bh=jcImtnLwcUfLeQIU1OvOi7H26D0RUYzhnoSlDqyoMtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IGvYSSg6U+3l6eZaEulX1rrFvOU3LewgIdtcEvx2XxMwL+y5cvo14LixCRSEa32rZ
	 LWljtQqZUu0U+49VYQuKHnxJo4xHuLlDik2odyoZJ6MIZ1PYxpLqGDhee87RWpp8/M
	 cfKDKyuc6uA+im1QmYq/Ga2TmbrEfoGpJ1FdpC3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E45D0F8019B; Fri, 28 Jul 2023 09:26:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E54F80163;
	Fri, 28 Jul 2023 09:26:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF179F8019B; Fri, 28 Jul 2023 09:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 504EAF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 09:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504EAF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BXZKh4I+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690529155; x=1722065155;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jcImtnLwcUfLeQIU1OvOi7H26D0RUYzhnoSlDqyoMtY=;
  b=BXZKh4I+WYGr4o78j2fNEaFFmTp6VOkioxMvG5/f4HkI7X08uJOfUJDG
   PbgATUA1Jer4DnnoWcAyFeLQOZ/EZweDFKMks3eHvD3sLYxP5x56u/RPW
   ggWq29rfRID5XuM1a807l8I40NbSEmTYf4Onh4OByu4V0iHEVKP1VFXQO
   G6+AFIws0VYicpQkCofmk3oryp0kRkZ4n9J4EFse0CxebdD7DqIbZPZt+
   kXtG2/RoG4n4+6mjvrEvjB4sD8CGqsyv3VMyVCugoOciAMRjPZIVdp2NN
   +/mugpSAjGS+Qp/E0plUO0ew8rp7F+p7TAP2EqPIL5X3l0/o6cCC+LYIZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353434716"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200";
   d="scan'208";a="353434716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 00:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973949477"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200";
   d="scan'208";a="973949477"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 00:25:27 -0700
Message-ID: <402a7a63-5584-ef79-e42f-e2102f42b9aa@linux.intel.com>
Date: Fri, 28 Jul 2023 09:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, justinstitt@google.com
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <202307261532.3EFCF04F1@keescook>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <202307261532.3EFCF04F1@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HH5JL7JJI65HO7EZEXC7CDDYHV7J62BJ
X-Message-ID-Hash: HH5JL7JJI65HO7EZEXC7CDDYHV7J62BJ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HH5JL7JJI65HO7EZEXC7CDDYHV7J62BJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/27/2023 12:34 AM, Kees Cook wrote:
> On Wed, Jul 26, 2023 at 09:12:18PM +0000, justinstitt@google.com wrote:
>> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>>
>> A suitable replacement is `strscpy` [2] due to the fact that it
>> guarantees NUL-termination on its destination buffer argument which is
>> _not_ the case for `strncpy`!
>>
>> It was pretty difficult, in this case, to try and figure out whether or
>> not the destination buffer was zero-initialized. If it is and this
>> behavior is relied on then perhaps `strscpy_pad` is the preferred
>> option here.
>>
>> Kees was able to help me out and identify the following code snippet
>> which seems to show that the destination buffer is zero-initialized.
>>
>> |       skl = devm_kzalloc(&pci->dev, sizeof(*skl), GFP_KERNEL);
>>
>> With this information, I opted for `strscpy` since padding is seemingly
>> not required.
> 
> We did notice that str_elem->string is 44 bytes, but
> skl->lib_info[ref_count].name is 128 bytes. If str_elem->string isn't
> NUL-terminated, this can still hit an over-read condition (though
> CONFIG_FORTIFY_SOURCE would have caught it both before with strncpy()
> and now with strscpy()). So I assume it is expected to be
> NUL-terminated?
> 

Yes it is a filename of additional library which can be loaded, topology 
UAPI only allows for passing 44 bytes long strings per string token (see 
snd_soc_tplg_vendor_array -> union -> string flex array -> 
snd_soc_tplg_vendor_string_elem -> SNDRV_CTL_ELEM_ID_NAME_MAXLEN), so we 
could also change length of
skl->lib_info[ref_count].name and potentially save few bytes. And 
looking at it again I also think that we should not copy destination 
size number of bytes, by which I mean 
ARRAY_SIZE(skl->lib_info[ref_count].name), which is 128 in this case... 
so either need to change destination buffer size to be same as topology 
field or calculate it differently.


