Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AEC2F20CE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:30:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 374F31747;
	Mon, 11 Jan 2021 21:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 374F31747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610397044;
	bh=RD+EP1iuw2MN4/WH+x0qA/FEncmO8Axa3NeAZqFHpVM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uM6IhJNOyQU8Zg6pUA9jxQlXSuLl4EnmSEXHV0S0zmnQhSCF77tnzuF9WR+QlVIDV
	 2miC8OhgiSt9VBU1q6niUUFlvGE5rTAf2c7EO5OWw/D4T+o+F9wZuKl+pHpYe7w8tX
	 D+ZzThN8sD+4WiBwbz8bBYO2K6IyKOM/AX7r2OcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC42F80475;
	Mon, 11 Jan 2021 21:29:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46976F80475; Mon, 11 Jan 2021 21:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48399F8016C
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 21:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48399F8016C
IronPort-SDR: +IgRyG12q+yqr7BRKnkqG7daxlUPMHpCSu8dSRD0bFBb3gwz+OSvgINWYt7gDxZMQYz3nzSKdy
 O01J+dAJY5IQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="262712509"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="262712509"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:37 -0800
IronPort-SDR: Wk15VZMYLhTSRJe+wM8eN+4NsVkhDFIAzmHLW+rsMFHB/6IN88TOVK44+axPb81kMjUhRzbz9A
 VbzTZmXIqtAg==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="344995380"
Received: from gkbech1x-mobl.amr.corp.intel.com (HELO [10.212.87.85])
 ([10.212.87.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:35 -0800
Subject: Re: [PATCH 13/14] ASoC: Intel: bytcr_wm5102: Add machine driver for
 BYT/WM5102
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-14-hdegoede@redhat.com>
 <20201229135836.GO9673@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b1a1a056-8347-5b5b-fcdd-8a37c24ecef9@linux.intel.com>
Date: Mon, 11 Jan 2021 11:54:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201229135836.GO9673@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, patches@opensource.cirrus.com,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>
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


>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_component_set_sysclk(codec_component, ARIZONA_CLK_OPCLK, 0,
>> +					   rate * sr_mult, SND_SOC_CLOCK_OUT);
>> +	if (ret) {
>> +		dev_err(codec_component->dev, "Error setting OPCLK: %d\n", ret);
>> +		return ret;
>> +	}
> 
> OPCLK is a clock that can be outputted on the CODECs GPIOs. Is
> that being used to clock some external component? If so it should
> be added to the DAPM graph, if not you might as well remove this
> call.

Thanks Charles for the feedback.

I have a vague recollection that the routing was supposed to be 
something like:

AP-----V
        WM5102----> BT HFP
Modem--^

with processing on WM5102.

But when I look at the initial Android code there are references to the 
HFP path being handled by the AP.

Probably better to remove this clock configuration if the need for it is 
unclear, the goal is only to enable speaker/headset for now.

