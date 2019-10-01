Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1604C39DF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 18:05:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE631688;
	Tue,  1 Oct 2019 18:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE631688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569945940;
	bh=3Wjv6ZBqW1SFv0ZPbn9bHf3yZ4KwWLSlKcVzLp0ByE8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NkWghrfmItclrtRSRT9G5nRgbFR1UQGHQNIVTPhIyWQbz8l7DviwfQalk/WeXybVN
	 LuqbibnS3FMVltuj93dh95QEaMPS6gYntKEqcx6zENeHw4/4SZAOvd8ZgLCqMXAly4
	 Zqnz2bytZACv3+KK9mhF8ydZEJ1/KdwlIr4r/kE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC4E1F80506;
	Tue,  1 Oct 2019 18:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5143DF80506; Tue,  1 Oct 2019 18:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18CBAF80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 18:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18CBAF80482
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 09:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="216117152"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2019 09:03:46 -0700
Received: from abapat-mobl1.amr.corp.intel.com (unknown [10.251.1.101])
 by linux.intel.com (Postfix) with ESMTP id 1AC725803FA;
 Tue,  1 Oct 2019 09:03:46 -0700 (PDT)
To: Arnd Bergmann <arnd@arndb.de>
References: <20191001142026.1124917-1-arnd@arndb.de>
 <bb58c7cc-209d-7a2f-0e5b-95a9605ffe7b@linux.intel.com>
 <CAK8P3a3Js2dNhnRhP7PLadWZ69DZr1mz6DowN9HDJL4CFDAAFw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e4b90233-846c-bfc1-68a3-a7b7c28b60bd@linux.intel.com>
Date: Tue, 1 Oct 2019 11:03:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3Js2dNhnRhP7PLadWZ69DZr1mz6DowN9HDJL4CFDAAFw@mail.gmail.com>
Content-Language: en-US
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: imx: fix reverse
 CONFIG_SND_SOC_SOF_OF dependency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/1/19 10:41 AM, Arnd Bergmann wrote:
> On Tue, Oct 1, 2019 at 5:32 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> On 10/1/19 9:20 AM, Arnd Bergmann wrote:
>>> CONFIG_SND_SOC_SOF_IMX depends on CONFIG_SND_SOC_SOF, but is in
>>> turn referenced by the sof-of-dev driver. This creates a reverse
>>> dependency that manifests in a link error when CONFIG_SND_SOC_SOF_OF
>>> is built-in but CONFIG_SND_SOC_SOF_IMX=m:
>>>
>>> sound/soc/sof/sof-of-dev.o:(.data+0x118): undefined reference to `sof_imx8_ops'
>>>
>>> Make the latter a 'bool' symbol and change the Makefile so the imx8
>>> driver is compiled the same way as the driver using it.
>>>
>>> A nicer way would be to reverse the layering and move all
>>> the imx specific bits of sof-of-dev.c into the imx driver
>>> itself, which can then call into the common code. Doing this
>>> would need more testing and can be done if we add another
>>> driver like the first one.
>>
>> Or use something like
>>
>> config SND_SOC_SOF_IMX8_SUPPORT
>>          bool "SOF support for i.MX8"
>>          depends on IMX_SCU
>>          depends on IMX_DSP
>>
>> config SND_SOC_SOF_IMX8
>>          tristate
>>          <i.mx selects>
>>
>> config SND_SOC_SOF_OF
>>          depends on OF
>>          select SND_SOC_SOF_IMX8 if SND_SOC_SOF_IMX8_SUPPORT
>>
>> That way you propagate the module/built-in information. That's how we
>> fixed those issues for the Intel parts.
> 
> Yes, I think that would work here as well, but it keeps even more
> information about the specific drivers in the generic code. It also
> requires adding more 'select' statements that tend to cause more
> problems.
> 
> The same could be done with a Kconfig-only solution avoiding
> 'select' such as:
> 
> config SND_SOC_SOF_IMX8_SUPPORT
>           bool "SOF support for i.MX8"
>           depends on IMX_SCU
>           depends on IMX_DSP
> 
>   config SND_SOC_SOF_IMX8
>           def_tristate SND_SOC_SOF_OF
>           depends on SND_SOC_SOF_IMX8_SUPPORT

Ah, nice, thanks for the suggestion! That would be my preference, we 
have a similar select for PCI and ACPI parts in sound/soc/sof/Kconfig 
and I was looking for a means to do this more elegantly.
I can submit a new fix or let you sent a v2, whatever is more convenient.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
