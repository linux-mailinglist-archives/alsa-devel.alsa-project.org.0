Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503BC181CDF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 16:51:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF6E950;
	Wed, 11 Mar 2020 16:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF6E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583941897;
	bh=pEqFyQbO6vgGHM4v4KpRpNv6eZ952M6uHkPgYSVUcCc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzHiCUyw++V0+DSBSLcfQtTvdhBUAHZJG1D3+7cRzfHs6JCO/zkZ08scwq3JsPPNr
	 mOPXTk5kcbiVoAzjLVjDqtKbc8xesykO5gOFXBGpZa75Tv1am42sqU4E8XplQTOm0f
	 wCRVZdKHUkhKP8nDTsnGz4F1TZUammbq8YDJLL1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5DE5F800B5;
	Wed, 11 Mar 2020 16:49:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0B1AF801EB; Wed, 11 Mar 2020 16:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38A2DF800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 16:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A2DF800B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 08:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="236320108"
Received: from abazhenx-mobl1.ccr.corp.intel.com (HELO [10.252.25.1])
 ([10.252.25.1])
 by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2020 08:49:43 -0700
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
 <20200309113844.GA4101@sirena.org.uk>
 <e50a52eb-ea7a-4528-cfdb-1dd9210b5779@intel.com>
 <20200309165413.GH4101@sirena.org.uk>
 <cbcdd4bd-6981-0dda-c8e9-bbe5c8128afc@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2dc38392-760b-a5fc-fa00-98530729f2d3@intel.com>
Date: Wed, 11 Mar 2020 16:49:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cbcdd4bd-6981-0dda-c8e9-bbe5c8128afc@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, vkoul@kernel.org, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On 2020-03-10 17:03, Pierre-Louis Bossart wrote:
>> I didn't actually look at the patches since by the time I went to look
>> at them it was clear that there was going to be a new version.  Pierre
>> was saying that they added new functionality which would generally not
>> be suitable.
> 
> I am ok with the patches, as long as "[PATCH 5/7] ASoC: Intel: 
> skl_hda_dsp: Enable Dmic configuration" is dropped as discussed.
> 
> I don't know if that requires a v2 or if Mark you can just drop this one 
> patch?
> 
> So for all Patches except Patch5:
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Thanks Cezary!
> 

Thanks for quick review and upstream!

In fact, I wasn't even able to append missing 'Fixes' here and there.
While indeed on 4.19 hdadsp machine driver does not exist so these 
patches can count as "new feature", for some other kernels such as 5.4 
that ain't a case.

Not very familiar with the cherry-pick mechanism for stable kernels, but 
is it possible for patches that ain't flagged with 'Fixes' tag to get 
backported? Having all of these at least on 5.4 is in my opinion desirable.

Czarek
