Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED128492C3C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 18:24:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754E72BE0;
	Tue, 18 Jan 2022 18:23:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754E72BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642526647;
	bh=EWRTFiZUItx3MWdwZQTZ060I//3YEQzPGnM9FwhmVhk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhysOwh5kCTPnPamlwSq7Kdfm4lTuF75wk813akwVovYmz3Gu6f9hP4M1FxpVltol
	 /0sSxv4EmE76/G2trd2zniLwcaggIKbOP5l+c0Xelr2LpXWfinTveOzDgyCOxFF1IP
	 yZgQiJISjYmzwd2eYzU3NecUMGG/8LroIS4bPMXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F36F8050F;
	Tue, 18 Jan 2022 18:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 151F8F80482; Tue, 18 Jan 2022 18:23:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CA42F80482
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA42F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Gts12SxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642526585; x=1674062585;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EWRTFiZUItx3MWdwZQTZ060I//3YEQzPGnM9FwhmVhk=;
 b=Gts12SxR/pk3Ts67M0fSTXRixDtxpn4TLKEqSOErNLdQxaRB0/9CsevW
 74nzRHuJIUggRUr2xu025Nk3twD7eok0u9VBk6Dy2fw9Dzs4v/PrdmTgV
 aV9TsMD247nfwhwDBSJIDDLfbdxEe5+wDcYbpMIoMSpNoNQ5b4V3Ek0qh
 Mk48AwlgViuJ4288t7YAtgJHZg/oVY6WF6qVTnLUBBxkEZpfAlabMXRU4
 qNi21i/LQ5JqQ4jSpDzmT8bH9aF80PAXijsq4sORa6m6LMiUCUd6Z/IwF
 ndmiSJ3M+HiMoqK9MQ1QkHZWpQwWCUqcseGEe3YPKBDOf7VT7niOffzyf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244663520"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="244663520"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 09:21:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="622211580"
Received: from mdzurick-mobl.amr.corp.intel.com (HELO [10.209.145.208])
 ([10.209.145.208])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 09:21:51 -0800
Subject: Re: [PATCH] ASoC: amd: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
To: Mark Brown <broonie@kernel.org>, Julian Braha <julianbraha@gmail.com>
References: <20220117041528.59958-1-julianbraha@gmail.com>
 <Yeb0n9AVXeVzBHrT@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <26ec72a7-effa-7553-fc0f-4e016b651c09@linux.intel.com>
Date: Tue, 18 Jan 2022 11:21:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yeb0n9AVXeVzBHrT@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, AjitKumar.Pandey@amd.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 fazilyildiran@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 Vijendar.Mukunda@amd.com, tanureal@opensource.cirrus.com
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



On 1/18/22 11:10 AM, Mark Brown wrote:
> On Sun, Jan 16, 2022 at 11:15:28PM -0500, Julian Braha wrote:
>> When SND_SOC_AMD_YC_MACH is selected,
>> and GPIOLIB is not selected,
>> Kbuild gives the following warning:
>>
>> WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>>   Selected by [y]:
>>   - SND_SOC_AMD_YC_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP6x [=y]
> 
> Why is this a good fix and not removing the dependency on gpiolib from
> DMIC?  While a DMIC *can* use a GPIO it's not something that's an
> intrinsic requirement and it's entirely optional in the code.

We also have similar 'depends on GPIOLIB' for Intel boards that are not
really useful. see e.g. 4262ddc2ad63 ('ASoC: Intel: boards: add explicit
dependency on GPIOLIB when DMIC is used'). IIRC we had this discussion
before about doing a larger cleanup.


