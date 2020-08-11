Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA3241736
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 09:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DDC184B;
	Tue, 11 Aug 2020 09:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DDC184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597131149;
	bh=gg4BK8MIbEobdX5yRb50MyBRHrKGJ6t41M8LmSlWdDk=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcHXspKX3jJh3rMj7rZLDy3Din6AeT4F33zLqNjwksRwdDzHdKr9rly8TliiPX2o7
	 y345YF4l1uIT0bnMSmvkxwJO4gUA0xBzwjUfluIe0hLJukw/Q/a4zIYXKb1g8wZ+u1
	 WEKHgILu5Gx6DNcJsnsh6hZm9QVgciZRI/gSTfws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F124F80161;
	Tue, 11 Aug 2020 09:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B3CBF8015B; Tue, 11 Aug 2020 09:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73491F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 09:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73491F800D3
IronPort-SDR: 9e0buFu1vtb3S0x098pri/KXslhR+TfB6oxbix++8sZBpsglOYP5G7gbc3N125aiRwkOIOIqJ+
 96IsFiq7qwxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="151359723"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="151359723"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 00:30:27 -0700
IronPort-SDR: ULYzAC9OOyivaB4WrLTMqpYT6YbtjqsveKrIHy//fZL+st7qVc/Y8s3OPEQEPbT/xYUko1p1pP
 JeH3/yRY/WFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="317631427"
Received: from tpawlows-mobl.ger.corp.intel.com (HELO [10.213.31.191])
 ([10.213.31.191])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 00:30:21 -0700
Subject: Re: [PATCH 07/13] ASoC: Intel: catpt: Event tracing
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-8-cezary.rojewski@intel.com>
 <20200807150908.GN5435@sirena.org.uk>
 <2e964389-9917-91a4-5f41-7031e54f83a5@intel.com>
Message-ID: <b7b1d286-0920-2c49-b227-1c49840d20b8@intel.com>
Date: Tue, 11 Aug 2020 09:30:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2e964389-9917-91a4-5f41-7031e54f83a5@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On 2020-08-10 9:16 AM, Cezary Rojewski wrote:
> On 2020-08-07 5:09 PM, Mark Brown wrote:
>> On Fri, Aug 07, 2020 at 01:06:43PM +0200, Cezary Rojewski wrote:
>>> Define tracing macros for easy catpt debug. These are divided into
>>> memory, registry and ipc event categories.
>>>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>   sound/soc/intel/catpt/trace.h | 169 ++++++++++++++++++++++++++++++++++
>>
>> Usually events go into include/trace/events/
>>
> 
> Thought TRACE_INCLUDE_FILE/ _PATH are designed specifically to remove 
> the need for trace.h to go into mentioned folder. Based my decision on 
> fact that sound/hda and sound/core have their traces defined locally.
> 
> What's the preferred way?
> 

In regard to preferences, one more question Mark, if I may:
	snd_soc_catpt vs snd_soc_intel_catpt

while developers usually prefer the shorter ones, I understand there 
might be some subsystem level preferences and currently chosen name 
could have easily slipped reviewers given the length of patchset.

Czarek
