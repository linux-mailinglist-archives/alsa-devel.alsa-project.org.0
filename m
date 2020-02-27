Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2C170D5F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 01:42:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78D8169B;
	Thu, 27 Feb 2020 01:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78D8169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582764121;
	bh=WGITMeNm9IghyFy9BIxe8aNF3+BLI70qjTtd3Kc3nwY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tV0FQlwIjtpXBfF6mhkTUYfeQsO7qnqwgaqDygUVUGUALMvaQm4iK8YUWO+voc9nh
	 Bo4kOxEFPYufpDPWu0HGe5HHwmEi9MHnVHPX7dIwzcIuzw/KXjlIgC8krWLn0fTwIv
	 D1I/gqCAHKigcdqffyIMycPX4BcWUxf981iAMZps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA78F800E8;
	Thu, 27 Feb 2020 01:40:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B89FF8014E; Thu, 27 Feb 2020 01:40:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38410F800E8
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 01:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38410F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 16:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,490,1574150400"; d="scan'208";a="285159557"
Received: from unknown (HELO [10.251.27.58]) ([10.251.27.58])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Feb 2020 16:40:11 -0800
Subject: Re: [PATCH 6/8] ASoC: soc-pcm: check DAI's activity more simply
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87eeuh97k4.wl-kuninori.morimoto.gx@renesas.com>
 <875zft97i4.wl-kuninori.morimoto.gx@renesas.com>
 <704a2cb1-ebcd-d433-0b8a-0f8d97d72fa5@linux.intel.com>
 <87v9ns7tpk.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f99bfbaa-c1a3-3545-aef9-dcb6ad9bd77f@linux.intel.com>
Date: Wed, 26 Feb 2020 18:40:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87v9ns7tpk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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



>>> -		if ((playback && playback_active == 1) ||
>>> -		    (!playback && capture_active == 1))
>>> +		if (codec_dai->active == 1)
>>
>> nit-pick: we have two tests in soc-pcm.c
>>
>> if (codec_dai->active)
>> if (codec_dai->active == 1)
>>
>> The two are functionality equivalent but it'd be good to choose one
>> version - or possibly use 'active' as a boolean.
> 
> In my understanding, dai->active can be 0/1/2.

I see, I guess I missed this completely. Thanks Morimoto-san for the 
precision.
