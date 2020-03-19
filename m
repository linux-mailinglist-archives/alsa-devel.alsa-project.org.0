Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5B18C06C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 20:31:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65EBD179C;
	Thu, 19 Mar 2020 20:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65EBD179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584646267;
	bh=rq5oP6Ug5Od0LjTx0LNJMTIVmmDG7cUK91FxWANfZiE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOKDqcpXos6CPdhaEfhDIlrHHX5K4DVUxbhSwb0FzXfX1wuc9XwUZHwTOVn1U/hp/
	 JoyEntkIXPIuevoDNIkKIhKCKUMZjRCPi7YS+7iqSAEeCfExnjuGqcLCXnFqlqDSun
	 EvmWZjxFMdM/Dp9IsCa0QVJvNr5dCeZIY0QNToBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19695F8028B;
	Thu, 19 Mar 2020 20:29:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9EF4F8023E; Thu, 19 Mar 2020 20:29:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F8ADF80217
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 20:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F8ADF80217
IronPort-SDR: OaUd89KBLxc07poA4AcNTnzTOAmE3RY6dSTBXsBvYt4cp6Tke4i2NTK2zYo5iCTckRAhtDIXGX
 ZYBIuEZRoNaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 12:29:17 -0700
IronPort-SDR: MQXloGgtmfQmn2lTbl+0WLbHTx9QpCVk0qFlUxv6GOqn/OpUgA3EDvcUSRLeEL1HnuDHbQR4cA
 TjDyvYis4T+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="391905475"
Received: from mallani-mobl.amr.corp.intel.com (HELO [10.255.35.49])
 ([10.255.35.49])
 by orsmga004.jf.intel.com with ESMTP; 19 Mar 2020 12:29:16 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>
References: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <a7bf2aee-78e7-f905-bcc3-cd21bf16a976@intel.com>
 <20200319182413.GA3968@light.dominikbrodowski.net>
 <750f7841-0b95-9fa8-d858-e0bff4d834d5@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f6b7c60a-d99e-c140-31d0-0b56960c3ec9@linux.intel.com>
Date: Thu, 19 Mar 2020 14:05:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <750f7841-0b95-9fa8-d858-e0bff4d834d5@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, Keyon Jie <yang.jie@linux.intel.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 3/19/20 1:35 PM, Cezary Rojewski wrote:
> On 2020-03-19 19:24, Dominik Brodowski wrote:
>> On Thu, Mar 19, 2020 at 06:33:50PM +0100, Cezary Rojewski wrote:
>>>
>>> Could you confirm the same happens on your machine when revert of 
>>> mentioned
>>> patch is not applied ("stream is NULL" messages occur)? Issue may be
>>> harmless but explained sequence does not look right.
>>
>> Indeed, I still see
>>
>> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no 
>> stream to reset, ignore it.
>> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no 
>> stream to free, ignore it.
>> haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox readback FW 
>> info: type 01, - version: 00.00, build 77, source commit id: 
>> 876ac6906f31a43b6772b23c7c983ce9dcb18a19
>> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no 
>> stream to reset, ignore it.
>> haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no 
>> stream to free, ignore it.
>>
>> though sounds continues to work.
>>
> 
> Thanks once again for your input and time!
> 
> I'll prepare patches for both issues. My guess is haswell-pcm could be 
> updated to handle 'platform' component param just fine, but it is 
> probably a change of more than few lines. I'd rather revert non-SOF 
> broadwell to its previous behavior and start a separate task from there.

It'd be good to know why a dummy platform component is required though.
