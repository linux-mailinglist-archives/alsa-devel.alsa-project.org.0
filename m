Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B14373A85F1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 18:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B42169B;
	Tue, 15 Jun 2021 18:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B42169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623772917;
	bh=y3LdWgYrhG0RCCsbHUtzZIkdvtA6lC/jkbvfWaPhT3g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZILVYJRJaFtpWlAKZJXCVETnrcr7wLUwS92PDSNOWNX6q/X0wQS/bLNiuaUSDhKX
	 /IHjVngMxsgauOjTEXqqSuKJApSXViL98sdxm7xtse9nwLKJwC7eVhZGBTCdk0sNEz
	 AaMNBx4ZNny1/2sWg4M3yurACD4+l4+ZrQIluDWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C55C2F8025A;
	Tue, 15 Jun 2021 18:00:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971C4F80113; Tue, 15 Jun 2021 18:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62C89F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 18:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C89F80113
IronPort-SDR: aUZk6ExugD1rpWh0/dWpOlhFchnl77eRicCJh+BupwxqSonYP3NTzo4u9C5Tv9uOmi6C0NqMbX
 0uuI7PUH8bTw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="269868541"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="269868541"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 09:00:14 -0700
IronPort-SDR: VuzC0kwC5Gd7fL4dcEBxLlwVKjbOSfVaWfYUJJcNryXABhVaEK7CES8NVtdky/X2ZqPP4QFqfA
 bw9EeubIQywg==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="487823401"
Received: from bgeagarc-mobl1.amr.corp.intel.com (HELO [10.209.128.67])
 ([10.209.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 09:00:11 -0700
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To: Cheng-yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
Date: Tue, 15 Jun 2021 11:00:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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



On 6/15/21 10:47 AM, Cheng-yi Chiang wrote:
> Hi Tzung-Bi,
> 
> On a platform, the four max98357a amps will be controlled by only one
> codec device, as GPIO for SD_MODE is shared by all amps and is the
> only thing to be controlled.
> In this sense, I think we can treat max98357a DAI as if it supports
> four channels.
> I understand that this solution is not scalable, because one can
> control as many amps as they want.
> Theoretically, the number of supported channels by this codec device
> is unlimited.
> I found that rt1015.c has similar usage.
> Do you have a better suggestion to support this kind of use case ?
> Thanks!

please don't top-post...

I don't think it's correct to declare 4-channel support at the 
individual codec DAI level when in practice each device will be provided 
with a TDM mask that selects two slots.

This is confusing device capabilities and TDM link configuration.

> On Tue, Jun 1, 2021 at 2:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>>
>> On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>>> Sets channels_max to 4 to support QUAD channel.
>>
>> Could you point out probably the up-to-date MAX98357A datasheet for
>> 4-channel support?
>>
>> On a related note, from the public datasheet I could find[1], "Table
>> 5" only shows 2 channel's configuration.
>>
>> [1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
