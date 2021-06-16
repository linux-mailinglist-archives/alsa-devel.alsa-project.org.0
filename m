Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BA3AA413
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 21:12:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D37816EB;
	Wed, 16 Jun 2021 21:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D37816EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623870776;
	bh=Djd1xykuIfQ4AlzslrkGdUb2vW2c43W7oNkeoBmUFjs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JzR1g+Dc1Kmc+0pEf/+ApnNcBFLT5YuiIxDvgXXS/ZMNeHoeeXBcOKKilcnLpC2zE
	 5JKFe5zDCZB0ckVA+5YhVRzmWO4v66zjQZMjLBomMzGIAFd1h9p7OkFFmQ36FC4an6
	 0nxWprwvY8wexYU+qFCMJua5AQ/ouM2VBn0QDHfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67E0F80165;
	Wed, 16 Jun 2021 21:11:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01432F80423; Wed, 16 Jun 2021 21:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D3E5F8028B
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 21:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D3E5F8028B
IronPort-SDR: G3lATC8EiNG3XOCq4V1Rbd0A5Ejf0pfk6MRaltHtaog9+rmTWV3WxfCweytN2AazaQ5F0MawTo
 g7dLdbNN8/kQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="206199498"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="206199498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 12:11:17 -0700
IronPort-SDR: n6zRFDrwjIzQ47702ClxTmPuOe3ZO+JXUoWxQtosamnGyR9/uvZ608qFuQhnMUaTWvtcZYsAfp
 Ft5a6WSHOxlg==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="640104279"
Received: from mindylam-mobl1.amr.corp.intel.com (HELO [10.213.182.47])
 ([10.213.182.47])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 12:11:14 -0700
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To: Cheng-yi Chiang <cychiang@chromium.org>
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
 <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
 <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7748e621-ba54-db90-6b56-23e006eb1dbe@linux.intel.com>
Date: Wed, 16 Jun 2021 11:23:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
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


>> I don't think it's correct to declare 4-channel support at the
>> individual codec DAI level when in practice each device will be provided
>> with a TDM mask that selects two slots.
> 
> On this platform there is no TDM support, so there were two I2S data lines.
> 
>>
>> This is confusing device capabilities and TDM link configuration.
> 
> I see that in most of the use cases of multiple amps, we should use
> codecs and num_codecs of the link.
> But in this case we only want one codec to control the only GPIO
> shared by 4 max98357a amps
> I think we should be able to use 1 max98357 codec and 3 dummy codec to
> fulfill this use case.
> Not sure if the number of dummy codec would really matter.
> With num_codec > 1 we should be able to bypass the channel checking
> and just use the channel from CPU DAI.

Interesting, I haven't seen such 'multi-lane' solutions so far for I2S.

