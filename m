Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523DB42EF41
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 13:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2D216AD;
	Fri, 15 Oct 2021 13:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2D216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634295864;
	bh=o5D0MLz2yC5xcirDlPinsOlUOS/NC6pb42/RQASrG6s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ul89hoZGk04LU3Z+y7K3U+6q3RzyOxH1eNHVdU3X+pd7ka8QqG3vV//9/zqpqT5Mf
	 dzpsfI1CODP6KMA0OuFwzr9ygE2cpWQxx+gNWV77bc5uYJSRPi7+H2Csjx8aTXH5Sg
	 lxeEpHgpIyPPDud7S4sR9pDNU277g+vzh28Zmeks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E7AF8028D;
	Fri, 15 Oct 2021 13:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17FFAF80269; Fri, 15 Oct 2021 13:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2861F80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 13:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2861F80167
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="288758971"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="288758971"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 04:02:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="492447937"
Received: from liminghu-mobl.ccr.corp.intel.com (HELO [10.212.23.213])
 ([10.212.23.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 04:02:54 -0700
Subject: Re: [RFC PATCH v3 07/13] ASoC: soc-pcm: protect for_each_dpcm_be()
 loops
To: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-8-pierre-louis.bossart@linux.intel.com>
 <e101dee9-42cb-60f4-529b-2a9abb7740df@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1492ba0c-73af-b43c-2d23-fc9e63bdc506@linux.intel.com>
Date: Fri, 15 Oct 2021 06:02:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e101dee9-42cb-60f4-529b-2a9abb7740df@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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



On 10/15/21 1:24 AM, Sameer Pujar wrote:
> 
> 
> On 10/13/2021 8:00 PM, Pierre-Louis Bossart wrote:
>> The D in DPCM stands for 'dynamic', which means that connections
>> between FE and BE can evolve.
>>
>> Commit a97648697790 ("ASoC: dpcm: prevent snd_soc_dpcm use after
>> free") started to protect some of the for_each_dpcm_be() loops, but
>> there are still many cases that were not modified.
>>
>> This patch adds protection for all the remaining loops, with the
>> notable exception of the dpcm_be_dai_trigger(), where the lock is
>> already taken at a higher level, e.g. in snd_pcm_period_elapsed().
>>
>> Signed-off-by: Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com>
>> ---
>>   sound/soc/soc-pcm.c | 86 ++++++++++++++++++++-------------------------
>>   1 file changed, 39 insertions(+), 47 deletions(-)
> 
> After this, once I load sound card there are warning prints and failure:
> 
> [   71.224324] WARNING: CPU: 3 PID: 574 at
> drivers/firmware/tegra/bpmp.c:362 tegra_bpmp_transfer+0x2d0/0x328
> [   71.238032] ---[ end trace 88d978f78a82134f ]---
> [   71.243033] WARNING: CPU: 3 PID: 574 at
> drivers/firmware/tegra/bpmp.c:362 tegra_bpmp_transfer+0x2d0/0x328
> [   71.257022] ---[ end trace 88d978f78a821350 ]---
> [   71.261965] tegra-audio-graph-card sound: Can't set plla rate for
> 270950400, err: -22
> ...
> 
> 
> This happens because, now the atomicity is propagated to BE callbacks
> where the clock settings are done in hw_param(). On Tegra, the clock
> APIs are served by BPMP and warning is seen because of below.

Sorry, I don't understand this part.

if the FEs used on Tegra have the nonatomic property set to zero,
nothing will be propagated really.

This patch was required on the Intel side, because ALL FEs are nonatomic
but some BEs are not, so I had issues when connecting a nonatomic FE to
an atomic BE. See e.g.
https://github.com/thesofproject/linux/pull/3209#issuecomment-941229502
