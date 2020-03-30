Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD60B1975A1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C2941658;
	Mon, 30 Mar 2020 09:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C2941658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553254;
	bh=FdOfKK56CcZS7xHCVHkAKHvBJzto/C/Z0NJ02HHdqgQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rXAFi09wvRDnRhVEQ6NvMfoIXk9jc3bvqtA/10D+tkgKVhhZEkHo2WHXD48AzDhoZ
	 oxDa8wYXYq9Ri6h+DTpcYUaOhS1CJiBPFmZLfnbf23oxGVJeR3F+xoxt5hfuJTsBty
	 ISgGCDXTNHnzLI1Na2yx8qnCEqMXo7gwSyp5GI6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C019F8014A;
	Mon, 30 Mar 2020 09:25:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 222AAF80148; Mon, 30 Mar 2020 09:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0333F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0333F800EB
IronPort-SDR: ykNHzjm4HWEZMHMZJX4xR/vGAJ0IOmVlAlG4mFixrTkIF1x0W8VEscu1F+baFCrG4UqyK2Z8hM
 rlfJAQKdkPig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 00:25:37 -0700
IronPort-SDR: 1VuR2d5/4HK8QdOueoXtD46A+ThCuOBTBRRoe4yu+5/j9dT/3ZnwV1j3NBQRW4CqtWG5AftHkk
 C3EpXJ5OBXUg==
X-IronPort-AV: E=Sophos;i="5.72,323,1580803200"; d="scan'208";a="395039944"
Received: from unknown (HELO [10.249.135.1]) ([10.249.135.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 00:25:32 -0700
Subject: Re: [alsa-devel] [PATCH v3 5/8] ASoC: soc-pcm: call
 snd_soc_dai_startup()/shutdown() once
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <875zgfcey5.wl-kuninori.morimoto.gx@renesas.com>
 <54b81b41-f4cf-c28c-0ec5-363e2c62796b@linux.intel.com>
 <df297c98-74a4-fe61-9c61-563a5bae2615@linux.intel.com>
 <87lfnibqba.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <d7f0fc98-afbf-c6ea-22d2-690f988b1d1a@linux.intel.com>
Date: Mon, 30 Mar 2020 09:25:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87lfnibqba.wl-kuninori.morimoto.gx@renesas.com>
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



On 3/30/2020 3:10 AM, Kuninori Morimoto wrote:
> 
> Hi Amadeusz, Pierre-Louis
> 
> Thank you for your feedback, and sorry to bother you.
> 
>>> the above change breaks simultaneous playback and capture on single
>>> DAI in more complicated use cases. With above change when one runs
>>> playback first, startup callback is skipped when running capture
>>> while playback is still running.
> 
> Similar issue had been happened on component open before.
> https://lore.kernel.org/alsa-devel/20200219182650.1416-1-kai.vehmanen@linux.intel.com/
> 
> I'm so sorry but this is bug.
> In my quick check, this patch is not related to other patches.
> So, just reverting it is nice idea, I think.
> 
>> Should the 'started' bitfield should be an array for capture and
>> playback cases respectively? e.g.
> 
> Yeah.
> But, I will re-try this issue (for DAI, for Component) again.
> Let's just revert it so far.
> Is it OK for you ?
> 
> Thank you for your help !!
> 

Hi,

I tested patch from Pierre and it works for me, I'm also ok with revert.

Thanks,
Amadeusz
