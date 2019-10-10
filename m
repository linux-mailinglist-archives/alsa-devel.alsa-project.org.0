Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E219D2C06
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C194E;
	Thu, 10 Oct 2019 16:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C194E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570716217;
	bh=i6XKlt0Tq9UPm9p5AWBGQpQ+xd4wyk3Y60GNjEKlBIk=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4F4hsnbg9zk0RK7fczkGnYveokvaSY7Isvjh0lBBVhkkrhTCDXU+dz0xZZLEphnq
	 o3KOcX1aYgxhQiqgH9ccnv+xnXTCilzFC3J4VAlXQItFejZt1GhVodDUzfks2/DKnl
	 mb6royAEXlbnoB9Rf2wrlFMLl/xD2rEskBFWPoOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58467F80322;
	Thu, 10 Oct 2019 16:01:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01537F8038F; Thu, 10 Oct 2019 16:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E579F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E579F802BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 07:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="197257569"
Received: from unknown (HELO [10.254.187.20]) ([10.254.187.20])
 by orsmga003.jf.intel.com with ESMTP; 10 Oct 2019 07:01:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
 <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
 <20191010120337.GB31391@ediswmail.ad.cirrus.com>
Message-ID: <22eff3aa-dfd6-1ee5-8f22-2af492286053@linux.intel.com>
Date: Thu, 10 Oct 2019 09:01:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010120337.GB31391@ediswmail.ad.cirrus.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, Vinod Koul <vkoul@kernel.org>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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


>>> It's been a while since this thread started, and I still don't
>>> quite get the concepts or logic.
>>>
>>> First, I don't understand what the problem with "aux" devices is.
>>> All the SoundWire stuff is based on the concept of DAI, so I guess
>>> I am
>>
>> That is the actual problem! Some aux devices does not have dais.
>>
> 
> Usually aux devices are used for things like analog amplifiers that
> clearly don't have a digital interface, thus it really makes no sense
> to have a DAI link connecting them. So I guess my question here
> would be what is the thinking on making the "smart amplifier" dailess?
> It feels like having a CODEC to CODEC DAI between the CODEC and
> the AMP would be a more obvious way to connect the two devices
> and would presumably avoid the issues being discussed around the
> patch.

Ah, now I get it, I missed the point about not having DAIs for the 
amplifier.

I will second Charles' point, the code you have in the machine driver at 
[1] gets a SoundWire stream context from the SLIMbus codec dai. It's a 
bit odd to mix layers this way.


And if I look at the code below, taken from [1], if you have more than 
one codec, then your code looks problematic: data->sruntime would be 
overriden and you'd use the info from the last codec dai on the dailink...

case SLIMBUS_0_RX...SLIMBUS_6_TX:
   for (i = 0 ; i < dai_link->num_codecs; i++) {
     [snip]
     data->sruntime[cpu_dai->id] =
	snd_soc_dai_get_sdw_stream(rtd->codec_dais[i], 0); << same destination 
for multiple codec_dais...

If you keep the amp dai-less, then the stream concept should be somehow 
allocated on the master (or machine) side and passed to the codec dais 
that are associated to the same 'stream'.
	

[1] 
https://git.linaro.org/people/srinivas.kandagatla/linux.git/tree/sound/soc/qcom/db845c.c?h=release/db845c/qcomlt-5.2 


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
