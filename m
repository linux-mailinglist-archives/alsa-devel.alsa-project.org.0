Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A22A05AF
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5371663;
	Fri, 30 Oct 2020 13:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5371663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061900;
	bh=uzDW1hMYxekseheUwiEzlYXAvDyK68umlKTHyEkHIZY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3CY4EW5d2UEIaNdQo73/GcAw8x+RraVnDek7QGDEa4Ktx4DY2tZYcsJoIkwXv904
	 H6mJGZ3ndpwDkBbNxBtc3vuIUWREYTbAwcLntvxSk8x1mzGkamnz36uzkjnuSodjOB
	 Lb8dW76FMd6+rZKZV8fwhYKHZDmO5lZpXzo7FcO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36481F80107;
	Fri, 30 Oct 2020 13:43:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15AA4F80212; Fri, 30 Oct 2020 13:43:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 079CDF800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:43:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 079CDF800C0
IronPort-SDR: x61Bekwm140BvFm5eDITAO4j85HcTrrs3IThiaeRnd2U8aMph1SZxEqH+3znOkWHFooxZNV+xc
 uGaPXVsU2I9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="156374081"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="156374081"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:43:20 -0700
IronPort-SDR: sx4mHveyVN1O6cluDDq9SRM8hrAN4F/4UUii79skx3KKSt61DcjEQwTOm9YFlrG4BsJwqe3i/F
 Q5mjVHG1sfeA==
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="527101397"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.249.142.235])
 ([10.249.142.235])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:43:18 -0700
Subject: Re: [PATCH v3 0/7] ASoC: topology: Change to resource managed memory
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <80326d15-a19b-364f-2995-09eb4ce04a84@linux.intel.com>
Date: Fri, 30 Oct 2020 13:43:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On 10/30/2020 3:54 PM, Amadeusz Sławiński wrote:
> Almost all other allocations in ASoC API are resource managed, the only
> exception is soc-topology.c.
> 
> This patchset clean ups few unnecessary functions in preparation for
> change and then changes to devm_ functions for allocation.
> 
> Amadeusz Sławiński (6):
>    ASoC: topology: Remove unused functions from topology API
>    ASoC: topology: Remove multistep topology loading
>    ASoC: topology: Unify all device references
>    ASoC: topology: Change allocations to resource managed
>    ASoC: topology: Remove empty functions
>    ASoC: topology: Simplify remove_widget function
> 
>   include/sound/soc-topology.h           |  13 +-
>   sound/soc/intel/skylake/skl-topology.c |   9 +-
>   sound/soc/soc-topology.c               | 302 +++++--------------------
>   sound/soc/sof/pcm.c                    |   2 +-
>   sound/soc/sof/topology.c               |   4 +-
>   5 files changed, 57 insertions(+), 273 deletions(-)
> 

Eh... and of course I've messed up something, there shouldn't be v3 in 
the topic of cover letter ;) I can resend if you want?
