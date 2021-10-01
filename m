Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636841E75A
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 07:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F285616DF;
	Fri,  1 Oct 2021 07:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F285616DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633067995;
	bh=LfresbpxngvZM6ZTxLfqwt01AtTg/WDC7/ObCL3WLMw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aK/VRAC1l3TI2jIlRC4T7EuC6CUlku6Dc8LAW40mBeHCcAkd3jPatzFtCvnZTCvhJ
	 53Exv0xLnsEM77fCpEzgYyAfJrFtJA/ab1pQtVQI4bCR8s+VpCV5jK4beg1ap+TKU+
	 jIEeHLUqh/e59XwXjxImS4ovwW/7GPNByACa+V5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D2ADF8026D;
	Fri,  1 Oct 2021 07:58:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F80F80245; Fri,  1 Oct 2021 07:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=CTE_8BIT_MISMATCH, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1579CF801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 07:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1579CF801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="289008433"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="289008433"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 22:58:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="477233863"
Received: from kdrangex-mobl.ger.corp.intel.com (HELO [10.251.220.94])
 ([10.251.220.94])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 22:58:22 -0700
Message-ID: <f28fb37c-a4ed-446c-90ba-d6124caa89b1@linux.intel.com>
Date: Fri, 1 Oct 2021 08:58:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210928082248.6081-1-peter.ujfalusi@linux.intel.com>
 <20210928151012.GA25932@sirena.org.uk>
 <795a1c96-c4b5-a364-e192-58358c90d5de@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <795a1c96-c4b5-a364-e192-58358c90d5de@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com, lgirdwood@gmail.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

Hi Mark, Pierre,

On 30/09/2021 23:24, Pierre-Louis Bossart wrote:
> 
> 
> On 9/28/21 10:10 AM, Mark Brown wrote:
>> On Tue, Sep 28, 2021 at 11:22:48AM +0300, Peter Ujfalusi wrote:
>>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>
>>> The work-around enabled in hda-stream.c is only required on earlier
>>> versions of SOCs/PCH (Skylake, KabyLake, ApolloLake,
>>> GeminiLake). Before setting the format on the host DMA, it is required
>>> to couple the host and link DMA - which as a consequence shall use the
>>> same format.
>>
>> This breaks the build for me:
>>
>> /mnt/kernel/sound/soc/sof/intel/hda-stream.c: In function 'hda_dsp_stream_hw_params':
>> /mnt/kernel/sound/soc/sof/intel/hda-stream.c:436:42: error: implicit declaration of function 'get_chip_info'; did you mean 'get_group_info'? [-Werror=implicit-function-declaration]

Sorry about that.

I'm going to script this from now.

It was sort of therapeutic meditation type of flow:

one slip of coffee
find a patch / feature series
git checkout -b to_upstream/<topic> <current_upstream_base>
git cherry-pick <hash from sof-dev-rebase>
if (fail) goto drop_patch;
scripts/checkpatch.pl --strict -g HEAD
if (fail) correct it();
compile (x64/aarch64, sparse for both) - this I have scripted
if (fail) goto drop_patch;
boot test
if (fail) goto drop_patch;
format-patch && send

fail:
drop patch or series and try to find another one.

I must have skipped the compile phase.

> Ack, we're missing a dependency.
> 
> Peter, this function was moved to shim.h with Ranjani's patch
> "ASoC: SOF: Intel: hda: expose get_chip_info()"
>
> That patch was added in the SOF multi-core series.

Yes, it is and it does not apply without the dynamic pipelines and
possibly have dependency on other patches from the muticore support for
the dynamic-pipelines.

Sorry for the trouble, I'll start with a coffee then the script.

-- 
Péter
