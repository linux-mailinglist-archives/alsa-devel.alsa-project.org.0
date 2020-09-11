Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24C2661D4
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 17:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF6AE167A;
	Fri, 11 Sep 2020 17:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF6AE167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599836967;
	bh=haWnPufh9ckeb4AOwdBXLbLUphdQ0AhB8WMlrBk7HDI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhcZpqk2Vj9ny0+GERFAW/+0DZKRsrkSu72aNK8D5Bs09YOnwU8kUQy5FqwRBI4WZ
	 MQVA/laSED4sNqmKMEAgYHM6zbIHSJrbhRZ85VURvj2xif3duu95AfG257muooUTg8
	 KMrzaoS61Id/6i5x1i9kdunsVuy3es2/wDidqIXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB818F800E9;
	Fri, 11 Sep 2020 17:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE21F80274; Fri, 11 Sep 2020 17:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=NICE_REPLY_A,PRX_BODY_21,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA3BCF80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 17:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA3BCF80115
IronPort-SDR: z7LLeZVGyCpACynQPtbdhVAveqstyuLaawZDSh4G1adEAJFfYOMZRtmjPDFpS5D5cIJde+JUSl
 E93QO9Bo38rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146464770"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="146464770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 08:07:25 -0700
IronPort-SDR: 4KNDny10BFkK+iQr+jUnPuRNxmW38V+91ARLv0S5o0x27rJZE6uaJy/wazA7H7JwpmBuamyGOO
 UV+MIBei0Lcg==
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; d="scan'208";a="481354710"
Received: from basudipt-mobl1.gar.corp.intel.com (HELO [10.212.223.238])
 ([10.212.223.238])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 08:07:24 -0700
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
To: Vinod Koul <vkoul@kernel.org>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
 <20200901162225.33343-3-pierre-louis.bossart@linux.intel.com>
 <20200904050244.GT2639@vkoul-mobl>
 <f35a0ae7-2779-0c69-9ef3-0d0e298888ac@linux.intel.com>
 <20200909075555.GK77521@vkoul-mobl>
 <184867c2-9f0c-bffe-2eb7-e9c5735614b0@linux.intel.com>
 <20200910062223.GQ77521@vkoul-mobl>
 <adf51127-2813-cdf0-e5a6-f5ec3b0d33fa@linux.intel.com>
 <20200911070649.GU77521@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <21606609-8aaf-c7b2-ffaf-c7d37de1fa3f@linux.intel.com>
Date: Fri, 11 Sep 2020 09:50:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911070649.GU77521@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Hi Vinod,

>>>>>>>> + *	25		0 (Reserved)
>>>>>>>> + *	24:22		Function Number [2:0]
>>>>>>>> + *	21		Entity[6]
>>>>>>>> + *	20:19		Control Selector[5:4]
>>>>>>>> + *	18		0 (Reserved)
>>>>>>>> + *	17:15		Control Number[5:3]
>>>>>>>> + *	14		Next
>>>>>>>> + *	13		MBQ
>>>>>>>> + *	12:7		Entity[5:0]
>>>>>>>> + *	6:3		Control Selector[3:0]
>>>>>>>> + *	2:0		Control Number[2:0]

[...]

>>>>
>>>> #define SDCA_CONTROL_DEST_MASK1 GENMASK(20, 19)
>>>> #define SDCA_CONTROL_ORIG_MASK1 GENMASK(5, 4)
>>>> #define SDCA_CONTROL_DEST_MASK2 GENMASK(6, 3)
>>>> #define SDCA_CONTROL_ORIG_MASK2 GENMASK(3, 0)
> 
> I think I missed ORIG and DEST stuff, what does this mean here?

If you missed this, it means my explanations are not good enough and I 
need to make it clearer in the commit log/documentation. Point taken, 
I'll improve this for the next version.

> Relooking at the bit definition, for example 'Control Number' is defined
> in both 17:15 as well as 2:0, why is that. Is it split?
> 
> How does one program a control number into this?

A Control Number is represented on 6 bits.

See the documentation above.

	17:15		Control Selector[5:3]
	2:0		Control Selector[2:0]

The 3 MSBs for into bits 17:15 of the address, and the 3 LSBs into bits 
2:0 of the address. The second part is simpler for Control Number but 
for entities and control selectors the LSB positions don't match.

Yes it's convoluted but it was well-intended: in most cases, there is a 
limited number of entities, control selectors, channel numbers, and 
putting the LSBs together in the 16-LSB of the address helps avoid 
reprogramming paging registers: all the addresses for a given function 
typically map into the same page.

That said, I am not sure the optimization is that great in the end, 
because we end-up having to play with bits for each address. Fewer 
changes of the paging registers but tons of operations in the core.

I wasn't around when this mapping was defined, and it is what is is now. 
There's hardware built based on this formula so we have to make it work.

Does this clarify the usage?

If you have a better suggestion that the FIELD_PREP/FIELD_GET use, I am 
all ears. At the end of the day, the mapping is pre-defined and we don't 
have any degree of freedom. What I do want is that this macro/inline 
function is shared by all codec drivers so that we don't have different 
interpretations of how the address is constructed.

Thanks,
-Pierre

