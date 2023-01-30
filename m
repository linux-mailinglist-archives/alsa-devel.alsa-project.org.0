Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1C680EF2
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 14:30:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75F6EAC;
	Mon, 30 Jan 2023 14:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75F6EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675085409;
	bh=6G6Pj7CzFBYnmwgdg9HJC0QnXScAWWEQlAUIefI67Ic=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=btJKuTW1b+XPoy7xKQ2kUA4L5P0FT0zpr8RKGHBo1ayrPsle/sM9vWhNDqTbDcp/L
	 6sU4hTtqN2nu1NInS1mFwgkpyD7RS0RjkCUyNssCF4kvRLenby2kmn2hURlMqnml29
	 wLefA2wN/XMRSSUKB1Vq/itNHNebkHj6hqyJgAKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 055A3F80496;
	Mon, 30 Jan 2023 14:29:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CF6F80496; Mon, 30 Jan 2023 14:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A884EF80496
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 14:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A884EF80496
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fbBUvxgh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675085348; x=1706621348;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6G6Pj7CzFBYnmwgdg9HJC0QnXScAWWEQlAUIefI67Ic=;
 b=fbBUvxghTTykE6QHaPb4LgNY/X5cdSzoCktBDKSo+g8WJHs2/o5F5bhY
 Y/dLFd7TXfQkeOhg3OL7UWvPbw9LNH7BuPgY5DDMV8QaY5pJRBsmFCWMw
 seWN2pXO4qFGpGVjliBS4TOdIc/6VyCUI67JSd2rOH4836e/TSfqG5bZA
 txSwBtor6Bks4KkGSiPM+MXSagbPUIdqoYOEKKXXSOOpEzeh5alHwArar
 dZ/F+I1ElivnOjLRF7DLw3KzT/zf1HlsmVsbj8fjq6bScAD2mnXwt4EL1
 s+/k0CsXzJ3mUN6HKT/RfEUBxaBKbO4+zU8U29wVeaseHwobnPkmeljG1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="328831042"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="328831042"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 05:29:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="992903669"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="992903669"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 05:29:01 -0800
Message-ID: <a75634d6-e844-46c3-fa68-0c425a2efd7e@linux.intel.com>
Date: Mon, 30 Jan 2023 14:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 00/11] ASoC: topology: Fixes and cleanups
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/28/2023 12:11 AM, Amadeusz Sławiński wrote:
> Following is series of fixes and cleanups for core topology code. Few
> patches fixing various problems all around and few fixing function
> names.
> 
> v2:
>   - fix commit messages
>   - change order of last two patches
>   - as there is no code changes, add Reviewed-by from Ranjani
> 

And I've just realized that I forgot -v2 switch when sending... I hope I 
don't need to resend ;)

> Amadeusz Sławiński (11):
>    ASoC: topology: Properly access value coming from topology file
>    ASoC: topology: Remove unused SOC_TPLG_PASS_PINS constant
>    ASoC: topology: Fix typo in functions name
>    ASoC: topology: Fix function name
>    ASoC: topology: Rename remove_ handlers
>    ASoC: topology: Remove unnecessary forward declarations
>    ASoC: topology: Pass correct pointer instead of casting
>    ASoC: topology: Return an error on complete() failure
>    ASoC: Topology: Remove unnecessary check for EOF
>    ASoC: topology: Unify kcontrol removal code
>    ASoC: topology: Use unload() op directly
> 
>   include/sound/soc-topology.h |   2 +-
>   sound/soc/soc-topology.c     | 183 ++++++++++++++---------------------
>   2 files changed, 74 insertions(+), 111 deletions(-)
> 

