Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2492349C17
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 23:07:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231CA1663;
	Thu, 25 Mar 2021 23:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231CA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616710026;
	bh=6+q3to1KGDjTPQgOHHatA4fjsVRvMTmGyxluBkC2S7w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFcEK/rxs2fV2YfUIL+LfuNhLKLXtTOMvapZCXwI8ae6fvPJ/J/yqDkj+avJZ9sw4
	 gjGzHsLlOIKymO21XMDjDfk+00GuZH9RhS52zeiU5Lmxzd0Ikw4aJJOi2euR5AjKEX
	 p7qpGpKPyN+uWwVd7A5ybOfG310WnA60NyrNnu1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67817F800FF;
	Thu, 25 Mar 2021 23:05:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 981DAF8025F; Thu, 25 Mar 2021 23:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D91DBF80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91DBF80104
IronPort-SDR: rWeii6xtXy2vinq/xcrMrKwrcMZbP2mALfZwXxj7wjtG7w5aWx/saM096LCqekgt51wrYkIlpL
 OGK2AaHk2XoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="171007622"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="171007622"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 15:05:18 -0700
IronPort-SDR: MiCpfJtfxmT4m7nNPkk5SxFFItGVy2HpO2jvDSzN7ok6D8Hrh1wFcGvH5SO/39R4P1Z43mEXTC
 3kxnyInXa7rA==
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="391920481"
Received: from ericwon-mobl.amr.corp.intel.com (HELO [10.212.8.91])
 ([10.212.8.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 15:05:17 -0700
Subject: Re: [PATCH 1/2] ASoC: Intel: kbl: Add MST route change to kbl machine
 drivers
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Gopal, Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
References: <20210324175200.44922-1-vamshi.krishna.gopal@intel.com>
 <20210324175200.44922-2-vamshi.krishna.gopal@intel.com>
 <2ee1a18e-8771-b8f7-0452-f96403bd7fe4@linux.intel.com>
 <SN6PR11MB28770F2E69C6D27984F3674FD6629@SN6PR11MB2877.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a7ae7c3c-b80d-2a31-8482-b5b8d6da5dfa@linux.intel.com>
Date: Thu, 25 Mar 2021 17:05:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <SN6PR11MB28770F2E69C6D27984F3674FD6629@SN6PR11MB2877.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "N, Harshapriya" <harshapriya.n@intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "biernacki@google.com" <biernacki@google.com>, "Bossart,
 Pierre-louis" <pierre-louis.bossart@intel.com>
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




>>>
>>> -	{ "HDMI", NULL, "hif5 Output" },
>>> -	{ "DP", NULL, "hif6 Output" },
>>> -
>>
>> ... this doesn't:
>>
>> other machine drivers use this:
>>
>> 	{"HDMI1", NULL, "hif5-0 Output"},
>> 	{"HDMI2", NULL, "hif6-0 Output"},
>> 	{"HDMI2", NULL, "hif7-0 Output"},
>>
> Hello Pierre,
> Thanks for reviewing the patch.
> I looked through the change you suggested in bxt_da7219_max98357a.c machine, but I noticed  hif6-0 Output and hif7-0 Output are having same port HDMI2, This looks not correct.

D'oh! You're right, this makes no sense to me either. I see 4 
occurrences in the code.

bxt_da7219_max98357a.c:	{"HDMI1", NULL, "hif5-0 Output"},
bxt_da7219_max98357a.c:	{"HDMI2", NULL, "hif6-0 Output"},
bxt_da7219_max98357a.c:	{"HDMI2", NULL, "hif7-0 Output"},

bxt_rt298.c:	{"HDMI1", NULL, "hif5-0 Output"},
bxt_rt298.c:	{"HDMI2", NULL, "hif6-0 Output"},
bxt_rt298.c:	{"HDMI2", NULL, "hif7-0 Output"},

bxt_rt298.c:	{"HDMI1", NULL, "hif5-0 Output"},
bxt_rt298.c:	{"HDMI2", NULL, "hif6-0 Output"},
bxt_rt298.c:	{"HDMI2", NULL, "hif7-0 Output"},

glk_rt5682_max98357a.c:	{ "HDMI1", NULL, "hif5-0 Output" },
glk_rt5682_max98357a.c:	{ "HDMI2", NULL, "hif6-0 Output" },
glk_rt5682_max98357a.c:	{ "HDMI2", NULL, "hif7-0 Output" },

Harsha and team, the HDMI2 duplicates seem like recurring copy/paste 
mistakes, can you double check what the intent was? If this is indeed 
unintentional, we probably need a patch per file with a Fixes tag to 
have this applied to the stable kernel.

Thanks!
