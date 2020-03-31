Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4715199369
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 12:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618DF1658;
	Tue, 31 Mar 2020 12:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618DF1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585650627;
	bh=5c6ldzLoJGoZ64/+nadWQXKpxw1tkIs+ygHRGhk/dnc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZCIb3HVp0vbnU+WuD+Cd648/Igl5oj0BDLzzURJkCvltXVBSOapwZudFuBgrI3El
	 zDpo0cFbe35jQY5UIUHubrbCERB7v3MF7LOlbQSNJgzWgx6B7q7HIk03UshcuojWFE
	 +X+8Bh4OI8jateYMEsteTz4t/9LI0t8nnOBJTZAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D16F800AA;
	Tue, 31 Mar 2020 12:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75C17F80146; Tue, 31 Mar 2020 12:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25638F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 12:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25638F8010D
IronPort-SDR: j27oW6BXUcSKBfRbs7OdDkvkJVO6NYtolUf/BCFzm45EyR7Y/W9JXZCkDVucBoVwf4S6Z9/0e0
 PEx3uiYRJdQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 03:28:28 -0700
IronPort-SDR: 0oYkq1L8SC0Jmf42og5EgfZTQVJsys6By+Rpr9rSzokV2sjPtNt89HevlkWrvzgQ8Fbsl8s76+
 4qNEBo1Cm7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="272698098"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.17.105])
 ([10.213.17.105])
 by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2020 03:28:24 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <9f1884b4-e356-9a8f-6912-0d55c4bcbf06@intel.com>
Date: Tue, 31 Mar 2020 12:28:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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

On 2020-03-30 23:39, Hans de Goede wrote:
> Hi,
> 
>> On 3/19/20 11:14 PM, Pierre-Louis Bossart wrote:
>>
>> we should ask Ben and Curtis @ Google if the changes related to 
>> suspend interfere with the wake-on-voice support?
>>
>> Btw the .ignore_suspend is also set in bytcr_rt5640/51 drivers, so 
>> wondering if additional devices are broken, or if there's something 
>> off about Broadwell in general. Hans, have you heard of any 
>> regressions on Baytrail devices?
> 
> I've just tested 5.6.0 on Bay Trail + a rt5651 codec,
> using the bytcr_rt5651 machine driver which sets
> ignore_suspend, as well as on a Cherry Trail + rt5645
> device using the chtrt5645 machine driver which does
> _not_ set ignore suspend.
> 
> Suspend/resume work fine on both and music playing
> before suspend continues playing after suspend.
> 
> Note that the bytcr_rt5651 machine driver also does:
> 
>          snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
>          snd_soc_dapm_ignore_suspend(&card->dapm, "Speaker");
> 
> Which the bdw-rt5677 seems to not do...
> 
> Regards,
> 
> Hans
> 

Thanks for your report Hans!

As all streams (whether that's playback routed through Headphones or 
Speaker, or capture) were connected to SSP0 dai link, there is a 
question to be raised: Is Capture path needed to be up during suspend 
for broadwell solutions?

Guess these two lines you mentioned above have the exact same impact on 
playback as complete .ignore_suspend flag removal from SSP0 dai link.

Don't believe WoV for WPT has been added for SST linux so 
.ignore_suspend=1 achieves nothing. The offload part is probably just 
limited to bigger buffer size compared to system pin than anything else. 
So, nothing prevents from removing .ignore_suspend for SST solutions 
until WoV is verified. Don't know about SOF side.
Pierre, what's your take on this?

Czarek
