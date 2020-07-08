Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76319218846
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E9A1681;
	Wed,  8 Jul 2020 15:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E9A1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594213288;
	bh=hlJLetuLbXwcSsDNMdpIiy+uJvqhZoWDE6euSIf441M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRT6T3ah0wEfYDfOOBgPIVZ2n6Cx11ts7UJvRTDkvxi42ccRndIn7vN3vc+oY+bP8
	 Y8/s16w3YaBVurV4s02zXZZ4S7MbcwakF+lTebj9vVqfv1duVwgUKAHB2R9pjr5qLM
	 tmzuIYIgcIVGiuw5mtbuEy0OSknToWsA3wtadwLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1262BF80115;
	Wed,  8 Jul 2020 14:59:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 797D9F8015A; Wed,  8 Jul 2020 14:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AEFEF80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 14:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AEFEF80115
IronPort-SDR: RjkM5Ag6zRxb3ghcFdpY+YS8xCaB039bNyg/9PK7fyegozMMRIy5VllvmJqb6HWdv9EJD0vwCs
 wK5q/+E8y3TQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="232648145"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="232648145"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 05:59:35 -0700
IronPort-SDR: V/Lrm6rBagVLaTce1VySBz2xWqmvhG84zZR7P2icyrxDDQ68/uHXW2LI8Rc8TzBFh3Z1pCZBNH
 TNk/+TUElbTA==
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="323871026"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 05:59:34 -0700
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v3_00/10=5d_ASoC=3a_Clean-up_W=3d1_build_w?=
 =?UTF-8?Q?arnings=e2=80=8b_-_part2?=
To: Lee Jones <lee.jones@linaro.org>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200708063900.GJ3500@dell>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <93b7fb31-7a00-2c68-5096-6a3c81df881a@linux.intel.com>
Date: Wed, 8 Jul 2020 07:59:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708063900.GJ3500@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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



On 7/8/20 1:39 AM, Lee Jones wrote:
> On Tue, 07 Jul 2020, Pierre-Louis Bossart wrote:
> 
>> Both Lee Jones and I submitted separate series, this is the second
>> part of the merged result, for which no feedback was provided.
>>
>> I picked Lee's patches for rt5659 and ak4458 and added the pxa and
>> ux500 that I didn't fix. The rest is largely identical between our
>> respective series, with the exception of the sunxi which I documented
>> and Lee removed. I don't have any specific preference and will go with
>> the flow on this.
>>
>> Lee Jones (4):
>>    ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
>>    ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and
>>      'reg_val_TSTDR'
>>    ASoC: codecs: rt5659: Remove many unused const variables
>>    ASoC: codecs: ak4458: Remove set but never checked variable 'ret'
>>
>> Pierre-Louis Bossart (6):
>>    ASoC: qcom: q6asm: fix kernel-doc
>>    ASoC: sunxi: sun4i-i2s: fix kernel-doc
>>    ASoC: sunxi: sun4i-spdif: fix kernel-doc
>>    ASoC: codecs: rt5631: fix kernel-doc
>>    ASoC: codecs: tlv320aic26: fix kernel-doc warning
> 
> Would you mind elaborating on "fix kernel-doc".  Some tooling relies
> on the fact that subject lines are, at least for the most part, pretty
> unique, and if we have to fix another kerneldoc issue in the future
> with the same thirst for simpleness, I'm afraid there might be
> clashes.

which tools? seems pretty bad to me to rely on string uniqueness, isn't 
uniqueness defined by SHA1s?

> Take a look at my patches, if you require inspiration.

I have a minimalist style for commit subjects but ok, will update them.

>>    ASoC: sti: uniperif: fix 'defined by not used' warning
>>
>>   sound/soc/codecs/ak4458.c       |  6 +++---
>>   sound/soc/codecs/rt5631.c       |  8 +++++--
>>   sound/soc/codecs/rt5659.c       | 37 ---------------------------------
>>   sound/soc/codecs/tlv320aic26.c  |  2 +-
>>   sound/soc/pxa/pxa-ssp.c         |  2 +-
>>   sound/soc/qcom/qdsp6/q6asm.c    |  2 +-
>>   sound/soc/sti/uniperif.h        |  2 +-
>>   sound/soc/sunxi/sun4i-i2s.c     | 10 ++++++++-
>>   sound/soc/sunxi/sun4i-spdif.c   |  2 +-
>>   sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
>>   10 files changed, 27 insertions(+), 52 deletions(-)
>>
> 
