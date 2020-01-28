Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5614BDCF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 17:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB80166D;
	Tue, 28 Jan 2020 17:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB80166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580229230;
	bh=lnRIYlO1gVkdEFaS3p42AxfJ8BjULSuGzaNOTEXhAjg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXvRUo3TrtFUg6qG9qxmaKW3pyV6N4f2FPPtTZ2PT7ODbdomwwkeuzOs9++2M4BU4
	 6XsqkPYzN3uhmmDvkmLSZxc3eWm9vnApuH+XOGurMykWOTenS0BOhXdHLPddgpzZQr
	 CVGTLkN1eIclQSsBMSuY6VHtRpnAms5v8l387iZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C65CF801F7;
	Tue, 28 Jan 2020 17:32:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC903F801EB; Tue, 28 Jan 2020 17:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 133BAF80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 17:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133BAF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 08:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="232004573"
Received: from cauduong-mobl1.amr.corp.intel.com (HELO [10.254.184.245])
 ([10.254.184.245])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 08:31:52 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>
References: <877e1doeis.wl-kuninori.morimoto.gx@renesas.com>
 <871rrloehp.wl-kuninori.morimoto.gx@renesas.com>
 <s5himkwoyi6.wl-tiwai@suse.de>
 <87eevk2g2y.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <47c4b6a4-0385-68b7-3570-9e0f960a6a70@linux.intel.com>
Date: Tue, 28 Jan 2020 10:31:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87eevk2g2y.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 4/7] ASoC: soc-pcm: goto error after trying
 for_each_rtd_codec_dai
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



>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> soc_pcm_open() might goto error process *during* for_each_rtd_codec_dai.
>>> In such case, fallback process need to care about operated/non-operated
>>> codec dai.
>>>
>>> But, if it goto error process *after* loop even though error happen
>>> during loop, it don't need to care about operated/non-operated.
>>> In such case code can be more simple.
>>> This patch do it. And this is prepare for soc_snd_open() cleanup
>>
>> This would mean that snd_soc_dai_shutdown() is called even for the
>> stream that returned the error.  This isn't the expected behavior.
> 
> Yeah.
> Actually, I have plan to add such flag by other patch.
> But indeed order was reversed.
> Will fixup.
> 
>> Also, bit-OR-ing the multiple error codes isn't wise, they may return
>> different error codes, and you'll mixed up to a different number.
> 
> It is used at some architecture.
> But yes, let's think about better idea.
> Will return 1st error.

I also cringed on the bit-OR'ed error codes, but I saw it's already used 
in soc-pcm.c so thought it was an agreed precedent?

		ret |= snd_soc_component_close(component, substream);
		ret |= snd_soc_component_hw_free(component, substream);

I also don't like the idea of not stopping loops on errors, or releasing 
things that haven't been properly allocated. It does simplify error 
handling but it's asking for trouble.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
