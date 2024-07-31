Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE78942A80
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 11:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1782CE4;
	Wed, 31 Jul 2024 11:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1782CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722418242;
	bh=SDIC6U1OpbbT/1qJASR0o4bsOf7WW3WUUTjs/xCccYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UvMllfCXdJv0CSkRJn2ruPqEMlcGpjY7g5VrcMwQyvp5nV+9pZL3Qaor1EnMOgRMl
	 ke8mjypvWcLSp5uwaPW7i/p5ipqLgGklZc28+zI6UyZRnOiBXtLQTLaTVtfeVBQdWP
	 rg4mfwJymwNyACFakEtnrpeXLFpMAZ4svrdBxfiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B089F805BB; Wed, 31 Jul 2024 11:30:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66CCCF805BA;
	Wed, 31 Jul 2024 11:30:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2792CF802DB; Wed, 31 Jul 2024 11:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 820F7F80269
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 11:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 820F7F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZEiG/vXV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418189; x=1753954189;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SDIC6U1OpbbT/1qJASR0o4bsOf7WW3WUUTjs/xCccYE=;
  b=ZEiG/vXV8dp+ZTkDXYVwdec/7Qk0dEkzjzZUu0lz1T34IaIuvnM83eXh
   WROxzK/0oP6MwnFKNhiSUD25ELkmNztuAg6mBoDxOlnFRWQqATXv47gxC
   t6YF4dLWJsKgrkUmNX15mOxb+6Oe9lTdelyKaXTpIsAigBkgPF4n+kN1C
   wD9WGcppiIaMvJyDTZg8L0++P61p/qHKwoUuOs+SxB/Yj10Z5bBupuZcQ
   2oeyOBOI9dUVtgxMBzvNCbLYqyIuhWQWZ2AQZWsSNAv+uHp7Ze8Fw0hLH
   ul6/cc5KTlg4dzaf4i0IKeBBYbH7sORlm9ZMzVKktwsMI3+FGsmbnfTGR
   Q==;
X-CSE-ConnectionGUID: 6ZOlML6KSxmf7H0Q/peMUw==
X-CSE-MsgGUID: vvVthlxmSlG4MYDyQ5XoBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31690556"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800";
   d="scan'208";a="31690556"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 02:29:45 -0700
X-CSE-ConnectionGUID: ZVGHI0YTQp2H5zrt/A91mQ==
X-CSE-MsgGUID: sUnvZSSjSSuv/eocgnFeMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800";
   d="scan'208";a="59261985"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 02:29:45 -0700
Message-ID: <1f1c9d4b-b3ca-44b6-acce-7e52cfaa2eb9@linux.intel.com>
Date: Wed, 31 Jul 2024 11:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alsa-lib 2/4] seq: Add API helper functions for creating
 UMP Endpoint and Blocks
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20240619152855.6809-1-tiwai@suse.de>
 <20240619152855.6809-3-tiwai@suse.de>
 <0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com>
 <87ikwlzzlt.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ikwlzzlt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 36O6642HP42SO6J54IWBUWU65FPSB2O7
