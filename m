Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AC604305
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 13:17:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E2691E8;
	Wed, 19 Oct 2022 13:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E2691E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666178242;
	bh=JHDDwHyU0y4RXgoPYLu1BylMdiRg9vlTKCvCWveMhts=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vau8gWfcTWY0r6/ABsHK8dQZ4TEOz47YOsSKAR+/8/BKMD7RMDjDx12uIOgyWh7aa
	 0jZZBfxAB6Mlqj90uPsJGd2vICsvPLNgNo7GtZ4jfEDkP9Gq09qFtN1HsZJwqTEHtt
	 eZqvYYPvyOUrIeqtoyRmq+86lTFOwJurciJzA8YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBF7F804E0;
	Wed, 19 Oct 2022 13:16:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E22F2F80087; Wed, 19 Oct 2022 13:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6ECDF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 13:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6ECDF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cx45t66q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666178183; x=1697714183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JHDDwHyU0y4RXgoPYLu1BylMdiRg9vlTKCvCWveMhts=;
 b=cx45t66qZ8xUJX+Sm7hn4j5w0aPfKMbOJnSd7J3oD66ioq11TSNvOC0D
 hbe9LgAyAwC/HgRrhgvEwUz1I5aPllPQ6hUjsTQt1LdiiGHZiJr/dY9kN
 rWgQR9kVXVXC64fut8KbS8b974GExTrsOuUthcwii0eCAPHUB/CLl0Dwe
 hA4e9LIG6c+5XjAt44Tlgpjn4VGMwvcEYMmlLUKJzs9pBkWY/rjZYzbRa
 na2ghVb6bHqouLKCzGSw6o9VoHJSLZevqt2nQ+pyrDM8ow8vD4d/te6oK
 lZnJLzV/XKvZ3sRAMXsiQ/B4KxWY7N6IXh9+/Wd7rWuWJKClhiWayiVuo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="286096879"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286096879"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 04:16:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="662413280"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="662413280"
Received: from akirui-mobl.ger.corp.intel.com (HELO [10.252.27.10])
 ([10.252.27.10])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 04:16:15 -0700
Message-ID: <52b62b01-420a-75b8-4355-784f5eb7d62b@linux.intel.com>
Date: Wed, 19 Oct 2022 14:16:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
 <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
 <06f141c4-cf3b-f227-2f94-625ffcda79f6@intel.com>
 <522cf594-a56a-6649-9bce-b616bf8f47ca@linux.intel.com>
 <28d040a5-52dd-a8ac-2217-7f71cbf8e905@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <28d040a5-52dd-a8ac-2217-7f71cbf8e905@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On 19/10/2022 12:51, Cezary Rojewski wrote:
>> That's not necessarily a valid assumption, it's perfectly possible that
>> a specific OEM decides to allocate more budget for a specific feature
>> and less for others, resulting in libraries that are recompiled,
>> optimized or configured differently. The UUID is a weak notion here, as
>> measured by the same UUID being used for different DSP generations.
>> Nothing prevents someone from generating a slightly different library
>> exposed with the same UUID.
>>
>> We didn't want to restrict our partners and gave them with the ability
>> to put both the base firmware and the libraries in different directories
>> and overload the default path should they wish to do so. They could
>> decide to point to the same directory if they wanted to. That's not our
>> decision.
>>
>> If you look at all recent evolutions, we initially introduced different
>> paths for firmware, then topology, then firmware and topology names. The
>> logic of adding more flexibility for library path follow the pattern of
>> trying to avoid making assumptions we have to undo at a later point.
> 
> Thanks for the elaborate input. The evolution sound good, and is
> perfectly reasonable. My only feedback is - should we put everything
> under /intel directory? If all the paths can be customized, then the
> parent directory needs not to be the same for every firmware package
> regardless of its origin. It's counterintuitive, is it not?

at the moment:
# ls -al /lib/firmware/intel/ | wc -l
108

We might have 2 sets of binaries per platform, one using product key,
other using community key.

If we dump everything in one directory (/lib/firmware/intel/), things
will go out of hand pretty easily which can be somehow handled with
complex file naming. This is only for the basefw, then we have the
libraries (however they are sourced) with again two sets of keys, platforms.

Surely it can be done, but historically SOF prefers to use directories
instead of pre/mid/post-fixing patterns of file names.

Also note that SOF is looking for a module UUID when trying to load a
library we don't track arbitrary file names (see cover letter).

Does this make sense to you?

-- 
Péter
