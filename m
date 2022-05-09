Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9151FE58
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 15:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5F518E1;
	Mon,  9 May 2022 15:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5F518E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652103177;
	bh=GEnD1FBDizIqwkOcLdZXmPV+SgRq64ykgBvQxT7zusI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fncGpgxtAYZvt9N8sHtvTE1VcHjKTyCfpvF1GJmgLIjgqPpM5siNHPqeufd12NBOD
	 Fvlvx7rsWS6frmAgPCs1B7iyLIuymcnIXBtpxxHnYoL0lvDQS7tyo4nW7cRimbwz8l
	 AgjaFvqOMYmp2YiX7qvPyIi/fBdBuKLZyQNaqiAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D278F80269;
	Mon,  9 May 2022 15:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 372BDF8025D; Mon,  9 May 2022 15:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B93B6F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 15:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B93B6F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V5P6wdH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652103111; x=1683639111;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GEnD1FBDizIqwkOcLdZXmPV+SgRq64ykgBvQxT7zusI=;
 b=V5P6wdH1WuPZqqo6X9RKlUH1hA43+FidJDe0XuC8DnTOWGjMsoF+D3AU
 hhTbuCR9gl0JUEcqVfOs8/RTGBDvaubXTyfc502YkSzduBle6AkkgoEdY
 q/kAbuHBwQGZhmMNnmvcwdVbm4wJP7lbprNAcWU6GP03oEO+9A3kvInV4
 b4PEgB0KjKkfo3w6dE64II8zw+POuuOLynQRipgc6WGRm8t7taAALtjB/
 EG8PHMk5Z6tQhXY+0QB4zKeMN0sIiGUofA0DeRXnVkIyj1VpU0OI5pKzW
 pWNr+VrH4ZX/dEIr0EDk5gKNYfEQ+lZtP4aDVG4KbfIs96DJ4+lSOJcJ9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294275022"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="294275022"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 06:31:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="696536444"
Received: from bjsmith1-mobl2.amr.corp.intel.com (HELO [10.212.144.50])
 ([10.212.144.50])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 06:31:44 -0700
Message-ID: <d9646029-29b1-d71b-d1f5-b33267888e3c@linux.intel.com>
Date: Mon, 9 May 2022 08:31:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
 <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
 <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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



On 5/7/22 01:52, Srinivas Kandagatla wrote:
> Thanks Pierre,
> 
> On 06/05/2022 15:13, Pierre-Louis Bossart wrote:
>>
>>
>> On 5/6/22 03:47, Srinivas Kandagatla wrote:
>>> Currently timeout for autoenumeration during probe and bus reset is
>>> set to
>>> 2 secs which is really a big value. This can have an adverse effect on
>>> boot time if the slave device is not ready/reset.
>>> This was the case with wcd938x which was not reset yet but we spent 2
>>> secs waiting in the soundwire controller probe. Reduce this time to
>>> 1/10 of Hz which should be good enough time to finish autoenumeration
>>> if any slaves are available on the bus.
>>
>> Humm, now that I think of it I am not sure what reducing the timeout
>> does.
>>
>> It's clear that autoenumeration should be very fast, but if there is
>> nothing to enumerate what would happen then? It seems that reducing the
>> timeout value only forces an inconsistent configuration to be exposed
>> earlier, but that would not result in a functional change where the
>> missing device would magically appear, would it? Is this change mainly
>> to make the tests fail faster? If the 'slave device is not ready/reset',
>> is there a recovery mechanism to recheck later?
>>
>> Would you mind clarifying what happens after the timeout, and why the
>> timeout would happen in the first place?
> 
> This issue is mostly present/seen with WCD938x codec due to its Linux
> device model.
> WCD938x Codec has 3 Linux component drivers
> 1. TX Component (A soundwire device connected to TX Soundwire Master)
> 2. RX Component (A soundwire device connected to RX Soundwire Master)
> 3. Master Component (Linux component framework master for (1) and  (2)
> and registers ASoC codec)
> 
> Also we have only one reset for (1) and (2).
> 
> reset line is handled by (3)
> There are two possibilities when the WCD938x reset can happen,
> 
> 1. If reset happens earlier than probing (1) and (2) which is best case.
> 
> 
> 2. if reset happens after (1) and (2) are probed then SoundWire TX and
> RX master will have spend 2 + 2 secs waiting, Which is a long time out
> Hence the patch.
> 
> TBH, the 2 sec timeout value was just a random number which I added at
> the start, we had to come up with some sensible value over the time
> anyway for that.
> 
> You could say why do we need wait itself in the first place.
> 
> The reason we need wait in first place is because, there is a danger of
> codec accessing registers even before enumeration is finished. Because
> most of the ASoC codec registration happens as part of codec/component
> driver probe function rather than status callback.
> 
> I hope this answers your questions.


Humm, not really.

First, you're using this TIMEOUT_MS value in 3 unrelated places, and
using 2 different struct completion, which means there are side effects
beyond autoenumeration.

qcom.c-         /*

qcom.c-          * sleep for 10ms for MSM soundwire variant to allow
broadcast

qcom.c-          * command to complete.

qcom.c-          */

qcom.c-         ret = wait_for_completion_timeout(&swrm->broadcast,

qcom.c:                                   msecs_to_jiffies(TIMEOUT_MS));

--

qcom.c-         goto err_clk;

qcom.c- }

qcom.c-

qcom.c- qcom_swrm_init(ctrl);

qcom.c- wait_for_completion_timeout(&ctrl->enumeration,

qcom.c:                             msecs_to_jiffies(TIMEOUT_MS));

--

qcom.c-         if (!swrm_wait_for_frame_gen_enabled(ctrl))

qcom.c-                 dev_err(ctrl->dev, "link failed to connect\n");

qcom.c-

qcom.c-         /* wait for hw enumeration to complete */

qcom.c-         wait_for_completion_timeout(&ctrl->enumeration,

qcom.c:                                   msecs_to_jiffies(TIMEOUT_MS));


And then I don't get what you do on a timeout. in the enumeration part,
the timeout value is not checked for, so I guess enumeration proceeds
without the hardware being available? That seems to contradict the
assertion that you don't want to access registers before the hardware is
properly initialized.

And then on broadcast you have this error handling:

		ret = wait_for_completion_timeout(&swrm->broadcast,
						  msecs_to_jiffies(TIMEOUT_MS));
		if (!ret)
			ret = SDW_CMD_IGNORED;
		else
			ret = SDW_CMD_OK;

Which is equally confusing since SDW_CMD_IGNORED is really an error, and
the bus layer does not really handle it well - not to mention that I
vaguely recall the qcom hardware having its own definition of IGNORED?

