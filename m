Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413D31EBF4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 17:04:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99BF1660;
	Thu, 18 Feb 2021 17:04:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99BF1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613664293;
	bh=4YjyC2WsTG7kRB2+hXGcqduThddkOPHIIOOTf7WZ2Gs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tTtGGv0VFFK27WuVgxVUjBhVsXDOPHxf+3Mt+NmpLAqHGcWVaysV4sE1X2qLjsfZ6
	 hAxxSWGI28IFAgwCZ2tm/g8wXeDhJU7m1dtBqkk+Bx2NMIXNAj+WT3T3z1E28MCry5
	 tygYJ6hXrBYiTQ3nB/EkR6Po/Ucv/o+V4q05PiB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6BEF8016E;
	Thu, 18 Feb 2021 17:03:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCDCFF80155; Thu, 18 Feb 2021 17:03:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A903F800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 17:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A903F800D0
IronPort-SDR: SWfthh3uuklI4yCXtrU+McfNX9Ef3O/fMRa/zHsClMOYkHP65LyU/2BuZJjRBWMLM8LIG0bp5V
 owUDdcp/r4jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="162684137"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="162684137"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 08:03:04 -0800
IronPort-SDR: Pm/X9GXAjDG/ta2lIEgiEGBff0QIywysZgGFYPpqfzo3Dx9zDhfShAN6RMsN1NzCAmgM/+QsVW
 7vO+Xh+u4wZw==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="386018355"
Received: from fdherrer-mobl.amr.corp.intel.com (HELO [10.209.31.85])
 ([10.209.31.85])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 08:03:02 -0800
Subject: Re: [PATCH v2] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
To: Jaroslav Kysela <perex@perex.cz>, shumingf@realtek.com,
 broonie@kernel.org, lgirdwood@gmail.com
References: <20210218091208.28734-1-shumingf@realtek.com>
 <350ee43a-af99-bb8e-60d3-2a0dc561cb45@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <84ce7570-b5c7-d89d-7d65-a391c3b65f93@linux.intel.com>
Date: Thu, 18 Feb 2021 08:49:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <350ee43a-af99-bb8e-60d3-2a0dc561cb45@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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



On 2/18/21 3:44 AM, Jaroslav Kysela wrote:
> Dne 18. 02. 21 v 10:12 shumingf@realtek.com napsal(a):
> 
>> +	SND_SOC_DAPM_SWITCH("DAC L", SND_SOC_NOPM, 0, 0, &rt1316_sto_dac_l),
>> +	SND_SOC_DAPM_SWITCH("DAC R", SND_SOC_NOPM, 0, 0, &rt1316_sto_dac_r),
> 
> Truly, I don't understand the reason to have a separate L/R switch when we can
> map this functionality to one stereo (multichannel) control.
> 
> It's an issue for all ASoC drivers. We should consider to be more strict for
> the new ones.

At the same time we have to recognize that the L/R notion only makes 
sense at the input to the amplifier. The amplifier may recombine 
channels to deal with orientation/posture or simply select a specific 
input, and drive different speakers (e.g. tweeter/woofer). Dac L and R 
are often an abuse of language when the system have multi-way speakers. 
Exhibit A for this is the TigerLake device with 2 RT1316 and 4 speakers. 
L/R don't make sense to describe amplifier outputs and speaker position.

There's also a difficult balance to be found between exposing all the 
capabilities of the device, and making integration and userspace 
simpler. I2C/IS2 and SoundWire devices tend to expose more controls than 
HDaudio ones, and that was driven by a desire to optimize as much as 
possible. Some devices are designed with limited number of controls, 
others provide hooks to tweak everything in the system by exposing 
literally have thousands of controls. I don't think we should pick and 
choose which controls we want to expose, that's the codec vendor's job 
IMHO (or the device class definition when standard and applicable)
