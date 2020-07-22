Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C702229BA8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 17:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDE6851;
	Wed, 22 Jul 2020 17:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDE6851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595432472;
	bh=3m26o69vOnLeAuSG2ZeQ66WUsvh3LFEoA1s4Fjzyvnk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rK/r1NXj8PHs+fkfHza/4S3I8UHFtNv7CYvhnBJDREaIETYoRgBHAtZidP33Cl2+O
	 7e9Pwoxwt2lVsK71bBhtHhVKrWEMkmACD+h3/pRafrw2jvOLHoELvLOE9WXh1aDJuw
	 qCvGCsziG+GPOxAK4hsLkk0kxsQv4H/dV7MuAwaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5947F8014C;
	Wed, 22 Jul 2020 17:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85725F8014C; Wed, 22 Jul 2020 17:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D871F80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 17:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D871F80139
IronPort-SDR: oIJEwSid8zkzsgDfNKFa8YFK6rM+ti7QsKqBVC4XOVHDBljsBieHOrWVNaBIflxQVvcgpBHfy3
 Lybng8/QZZfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="137858018"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="137858018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 08:39:14 -0700
IronPort-SDR: YMeYteoU6TNd2psLZtg6yqPBFXQeGmPUFqeuEf2DAnHGIQoGOYRZSZ1KbHo8vFP+r/kKbwzCOz
 7WLdl1n49FCQ==
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="272042486"
Received: from asinghi-mobl2.amr.corp.intel.com (HELO [10.255.231.54])
 ([10.255.231.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 08:39:13 -0700
Subject: Re: [PATCH v8] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <1595432147-11166-1-git-send-email-harshapriya.n@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d838b6fa-14d0-ae20-2107-edbdf3f73f3c@linux.intel.com>
Date: Wed, 22 Jul 2020 10:39:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595432147-11166-1-git-send-email-harshapriya.n@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
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



On 7/22/20 10:35 AM, Harsha Priya wrote:
> kabylake_ssp_fixup function uses snd_soc_dpcm to identify the
> codecs DAIs. The HW parameters are changed based on the codec DAI of the
> stream. The earlier approach to get snd_soc_dpcm was using container_of()
> macro on snd_pcm_hw_params.
> 
> The structures have been modified over time and snd_soc_dpcm does not have
> snd_pcm_hw_params as a reference but as a copy. This causes the current
> driver to crash when used.
> 
> This patch changes the way snd_soc_dpcm is extracted. snd_soc_pcm_runtime
> holds 2 dpcm instances (one for playback and one for capture). 2 codecs
> on the SSP are dmic (capture) and speakers (playback). Based on the
> stream direction, snd_soc_dpcm is extracted from snd_soc_pcm_runtime.
> 
> Tested for all use cases of the driver.
> 
> Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
> Tested-by: Lukasz Majczak <lma@semihalf.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Harsha and Lukasz!

