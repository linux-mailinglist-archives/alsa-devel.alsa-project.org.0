Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81932A297
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76502173C;
	Tue,  2 Mar 2021 15:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76502173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614696859;
	bh=XihITupK6MGku91rU9Px6KPzNG/zpZKIUug87S9agqk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICpKdwQH+31zcLIp8KndU3CGCfQ+/ZuHXo3We6CKzeMbnuC7FRP4Q5ImSz2ZjGSJZ
	 8MDao4FjwpuH9q80reIUQ4m5krsqTB4qh2qMbHSmX2SImo8C7/5em8j2eTMv112fFA
	 WYOPISc6jTO8A/40Iky6//orXAmdkOf9cEyymV14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF96FF80088;
	Tue,  2 Mar 2021 15:52:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71922F80269; Tue,  2 Mar 2021 15:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D8E2F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:52:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D8E2F8012D
IronPort-SDR: lcQHp1FfcnvGL6pFFUEPbnBAPULflM8KrfmaFA4+WHMyZ0kURG0OZHs71SHRcZx6hWp88RTXVc
 4mpDcrwb11MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166713722"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="166713722"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 06:52:35 -0800
IronPort-SDR: mwUcK08S3UWBfmzGuV3G8R5+njEMi6baLAd9sBG4O/u/ncXVFRz33+DEyUPu7nTwzivU+zQ9ue
 hXyBkmMPCUNQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="383573032"
Received: from twang17-mobl.gar.corp.intel.com (HELO [10.213.174.57])
 ([10.213.174.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 06:52:35 -0800
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
To: Takashi Iwai <tiwai@suse.de>, Vinod Koul <vkoul@kernel.org>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <s5htuptfyae.wl-tiwai@suse.de> <YD5IChh6Xubim//Q@vkoul-mobl>
 <s5hk0qpfwfo.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <01feab68-14a2-36e0-4e30-f88187ae2a5e@linux.intel.com>
Date: Tue, 2 Mar 2021 08:52:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hk0qpfwfo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, arnd@arndb.de
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


> OK, I applied those and pushed to topic/sound-sdw-kconfig-fixes
> immutable branch.   A signed tag, sound-sdw-kconfig-fixes, is found
> there, too.
> 
> Mark, Vinod, feel free to pull from:
>    git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-sdw-kconfig/fixes
> 

Thanks Takashi!

> I suppose those are supposed to be merged in 5.12?  If so, I'm going
> to merge to for-linus branch as well.

We finished those changes rather late in the cycle, so I didn't want to 
send this before 5.12-rc1 and create issues.

But we've been testing them for at least a month now, so the risk is low 
if this series was added in an 5.12-rcX branch.
