Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB46D3DD7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 09:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7A31F7;
	Mon,  3 Apr 2023 09:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7A31F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680505776;
	bh=Z14ZgWQ7PAtGKqW1xLqpPRGzxTQkcM8qbmygRVkC0+g=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jCwVAEgZa1pPfJ/qHWT8KAyu+eKjthrJC5ALrtORqAe0eeqPyhW6fNB7bRBuLBN9r
	 QTRB31ltUrYQjEgbQ3AjLqphkoUwxhXG8CvPEF0oNVDlcHSErM4RPZDJ6Q0LVrghEU
	 J+6KQMpwNfVeRSMZB0E2xqDHGHKTbnEflZsBUx08=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67CB4F80249;
	Mon,  3 Apr 2023 09:08:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84370F8024C; Mon,  3 Apr 2023 09:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AAE5F8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 09:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AAE5F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QyTjx3gp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680505712; x=1712041712;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Z14ZgWQ7PAtGKqW1xLqpPRGzxTQkcM8qbmygRVkC0+g=;
  b=QyTjx3gpImvvVCDGtJk91yKZa2+WUvU5ciF9BnpcgqkhgvoyDb6vIjRf
   Pl7Rpj2AC096p0S6s0ROISCS5H31Rt3jHuBFnLBZARkHwAdD2PV5sO4KT
   QYI5QRGtljhzGbpgvojQ8GqG09TKn/Y2TYQiUOcVcg0ziYSnXJyLUXsRI
   zBmppdAyVDkGK9dlxMSMDRcvN5+TYtgSZCLtdMpRFG7tmTA6d3q9UdEaB
   MDPNrEQy7ddDKsxYBmUySUh+u3pNRL6IkegfIHHR3vju4Rlr3MC7kDORz
   m6sj63WvzwLqroT3Vo1DHS3Ao+0oWr97xIkX9Ux4sllO/bdvDkngFPiPd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321489809"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400";
   d="scan'208";a="321489809"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 00:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="718435532"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400";
   d="scan'208";a="718435532"
Received: from epologov-mobl2.ccr.corp.intel.com (HELO [10.252.52.206])
 ([10.252.52.206])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 00:08:11 -0700
Message-ID: <471b8f95-1c13-48bd-0491-cae0fe2ce824@linux.intel.com>
Date: Mon, 3 Apr 2023 10:08:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [bug report] ASoC: SOF: avoid a NULL dereference with unsupported
 widgets
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
 <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
 <b3671cde-7f77-48aa-a4a2-db25e141ff45@kili.mountain>
 <8f78395b-5cc3-e5da-90f2-2fa7114ddcfb@linux.intel.com>
 <9ab57cb9-8320-4891-beb9-50c57346d9e5@kili.mountain>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <9ab57cb9-8320-4891-beb9-50c57346d9e5@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2FX67JAIT24CIACN2CJYM2PLWBNZOSM5
X-Message-ID-Hash: 2FX67JAIT24CIACN2CJYM2PLWBNZOSM5
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FX67JAIT24CIACN2CJYM2PLWBNZOSM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 03/04/2023 08:54, Dan Carpenter wrote:
> On Mon, Apr 03, 2023 at 08:20:38AM +0300, Péter Ujfalusi wrote:
>>
>>
>> On 01/04/2023 10:44, Dan Carpenter wrote:
>>> On Fri, Mar 31, 2023 at 10:14:11AM +0300, Péter Ujfalusi wrote:
>>>> if src_fw_module is NULL then the print will be:
>>>> source (efault) or sink sink.module.name widget weren't set up properly
>>>>
>>>> Guennadi is relying on some black magic in the printk system to handle
>>>> the printing instead of open coding.
>>>
>>> I've done compiler related work and explored some weird aspect of the
>>> C language and I am so fascinated by this.  I would have thought it
>>> crashes before the function is called.  I cannot even imagine how black
>>> magic like this would work.
>>
>> I think it is not a compiler magic, but kernel magic:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/vsprintf.c#n700
>>
>>> Is there anyway I can test this?
>>
>> You could, If you have a laptop which uses SOF and it is Intel 11th gen
>> or newer then you can switch it to IPC4 and install the opt-in v2.5
>> (which would need with 6.4 kernel).
>> Apply this patch to 6.3-rc (or 6.2) and boot up, but unpatched kernel
>> will NULL dereference, so you need to have a backup option.
>>
>> https://github.com/thesofproject/sof-bin
>>
>> The v2.5 is not there as a release,you need to fetch the repo and follow
>> the instructions.
>>
>> Read the instruction in v2.5.x/README.md before attempting to use this
>> release.
>>
>> Now that I look back at the patch, yes it is not obvious, but it is
>> doing a valid thing.
> 
> Yeah.  Fine.  It doesn't crash but "valid" is kind of debatable.  It's
> a super ugly thing.

Well, it is going to behave in an expected way (print (efault) instead
of the module name in case it is not present).
By itself it is correct as this is a feature given by the kernel, on the
other hand, it could be improved to print the _swidget->widget->name and
a note, which side is missing the fw_module.

I can send a v2 with a new print without waiting for Guennadi in few hours.

-- 
Péter
