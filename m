Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF333434D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 17:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135D71767;
	Wed, 10 Mar 2021 17:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135D71767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615394583;
	bh=dHvMiU3ptuDAImeUIkUtOagfaCABavIqgtzQd1u/+vo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgTnHbd6L5sd+z2AXQZYrQWqNZn/ZwhxSyZKE1OeidbJMOfoVnK1L5oRpW5zTAsfy
	 NFdtGJk/4VPVu+W/y6YN/2/5q5XvSdYtHvj/I4XCZDh6CzzNwSMhRkRqh9aJwHMDqb
	 bRFbTIeopNrNfXTlF4Sd47w9ZqkUmynnpkWrQ/SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6345CF8012F;
	Wed, 10 Mar 2021 17:41:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18ED4F801D8; Wed, 10 Mar 2021 17:41:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA32F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 17:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA32F8012F
IronPort-SDR: i+zVH2HLnfjIJYDaeqjG6fz9qi9qjmXsQkaW4x9jVFgRj+aVsSjj0bpyTucupIJiYoWqIf+WJ3
 o4ySeEab+0Wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="168425115"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="168425115"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 08:41:23 -0800
IronPort-SDR: YYDjhh1OA5FA/uN50/iTRjQ0hrwf4lSd5EzYDJrUKp2IotZ73mJSacsS+5eHu3txj+eR013M9t
 BFj6NdzrLPcg==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="403742860"
Received: from huiyingw-mobl.amr.corp.intel.com (HELO [10.212.214.84])
 ([10.212.214.84])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 08:41:21 -0800
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk> <s5hzgzbvube.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
Date: Wed, 10 Mar 2021 10:41:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hzgzbvube.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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



On 3/10/21 10:37 AM, Takashi Iwai wrote:
> On Wed, 10 Mar 2021 17:18:14 +0100,
> Mark Brown wrote:
>>
>> On Wed, Mar 10, 2021 at 09:44:07AM -0600, Pierre-Louis Bossart wrote:
>>> On 3/10/21 7:35 AM, Mark Brown wrote:
>>
>>>> Just change it to a system level check for ACPI, checking for OF would
>>>> leave problems for board files or any other alternative firmware
>>>> interfaces.
>>
>>> did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?
>>
>> Is there a runtime check?
> 
> Well, basically both DMI and ACPI are completely different things, so
> I don't think it's right to check the availability of ACPI as a signal
> of the availability of DMI.

would this work?

if (!IS_ENABLED(CONFIG_DMI))
     return 0;
