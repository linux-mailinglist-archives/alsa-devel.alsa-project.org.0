Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DDC33D676
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 16:06:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C57618EE;
	Tue, 16 Mar 2021 16:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C57618EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615907192;
	bh=2JQWrD1BEdDFhiO+/je+FGCZdigzlLU21cRM7PU/4u4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a7zZJ8tTOIlYKN4L4tsU9nuB5euiMxxTm6RmeHZ6eK9iKuLgHQowbgG50v+IHEFmP
	 iVWp3uaqEQI73bjhwlZLJ8BsuqzNxWeuJB+kCC+dG4HD+uTez1Bb0rpEsv5Ay0hb04
	 ENuqzxVB1FqVPfFS5F3qPmzH2/UISIYZi0fEd4Qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB6BEF8027D;
	Tue, 16 Mar 2021 16:05:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B95F7F8032C; Tue, 16 Mar 2021 16:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C33BF8026A
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 16:04:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C33BF8026A
IronPort-SDR: kV+v1mGnqA1dutpM7szaWc+3JELjFb26oAonlLL4Cq8V/XlRhCdIjLJDy1PzCSjuR/+bHvlJ7o
 ovHZVgKL5o4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="189367868"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="189367868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 08:04:45 -0700
IronPort-SDR: ZGgvL0zLqcwacdfAybfgzcPBHc5oXgdtfqdvBMp77181rJn6gKrGGmkEXJbFlex8iA2Ksjfev8
 GCcpTqNW3oZg==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="601857037"
Received: from mdacha-mobl3.amr.corp.intel.com (HELO [10.212.75.21])
 ([10.212.75.21])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 08:04:43 -0700
Subject: Re: [PATCH v3] ASoC: amd: add support for rt5682 codec in machine
 driver
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <1615824133-21553-1-git-send-email-Vijendar.Mukunda@amd.com>
 <efa02319-2abf-4fb9-efec-13b6279f3d78@linux.intel.com>
 <87f41e68-3158-38f8-5e84-270ab184691b@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6bdef069-374a-d215-30a4-715e05304fc7@linux.intel.com>
Date: Tue, 16 Mar 2021 09:53:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87f41e68-3158-38f8-5e84-270ab184691b@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Chuhong Yuan <hslester96@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Alexander.Deucher@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Virendra-Pratap.Arya@amd.com, Murali-krishna.Vemuri@amd.com
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



On 3/16/21 8:37 AM, Mukunda,Vijendar wrote:
> 
> 
> On 15/03/21 9:30 pm, Pierre-Louis Bossart wrote:
>>
>>> +static int rt5682_clk_enable(struct snd_pcm_substream *substream)
>>> +{
>>> +    int ret;
>>> +    struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>>> +
>>> +    /*
>>> +     * Set wclk to 48000 because the rate constraint of this driver is
>>> +     * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
>>> +     * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
>>> +     * source so for all codecs we have to limit bclk to 64X lrclk.
>>> +     */
>>> +    clk_set_rate(rt5682_dai_wclk, 48000);
>>> +    clk_set_rate(rt5682_dai_bclk, 48000 * 64);
>>> +    ret = clk_prepare_enable(rt5682_dai_bclk);
>>> +    if (ret < 0) {
>>> +        dev_err(rtd->dev, "can't enable master clock %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    return ret;
>>> +}
>>
>> Out of curiosity, is there a reason why you use clk_prepare_enable() 
>> for the bclk but not for the wclk?These changes were shared by codec 
>> vendor as an initial patch.
> We should use clk_prepare_enable() for wclk not for bclk.
> We will update and share the new patch.

Well the question remains: if you have two clocks and only enable one, 
why do you need to get two clocks.

Also this patch was modeled after the da7219 case, where the same open 
applies.
