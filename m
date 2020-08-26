Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4E2531A7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 16:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BBF1743;
	Wed, 26 Aug 2020 16:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BBF1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598452982;
	bh=QHQ7Ii82LXKjYwCKdZMldkrauqmqvMhAbHmnwbtqIZE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDJk5IjqGLUk8ydSayomm3brNyWohNB38GLP/XyGRWQU60R+yLf7tkzlPCAwlYVNR
	 7PHVIbd+4WHdp6oKI9zoshxmd4759dbihpbpNa/IfgB7Cnk4KFPU82cc5jT6pbD3vJ
	 8eqbICNP01ZP79LjAFCNE5e5nXwTxKk8RnsjUte4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12D7CF801F2;
	Wed, 26 Aug 2020 16:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BCFAF801EC; Wed, 26 Aug 2020 16:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E065DF801D9
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 16:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E065DF801D9
IronPort-SDR: UST+05oNcoDyhwcyr4deKusL6pYo1gx4y7sEOS3yNn/iii+ht9hmShY6PNWCRH/WK/Kfh1gi3q
 jrRcXeMhTZ6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="135849038"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="135849038"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 07:40:22 -0700
IronPort-SDR: 3qQWmHAeoyu+Ah83AqVvZtMwmiF0fwP9YBedaITiYvRLqQEMSxRS2DLLjiu+Bf2T0sqk4dB+OS
 AK/EvdCcWAvQ==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="299494867"
Received: from gillelas-mobl1.amr.corp.intel.com (HELO [10.255.231.51])
 ([10.255.231.51])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 07:40:20 -0700
Subject: Re: [PATCH 07/11] soundwire: intel: Only call sdw stream APIs for the
 first cpu_dai
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
 <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
 <20200826094636.GB2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5a7b75e5-4d64-9927-df81-68164ef2662a@linux.intel.com>
Date: Wed, 26 Aug 2020 09:35:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826094636.GB2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


>> -	ret = sdw_prepare_stream(dma->stream);
>> +	/*
>> +	 * All cpu dais belong to a stream. To ensure sdw_prepare_stream
>> +	 * is called once per stream, we should call it only when
>> +	 * dai = first_cpu_dai.
>> +	 */
>> +	if (first_cpu_dai == dai)
>> +		ret = sdw_prepare_stream(dma->stream);
> 
> Hmmm why not use the one place which is unique in the card to call this,
> hint machine dais are only called once.

we are already calling directly sdw_startup_stream() and 
sdw_shutdown_stream() from the machine driver.

We could call sdw_stream_enable() in the dailink .trigger as well, since 
it only calls the stream API.

However for both .prepare() and .hw_free() there are a set of dai-level 
configurations using static functions defined only in intel.c, and I 
don't think we can move the code to the machine driver, or split the 
prepare/hw_free in two (dailink and dai operations).

I am not against your idea, I am not sure if it can be done.

Would you be ok to merge this as a first step and let us work on an 
optimization later (which would require ASoC/SoundWire synchronization)?


