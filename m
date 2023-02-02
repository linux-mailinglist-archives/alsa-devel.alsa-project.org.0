Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7896878DC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 10:32:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E42F7F1;
	Thu,  2 Feb 2023 10:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E42F7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675330355;
	bh=LhJvtpyTm7/7KJmpK0D5gRr2h1YWr/R+/WuVOeTa2rQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t/SlrgPWBFFfNyKRpF7v4FeQBlfrVvasAEruQSlDIKn09pUUQ3COSNanmwZ5k4jZM
	 sP/9AHJwEaU6AbaEhTtaE6UmEjf6p6hKdIwX7s2M5bw054EWsKrjVF/KJYaMDMfMaW
	 TeGGSnqjTUwXQTudVt0oOIOY1Xjd9O7iqtea597E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5B7F800E3;
	Thu,  2 Feb 2023 10:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F4BF804C2; Thu,  2 Feb 2023 10:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50B27F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 10:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B27F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GCiYkTi8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675330286; x=1706866286;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LhJvtpyTm7/7KJmpK0D5gRr2h1YWr/R+/WuVOeTa2rQ=;
 b=GCiYkTi8fSZkol/uh7fIxwqckZr75PX9O5nnAFtcD/rHjCumd9/rT/Tv
 ivNRuwbHBDrrHaSM+sHXPbqbdokfsD5hzFNDROHYpwH0OnsChTs2/+NRL
 4J5rgNutm00j8inSC+bQi79R6l/+bntwc8zLDC2xKd3Ge/QtF0hegA+Lt
 ooa/KquqYPWeBEzSIYXD2PtUmF0w2K6uAxLJqI6wifFZBBjJ1GFLfmC99
 ifmAQGnkUfPZwZsRzE5yEJn4YwVdzJluYENyGBTVZ/Q06HOCbG3r2W9GS
 XEPIl56j6IRJmI6ow8r/eQBsB7yIT4AQQd2WB3NAkCAXExZOmTveghe33 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308742435"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308742435"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:31:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697625695"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="697625695"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO [10.252.1.104])
 ([10.252.1.104])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:31:18 -0800
Message-ID: <0392c6bf-39e4-e9ef-99f3-728dbc3e35b6@linux.intel.com>
Date: Thu, 2 Feb 2023 11:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 9/9] ASoC: SOF: ipc4-pcm: add delay function support
To: Jaroslav Kysela <perex@perex.cz>, lgirdwood@gmail.com, broonie@kernel.org
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
 <20230201123231.26361-10-peter.ujfalusi@linux.intel.com>
 <d5f6aa34-4fff-9e23-0811-de1ee6d8a2e9@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <d5f6aa34-4fff-9e23-0811-de1ee6d8a2e9@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 01/02/2023 14:44, Jaroslav Kysela wrote:
> On 01. 02. 23 13:32, Peter Ujfalusi wrote:
> 
>> +static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component
>> *component,
>> +                        struct snd_pcm_substream *substream)
>> +{
> 
> ...
> 
>> +
>> +    /*
>> +     * Handle 32-bit counter wrap around, which would happen
>> +     * for a 48khz 2ch stream in 24.855 hours
>> +     */
>> +    link_ptr = tmp_ptr & UINT_MAX;
>> +
>> +    host_ptr = substream->runtime->status->hw_ptr;
>> +
>> +    if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +        return host_ptr - link_ptr;
>> +
>> +    return link_ptr - host_ptr;
> 
> I don't think that this calculation is fine for the wrap point. The
> hw_ptr is in range 0..pcm_boundary not UINT_MAX.

That is true. Our link counter is u64 (and it is counting the bytes, not
a real DMA position) so I can
tmp_ptr %= substream->runtime->boundary;

then handle the wrap of both later.

> Also, you should consider the underrun/overrun situations.

>The simple substraction is not enough to handle this correctly.

Yes, you are right. I will send v2 right away(ish)

Thanks,
Péter
