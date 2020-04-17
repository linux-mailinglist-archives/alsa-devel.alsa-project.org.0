Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4281AE18D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 17:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52771607;
	Fri, 17 Apr 2020 17:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52771607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587138667;
	bh=Ggll7FIc1bJiU6ggC4/myk1ClM5AFVJh4WMyf7QxHZk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3GlbCB+lc/rfoPmH3IqJF1GLjIyX1X/hHivV+8wpqhp3R/DW2uHHfUJNPIS1k4AK
	 UwpzaqVlgFdcCAvmd3Wqe5y9NPjJpyNZtizgvnfHdQwteKns/tS+h0CHO8PQ9HVed2
	 AOxV2lM3GEkXmNth1ZX1Cba4b01a2HAdbowJT0VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06506F80290;
	Fri, 17 Apr 2020 17:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47870F8028B; Fri, 17 Apr 2020 17:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2ACBF8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 17:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2ACBF8028B
IronPort-SDR: Nrb75Oxw112On7Sqk/Sl0g1Gh5NSj3GsQomF/BdF8nVPJklc2DL60GWHkeJ2f7jted7k1Icqrr
 FSoBXUDquqmw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 08:48:23 -0700
IronPort-SDR: ZBwe2yhen/Cg4VzUVmdatNxrnAr9gr2mfLpMqbuIjwHNm8+JZZMJryQnFAdgH7o+9ulVtWAxwR
 X5jV6k+GoP8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="278417849"
Received: from dsbrown-mobl.amr.corp.intel.com (HELO [10.251.128.242])
 ([10.251.128.242])
 by fmsmga004.fm.intel.com with ESMTP; 17 Apr 2020 08:48:21 -0700
Subject: Re: [PATCH] ASoC: Intel: atom: remove unused 'sst_mix_voip_controls'
To: Jason Yan <yanaijie@huawei.com>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com,
 tglx@linutronix.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20200417092344.14301-1-yanaijie@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8cd0ba8d-138d-d4da-d6fb-d2457ea2db13@linux.intel.com>
Date: Fri, 17 Apr 2020 08:43:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417092344.14301-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>
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



On 4/17/20 4:23 AM, Jason Yan wrote:
> Fix the following gcc warning:
> 
> sound/soc/intel/atom/sst-atom-controls.c:710:30: warning:
> ‘sst_mix_voip_controls’ defined but not used [-Wunused-const-variable=]
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_voip_controls);

I'd prefer it if we didn't change this but only added __maybe_unused in 
the macro.

This is 2013/2014 legacy stuff, some parts were not upstreamed and this 
was used by out-of-tree Android variations, and I don't know the 
consequences of taking this out.

Better just squelch the warning but not change anything, no?

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>   sound/soc/intel/atom/sst-atom-controls.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
> index 69f3af4524ab..541f0059ba7a 100644
> --- a/sound/soc/intel/atom/sst-atom-controls.c
> +++ b/sound/soc/intel/atom/sst-atom-controls.c
> @@ -707,7 +707,6 @@ SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_pcm2_controls);
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_sprot_l0_controls);
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_media_l1_controls);
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_media_l2_controls);
> -SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_voip_controls);
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_codec0_controls);
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_codec1_controls);
>   SST_SBA_DECLARE_MIX_CONTROLS(sst_mix_modem_controls);
> 
