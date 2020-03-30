Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023E19851E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 22:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD081660;
	Mon, 30 Mar 2020 22:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD081660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585598975;
	bh=Qw4k1umD6NLTObB2nX3MAMMYUDDttuTcr0lOefOg0s0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csBpnot8wZPpADT+b5XPCRKgHkCsDks26tqnvRfIyGPL21fyeMo26zQ4Q609eCVHK
	 BlCjWYTSnmwphOSg6AD7V4mrAsho6iqk7wkY0/lbQ62tW+YekUxh0zipOsKPrXU41y
	 IVOkRtnEWUJ9qN5zSJfN6qN1/jAZrPZn+5g8Og68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA180F8014C;
	Mon, 30 Mar 2020 22:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D39F5F8014A; Mon, 30 Mar 2020 22:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 044AAF80145
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 22:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 044AAF80145
IronPort-SDR: HbaV0R/QAp1OOUAfzAVNQ5ywf642e2+oP67ppaJa9SXM/nbi7nHF7sapwH5jskbUg2RffSP4X/
 Cgza9xdwcXnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 13:06:59 -0700
IronPort-SDR: BFrhuWyLXeqeSJSUaKpQrbhhujSmmKWfneFwlyhk4r2C0xgM5mfFHNJhD6NV6YjWPLKD9ByYw6
 7xPvn1nnf3Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="248816604"
Received: from unknown (HELO [10.134.63.32]) ([10.134.63.32])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 13:06:59 -0700
Subject: Re: [PATCH v2 0/6] ASoC: topology: Propagate error appropriately
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e345ffe1-1593-49c0-32bd-4637bc1764da@linux.intel.com>
Date: Mon, 30 Mar 2020 11:38:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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



On 3/27/20 3:47 PM, Amadeusz Sławiński wrote:
> v1:
>    Check if kstrdup succeeded.
> 
> v2:
>    Remove unneeded freeing, which is performed in another place by dobj
>    handlers.
> 
>    Additionally for functions which have return status which was ignored,
>    perform success checks and handle failures in appropriate way.
> 
> Amadeusz Sławiński (6):
>    ASoC: topology: Add missing memory checks
>    ASoC: topology: Check return value of soc_tplg_create_tlv
>    ASoC: topology: Check return value of soc_tplg_*_create
>    ASoC: topology: Check soc_tplg_add_route return value
>    ASoC: topology: Check return value of pcm_new_ver
>    ASoC: topology: Check return value of soc_tplg_dai_config

Looks good to me

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We probably want Ranjani to double-check this series though.

> 
>   sound/soc/soc-topology.c | 113 ++++++++++++++++++++++++++++++---------
>   1 file changed, 88 insertions(+), 25 deletions(-)
> 