X-Message-ID-Hash: 36O6642HP42SO6J54IWBUWU65FPSB2O7
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36O6642HP42SO6J54IWBUWU65FPSB2O7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/31/2024 11:21 AM, Takashi Iwai wrote:
> On Wed, 31 Jul 2024 10:46:08 +0200,
> Amadeusz Sławiński wrote:
>>
>> On 6/19/2024 5:28 PM, Takashi Iwai wrote:
>>> For making it easer for applications to create a virtual UMP Endpoint
>>> and UMP blocks, add two API helper functions.
>>>
>>> snd_seq_create_ump_endpoint() creates (unsurprisingly) a UMP Endpoint,
>>> based on the given snd_ump_endpoint_info_t information.  The number of
>>> (max) UMP groups belonging to this Endpoint has to be specified.
>>> This function sets up the Endpoint info on the sequencer client, and
>>> creates a MIDI 2.0 UMP port as well as UMP Group ports automatically.
>>> The name of the sequencer client is updated from the Endpoint name,
>>> too.
>>>
>>> After creating a UMP Endpoint, create each UMP Block via
>>> snd_seq_create_ump_block() function with a snd_ump_block_info_t info.
>>> The associated groups for each block have to be specified there.
>>> The port names and capability bits are updated accordingly after
>>> setting each block information.
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>
>> ...
>>
>>> +			if (*blknames) {
>>> +				strlcat(blknames, ", ", sizeof(blknames));
>>> +				strlcat(blknames, (const char *)bp->name,
>>> +					sizeof(blknames));
>>
>> FYI, this seems to introduce build problems on systems that do not
>> have strlcpy:
>>
>> During build:
>> seqmid.c: In function ‘update_group_ports’:
>> seqmid.c:672:33: warning: implicit declaration of function
>> ‘strlcat’; did you mean ‘strncat’?
>> [-Wimplicit-function-declaration]
>>    672 |                                 strlcat(blknames, ", ",
>> sizeof(blknames));
>>        |                                 ^~~~~~~
>>        |                                 strncat
>>
>> And then during linking:
>> /usr/bin/ld: seq/.libs/libseq.a(seqmid.o): in function `update_group_ports':
>> /home/amade/workdir/avs/alsa-lib/src/seq/seqmid.c:672: undefined
>> reference to `strlcat'
>> /usr/bin/ld: /home/amade/workdir/avs/alsa-lib/src/seq/seqmid.c:673:
>> undefined reference to `strlcat'
>> collect2: error: ld returned 1 exit status
> 
> Thanks, I'll modify it to avoid strlcat() like below.
> 
> 
> Takashi
> 
> -- 8< --
> Subject: [PATCH] seq: Avoid strlcat()
> 
> strlcat() isn't available in every system, so better to avoid it.
> Rewrite the code without strlcat().
> 
> Fixes: 6167b8ce3e80 ("seq: Add API helper functions for creating UMP Endpoint and Blocks")
> Link: https://lore.kernel.org/0796c157-1ac3-47a3-9d54-ba86f59d64d5@linux.intel.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   src/seq/seqmid.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/src/seq/seqmid.c b/src/seq/seqmid.c
> index 08c62d5c24b8..b30db4075254 100644
> --- a/src/seq/seqmid.c
> +++ b/src/seq/seqmid.c
> @@ -635,6 +635,7 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
>   		char blknames[64];
>   		char name[64];
>   		unsigned int caps = 0;
> +		int len;
>   
>   		blknames[0] = 0;
>   		for (b = 0; b < ep->num_blocks; b++) {
> @@ -668,14 +669,13 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
>   
>   			if (!*bp->name)
>   				continue;
> -			if (*blknames) {
> -				strlcat(blknames, ", ", sizeof(blknames));
> -				strlcat(blknames, (const char *)bp->name,
> -					sizeof(blknames));
> -			} else {
> +			len = strlen(blknames);
> +			if (len)
> +				snprintf(blknames + len, sizeof(blknames) - len,
> +					 ", %s", bp->name);
> +			else
>   				snd_strlcpy(blknames, (const char *)bp->name,
>   					    sizeof(blknames));
> -			}
>   		}
>   
>   		if (!*blknames)

Builds now, but still gives warning:

seqmid.c: In function ‘update_group_ports’:
seqmid.c:675:45: warning: ‘%s’ directive output may be truncated writing 
up to 127 bytes into a region of size 61 [-Wformat-truncation=]
   675 |                                          ", %s", bp->name);
       |                                             ^~
In file included from /usr/include/stdio.h:894,
                  from ../../include/local.h:28,
                  from seq_local.h:26,
                  from seqmid.c:23:
In function ‘snprintf’,
     inlined from ‘update_group_ports’ at seqmid.c:674:5:
/usr/include/x86_64-linux-gnu/bits/stdio2.h:71:10: note: 
‘__builtin___snprintf_chk’ output between 3 and 130 bytes into a 
destination of size 63
    71 |   return __builtin___snprintf_chk (__s, __n, 
__USE_FORTIFY_LEVEL - 1,
       | 
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    72 |                                    __glibc_objsize (__s), __fmt,
       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    73 |                                    __va_arg_pack ());
       |                                    ~~~~~~~~~~~~~~~~~


